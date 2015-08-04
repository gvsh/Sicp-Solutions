
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

