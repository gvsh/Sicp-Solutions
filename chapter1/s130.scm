

(define (inc      n) (+ n 1))

(define (identity x) x)

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

(define (sum-integers a b)
    (sum identity a inc b))

(sum-integers 1 10)

