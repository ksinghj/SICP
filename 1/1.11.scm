; recursive
; (define (f n)
;     (if (< n 3)
;         n
;         (+ (f (- n 1)) (* 2 (f (- n 2))) (* 3 (f (- n 3))))))

; (define (f n)
;     (cond ((< n 3) n)
;         (else (+ (f (- n 1))
;               (* 2 (f (- n 2)))
;               (* 3 (f (- n 3)))))))

; (f 5)

; iterative | Still don't understand fully.. had to look it up
(define (f n)
    (if (< n 3)
    n
    (f-iter 2 1 0 n)))

(define (f-iter a b c count)
        (if (< count 3)
        a
        (f-iter (+ (- a 1) (* 2 (- b 2) (* 3 (- c 3))))
        a
        b
        (- count 1))))

(f 3)
