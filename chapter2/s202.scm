
(define (average x y)
    (/ (+ x y) 2))

(define (make-point x y)
    (cons
        x
        y))

(define (x-point p) (car p))

(define (y-point p) (cdr p))

(define (make-segment x y)
    (cons
        x
        y))

(define (start-segment p) (car p))

(define (end-segment   p) (cdr p))

(define (print-point p)
    (newline)
    (display "(")
    (display (x-point p))
    (display ",")
    (display (y-point p))
    (display ")"))

(define (midpoint-segment s)
    (let
        ((sp (start-segment s))
         (ep (end-segment   s)))
    (make-point
        (average
            (x-point sp)
            (x-point ep))
        (average
            (y-point sp)
            (y-point ep)))))
            

(define seg
            (make-segment
                (make-point  2  3) 
                (make-point 10 15))) 
  
(print-point (midpoint-segment seg))

