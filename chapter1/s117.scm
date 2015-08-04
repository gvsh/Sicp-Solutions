
(define (double x) (+ x x))
(define (halve  x) (/ x 2))

(define (odd? n)
    (= (remainder n 2) 1))
    
(define (even? n)
    (= (remainder n 2) 0))

(define (* b n)
    (cond
        ((= n 0) 0)
        ((even? n)
            (double (* b (halve n))))
        ((odd? n)
            (+ b (* b (- n 1))))))
    

