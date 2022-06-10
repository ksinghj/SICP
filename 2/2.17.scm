; last pair

; use squares procedure,
; but use like the n argument is the length of the list

; how to put this into a procedure last-pair?

; used length procedure defined above in the book
(define (length items)
  (if (null? items)
      0
      (+ 1 (length (cdr items)))))

(define (last-pair items)
    (let (len (length items)))
        (if (= len 0))
        (car items)
        (last-pair (cdr items)))

(last-pair (list 1 2 3 4 5))
