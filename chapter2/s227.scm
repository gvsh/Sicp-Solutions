
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

(define (deep-reverse tree1)
    (map
        (lambda (x)
            (if
                (list? x)
                (deep-reverse x)
                x))
        (reverse tree1)))

(define x (list (list 1 2) (list 3 4)))
(define y (list (list 1 2) (list 3 (list 4 5)))) 

x
(reverse x)
(deep-reverse x)

y
(reverse y)
(deep-reverse y)


333



(reverse  (list 1 2))
(reverse  (list 1 2 3 4 5))
(reverse  (list 1))
(reverse  '())

(deep-reverse  (list 1 2))
(deep-reverse  (list 1 2 3 4 5))
(deep-reverse  (list 1))
(deep-reverse  '())
