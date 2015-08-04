
(define (inc      n) (+ n 1))

(define (identity x) x)

(define
    (prod-iter-helper
        runningsum
        operation
        termfunction
        termvalue
        nextfunction
        upperbound) 
    (if
        (> termvalue upperbound)
        runningsum
        (prod-iter-helper
            (operation runningsum (termfunction termvalue))
            operation
            termfunction
            (nextfunction termvalue)
            nextfunction
            upperbound)))

(define (product term starter a next b)
    (prod-iter-helper
        starter
        *
        term
        a
        next
        b))

(define (product-integers a b)
    (product identity 1 a inc b))

(define (factorial b)
    (product identity 1 1 inc b))

(define (even? n)
    (= (remainder n 2) 0))
 
(define (pi-term index)
    (if
        (even? index)
            (/ (+ index 2) (+ index 1))
            (/ (+ index 1) (+ index 2))))

(define (pi-approx n)
    (* 4.0 (product pi-term 1/1 1/1 inc (/ n 1))))




