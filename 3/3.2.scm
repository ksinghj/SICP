(define (make-monitored f . args)
    (let ((call-count 0))
        (lambda (mf)
            (begin (
                (f args)
                (set! call-count (+ 1 call-count))
                (cond ((eq? mf 'how-many-calls?) call-count))
                      ((eq? mf 'reset-count) (set! call-count 0)))))))

(define (double number)
    (* 2 number))

(define d (make-monitored double))
(d 2)
(d 'how-many-calls?)
