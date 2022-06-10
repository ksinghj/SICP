; get max 2 (SO)
(define (max-two a b c)
  (if (>= a b)
      (if (>= b c)
          (list a b)
          (list a c))
      (if (>= a c)
          (list b a)
          (list b c))))

(define (square-sum a b)
        (+ (* a a) (* b b)))

(define (sum-square-largest-two a b c)
        (apply square-sum (max-two a b c)))

(sum-square-largest-two 3 1 2)
