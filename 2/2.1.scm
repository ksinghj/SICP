; Euclid's Algorithm
(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

; original
; (define (make-rat n d)
;   (let ((g (gcd n d)))
;     (cons (/ n g) (/ d g))))

(define (numer x) (car x))

(define (denom x) (cdr x))

; (define (is-negative num)
;     (cond (< 0 (- 0 num))
;         (#t)
;         (#f)))

(define (make-negative num)
  (- 0 num))

(define (new-make-rat n d)
  ; if n OR d is-negative,
  ; make n negative
  (let ((g (gcd n d)))
    (if (OR (negative? n) (negative? d))
      (cons (/ (make-negative n) g) (/ d g))
      (cons (/ n g) (/ d g))
      )))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))

(define one-half (new-make-rat 1 2))
(print-rat one-half)
