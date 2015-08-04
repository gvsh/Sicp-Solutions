
(define (inc      n) (+ n 1))

(define (identity x) x)

(define
    (sum-iter-helper
        filter?    
        runningsum
        operation
        termfunction
        termvalue
        nextfunction
        upperbound) 
    (if
        (> termvalue upperbound)
        runningsum
        (if
            (filter? (termfunction termvalue))
                (sum-iter-helper
                    filter?
                    (operation runningsum (termfunction termvalue))
                    operation
                    termfunction
                    (nextfunction termvalue)
                    nextfunction
                    upperbound)
                (sum-iter-helper
                    filter?
                    runningsum
                    operation
                    termfunction
                    (nextfunction termvalue)
                    nextfunction
                    upperbound))))


(define (sum filter? term starter operation a next b)
    (sum-iter-helper
        filter?
        starter
        operation
        term
        a
        next
        b))

(define (filtered-accumulate filter? combiner null-value term a next b)
    (sum filter? term null-value combiner a next b))

(define (even? n)
    (= (remainder n 2) 0))

(define (sum-integers a b)
    (filtered-accumulate even? + 0 identity a inc b))

;; prime number test code
(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

;; end prime number test code

(define (prime-sum a b)
    (if
        (= a 1)
        (filtered-accumulate prime? + 0 square 2 inc b)
        (filtered-accumulate prime? + 0 square a inc b)))

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

    
(define (phi-product n)
    (define (coprime? a)
        (= (gcd a n) 1))
    (filtered-accumulate coprime? * 1 identity 1 inc (- n 1))))


