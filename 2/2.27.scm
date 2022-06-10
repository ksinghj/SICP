; reverse from 1.18 (From solutions, I didn't write this):
(define nil '()) 
  
(define (reverse items) 
  (define (iter items result) 
    (if (null? items) 
        result 
        (iter (cdr items) (cons (car items) result)))) 

  (iter items nil))

(reverse (list (list 1 2) (list 3 4)))

(define (deep-reverse items)
  (define (iter items result)
    (if (null? items)
      result
      (iter (reverse (cdr items)) (cons (reverse (car items)) result))))

  (iter items nil))

(deep-reverse (list (list 1 2) (list 3 4)))
