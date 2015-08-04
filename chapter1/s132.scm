

(define (inc      n) (+ n 1))

(define (identity x) x)

(define
    (sum-iter-helper
        runningsum
        operation
        termfunction
        termvalue
        nextfunction
        upperbound) 
    (if
        (> termvalue upperbound)
        runningsum
        (sum-iter-helper
            (operation runningsum (termfunction termvalue))
            operation
            termfunction
            (nextfunction termvalue)
            nextfunction
            upperbound)))

(define (sum term starter operation a next b)
    (sum-iter-helper
        starter
        operation
        term
        a
        next
        b))

(define (accumulate combiner null-value term a next b)
    (sum term null-value combiner a next b))
    

(define (sum-integers a b)
    (accumulate + 0 identity a inc b))

(sum-integers 1 10)

(define (factorial b)
    (sum identity 1 * 1 inc b))

(sum-integers 1 8)
 
