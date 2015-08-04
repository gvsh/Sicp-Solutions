
(define tolerance 0.00001)

(define (fixed-point f first-guess)
    (define (close-enough? v1 v2)
        (newline)
        (display "old guess ")
        (display v1)
        (newline)
        (display "new guess ")
        (display v2)
        (newline)
        (< (abs (- v1 v2)) tolerance))
    (define (try guess)
        (let ((next (f guess)))
        (if (close-enough? guess next)
            next
            (try next))))
    (try first-guess))

(define f (lambda (x) (/ (log 1000) (log x))))

(fixed-point f 4.0)


