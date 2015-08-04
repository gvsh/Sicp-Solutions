
(define (square n) (* n n))


(define (smallest-divisor n)
    (find-divisor n 2))

(define (find-divisor n test-divisor)
    (cond
        ((> (square test-divisor) n)
            n)
        ((divides? test-divisor n)
            test-divisor)
        (else
            (find-divisor
                n
                (+ test-divisor 1)))))

(define (divides? a b)
    (= (remainder b a) 0))

(define (prime? n)
    (=
        n
        (smallest-divisor n)))

(define (start-prime-test n start-time)
    (if
        (prime? n)
        (report-prime
            (-
                (runtime)
                start-time))))

(define (report-prime elapsed-time)
    (display " *** \n")
    (display elapsed-time)
    (display " *** \n")
    "over")

(define (timed-prime-test n)
    (display n)
    (start-prime-test n (runtime)))

(timed-prime-test 2932031007403)

