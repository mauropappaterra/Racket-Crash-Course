;; Racket Crash Course
;; functions.rkt
;; Created by Mauro José Pappaterra on 15 March 2017

#lang racket

(printf"\n\n")
;;1

(define binomial (λ(n k) ; finds binomial coefficient of n choose k
                    (cond
                      [(= k 0) 1]
                      [(= n k) 1]
                      [(> n k)(> k 0) (+(binomial (- n 1) k)(binomial (- n 1) (- k 1)))]) ; recursive call
                   ))

; Let's try our recursive function :)
(printf "n = 3 k = 0  ==> ") (binomial 3 0); => 1
(printf "n = 3 k = 3  ==> ") (binomial 3 3); => 1
(printf "n = 3 k = 2  ==> ") (binomial 3 2); => 3
(printf "n = 4 k = 1  ==> ") (binomial 4 1); => 4
(printf "n = 4 k = 2  ==> ") (binomial 4 2); => 6
(printf "n = 10 k = 7  ==> ") (binomial 10 7); => 120
(printf "n = 14 k = 4  ==> ") (binomial 14 4); => 1001
(printf "n = 22 k = 15  ==> ") (binomial 22 15); => 170544
(printf "n = 35 k = 33  ==> ") (binomial 35 33); => 595

(printf"\n\n")

;;2

(define mod (λ(n m) ; divides n by m, returns reminder
                    (cond
                      [(= n m) 0]
                      [(< n m) n]
                      [(> n m) (mod (- n m) m)]) ; recursive call
              ))

; Let's try our recursive function :)
(printf "mod(5,5) ==> ") (mod 5 5); => 0
(printf "mod(7,10) ==> ") (mod 7 10); => 7
(printf "mod(10000,5) ==> ") (mod 10000 5); => 0
(printf "mod(100003,5) ==> ") (mod 100003 5); => 3
(printf "mod(14657,7) ==> ") (mod 14657 7); => 6 
;(printf "mod(536346363,4) ==> ") (mod 536346363 4); => 3

(printf"\n\n")

;;3
(define binaryToDecimal (λ(b) ; takes binary number and returns decimal integer
                          (define b_list(binaryToList b)) ; converts b into a list
                          (define last_number(-(length b_list) 1))
                          (define power 0)
                          (define decimal 0)

                          (for ([i b_list]) ; loop
                            (set! decimal (+ decimal(* (list-ref b_list last_number) (expt 2 power))))
                            (set! last_number (- last_number 1))
                            (set! power(+ power 1))
                           )

                          decimal ; returns decimal
                          ))

(define binaryToList (λ(num) ; takes any number and turns it into a list of binary numbers, everything other than 1 will turn into 0
                         (define char_list(string->list(number->string num))); '(#\1 #\0 #\0 #\0 #\0 #\1)
                         (define binary_list(list)) ;an empty list

                       (for ([i char_list]) ; loop
                            ;(set! binary_list (append binary_list '(0)))
                            (if (equal? #\1 i) (set! binary_list (append binary_list '(1))) (set! binary_list (append binary_list '(0))))
                           )

                       binary_list ; returns binary list
                       ))

; Let's try our function :)
(printf "(0010) ==> ") (binaryToList 100001); => '(1 0 0 0 0 1)
(printf "(111111110) ==> ") (binaryToList 111111110); => '(1 0 0 0 0 1)
(printf "(71691) ==> ") (binaryToList 716001); => '(1 0 0 0 0 1)

(printf"\n\n")

; Let's try our function :)
(printf "(101101) ==> ") (binaryToDecimal 101101); => 45
(printf "(11111100) ==> ") (binaryToDecimal 11111100); => 252
(printf "(0000000000001) ==> ") (binaryToDecimal 0000000000001); => 1
(printf "(01100011) ==> ") (binaryToDecimal 01100011); => 99
(printf "(001101011001) ==> ") (binaryToDecimal 001101011001); => 857

(printf"\n\n")

;;4
(define addBinary (λ(b) ; sums al binaries, returns result in decimals
                     (define result 0)

                     (for ([i b]) ; loop
                       (set! result (+ result (binaryToDecimal i)))
                      )

                      result ; return result
                      ))

; Let's try our function :)
(printf "(10 + 10) ==> ") (addBinary '(10 10)); => 4
(printf "(10 + 10 + 10 + 10 + 10) ==> ") (addBinary '(10 10 10 10 10)); => 10
(printf "(100 + 100) ==> ") (addBinary '(100 100)); => 8
(printf "(1010101 + 11111) ==> ") (addBinary '(1010101 111110)); => 147

(printf"\n\n")

;;5
(define min (λ(list) ; returns the lowest value on the list
                 (define lower 99999999999999999999999999999999)  

                 (for ([i list]) ; loop
                  (cond
                   [(< i lower) (set! lower i)]
                    ))
              
              lower; returns lowest int
              ))

; Let's try our function :)
(printf "min (2 3 4 5 6 7 1) ==> ") (min '(2 3 4 5 6 7 1)); => 1
(printf "min (100 1234 36 28) ==> ") (min '(100 1234 36 28)); => 28
(printf "min (3 4 56 78 945 234 123 777 3) ==> ") (min '(3 4 56 78 945 234 123 777 3)); => 3
(printf "min (1 2 1) ==> ") (min '(1 2 1)); => 1
(printf "min (521 32 221 -999 -999999 -9999999999999 100 6527 -76) ==> ") (min '(521 32 221 -999 -999999 -9999999999999 100 6527 -76)); => -9999999999999

(printf"\n\n")

;;6
(define myRemove (λ(num lista) ; removes all instances of num from list NOTICE: I changed 'list' for Spanish 'lista' in order to avoid using a special word

                 (for ([i lista]) ; loop
                  (cond
                   [(equal? #t(equal? i num)) (set! lista (remq i lista)) ]
                  ;[(equal? #f(equal? i num)) (set! lista (remq i lista)) ]
                   ))
              
              lista; returns list
              ))

; Let's try our function :)
(printf "myRemove 3 (2 3 4 3 6 3 1) ==> ") (myRemove 3 '(2 3 4 3 6 3 1)); =>'(2 4 6 1)
(printf "myRemove 28 (28 28 36 28) ==> ") (myRemove 28 '(28 28 36 28)); => '(36)
(printf "myRemove 4 (4 4 56 78 945 4 4 4 3) ==> ") (myRemove 4 '(4 4 56 78 945 4 4 4 3)); => '(56 78 945 3)
(printf "myRemove 1 (1 2 1) ==> ") (myRemove 1 '(1 2 1)); => '(2)
(printf "myRemove 1 (1 2 1) ==> ") (myRemove 2 '(1 2 1)); => '(1 1)
(printf "myRemove -9999999999999 (521 32 221 -999 -999999 -9999999999999 100 6527 -76) ==> ") (myRemove -9999999999999 '(521 32 221 -999 -999999 -9999999999999 100 6527 -76)); =>'(521 32 221 -999 -999999 100 6527 -76)

(printf"\n\n")

;;7
;(define selectionSort (λ(lista) ; takes a list and sorts it
 ;                (define j 1)
 ;                (define flag #f)
;
 ;                (for ([i lista]) ; loop
  ;                (cond
   ;                [(< i (list-ref lista j)) (
;
 ;                      ; swap locations i and j here if this is never executed flag is set to #t
  ;                                        )]
   ;                 )
   ;                )
  ;            
 ;                  (if (equal? #f flag) (selectionSort(lista)) (break)) ; call recusive function only is flag is false
;
 ;             ))
;
; Let's try our function :)
;(printf "selectionSort (2 3 4 5 6 7 1) ==> ") (selectionSort '(2 3 4 5 6 7 1)); => 1
;(printf "selectionSort(100 1234 36 28) ==> ") (selectionSort '(100 1234 36 28)); => 28
;(printf "selectionSort (3 4 56 78 945 234 123 777 3) ==> ") (selectionSort '(3 4 56 78 945 234 123 777 3)); => 3
;(printf "selectionSort (1 2 1) ==> ") (selectionSort '(1 2 1)); => 1
;(printf "selectionSort (521 32 221 -999 -999999 -9999999999999 100 6527 -76) ==> ") (selectionSort'(521 32 221 -999 -999999 -9999999999999 100 6527 -76)); => -9999999999999

(printf"\n\n")