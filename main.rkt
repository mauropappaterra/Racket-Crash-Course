;; Racket Crash Course
;; main.rkt
;; Created by Mauro José Pappaterra on 20 February 2017

#lang racket ;; This line defines the language

;; This is a comment it won't be compiled

;; Arithmetic operations
(+ 1 1)  ; => 2 addition
(- 8 1)  ; => 7 substraction
(* 10 2) ; => 20 multiplication
(quotient 5 2) ; => 2 quotient
(remainder 5 2) ; => 1 reminder
(expt 2 3) ; => 8 exponentiation
(/ 35 5) ; => 7 division
(/ 1 3) ; => 1/3 fractal division
(exact->inexact 1/3) ; => 0.3333333333333333 fractions
(+ 1+2i  2-3i) ; => 3-1i complex numbers

;; Booleans
#t ; for true
#f ; for false (any value other than #f is true)
(not #t) ; => #f NOT
(and #t #f (error "doesn't get here")) ; => #f AND
(or #f #t (error "doesn't get here"))  ; => #t OR

;; Strings and Characters
#\A ; => #\A
#\λ ; => #\λ
#\u03BB ; => #\λ
"Hello World!" ; => Hello World!
"Albert \"Baby Face\" Capone"   ; backslash is an escaping character
(string-append "Hello " "world!") ; => "Hello world!" String concatenation