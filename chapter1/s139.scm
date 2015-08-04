
(define (cont-frac
                n
                d
                k)
    (if
        (= k 1)
        (/
            (n k)
            (d k))
        (/
            (n k)
            (+
                (d k)
                (cont-frac
                    n
                    d
                    (- k 1))))))

(define (reverse-nd n k)
    (lambda (x)
        (n (- (+ k 1) x))))
                
(define (cont-frac-rec n d k)
    (cont-frac
        (reverse-nd n k)
        (reverse-nd d k)
        k))

(define (cont-frac-iter-helper
                result
                n
                d
                k)
    (if
        (= k 1)
        result
        (cont-frac-iter-helper
                    (/
                        (n (- k 1))
                        (+
                            (d (- k 1))
                            result))
                    n
                    d
                    (- k 1))))

(define (cont-frac-iter n d k)
    (cont-frac-iter-helper
        (/ (n k) (d k))
        n
        d
        k))

(define (dfun i)
    (- (* i 2) 1))

(define d dfun)

;; (cont-frac-rec      n d 60)
;; (cont-frac-iter     n d 60)        

(define (tan-cf k x)
    (define (n k)
            (-
                0
                (* x x)))
    (*
        -1
        (/ 
           (cont-frac-iter     n d k)
           x)))

(tan-cf 60 (/ 3.1415926535 4))

