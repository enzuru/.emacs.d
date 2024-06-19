;; -*- coding: utf-8; lexical-binding: t -*-

(defun enzuru-fitness-monthly-pounds
    (daily-calories daily-training-hours days)
  (let ((neat 2200)
        (burned-per-hour 400))
    (/ (- (* days daily-calories)
          (* days daily-training-hours burned-per-hour)
          (* days neat))
       3500.0)))

(defun enzuru-fitness-success (message)
  (print (concat "SUCCESSFUL PREDICTION: " message)))

(defun enzuru-fitness-failure (message)
  (print (concat "FAILED PREDICTION: " message)))

(defun enzuru-fitness-weight-test (month predicted actual)
  (if (eql (round predicted) actual)
      (enzuru-fitness-success month)
    (enzuru-fitness-failure month)))

(defun enzuru-fitness-test-algo ()
  (enzuru-fitness-weight-test "2010"
                              (enzuru-fitness-monthly-pounds 1500 (/ 12 7.0) 30) -10)
  (enzuru-fitness-weight-test "2019"
                              (enzuru-fitness-monthly-pounds 2500 (/ 10 7.0) 30) -2)
  (enzuru-fitness-weight-test "January 2024"
                              (enzuru-fitness-monthly-pounds 2500 0.97 31) -2)
  (enzuru-fitness-weight-test "February 2024"
                              (enzuru-fitness-monthly-pounds 2690 1.31 28) 3)
  (enzuru-fitness-weight-test "March 2024"
                              (enzuru-fitness-monthly-pounds 2677 1.26 31) -1)
  (enzuru-fitness-weight-test "April 2024"
                              (enzuru-fitness-monthly-pounds 2367 1.33 30) -3)
  (enzuru-fitness-weight-test "May 2024"
                              (enzuru-fitness-monthly-pounds 2483 1.23 31) -4)
  (enzuru-fitness-weight-test "June 2024"
                              (enzuru-fitness-monthly-pounds 2567 1.867 30) -3))

(defun enzuru-fitness-vo2-max (ftp kilos)
  (+ (/ (* 10.8 ftp) kilos) 7))

(provide 'enzuru-fitness)
