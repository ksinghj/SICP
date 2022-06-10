; (define (sum term a next b)
;   (if (> a b)
;       0
;       (+ (term a)
;          (sum term (next a) next b))))

(define (inc a) (+ a 1))

(define (cube a) (* a a a))

(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
        0
        (iter (next a) b)))
  (iter a b))

(sum cube 1 inc 3)
