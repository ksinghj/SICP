(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

; selectors
(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (cdr mobile))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (cdr branch))

; total weight
(define (total-weight mobile)
  (+ (left-branch mobile) (right-branch mobile)))

; is mobile balanced?
(define (mobile-balanced? mobile)
  (equal? 
    (* (branch-length (left-branch mobile) (total-weight (left-branch mobile)))
       (branch-length (right-branch mobile) (total-weight (right-branch mobile))))))
; branch-length * total-weight of left branch === branch-length * total-weight of right branch

; ❌ would need recursive solutions or it wouldn't scale well.. gave it a go though.
