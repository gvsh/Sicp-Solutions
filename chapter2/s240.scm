
(define nil '())

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

(define (enumerate-interval low high)
    (if (> low high)
        nil
        (cons low (enumerate-interval (+ low 1) high))))

(define (flatmap proc seq)
    (accumulate append nil (map proc seq)))

(define (prime-sum? pair)
    (prime? (+ (car pair) (cadr pair))))

(define (make-pair-sum pair)
    (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))

(define (unique-pairs n)
    (flatmap
        (lambda (i)
            (map
                (lambda (j) (list i j))
                (enumerate-interval 1 (- i 1))))
        (enumerate-interval 1 n)))))



(define (prime-sum-pairs n)
  (map make-pair-sum
       (filter prime-sum? (unique-pairs n))))

(unique-pairs 5)
(prime-sum-pairs 5)

