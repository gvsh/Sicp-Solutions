


(define (add3 a1 a2 a3)
    (+
        a1
        (+
            (* 2 a2)
            (* 3 a3))))
                        

;; Recursive
                        
(define (f n)
    (cond
        ((< n 3) n)
        ((> n 2)
            (add3
                (f (- n 1))
                (f (- n 2))
                (f (- n 3))))))


;; Iterative

(define
    (f-iter
        a1
        a2
        a3
        count)
    (if
        (= count 3)
        a1
        (f-iter
            (add3 a1 a2 a3)
            a1
            a2                
            (- count 1))))

