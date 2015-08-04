
(define (square n) (* n n))

(define (odd? n)
    (= (remainder n 2) 1))
    
(define (even? n)
    (= (remainder n 2) 0))
    
(define (fast-expt-it b n)
    (fast-expt-iter 1 b n))

(define (fast-expt-iter a b n)
    (cond
        ((= n 0) a)
        ((even? n)
            (fast-expt-iter
                a
                (square b)
                (/ n 2)))
        ((odd? n)
            (fast-expt-iter
                (* a b)
                b
                (- n 1)))))



