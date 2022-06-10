(define (inc a) (+ a 1))
(define (dec a) (- a 1))

; (+ 4 5)
(define (+ a b)
  (if (= a 0)
; (if (= 4 0)
      b
;     5
      (inc (+ (dec a) b))))
;     (inc (+ (dec 4) 5))
;     (inc (+ (3) 5))
;     (inc (8)) returns 9
; recursive process, because (inc ) is called with integer arguments

(define (+ a b)
  (if (= a 0)
; (if (= 4 0))
      b
;     5
      (+ (dec a) (inc b))))
;     (+ (dec (4) (inc 5)))
;     (+ 3 6) returns 9
; iterative process, as we call the (+ ) procedure with inc and dec procedures as arguments
; so we only ever go a nested as (+ ) with different arguments