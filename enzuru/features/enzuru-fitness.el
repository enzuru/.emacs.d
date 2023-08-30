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

(defun success (message)
  (print (concat "SUCCESS: " message)))

(defun failure (message)
  (print (concat "FAILURE: " message)))

(defun enzuru-fitness-test-algo ()
  (if (eql (round (enzuru-fitness-monthly-pounds 2645 1.1 31 0)) 0)
      (success "January 2023")
    (failure "January 2023"))
  (if (eql (round (enzuru-fitness-monthly-pounds 2679 1.14 28 0)) 0)
      (success "February 2023")
    (failure "February 2023"))
  (if (eql (round (enzuru-fitness-monthly-pounds 2742 1.39 31 0)) -1)
      (success "March 2023")
    (failure "March 2023"))
  (if (eql (round (enzuru-fitness-monthly-pounds 2567 1.267 30 0)) -1)
      (success "April 2023")
    (failure "April 2023"))
  (if (eql (round (enzuru-fitness-monthly-pounds 2581 1.42 31 0)) -1)
      (success "May 2023")
    (failure "May 2023"))
  (if (eql (round (enzuru-fitness-monthly-pounds 2800 1.167 20 11)) 0)
      (success "June 2023")
    (failure "June 2023"))
  (if (eql (round (enzuru-fitness-monthly-pounds 2565 0.87 24 7)) 0)
      (success "July 2023")
    (failure "July 2023"))
  (if (eql (round (enzuru-fitness-monthly-pounds 2548 1.2 19 12)) -2)
      (success "August 2023")
    (failure "August 2023"))
  (if (eql (round (enzuru-fitness-monthly-pounds 2500 1.4 30 0)) -2)
      (success "September 2023")
    (failure "September 2023")))

(defun enzuru-fitness-vo2-max (ftp kilos)
  (+ (/ (* 10.8 ftp) kilos) 7))

(provide 'enzuru-fitness)
