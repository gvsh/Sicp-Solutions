
(define nil '())

(define (subsets s)
    (if (null? s)
        (list nil)
        (let ((rest (subsets (cdr s))))
        (append
            rest
            (map
                (lambda (x) (cons (car s) x))
                rest)))))

(subsets (list 1 2 3 4 5 6))
(length (subsets (list 1 2 3 4 5 6 7 8)))





