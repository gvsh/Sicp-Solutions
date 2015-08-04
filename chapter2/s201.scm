
(define (abs x)
    (cond ((< x 0) (- x))
        (else x)))

(define (gcd a b)
    (if (= b 0)
        a
        (gcd
            b
            (remainder a b))))

(define (make-rat n1 d1)
    (let
        ((n (abs  n1))
         (d (abs  d1))
         (ns (if (< n1 0) -1 1))
         (ds (if (< d1 0) -1 1)))
        (let
            ((g (gcd n d)))
            (cons
                (* ns ds (/ n g))
                (/ d g)))))


(define (numer x) (car x))

(define (denom x) (cdr x))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))



(print-rat (make-rat  4  12))
(print-rat (make-rat -4  12))
(print-rat (make-rat  4 -12))
(print-rat (make-rat -4 -12))

(numer  (make-rat  4  12))
(numer  (make-rat -4  12))
(numer  (make-rat  4 -12))
(numer  (make-rat -4 -12))



(denom  (make-rat  4  12))
(denom  (make-rat -4  12))
(denom  (make-rat  4 -12))
(denom  (make-rat -4 -12))




