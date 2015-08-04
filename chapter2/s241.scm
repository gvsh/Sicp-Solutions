
(define nil '())

(define (append list1 list2)
    (if (null? list1)
        list2
        (cons (car list1) (append (cdr list1) list2))))

(define (reverse list1)
    (if
        (null? list1)
        nil
        (if
            (null? (cdr list1))
            list1
            (append
                (reverse (cdr list1))
                (cons (car list1) nil)))))

(reverse  (list 1 2))
(reverse  (list 1 2 3 4 5))
(reverse  (list 1))
(reverse  ())
(reverse  '())

(define (enumerate-interval low high)
    (if (> low high)
        nil
        (cons low (enumerate-interval (+ low 1) high))))

(define (flatmap proc seq)
    (accumulate append nil (map proc seq)))

(define (unique-pairs n)
    (flatmap
        (lambda (i)
            (map
                (lambda (j) (list i j))
                (enumerate-interval 1 (- i 1))))
        (enumerate-interval 1 n)))))

(unique-pairs 5)

(define (unique-pairs-r n)
    (flatmap
        (lambda (i)
            (map
                (lambda (j) (list j i))
                (enumerate-interval 1 (- i 1))))
        (reverse (enumerate-interval 1 n))))))

(unique-pairs-r 5)

(define (unique-pairs3 n)
    (flatmap
        (lambda (i)
            (map
                (lambda (j) (cons j i))
                (enumerate-interval 1 n)))
        (unique-pairs n)))))

(unique-pairs3 5)

(define (ordered-3-tuple n)
    (flatmap
        (lambda (i)
            (flatmap
                (lambda (j)
                    (map
                        (lambda (k) (list i j k))
                        (enumerate-interval 1 (- j 1))))
                (enumerate-interval 1 (- i 1))))
         (enumerate-interval 1 n)))

(ordered-3-tuple 1)
(ordered-3-tuple 2)
(ordered-3-tuple 3)
(ordered-3-tuple 4)
(ordered-3-tuple 5)
(ordered-3-tuple 6)
(ordered-3-tuple 7)
(ordered-3-tuple 8)
(ordered-3-tuple 9)



 


