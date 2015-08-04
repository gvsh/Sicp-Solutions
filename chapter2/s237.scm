
(define nil '())

(define (accumulate op initial sequence)
    (if (null? sequence)
        initial
        (op (car sequence)
            (accumulate op initial (cdr sequence)))))

(define (accumulate-n op init seqs)
    (if
        (null? (car seqs))
        nil
        (cons
            (accumulate   op init (map (lambda (x) (car x)) seqs))
            (accumulate-n op init (map (lambda (x) (cdr x)) seqs)))))

(define (dot-product v w)
    (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
    (map (lambda (x) (dot-product x v)) m))

(define (transpose m)
    (accumulate-n cons nil s))

(define (matrix-*-matrix m1 m2)
    (map (lambda (x) (matrix-*-vector m1 x)) (transpose m2)))

(define w
    (list 
        (list  1  2  3)
        (list  4  5  6)
        (list 10 11 12)))

(define s
    (list 
        (list  1  2  3)
        (list  4  5  6)
        (list  7  8  9)
        (list 10 11 12)))

(define w2
    (list 
        (list  1  2  3  4)
        (list  4  5  6  7)
        (list  7  8  9 10)
        (list 10 11 12 13)))

(define v1 (list  1  2  3))
(define v2 (list  4  5  6))

(accumulate-n + 0 s)
(dot-product v1 v2)
(matrix-*-vector w v1)
(matrix-*-matrix s w2)

