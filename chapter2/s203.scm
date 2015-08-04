
(define (square x) (* x x))

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

(define (p-distance p1 p2)
    (+
        (square (- (x-point p2) (x-point p1)))
        (square (- (y-point p2) (y-point p1)))))

(define op (make-point 0 0))

(define (make-rectangle s1 s2)
    (cons s1 s2))

(define (side1 r) (car r))

(define (side2 r) (cdr r))

(define (area-rectangle r)
    (* (side1 r) (side2 r))

(define (perimeter-rectangle r)
    (* 2 (+ (side1 r) (side2 r))))


(define seg
            (make-segment
                (make-point  2  3) 
                (make-point 10 15))) 
  
(print-point (midpoint-segment seg))

    (let
        ((sp1 (start-segment s1))
         (ep1 (end-segment   s1))
         (sp2 (start-segment s2))
         (ep2 (end-segment   s2)))
