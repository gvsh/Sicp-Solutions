
(define (square x) (* x x))

(define 
    (average x y)
        (/ 
            (+ x y)
            2))

(define
    (good-enough?
        x
        guess)
        (<
            (abs 
                (- 
                    x
                    (square guess)))
            0.00001))

(define
    (good-enough2?
        x
        guess)
        (<
            (abs 
                (- 
                    x
                    guess))
            0.00001))

(define (abs x)
  (cond ((> x 0) x)
        ((= x 0) 0)
        ((< x 0) (- x))))

(define 
    (improve-guess
        x
        guess)
        (average
            (/ 
                x 
                guess)
            guess))

(define
    (sqrt-iter x guess)
        (if
            (or
                (good-enough?
                    x
                    guess) 
                (good-enough2?
                    guess
                    (improve-guess
                        x 
                        guess)))
                guess
                (sqrt-iter
                    x
                    (improve-guess
                        x 
                        guess)))))


(define (sqrt x) (sqrt-iter x 1.0))






