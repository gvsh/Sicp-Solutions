
(define nil '())

(define (accumulate op initial sequence)
    (if (null? sequence)
        initial
        (op (car sequence)
            (accumulate op initial (cdr sequence)))))

(define (enumerate-tree tree)
    (cond
        ((null? tree)
            nil)
        ((not (pair? tree))
            (list tree))
        (else
            (append
                (enumerate-tree (car tree))
                (enumerate-tree (cdr tree))))))

(define (count-leaves t)
    (accumulate
        +
        0
        (map
            (lambda (x)
                (if
                    (pair? x)
                    (count-leaves x)
                    1))
            t)))

(define tree (list 1 (list 2 (list 3 4)) 5 6 7 8))
(count-leaves tree) ;; => 7 
(count-leaves (list 1 (list 2 (list 3 4)) 5))




