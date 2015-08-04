
(define (cube   x) (* x x x))
(define (square x) (* x x))

(define (cubic a b c)
    (lambda (x)
        (+
            (* 1 (cube x))
            (* a (square x))
            (* b x)
            c)))







