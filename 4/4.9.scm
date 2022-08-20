; do
(define (do exp condition)
    ((lambda (exp)
        (if (eq? (#t condition))
            (begin (eval exp))
                (do exp condition)))
            'done))

; for
(define (for var condition action)
    (let ((temp-var) var))
        (if (eq? condition #t)
            (begin (set! temp-var action) 
                (eval exp)
                (for temp-var condition action))
            'done))

; while
(define (while exp condition)
    (if (eq? condition #t)
        (begin (eval exp) (while exp condition))
        'done))

; until
(define (until exp condition)
    (if (eq? condition #t)
        'done
        (begin (eval exp)
            (until exp condition))))
