
;; Mobile two Branches
;; A branch is a rod of certain length, at the end hangs a weight or another mobile.-
;; 

(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))


;; part d
(define (make-mobile left right)
  (cons left right))

(define (make-branch length structure)
  (cons length structure))


