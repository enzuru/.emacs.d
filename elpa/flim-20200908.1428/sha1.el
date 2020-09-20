;;; sha1.el --- SHA1 Secure Hash Algorithm.  -*- lexical-binding: t -*-

;; Copyright (C) 1999, 2001  Free Software Foundation, Inc.

;; Author: Shuhei KOBAYASHI <shuhei@aqua.ocn.ne.jp>
;; Keywords: SHA1, FIPS 180-1

;; This file is part of FLIM (Faithful Library about Internet Message).

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation; either version 2, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

;;; Commentary:

;; Examples from FIPS PUB 180-1.
;; <URL:http://www.itl.nist.gov/div897/pubs/fip180-1.htm>
;;
;; (sha1 "abc")
;; => a9993e364706816aba3e25717850c26c9cd0d89d
;;
;; (sha1 "abcdbcdecdefdefgefghfghighijhijkijkljklmklmnlmnomnopnopq")
;; => 84983e441c3bd26ebaae4aa1f95129e5e54670f1
;;
;; (sha1 (make-string 1000000 ?a))
;; => 34aa973cd4c4daa4f61eeb2bdbad27316534016f

;;; Code:

(defvar sha1-dl-module nil)

(provide 'sha1)

;;; sha1.el ends here
