(define (eval-and exps)
    (let ((first (car exps)))
    (let ((rest (cdr exps)))
    (if (eq? (#f (eval first))) ; truthy?
        (#f)
        (begin (eval-and rest) #t)))))

(define (eval-or exps)
    (let ((first (car exps)))
    (let ((rest (cdr exps)))
    (if (eq? #t (eval first))
        (#t)
        (begin (eval rest) #f)))))

; 🤔
