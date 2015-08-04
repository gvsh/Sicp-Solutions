
(define nil '())

(define (odd?  n) (= (remainder n 2) 1))

(define (even? n) (= (remainder n 2) 0))

(define (filter predicate sequence)
    (cond
        ((null? sequence)
                nil)
        ((predicate (car sequence))
                (cons
                    (car sequence)
                    (filter
                        predicate
                        (cdr sequence))))
        (else
                (filter
                        predicate
                        (cdr sequence)))))

(filter odd? (list 1 2 3 4 5))

(define (same-parity . list1)
    (if
        (null? list1)
        '()
        (if
            (odd? (car list1))
            (filter odd?  list1)
            (filter even? list1))))


(same-parity 1 2 3 4 5)
(same-parity 0 2 3 4 5)

