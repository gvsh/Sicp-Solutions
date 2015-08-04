
(define nil '())

(define (append list1 list2)
    (if (null? list1)
        list2
        (cons (car list1) (append (cdr list1) list2))))


;; Takes as input a tree
;; Create a list of elements of the tree.

;; Inorder traversal
;; create an internal list into which elements will be added.


(define (fringe x)
    (cond
        ((null? x)
            nil)
        ((not (pair? x))
            (cons x nil))
        (else
            (append
                (fringe (car x))
                (fringe (cdr x))))))



    
(define x (list (list 1 2) (list 3 4)))
(fringe x)

(fringe (list x x))


