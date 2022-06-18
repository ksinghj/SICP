(define (make-monitored f)
    (let ((call-count 0))
        (cond ((eq? mf 'how-many-calls?) call-count))
              ((eq? mf 'reset-count) (set! call-count 0))
              (else (set! call-count (+ 1 call-count)) (f))))

(define (double number)
    (* 2 number))

(define d (make-monitored double))
; (d 2)
; (d 'how-many-calls?)

; Didn't set the call-count++ !
