
(define (cube x) (* x x x))
(define dx       0.00001)

(define (compose f g)
    (lambda (x)
        (f (g x))))

(define (repeated f n)
    (if
        (= n 1)
        (lambda (x) (f x))
        (compose f (repeated f (- n 1)))))

(define (smooth-once f)
    (lambda (x)
        (/
            (+
                (f (- x dx))
                (f x)
                (f (+ x dx)))
            3)))

(define (smooth f n)
     (repeated (smooth-once f) n))
     


            


