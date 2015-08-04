
(define (accumulate op initial sequence)
    (if (null? sequence)
        initial
        (op (car sequence)
            (accumulate op initial (cdr sequence)))))

(define nil '())

(define (square x) (* x x))

(define (map proc sequence)
    (accumulate
        (lambda (x y)
            (cons (proc x) y))
        nil
        sequence))

(define (append seq1 seq2)
    (accumulate cons seq2 seq1))

(define (length seq)
    (accumulate
        (lambda (elem sum) (+ 1 sum))
        0
        seq))

(map square (list 1 2 3))

(append (list 1 2) (list 3 4 6))

(length (append (list 1 2) (list 3 4 6)))

