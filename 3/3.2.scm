(define (make-monitored f)
    (let ((call-count 0))
        (cond ((eq? mf 'how-many-calls?) call-count))
              ((eq? mf 'reset-count) (set! call-count 0))
              ))

(define (double number)
    (* 2 number))

(define d (make-monitored double))
; (d 2)
; (d 'how-many-calls?)
