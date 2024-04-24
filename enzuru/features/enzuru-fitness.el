;; -*- coding: utf-8; lexical-binding: t -*-

(defun enzuru-fitness-monthly-pounds
    (daily-calories daily-training-hours days-home days-outside)
  (let ((neat-home 2170)
        (neat-outside 2615)
        (burned-per-hour 400)
        (days-total (+ days-home days-outside)))
    (/ (- (* days-total daily-calories)
          (* days-total daily-training-hours burned-per-hour)
          (* days-home neat-home)
          (* days-outside neat-outside))
       3500.0)))

(defun enzuru-fitness-success (message)
  (print (concat "SUCCESSFUL PREDICTION: " message)))

(defun enzuru-test-failure (message)
  (print (concat "FAILED PREDICTION: " message)))

(defun enzuru-test-weight-loss (month predicted actual)
  (if (eql (round predicted) actual)
      (enzuru-fitness-success month)
    (enzuru-test-failure month)))

(defun enzuru-fitness-test-algo ()
  (enzuru-test-weight-loss "2010"
                           (enzuru-fitness-monthly-pounds 1500 (/ 12 7.0) 30 0) -10)
  (enzuru-test-weight-loss "2019"
                           (enzuru-fitness-monthly-pounds 2500 (/ 10 7.0) 30 0) -2)
  (enzuru-test-weight-loss "January 2024"
                           (enzuru-fitness-monthly-pounds 2500 0.97 31 0) -2)
  (enzuru-test-weight-loss "February 2024"
                           (enzuru-fitness-monthly-pounds 2690 1.31 28 0) 3)
  (enzuru-test-weight-loss "March 2024"
                           (enzuru-fitness-monthly-pounds 2677 1.26 31 0) -1)
  (enzuru-test-weight-loss "April 2024"
                           (enzuru-fitness-monthly-pounds 2300 1.5 30 0) -4))

(defun enzuru-fitness-vo2-max (ftp kilos)
  (+ (/ (* 10.8 ftp) kilos) 7))

(provide 'enzuru-fitness)
