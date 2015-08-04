

(define (even? n)
  (= (remainder n 2) 0))


(define (inc      n) (+ n 1))
(define (cube     x) (* (* x x) x))

(define
    (sum-iter-helper
        runningsum
        termfunction
        termvalue
        nextfunction
        upperbound) 
    (if
        (> termvalue upperbound)
        runningsum
        (sum-iter-helper
            (+ runningsum (termfunction termvalue))
            termfunction
            (nextfunction termvalue)
            nextfunction
            upperbound)))

(define (sum term a next b)
    (sum-iter-helper
        0
        term
        a
        next
        b))
            
(define (simpson-rule f a b n)
    (define (find-yk k)
        (if (even? k)
            (*
                2
                (f (+ a (* k (/
                (- b a)
                n)))))
            (*
                4
                (f (+ a (* k (/
                (- b a)
                n)))))))
        (*
            1.0
            (*
                (/
                    (/
                        (- b a)
                        n)                
                    3)
            (sum
                find-yk
                0
                inc
                n)))
            



