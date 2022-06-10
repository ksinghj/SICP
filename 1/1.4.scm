(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

(a-plus-abs-b 3 4)
; if b is greater than 0, add a and b (a + b)
; if b is less than 0, subtract b from a (a - b)
