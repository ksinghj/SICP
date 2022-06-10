(define (make-accumulator init)
    (let ((total init))
        (lambda (number) (begin (set! total (+ total number)))
            total)))

(define A (make-accumulator 5))
(A 10)
(A 10)

; the (begin) is redundant, but the solution is still valid
