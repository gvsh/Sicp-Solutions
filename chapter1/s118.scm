
(define (double x) (+ x x))
(define (halve  x) (/ x 2))

(define (odd? n)
    (=
        (remainder n 2)
        1))
    
(define (even? n)
    (=
        (remainder n 2)
        0))

(define (fast-mult-it b n)
    (fast-mult-iter 0 b n))

(define (fast-mult-iter a b n)
    (cond
        ((= n 0) a)
        ((even? n)
            (fast-mult-iter
                a
                (double b)
                (halve  n)))
        ((odd? n)
            (fast-mult-iter
                (+ a b)
                b
                (- n 1)))))

