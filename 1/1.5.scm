(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))

(test 0 (p))

; applicative order:
; "Using applicative-order evaluation, the evaluation of (test 0 (p)) never terminates, because (p) is infinitely expanded to itself:" 

; normal order
; if checks that 0 is equal to 0, it is, so 0 is returned
; (if (= 0 0)
; 0)
; ^ I originally put this as applicative order :/ I only just recognised (p) as a recursive function, and a useless one at that. Almost a trick question!

