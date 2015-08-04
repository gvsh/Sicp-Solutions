

(define (square x) (* x x))

(define (cube   x) (* (* x x) x))

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
        (/
            (+ 
                (/
                    x
                    (square guess))
                (* 2 guess))
            3))

(define
    (cube-iter x guess)
    
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
            
            (cube-iter
                    x
                    (improve-guess
                        x 
                        guess)))))


(define (cube-root x) (cube-iter x 1.0))






