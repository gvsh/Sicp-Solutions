
(define constant1 (lambda (i) 1.0))

(define n constant1)
(define d constant1)

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



(cont-frac      n d 12)
(cont-frac-iter n d 12)







