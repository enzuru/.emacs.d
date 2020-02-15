;;; mime-tnef.el --- mime-view content filter for ms-tnef

;; Copyright (C) 2015 Kazuhiro Ito

;; Author: Kazuhiro Ito <kzhr@d1.dion.ne.jp>
;; Keywords: MIME, multimedia, mail, news

;; This file is part of SEMI (Suite of Emacs MIME Interfaces).

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation; either version 2, or (at
;; your option) any later version.

;; This program is distributed in the hope that it will be useful, but
;; WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

;;; Commentary:

;; mime-tnef.el can handle an application/ms-tnef attachment, usually
;; named winmail.dat.  At present, mime-tnef.el provides access to
;; only attached files, not text.  Most of algorithms, constants are
;; derived from TNEF, C program available at
;; https://github.com/verdammelt/tnef .


;;; Code:

(require 'mime)
(require 'mime-edit)


;;; Customizable variables

(defcustom mime-tnef-unicode-coding-system
  (catch :found
    (dolist (coding '(utf-16le utf-16-le-no-signature) nil)
      (when (coding-system-p coding)
	(throw :found coding))))
  "Coding system for Windows uniode string."
  :group 'mime-view
  :type 'coding-system)


;;; Internal constants

(defconst mime-tnef-lvl-types-table
  '((1 . message)
    (2 . attachment)))

(defconst mime-tnef-names-table
  '((0 . OWNER) ;; #x0000
    (1 . SENTFOR) ;; #x0001
    (2 . DELEGATE) ;; #x0002
    (6 . DATESTART) ;; #x0006
    (7 . DATEEND) ;; #x0007
    (8 . AIDOWNER) ;; #x0008
    (9 . REQUESTRES) ;; #x0009
    (32768 . FROM) ;; #x8000
    (32772 . SUBJECT) ;; #x8004
    (32773 . DATESENT) ;; #x8005
    (32774 . DATERECD) ;; #x8006
    (32775 . MESSAGESTATUS) ;; #x8007
    (32776 . MESSAGECLASS) ;; #x8008
    (32777 . MESSAGEID) ;; #x8009
    (32778 . PARENTID) ;; #x800a
    (32779 . CONVERSATIONID) ;; #x800b
    (32780 . BODY) ;; #x800c
    (32781 . PRIORITY) ;; #x800d
    (32783 . ATTACHDATA) ;; #x800f
    (32784 . ATTACHTITLE) ;; #x8010
    (32785 . ATTACHMETAFILE) ;; #x8011
    (32786 . ATTACHCREATEDATE) ;; #x8012
    (32787 . ATTACHMODIFYDATE) ;; #x8013
    (32800 . DATEMODIFY) ;; #x8020
    (36865 . ATTACHTRANSPORTFILENAME) ;; #x9001
    (36866 . ATTACHRENDDATA) ;; #x9002
    (36867 . MAPIPROPS) ;; #x9003
    (36868 . RECIPTABLE) ;; #x9004
    (36869 . ATTACHMENT) ;; #x9005
    (36870 . TNEFVERSION) ;; #x9006
    (36871 . OEMCODEPAGE) ;; #x9007
    (36872 . ORIGNINALMESSAGECLASS) ;; #x9008
    ))

(defconst mime-tnef-types-table
  '((0 . TRIPLES) ;; #x0000
    (1 . STRING) ;; #x0001
    (2 . TEXT) ;; #x0002
    (3 . DATE) ;; #x0003
    (4 . SHORT) ;; #x0004
    (5 . LONG) ;; #x0005
    (6 . BYTE) ;; #x0006
    (7 . WORD) ;; #x0007
    (8 . DWORD) ;; #x0008
    (9 . MAX) ;; #x0009
    ))

(defconst mime-tnef-mapi-names-table
  '((1 . ACKNOWLEDGEMENT_MODE) ;; #x0001
    (2 . ALTERNATE_RECIPIENT_ALLOWED) ;; #x0002
    (3 . AUTHORIZING_USERS) ;; #x0003
    (4 . AUTO_FORWARD_COMMENT) ;; #x0004
    (5 . AUTO_FORWARDED) ;; #x0005
    (6 . CONTENT_CONFIDENTIALITY_ALGORITHM_ID) ;; #x0006
    (7 . CONTENT_CORRELATOR) ;; #x0007
    (8 . CONTENT_IDENTIFIER) ;; #x0008
    (9 . CONTENT_LENGTH) ;; #x0009
    (10 . CONTENT_RETURN_REQUESTED) ;; #x000A
    (11 . CONVERSATION_KEY) ;; #x000B
    (12 . CONVERSION_EITS) ;; #x000C
    (13 . CONVERSION_WITH_LOSS_PROHIBITED) ;; #x000D
    (14 . CONVERTED_EITS) ;; #x000E
    (15 . DEFERRED_DELIVERY_TIME) ;; #x000F
    (16 . DELIVER_TIME) ;; #x0010
    (17 . DISCARD_REASON) ;; #x0011
    (18 . DISCLOSURE_OF_RECIPIENTS) ;; #x0012
    (19 . DL_EXPANSION_HISTORY) ;; #x0013
    (20 . DL_EXPANSION_PROHIBITED) ;; #x0014
    (21 . EXPIRY_TIME) ;; #x0015
    (22 . IMPLICIT_CONVERSION_PROHIBITED) ;; #x0016
    (23 . IMPORTANCE) ;; #x0017
    (24 . IPM_ID) ;; #x0018
    (25 . LATEST_DELIVERY_TIME) ;; #x0019
    (26 . MESSAGE_CLASS) ;; #x001A
    (27 . MESSAGE_DELIVERY_ID) ;; #x001B
    (30 . MESSAGE_SECURITY_LABEL) ;; #x001E
    (31 . OBSOLETED_IPMS) ;; #x001F
    (32 . ORIGINALLY_INTENDED_RECIPIENT_NAME) ;; #x0020
    (33 . ORIGINAL_EITS) ;; #x0021
    (34 . ORIGINATOR_CERTIFICATE) ;; #x0022
    (35 . ORIGINATOR_DELIVERY_REPORT_REQUESTED) ;; #x0023
    (36 . ORIGINATOR_RETURN_ADDRESS) ;; #x0024
    (37 . PARENT_KEY) ;; #x0025
    (38 . PRIORITY) ;; #x0026
    (39 . ORIGIN_CHECK) ;; #x0027
    (40 . PROOF_OF_SUBMISSION_REQUESTED) ;; #x0028
    (41 . READ_RECEIPT_REQUESTED) ;; #x0029
    (42 . RECEIPT_TIME) ;; #x002A
    (43 . RECIPIENT_REASSIGNMENT_PROHIBITED) ;; #x002B
    (44 . REDIRECTION_HISTORY) ;; #x002C
    (45 . RELATED_IPMS) ;; #x002D
    (46 . ORIGINAL_SENSITIVITY) ;; #x002E
    (47 . LANGUAGES) ;; #x002F
    (48 . REPLY_TIME) ;; #x0030
    (49 . REPORT_TAG) ;; #x0031
    (50 . REPORT_TIME) ;; #x0032
    (51 . RETURNED_IPM) ;; #x0033
    (52 . SECURITY) ;; #x0034
    (53 . INCOMPLETE_COPY) ;; #x0035
    (54 . SENSITIVITY) ;; #x0036
    (55 . SUBJECT) ;; #x0037
    (56 . SUBJECT_IPM) ;; #x0038
    (57 . CLIENT_SUBMIT_TIME) ;; #x0039
    (58 . REPORT_NAME) ;; #x003A
    (59 . SENT_REPRESENTING_SEARCH_KEY) ;; #x003B
    (60 . X400_CONTENT_TYPE) ;; #x003C
    (61 . SUBJECT_PREFIX) ;; #x003D
    (62 . NON_RECEIPT_REASON) ;; #x003E
    (63 . RECEIVED_BY_ENTRYID) ;; #x003F
    (64 . RECEIVED_BY_NAME) ;; #x0040
    (65 . SENT_REPRESENTING_ENTRYID) ;; #x0041
    (66 . SENT_REPRESENTING_NAME) ;; #x0042
    (67 . RCVD_REPRESENTING_ENTRYID) ;; #x0043
    (68 . RCVD_REPRESENTING_NAME) ;; #x0044
    (69 . REPORT_ENTRYID) ;; #x0045
    (70 . READ_RECEIPT_ENTRYID) ;; #x0046
    (71 . MESSAGE_SUBMISSION_ID) ;; #x0047
    (72 . PROVIDER_SUBMIT_TIME) ;; #x0048
    (73 . ORIGINAL_SUBJECT) ;; #x0049
    (74 . DISC_VAL) ;; #x004A
    (75 . ORIG_MESSAGE_CLASS) ;; #x004B
    (76 . ORIGINAL_AUTHOR_ENTRYID) ;; #x004C
    (77 . ORIGINAL_AUTHOR_NAME) ;; #x004D
    (78 . ORIGINAL_SUBMIT_TIME) ;; #x004E
    (79 . REPLY_RECIPIENT_ENTRIES) ;; #x004F
    (80 . REPLY_RECIPIENT_NAMES) ;; #x0050
    (81 . RECEIVED_BY_SEARCH_KEY) ;; #x0051
    (82 . RCVD_REPRESENTING_SEARCH_KEY) ;; #x0052
    (83 . READ_RECEIPT_SEARCH_KEY) ;; #x0053
    (84 . REPORT_SEARCH_KEY) ;; #x0054
    (85 . ORIGINAL_DELIVERY_TIME) ;; #x0055
    (86 . ORIGINAL_AUTHOR_SEARCH_KEY) ;; #x0056
    (87 . MESSAGE_TO_ME) ;; #x0057
    (88 . MESSAGE_CC_ME) ;; #x0058
    (89 . MESSAGE_RECIP_ME) ;; #x0059
    (90 . ORIGINAL_SENDER_NAME) ;; #x005A
    (91 . ORIGINAL_SENDER_ENTRYID) ;; #x005B
    (92 . ORIGINAL_SENDER_SEARCH_KEY) ;; #x005C
    (93 . ORIGINAL_SENT_REPRESENTING_NAME) ;; #x005D
    (94 . ORIGINAL_SENT_REPRESENTING_ENTRYID) ;; #x005E
    (95 . ORIGINAL_SENT_REPRESENTING_SEARCH_KEY) ;; #x005F
    (96 . START_DATE) ;; #x0060
    (97 . END_DATE) ;; #x0061
    (98 . OWNER_APPT_ID) ;; #x0062
    (99 . RESPONSE_REQUESTED) ;; #x0063
    (100 . SENT_REPRESENTING_ADDRTYPE) ;; #x0064
    (101 . SENT_REPRESENTING_EMAIL_ADDRESS) ;; #x0065
    (102 . ORIGINAL_SENDER_ADDRTYPE) ;; #x0066
    (103 . ORIGINAL_SENDER_EMAIL_ADDRESS) ;; #x0067
    (104 . ORIGINAL_SENT_REPRESENTING_ADDRTYPE) ;; #x0068
    (105 . ORIGINAL_SENT_REPRESENTING_EMAIL_ADDRESS) ;; #x0069
    (112 . CONVERSATION_TOPIC) ;; #x0070
    (113 . CONVERSATION_INDEX) ;; #x0071
    (114 . ORIGINAL_DISPLAY_BCC) ;; #x0072
    (115 . ORIGINAL_DISPLAY_CC) ;; #x0073
    (116 . ORIGINAL_DISPLAY_TO) ;; #x0074
    (117 . RECEIVED_BY_ADDRTYPE) ;; #x0075
    (118 . RECEIVED_BY_EMAIL_ADDRESS) ;; #x0076
    (119 . RCVD_REPRESENTING_ADDRTYPE) ;; #x0077
    (120 . RCVD_REPRESENTING_EMAIL_ADDRESS) ;; #x0078
    (121 . ORIGINAL_AUTHOR_ADDRTYPE) ;; #x0079
    (122 . ORIGINAL_AUTHOR_EMAIL_ADDRESS) ;; #x007A
    (123 . ORIGINALLY_INTENDED_RECIP_ADDRTYPE) ;; #x007B
    (124 . ORIGINALLY_INTENDED_RECIP_EMAIL_ADDRESS) ;; #x007C
    (125 . TRANSPORT_MESSAGE_HEADERS) ;; #x007D
    (126 . DELEGATION) ;; #x007E
    (127 . TNEF_CORRELATION_KEY) ;; #x007F
    (4096 . BODY) ;; #x1000
    (4097 . REPORT_TEXT) ;; #x1001
    (4098 . ORIGINATOR_AND_DL_EXPANSION_HISTORY) ;; #x1002
    (4099 . REPORTING_DL_NAME) ;; #x1003
    (4100 . REPORTING_MTA_CERTIFICATE) ;; #x1004
    (4102 . RTF_SYNC_BODY_CRC) ;; #x1006
    (4103 . RTF_SYNC_BODY_COUNT) ;; #x1007
    (4104 . RTF_SYNC_BODY_TAG) ;; #x1008
    (4105 . RTF_COMPRESSED) ;; #x1009
    (4112 . RTF_SYNC_PREFIX_COUNT) ;; #x1010
    (4113 . RTF_SYNC_TRAILING_COUNT) ;; #x1011
    (4114 . ORIGINALLY_INTENDED_RECIP_ENTRYID) ;; #x1012
    (4115 . BODY_HTML) ;; #x1013
    (4149 . SMTP_MESSAGE_ID) ;; #x1035
    (3072 . CONTENT_INTEGRITY_CHECK) ;; #x0C00
    (3073 . EXPLICIT_CONVERSION) ;; #x0C01
    (3074 . IPM_RETURN_REQUESTED) ;; #x0C02
    (3075 . MESSAGE_TOKEN) ;; #x0C03
    (3076 . NDR_REASON_CODE) ;; #x0C04
    (3077 . NDR_DIAG_CODE) ;; #x0C05
    (3078 . NON_RECEIPT_NOTIFICATION_REQUESTED) ;; #x0C06
    (3079 . DELIVERY_POINT) ;; #x0C07
    (3080 . ORIGINATOR_NON_DELIVERY_REPORT_REQUESTED) ;; #x0C08
    (3081 . ORIGINATOR_REQUESTED_ALTERNATE_RECIPIENT) ;; #x0C09
    (3082 . PHYSICAL_DELIVERY_BUREAU_FAX_DELIVERY) ;; #x0C0A
    (3083 . PHYSICAL_DELIVERY_MODE) ;; #x0C0B
    (3084 . PHYSICAL_DELIVERY_REPORT_REQUEST) ;; #x0C0C
    (3085 . PHYSICAL_FORWARDING_ADDRESS) ;; #x0C0D
    (3086 . PHYSICAL_FORWARDING_ADDRESS_REQUESTED) ;; #x0C0E
    (3087 . PHYSICAL_FORWARDING_PROHIBITED) ;; #x0C0F
    (3088 . PHYSICAL_RENDITION_ATTRIBUTES) ;; #x0C10
    (3089 . PROOF_OF_DELIVERY) ;; #x0C11
    (3090 . PROOF_OF_DELIVERY_REQUESTED) ;; #x0C12
    (3091 . RECIPIENT_CERTIFICATE) ;; #x0C13
    (3092 . RECIPIENT_NUMBER_FOR_ADVICE) ;; #x0C14
    (3093 . RECIPIENT_TYPE) ;; #x0C15
    (3094 . REGISTERED_MAIL_TYPE) ;; #x0C16
    (3095 . REPLY_REQUESTED) ;; #x0C17
    (3096 . REQUESTED_DELIVERY_METHOD) ;; #x0C18
    (3097 . SENDER_ENTRYID) ;; #x0C19
    (3098 . SENDER_NAME) ;; #x0C1A
    (3099 . SUPPLEMENTARY_INFO) ;; #x0C1B
    (3100 . TYPE_OF_MTS_USER) ;; #x0C1C
    (3101 . SENDER_SEARCH_KEY) ;; #x0C1D
    (3102 . SENDER_ADDRTYPE) ;; #x0C1E
    (3103 . SENDER_EMAIL_ADDRESS) ;; #x0C1F
    (3584 . CURRENT_VERSION) ;; #x0E00
    (3585 . DELETE_AFTER_SUBMIT) ;; #x0E01
    (3586 . DISPLAY_BCC) ;; #x0E02
    (3587 . DISPLAY_CC) ;; #x0E03
    (3588 . DISPLAY_TO) ;; #x0E04
    (3589 . PARENT_DISPLAY) ;; #x0E05
    (3590 . MESSAGE_DELIVERY_TIME) ;; #x0E06
    (3591 . MESSAGE_FLAGS) ;; #x0E07
    (3592 . MESSAGE_SIZE) ;; #x0E08
    (3593 . PARENT_ENTRYID) ;; #x0E09
    (3594 . SENTMAIL_ENTRYID) ;; #x0E0A
    (3596 . CORRELATE) ;; #x0E0C
    (3597 . CORRELATE_MTSID) ;; #x0E0D
    (3598 . DISCRETE_VALUES) ;; #x0E0E
    (3599 . RESPONSIBILITY) ;; #x0E0F
    (3600 . SPOOLER_STATUS) ;; #x0E10
    (3601 . TRANSPORT_STATUS) ;; #x0E11
    (3602 . MESSAGE_RECIPIENTS) ;; #x0E12
    (3603 . MESSAGE_ATTACHMENTS) ;; #x0E13
    (3604 . SUBMIT_FLAGS) ;; #x0E14
    (3605 . RECIPIENT_STATUS) ;; #x0E15
    (3606 . TRANSPORT_KEY) ;; #x0E16
    (3607 . MSG_STATUS) ;; #x0E17
    (3608 . MESSAGE_DOWNLOAD_TIME) ;; #x0E18
    (3609 . CREATION_VERSION) ;; #x0E19
    (3610 . MODIFY_VERSION) ;; #x0E1A
    (3611 . HASATTACH) ;; #x0E1B
    (3612 . BODY_CRC) ;; #x0E1C
    (3613 . NORMALIZED_SUBJECT) ;; #x0E1D
    (3615 . RTF_IN_SYNC) ;; #x0E1F
    (3616 . ATTACH_SIZE) ;; #x0E20
    (3617 . ATTACH_NUM) ;; #x0E21
    (3618 . PREPROCESS) ;; #x0E22
    (3621 . ORIGINATING_MTA_CERTIFICATE) ;; #x0E25
    (3622 . PROOF_OF_SUBMISSION) ;; #x0E26
    (4095 . ENTRYID) ;; #x0FFF
    (4094 . OBJECT_TYPE) ;; #x0FFE
    (4093 . ICON) ;; #x0FFD
    (4092 . MINI_ICON) ;; #x0FFC
    (4091 . STORE_ENTRYID) ;; #x0FFB
    (4090 . STORE_RECORD_KEY) ;; #x0FFA
    (4089 . RECORD_KEY) ;; #x0FF9
    (4088 . MAPPING_SIGNATURE) ;; #x0FF8
    (4087 . ACCESS_LEVEL) ;; #x0FF7
    (4086 . INSTANCE_KEY) ;; #x0FF6
    (4085 . ROW_TYPE) ;; #x0FF5
    (4084 . ACCESS) ;; #x0FF4
    (12288 . ROWID) ;; #x3000
    (12289 . DISPLAY_NAME) ;; #x3001
    (12290 . ADDRTYPE) ;; #x3002
    (12291 . EMAIL_ADDRESS) ;; #x3003
    (12292 . COMMENT) ;; #x3004
    (12293 . DEPTH) ;; #x3005
    (12294 . PROVIDER_DISPLAY) ;; #x3006
    (12295 . CREATION_TIME) ;; #x3007
    (12296 . LAST_MODIFICATION_TIME) ;; #x3008
    (12297 . RESOURCE_FLAGS) ;; #x3009
    (12298 . PROVIDER_DLL_NAME) ;; #x300A
    (12299 . SEARCH_KEY) ;; #x300B
    (12300 . PROVIDER_UID) ;; #x300C
    (12301 . PROVIDER_ORDINAL) ;; #x300D
    (13057 . FORM_VERSION) ;; #x3301
    (13058 . FORM_CLSID) ;; #x3302
    (13059 . FORM_CONTACT_NAME) ;; #x3303
    (13060 . FORM_CATEGORY) ;; #x3304
    (13061 . FORM_CATEGORY_SUB) ;; #x3305
    (13062 . FORM_HOST_MAP) ;; #x3306
    (13063 . FORM_HIDDEN) ;; #x3307
    (13064 . FORM_DESIGNER_NAME) ;; #x3308
    (13065 . FORM_DESIGNER_GUID) ;; #x3309
    (13066 . FORM_MESSAGE_BEHAVIOR) ;; #x330A
    (13312 . DEFAULT_STORE) ;; #x3400
    (13325 . STORE_SUPPORT_MASK) ;; #x340D
    (13326 . STORE_STATE) ;; #x340E
    (13328 . IPM_SUBTREE_SEARCH_KEY) ;; #x3410
    (13329 . IPM_OUTBOX_SEARCH_KEY) ;; #x3411
    (13330 . IPM_WASTEBASKET_SEARCH_KEY) ;; #x3412
    (13331 . IPM_SENTMAIL_SEARCH_KEY) ;; #x3413
    (13332 . MDB_PROVIDER) ;; #x3414
    (13333 . RECEIVE_FOLDER_SETTINGS) ;; #x3415
    (13791 . VALID_FOLDER_MASK) ;; #x35DF
    (13792 . IPM_SUBTREE_ENTRYID) ;; #x35E0
    (13794 . IPM_OUTBOX_ENTRYID) ;; #x35E2
    (13795 . IPM_WASTEBASKET_ENTRYID) ;; #x35E3
    (13796 . IPM_SENTMAIL_ENTRYID) ;; #x35E4
    (13797 . VIEWS_ENTRYID) ;; #x35E5
    (13798 . COMMON_VIEWS_ENTRYID) ;; #x35E6
    (13799 . FINDER_ENTRYID) ;; #x35E7
    (13824 . CONTAINER_FLAGS) ;; #x3600
    (13825 . FOLDER_TYPE) ;; #x3601
    (13826 . CONTENT_COUNT) ;; #x3602
    (13827 . CONTENT_UNREAD) ;; #x3603
    (13828 . CREATE_TEMPLATES) ;; #x3604
    (13829 . DETAILS_TABLE) ;; #x3605
    (13831 . SEARCH) ;; #x3607
    (13833 . SELECTABLE) ;; #x3609
    (13834 . SUBFOLDERS) ;; #x360A
    (13835 . STATUS) ;; #x360B
    (13836 . ANR) ;; #x360C
    (13837 . CONTENTS_SORT_ORDER) ;; #x360D
    (13838 . CONTAINER_HIERARCHY) ;; #x360E
    (13839 . CONTAINER_CONTENTS) ;; #x360F
    (13840 . FOLDER_ASSOCIATED_CONTENTS) ;; #x3610
    (13841 . DEF_CREATE_DL) ;; #x3611
    (13842 . DEF_CREATE_MAILUSER) ;; #x3612
    (13843 . CONTAINER_CLASS) ;; #x3613
    (13844 . CONTAINER_MODIFY_VERSION) ;; #x3614
    (13845 . AB_PROVIDER_ID) ;; #x3615
    (13846 . DEFAULT_VIEW_ENTRYID) ;; #x3616
    (13847 . ASSOC_CONTENT_COUNT) ;; #x3617
    (14080 . ATTACHMENT_X400_PARAMETERS) ;; #x3700
    (14081 . ATTACH_DATA_OBJ) ;; #x3701
    (14082 . ATTACH_ENCODING) ;; #x3702
    (14083 . ATTACH_EXTENSION) ;; #x3703
    (14084 . ATTACH_FILENAME) ;; #x3704
    (14085 . ATTACH_METHOD) ;; #x3705
    (14087 . ATTACH_LONG_FILENAME) ;; #x3707
    (14088 . ATTACH_PATHNAME) ;; #x3708
    (14089 . ATTACH_RENDERING) ;; #x3709
    (14090 . ATTACH_TAG) ;; #x370A
    (14091 . RENDERING_POSITION) ;; #x370B
    (14092 . ATTACH_TRANSPORT_NAME) ;; #x370C
    (14093 . ATTACH_LONG_PATHNAME) ;; #x370D
    (14094 . ATTACH_MIME_TAG) ;; #x370E
    (14095 . ATTACH_ADDITIONAL_INFO) ;; #x370F
    (14096 . ATTACH_MIME_SEQUENCE) ;; #x3710
    (14098 . ATTACH_CONTENT_ID) ;; #x3712
    (14099 . ATTACH_CONTENT_LOCATION) ;; #x3713
    (14100 . ATTACH_FLAGS) ;; #x3714
    (14592 . DISPLAY_TYPE) ;; #x3900
    (14594 . TEMPLATEID) ;; #x3902
    (14596 . PRIMARY_CAPABILITY) ;; #x3904
    (14847 . 7BIT_DISPLAY_NAME) ;; #x39FF
    (14848 . ACCOUNT) ;; #x3A00
    (14849 . ALTERNATE_RECIPIENT) ;; #x3A01
    (14850 . CALLBACK_TELEPHONE_NUMBER) ;; #x3A02
    (14851 . CONVERSION_PROHIBITED) ;; #x3A03
    (14852 . DISCLOSE_RECIPIENTS) ;; #x3A04
    (14853 . GENERATION) ;; #x3A05
    (14854 . GIVEN_NAME) ;; #x3A06
    (14855 . GOVERNMENT_ID_NUMBER) ;; #x3A07
    (14856 . BUSINESS_TELEPHONE_NUMBER) ;; #x3A08
    (14857 . HOME_TELEPHONE_NUMBER) ;; #x3A09
    (14858 . INITIALS) ;; #x3A0A
    (14859 . KEYWORD) ;; #x3A0B
    (14860 . LANGUAGE) ;; #x3A0C
    (14861 . LOCATION) ;; #x3A0D
    (14862 . MAIL_PERMISSION) ;; #x3A0E
    (14863 . MHS_COMMON_NAME) ;; #x3A0F
    (14864 . ORGANIZATIONAL_ID_NUMBER) ;; #x3A10
    (14865 . SURNAME) ;; #x3A11
    (14866 . ORIGINAL_ENTRYID) ;; #x3A12
    (14867 . ORIGINAL_DISPLAY_NAME) ;; #x3A13
    (14868 . ORIGINAL_SEARCH_KEY) ;; #x3A14
    (14869 . POSTAL_ADDRESS) ;; #x3A15
    (14870 . COMPANY_NAME) ;; #x3A16
    (14871 . TITLE) ;; #x3A17
    (14872 . DEPARTMENT_NAME) ;; #x3A18
    (14873 . OFFICE_LOCATION) ;; #x3A19
    (14874 . PRIMARY_TELEPHONE_NUMBER) ;; #x3A1A
    (14875 . BUSINESS2_TELEPHONE_NUMBER) ;; #x3A1B
    (14876 . MOBILE_TELEPHONE_NUMBER) ;; #x3A1C
    (14877 . RADIO_TELEPHONE_NUMBER) ;; #x3A1D
    (14878 . CAR_TELEPHONE_NUMBER) ;; #x3A1E
    (14879 . OTHER_TELEPHONE_NUMBER) ;; #x3A1F
    (14880 . TRANSMITABLE_DISPLAY_NAME) ;; #x3A20
    (14881 . PAGER_TELEPHONE_NUMBER) ;; #x3A21
    (14882 . USER_CERTIFICATE) ;; #x3A22
    (14883 . PRIMARY_FAX_NUMBER) ;; #x3A23
    (14884 . BUSINESS_FAX_NUMBER) ;; #x3A24
    (14885 . HOME_FAX_NUMBER) ;; #x3A25
    (14886 . COUNTRY) ;; #x3A26
    (14887 . LOCALITY) ;; #x3A27
    (14888 . STATE_OR_PROVINCE) ;; #x3A28
    (14889 . STREET_ADDRESS) ;; #x3A29
    (14890 . POSTAL_CODE) ;; #x3A2A
    (14891 . POST_OFFICE_BOX) ;; #x3A2B
    (14892 . TELEX_NUMBER) ;; #x3A2C
    (14893 . ISDN_NUMBER) ;; #x3A2D
    (14894 . ASSISTANT_TELEPHONE_NUMBER) ;; #x3A2E
    (14895 . HOME2_TELEPHONE_NUMBER) ;; #x3A2F
    (14896 . ASSISTANT) ;; #x3A30
    (14912 . SEND_RICH_INFO) ;; #x3A40
    (14913 . WEDDING_ANNIVERSARY) ;; #x3A41
    (14914 . BIRTHDAY) ;; #x3A42
    (14915 . HOBBIES) ;; #x3A43
    (14916 . MIDDLE_NAME) ;; #x3A44
    (14917 . DISPLAY_NAME_PREFIX) ;; #x3A45
    (14918 . PROFESSION) ;; #x3A46
    (14919 . PREFERRED_BY_NAME) ;; #x3A47
    (14920 . SPOUSE_NAME) ;; #x3A48
    (14921 . COMPUTER_NETWORK_NAME) ;; #x3A49
    (14922 . CUSTOMER_ID) ;; #x3A4A
    (14923 . TTYTDD_PHONE_NUMBER) ;; #x3A4B
    (14924 . FTP_SITE) ;; #x3A4C
    (14925 . GENDER) ;; #x3A4D
    (14926 . MANAGER_NAME) ;; #x3A4E
    (14927 . NICKNAME) ;; #x3A4F
    (14928 . PERSONAL_HOME_PAGE) ;; #x3A50
    (14929 . BUSINESS_HOME_PAGE) ;; #x3A51
    (14930 . CONTACT_VERSION) ;; #x3A52
    (14931 . CONTACT_ENTRYIDS) ;; #x3A53
    (14932 . CONTACT_ADDRTYPES) ;; #x3A54
    (14933 . CONTACT_DEFAULT_ADDRESS_INDEX) ;; #x3A55
    (14934 . CONTACT_EMAIL_ADDRESSES) ;; #x3A56
    (14935 . COMPANY_MAIN_PHONE_NUMBER) ;; #x3A57
    (14936 . CHILDRENS_NAMES) ;; #x3A58
    (14937 . HOME_ADDRESS_CITY) ;; #x3A59
    (14938 . HOME_ADDRESS_COUNTRY) ;; #x3A5A
    (14939 . HOME_ADDRESS_POSTAL_CODE) ;; #x3A5B
    (14940 . HOME_ADDRESS_STATE_OR_PROVINCE) ;; #x3A5C
    (14941 . HOME_ADDRESS_STREET) ;; #x3A5D
    (14942 . HOME_ADDRESS_POST_OFFICE_BOX) ;; #x3A5E
    (14943 . OTHER_ADDRESS_CITY) ;; #x3A5F
    (14944 . OTHER_ADDRESS_COUNTRY) ;; #x3A60
    (14945 . OTHER_ADDRESS_POSTAL_CODE) ;; #x3A61
    (14946 . OTHER_ADDRESS_STATE_OR_PROVINCE) ;; #x3A62
    (14947 . OTHER_ADDRESS_STREET) ;; #x3A63
    (14948 . OTHER_ADDRESS_POST_OFFICE_BOX) ;; #x3A64
    (15616 . STORE_PROVIDERS) ;; #x3D00
    (15617 . AB_PROVIDERS) ;; #x3D01
    (15618 . TRANSPORT_PROVIDERS) ;; #x3D02
    (15620 . DEFAULT_PROFILE) ;; #x3D04
    (15621 . AB_SEARCH_PATH) ;; #x3D05
    (15622 . AB_DEFAULT_DIR) ;; #x3D06
    (15623 . AB_DEFAULT_PAB) ;; #x3D07
    (15624 . FILTERING_HOOKS) ;; #x3D08
    (15625 . SERVICE_NAME) ;; #x3D09
    (15626 . SERVICE_DLL_NAME) ;; #x3D0A
    (15627 . SERVICE_ENTRY_NAME) ;; #x3D0B
    (15628 . SERVICE_UID) ;; #x3D0C
    (15629 . SERVICE_EXTRA_UIDS) ;; #x3D0D
    (15630 . SERVICES) ;; #x3D0E
    (15631 . SERVICE_SUPPORT_FILES) ;; #x3D0F
    (15632 . SERVICE_DELETE_FILES) ;; #x3D10
    (15633 . AB_SEARCH_PATH_UPDATE) ;; #x3D11
    (15634 . PROFILE_NAME) ;; #x3D12
    (15872 . IDENTITY_DISPLAY) ;; #x3E00
    (15873 . IDENTITY_ENTRYID) ;; #x3E01
    (15874 . RESOURCE_METHODS) ;; #x3E02
    (15875 . RESOURCE_TYPE) ;; #x3E03
    (15876 . STATUS_CODE) ;; #x3E04
    (15877 . IDENTITY_SEARCH_KEY) ;; #x3E05
    (15878 . OWN_STORE_ENTRYID) ;; #x3E06
    (15879 . RESOURCE_PATH) ;; #x3E07
    (15880 . STATUS_STRING) ;; #x3E08
    (15881 . X400_DEFERRED_DELIVERY_CANCEL) ;; #x3E09
    (15882 . HEADER_FOLDER_ENTRYID) ;; #x3E0A
    (15883 . REMOTE_PROGRESS) ;; #x3E0B
    (15884 . REMOTE_PROGRESS_TEXT) ;; #x3E0C
    (15885 . REMOTE_VALIDATE_OK) ;; #x3E0D
    (16128 . CONTROL_FLAGS) ;; #x3F00
    (16129 . CONTROL_STRUCTURE) ;; #x3F01
    (16130 . CONTROL_TYPE) ;; #x3F02
    (16131 . DELTAX) ;; #x3F03
    (16132 . DELTAY) ;; #x3F04
    (16133 . XPOS) ;; #x3F05
    (16134 . YPOS) ;; #x3F06
    (16135 . CONTROL_ID) ;; #x3F07
    (16136 . INITIAL_DETAILS_PANE) ;; #x3F08
    (26608 . ID_SECURE_MIN) ;; #x67F0
    (26623 . ID_SECURE_MAX) ;; #x67FF
    ))

(defconst mime-tnef-mapi-types-table
  '((0 . UNSPECIFIED) ;; #x0000
    (1 . NULL) ;; #x0001
    (2 . SHORT) ;; #x0002
    (3 . INT) ;; #x0003
    (4 . FLOAT) ;; #x0004
    (5 . DOUBLE) ;; #x0005
    (6 . CURRENCY) ;; #x0006
    (7 . APPTIME) ;; #x0007
    (10 . ERROR) ;; #x000a
    (11 . BOOLEAN) ;; #x000b
    (13 . OBJECT) ;; #x000d
    (20 . INT8BYTE) ;; #x0014
    (30 . STRING) ;; #x001e
    (31 . UNICODE_STRING) ;; #x001f
    (64 . SYSTIME) ;; #x0040
    (72 . CLSID) ;; #x0048
    (258 . BINARY) ;; #x0102
    ))


;;; Internal functions

(defmacro mime-tnef-byte (array idx)
  `(logand (aref ,array ,idx) 255))

(defmacro mime-tnef-padded-length (l)
  ;; L must be integer.
  `(* (/ (+ ,l 3) 4) 4))

(eval-and-compile
  (defsubst mime-tnef-2bytes (array idx)
    (+ (mime-tnef-byte array idx)
       (* (mime-tnef-byte array (1+ idx)) 256)))

  (defsubst mime-tnef-4bytes (array idx)
    (+ (mime-tnef-byte array idx)
       (* (mime-tnef-byte array (1+ idx)) 256)
       (* (mime-tnef-byte array (+ idx 2)) 65536)
       (* (mime-tnef-byte array (+ idx 3)) 16777216)))
  )


;;; Debug

(defvar mime-tnef-debug nil)

(defun mime-tnef-debug (string &rest args)
  (when mime-tnef-debug
    (if args (apply #'message string args)
      (message "%s" string))))


;;; TNEF element

(defun mime-tnef-element-start (element)
  (cdr (assq 'start element)))

(defun mime-tnef-element-end (element)
  (cdr (assq 'end element)))

(defun mime-tnef-element-name (element)
  (cdr (assq 'name element)))

(defun mime-tnef-element-type (element)
  (cdr (assq 'type element)))


;;; TNEF

(defun mime-tnef-parse (string)
  (catch :done
    (unless (and (> (length string) 6)
		 (equal (string-make-unibyte (substring string 0 4))
			(string-make-unibyte "\x78\x9f\x3e\x22")))
      (message "Input data does not seem to be MS-TNEF format")
      (throw :done nil))
    (mime-tnef-debug "TNEF Key: %04x\n" (mime-tnef-2bytes string 4))
    (let ((length (length string))
	  (read 6)
	  result object
	  lvl-type name type
	  sum
	  start end data-length)
      (while (< read length)
	(setq lvl-type (mime-tnef-byte string read)
	      name (mime-tnef-2bytes string (1+ read))
	      type (mime-tnef-2bytes string (+ read 3))
	      data-length (mime-tnef-4bytes string (+ read 5))
	      start (+ read 9)
	      end (+ start data-length)
	      object `(
		       (lvl-type . ,(or (cdr (assq lvl-type
		       				   mime-tnef-lvl-types-table))
					lvl-type))
		       (name . ,(or (cdr (assq name mime-tnef-names-table))
				    name))
		       (type . ,(or (cdr (assq type mime-tnef-types-table))
				    type))
		       (start . ,start)
		       (end . ,end)
		       ;; (length . ,(mime-tnef-4bytes string (+ read 5)))
		       )
	      read (+ read data-length 9 2)
	      sum 0)
	(dotimes (i data-length)
	  (setq sum (+ sum (mime-tnef-byte string (- read 3 i)))))
	(unless (eq (mime-tnef-2bytes string (- read 2)) (% sum 65536))
	  (message "Checksum mismatch, TNEF may be corrupted"))
	(setq result (cons object result)))
      (cons (nreverse result) string))))

(defun mime-tnef-codepage (tnef)
  (let ((elements (car tnef))
	codepage)
    (while elements
      (if (eq (mime-tnef-element-name (car elements)) 'OEMCODEPAGE)
	  (setq codepage (mime-tnef-4bytes
			  (cdr tnef) (mime-tnef-element-start (car elements)))
		elements nil)
	(setq elements (cdr elements))))
    (mime-tnef-debug "TNEF codepage is %d" codepage)
    codepage))

(defun mime-tnef-coding-system (tnef)
  (intern (format "cp%d" (mime-tnef-codepage tnef))))

(defun mime-tnef-decode-string (string tnef)
  (let ((coding (mime-tnef-coding-system tnef)))
    (decode-coding-string string
			  (if (coding-system-p coding)
			      coding
			    (detect-coding-string string t)))))

(defun mime-tnef-decode-unicode-string (string)
  (decode-coding-string string (and mime-tnef-unicode-coding-system
				    (detect-coding-string string t))))


;;; MAPI

(defun mime-tnef-mapi-parse (element tnef)
  (catch :done
    (let* ((raw (cdr tnef))
	   (read (mime-tnef-element-start element))
	   (count (mime-tnef-4bytes raw read))
	   result)
      (setq read (+ read 4))
      (mime-tnef-debug "MAPI count is %d" count)
      (dotimes (i count)
	(let ((type (mime-tnef-2bytes raw read))
	      (name (mime-tnef-2bytes raw (+ read 2)))
	      (multi 1)
	      elt)
	  (setq read (+ read 4))
	  (when (> (logand name 32768) 0) ;; #x8000
	    (mime-tnef-debug "MAPI element have GUID")
	    (let ((num (mime-tnef-4bytes raw (+ read 16))))
	      (mime-tnef-debug "MAPI number of GUID names is %d" num)
	      (if (zerop num)
		  (setq name (mime-tnef-2bytes raw (+ read 20))
			read (+ read 24))
		(setq read (+ read 20))
		(dotimes (i num)
		  (setq read (+ read 4
				(mime-tnef-padded-length
				 (mime-tnef-4bytes raw (+ read)))))))))
	  (when (or (> (logand type 4096) 0) ;; #x1000
		    (memq (cdr (assq type mime-tnef-mapi-types-table))
			  '(STRING UNICODE_STRING OBJECT BINARY)))
	    (mime-tnef-debug "MAPI element have multi-values")
	    (setq multi (prog1 (mime-tnef-4bytes raw read)
			  (setq read (+ read 4)))
		  type (logand type 61439))) ;; #xefff
	  (setq type (or (cdr (assq type mime-tnef-mapi-types-table)) type)
		name (or (cdr (assq name mime-tnef-mapi-names-table)) name))
	  (mime-tnef-debug
	   "MAPI %s (type %s), number of values is %d"
	   (if (integerp name) (format "%x" name) name) type multi)
	  (let (values)
	    (dotimes (i multi)
	      (cond
	       ((memq type '(SHORT BOOLEAN))
		(setq values (cons (mime-tnef-2bytes raw read) values)
		      ;; Padding 2 bytes.
		      read (+ read 4)))
	       ((memq type '(INT FLOAT))
		(setq values (cons (substring raw read (+ read 4)) values)
		      read (+ read 4)))
	       ((memq type '(SYSTIME DOUBLE APPTIME CURRENCY INT8BYTE))
		(setq values (cons (cons read (+ read 8)) values)
		      read (+ read 8)))
	       ((eq type 'CLSID)
		(setq values (cons (cons read (+ read 16)) values)
		      read (+ read 16)))
	       ((memq type '(STRING UNICODE_STRING OBJECT BINARY))
		(let ((length (mime-tnef-4bytes raw read)))
		  (unless (zerop length)
		    (setq values
			  (cons (cons
				 (+ read 4)
				 (+ read 4 length
				    (or (cdr (assq type
						   '((STRING . -1)
						     (UNICODE_STRING . -2))))
					0)))
				values)))
		  (setq read (+ read 4 (mime-tnef-padded-length length)))))
	       (t
		(message "TNEF may be corrupted!!")
		(throw :done (nreverse result)))
	       ))
	    (setq result
		  (cons `((name . ,name) (type . ,type) (values . ,values))
			result))
	    )))
      (nreverse result))))

(defun mime-tnef-mapi-string (mapi-element tnef)
  (let* ((value (cadr (assq 'values mapi-element)))
	 (string (substring (cdr tnef) (car value) (cdr value))))
    (if (eq (cdr (assq 'type mapi-element)) 'UNICODE_STRING)
	(mime-tnef-decode-unicode-string string)
      (mime-tnef-decode-string string tnef))))


;;; files

(defun mime-tnef-files (tnef)
  (let ((elements (car tnef))
	files file type)
    (while elements
      (setq type (mime-tnef-element-name (car elements)))
      (cond
       ((eq type 'ATTACHRENDDATA)
	(when file
	  (setq files (cons file files)
		file nil)))
       ((eq type 'ATTACHDATA)
	(when (assq 'start file)
	  (mime-tnef-debug "Multiple ATTACHDATA for single ATTACHRENDDATA"))
	(setq file (append
		    `(,(assq 'start (car elements))
		      ,(assq 'end (car elements))
		      )
		    (delq (assq 'start file)
			  (delq (assq 'end file) file)))))
       ((eq type 'ATTACHTITLE)
	(unless (assq 'name file)
	  (let ((start (mime-tnef-element-start (car elements)))
		(end (mime-tnef-element-end (car elements))))
	    (setq file
		  (cons `(name . ,(mime-tnef-decode-string
				   (substring (cdr tnef) start end) tnef))
			file)))))
       ((eq type 'ATTACHMENT)
	(let ((mapi (mime-tnef-mapi-parse (car elements) tnef)))
	  (while mapi
	    (let* ((elt (car mapi))
		   (name (cdr (assq 'name elt))))
	      (cond
	       ((eq name 'ATTACH_LONG_FILENAME)
		(setq file (append `((name . ,(mime-tnef-mapi-string elt tnef))
				    (longname . t))
				  (delq (assq 'longname file)
					(delq (assq 'name file) file)))))
	       ((eq name 'DISPLAY_NAME)
		;; ATTACH_LONG_FILENAME is preferred.
		(unless (assq 'longname file)
		  (setq file (cons `(name . ,(mime-tnef-mapi-string elt tnef))
				   (delq (assq 'name file) file)))))
	       ))
	    (setq mapi (cdr mapi))))))
      (setq elements (cdr elements)))
    (delq nil (nreverse (cons file files)))))


;;; MIME-view

(defun mime-tnef-insert-file-parameters (params file data)
  (let (charset
	result)
    (dolist (elt params)
      (setq result
	    (cons
	     (cons
	      (car elt)
	      (if (eq (cdr elt) 'charset)
		  (or charset
		      (let ((codings (detect-coding-string data)))
			(while (and (null charset) codings)
			  (setq charset (coding-system-to-mime-charset
					 (car codings)))
			  (when charset
			    (setq charset (symbol-name charset)))
			  (setq codings (cdr codings)))
			charset))
		(cdr elt)))
	     result)))
    (mime-edit-insert-file-parameters (nreverse result) file)))

(defun mime-tnef-insert-file (file data)
  (let*  ((guess (mime-find-file-type file))
	  (type (nth 0 guess))
	  (subtype (nth 1 guess))
	  (parameters (nth 2 guess))
	  (encoding "8bit")
	  (disposition-type (nth 4 guess))
	  (disposition-params (nth 5 guess)))
    (setq parameters
	  (concat
	   (when (consp parameters)
	     (mime-tnef-insert-file-parameters parameters file data))
	   (when disposition-type
	     (concat "\n" "Content-Disposition: " disposition-type
		     (mime-edit-insert-file-parameters
		      disposition-params file)))))
    (insert
     ;; multibyte buffer is needed for non-ASCII filename.
     (with-temp-buffer
       (mime-edit-insert-tag type subtype parameters)
       (mime-edit-define-encoding encoding)
       (goto-char (point-min))
       (mime-tnef-translate-single-part-tag)
       (buffer-string)))
    (insert data "\n")
    ))

(defun mime-tnef-translate-single-part-tag ()
  (if (re-search-forward mime-edit-single-part-tag-regexp nil t)
      (let* ((beg (match-beginning 0))
	     (end (match-end 0))
	     (tag (buffer-substring beg end)))
	(delete-region beg end)
	(let ((contype (mime-edit-get-contype tag))
	      (encoding (mime-edit-get-encoding tag)))
	  (save-restriction
	    (narrow-to-region (point)(point))
	    (insert "Content-Type: " contype "\n")
	    (if encoding
		(insert "Content-Transfer-Encoding: " encoding "\n"))
	    (mime-encode-header-in-buffer))
	  (cons (and contype
		     (downcase contype))
		(and encoding
		     (downcase encoding))))
	)))

(defvar mime-tnef-buffers nil)

(defun mime-tnef-kill-buffers ()
  (mapc (lambda (buffer)
	  (when (bufferp buffer)
	    (kill-buffer buffer)))
	mime-tnef-buffers))

(defun mime-display-application/ms-tnef (entity situation)
  (let ((tnef (mime-tnef-parse (mime-entity-content entity)))
	files p beg end buffer tnef-entity)
    (setq files (and (car tnef) (mime-tnef-files tnef)))
    (if (null files)
	(insert (if (car tnef)
		    "No attachment.\n"
		  "Data may be corrupted.\n"))
      (goto-char (setq p (point-max)))
      (save-restriction
      	(narrow-to-region p p)
      	(setq buffer (generate-new-buffer
		      (concat mime-temp-buffer-name "TNEF*")))
      	(with-current-buffer buffer
	  (set-buffer-multibyte nil)
	  (let ((boundary (concat "TNEF-" (mime-edit-make-boundary))))
	    (insert "Content-Type: multipart/mixed;\n"
		    " boundary=\"" boundary "\"\n"
		    "Content-Transfer-Encoding: 7bit\n\n")
	    ;; (mime-encode-header-in-buffer)
	    ;; (goto-char (point-max))
	    (while files
	      (narrow-to-region (point) (point))
	      (insert "--" boundary "\n")
	      (mime-tnef-insert-file (cdr (assq 'name (car files)))
				     (substring
				      (cdr tnef)
				      (cdr (assq 'start (car files)))
				      (cdr (assq 'end (car files)))))
	      (goto-char (point-max))
	      (setq files (cdr files)))
	    (widen)
	    (insert "--" boundary "--" "\n")
	    (setq tnef-entity
	 	  (mime-parse-message
      	 	   (mm-expand-class-name 'buffer)
      	 	   nil entity (mime-entity-node-id entity))
      	 	  buffer-read-only t)))
	(add-hook 'kill-buffer-hook 'mime-tnef-kill-buffers nil t)
	(make-local-variable 'mime-tnef-buffers)
	(add-to-list 'mime-tnef-buffers buffer)
	(mime-display-entity
	 tnef-entity nil '((header . invisible)
			   (body . visible)
			   (entity-button . invisible))))
      )))

;;; @ end
;;;

(provide 'mime-tnef)

;;; mime-tnef.el ends here
