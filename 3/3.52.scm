(define sum 0)
; 0
(define (accum x)
  (set! sum (+ x sum))
  sum)
; accum
(define seq (stream-map accum (stream-enumerate-interval 1 20)))
; (1 2 4 7 11 16 22 28 36 45 55 66 78 91 105 120 136 153 191 300 320)
; sum = 320
(define y (stream-filter even? seq))
; (2 4 16 22 28 36 66 78 120 136 300 320)
(define z (stream-filter (lambda (x) (= (remainder x 5) 0))
                         seq))
; (45 55 105 120 300 320)
(stream-ref y 7)
; 66
(display-stream z)
; 45
; 55
; 105
; 120
; 300
; 320

❌ incorrect stream-enumerate-interval functionality
