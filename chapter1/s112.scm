                
(define (pascal n a)
    (cond
        ((or
            (< n 3)
            (= a 1)
            (= n a)) 1)
        (else
            (+
                (pascal (- n 1) (- a 1))
                (pascal (- n 1) a)))))

