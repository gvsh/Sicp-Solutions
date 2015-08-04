
(define (queens board-size)
    (define (queen-cols k)
        (if (= k 0)
            (list empty-board)
            (filter
                (lambda (positions) (safe? k positions))
                (flatmap
                    (lambda (rest-of-queens)
                        (map
                            (lambda (new-row)
                            (adjoin-position new-row k rest-of-queens))
                    (enumerate-interval 1 board-size)))
                (queen-cols (- k 1))))))
            (queen-cols board-size))

(require graphics/graphics)
(open-graphics)
(define vp (open-viewport "A Picture Language" 500 500))

(define draw (draw-viewport vp))
(define (clear) ((clear-viewport vp)))
(define line (draw-line vp))

(define (make-vect x y)
  (cons x y))

(define (xcor-vect v)
  (car v))

(define (ycor-vect v)
  (cdr v))

(define (add-vect v1 v2)
  (make-vect (+ (xcor-vect v1)
                (xcor-vect v2))
             (+ (ycor-vect v1)
                (ycor-vect v2))))

(define (sub-vect v1 v2)
  (make-vect (- (xcor-vect v1)
                (xcor-vect v2))
             (- (ycor-vect v1)
                (ycor-vect v2))))

(define (scale-vect s v)
  (make-vect (* s (xcor-vect v))
             (* s (ycor-vect v))))


(define (make-frame origin edge1 edge2)
  (list origin edge1 edge2))

(define (origin-frame f)
  (car f))

(define (edge1-frame f)
  (cadr f))

(define (edge2-frame f)
  (caddr f))

(define (frame-coord-map frame)
  (lambda (v)
    (add-vect
     (origin-frame frame)
     (add-vect (scale-vect (xcor-vect v)
                           (edge1-frame frame))
               (scale-vect (ycor-vect v)
                           (edge2-frame frame))))))































;; Example 2.49

(require (lib "racket/draw"))
(require racket/class)

(define target (make-bitmap 100 100))
(define dc (new bitmap-dc% [bitmap target]))

;; Vectors

(define (make-vect x y)
  (cons x y))

(define (xcor-vect vect)
  (car vect))

(define (ycor-vect vect)
  (cdr vect))

(define (add-vect a b)
  (make-vect (+ (xcor-vect a) (xcor-vect b))
             (+ (ycor-vect a) (ycor-vect b))))

(define (sub-vect a b)
  (make-vect (- (xcor-vect a) (xcor-vect b))
             (- (ycor-vect a) (ycor-vect b))))

(define (scale-vect s a)
  (make-vect (* (xcor-vect a) s)
             (* (ycor-vect a) s)))

;; Frames

(define (make-frame origin edge1 edge2)
  (list origin edge1 edge2))

(define (origin-frame frame)
  (car frame))

(define (edge1-frame frame)
  (cadr frame))

(define (edge2-frame frame)
  (caddr frame))

;; Coords mapping

(define (frame-coord-map frame)
  (lambda (v)
    (add-vect 
     (origin-frame frame)
     (add-vect (scale-vect (xcor-vect v)
                           (edge1-frame frame))
               (scale-vect (ycor-vect v)
                           (edge2-frame frame))))))

;; Segments

(define (make-segment v1 v2)
  (cons v1 v2))

(define (start-segment v1)
  (car v1))

(define (end-segment v2)
  (cdr v2))

;; Painters

(define (my-draw-line v1 v2)
  (send dc draw-line
        (xcor-vect v1) (ycor-vect v1)
        (xcor-vect v2) (ycor-vect v2)))

(define (segments->painter segment-list)
  (lambda (frame)
    (for-each
     (lambda (segment)
       (my-draw-line
        ((frame-coord-map frame) (start-segment segment))
        ((frame-coord-map frame) (end-segment segment))))
     segment-list)))

;; Painting
;; a.

(define a-painter (segments->painter 
                   (list (make-segment 
                          (make-vect 0 0) 
                          (make-vect 0 1))
                         (make-segment 
                          (make-vect 0 1) 
                          (make-vect 1 1))
                         (make-segment
                          (make-vect 1 1)
                          (make-vect 1 0))
                         (make-segment
                          (make-vect 1 0)
                          (make-vect 0 0)))))

(send dc clear)
(a-painter (make-frame (make-vect 0 0) (make-vect 0 99) (make-vect 99 0)))
(send target save-file "ex2-49-a.png" 'png)

;; b.
(define b-painter (segments->painter 
                   (list (make-segment 
                          (make-vect 0 0) 
                          (make-vect 1 1))
                         (make-segment 
                          (make-vect 0 1) 
                          (make-vect 1 0)))))

(send dc clear)
(b-painter (make-frame (make-vect 0 0) (make-vect 0 100) (make-vect 100 0)))
(send target save-file "ex2-49-b.png" 'png)

;; c
(define c-painter (segments->painter 
                   (list (make-segment 
                          (make-vect 0 0.5) 
                          (make-vect 0.5 0))
                         (make-segment 
                          (make-vect 0.5 0) 
                          (make-vect 1 0.5))
                         (make-segment
                          (make-vect 1 0.5)
                          (make-vect 0.5 1))
                         (make-segment
                          (make-vect 0.5 1)
                          (make-vect 0 0.5)))))

(send dc clear)
(c-painter (make-frame (make-vect 0 0) (make-vect 0 100) (make-vect 100 0)))
(send target save-file "ex2-49-c.png" 'png)

;; d.
;; bleeeeh. I'm too lazy.

