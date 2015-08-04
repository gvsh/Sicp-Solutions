
(define (quotient-iter p n k)
    (if (= (remainder p n) 0)
        (quotient-iter (quotient p n) n (+ k 1))
        k))

(define (pair23 a b)
    (* (expt 2 a) (expt 3 b)))

(define (x-coord p)
    (quotient-iter p 2 0))

(define (y-coord p)
    (quotient-iter p 3 0))



