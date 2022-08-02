(define (stream-map proc . argstreams)
  (if (stream-null? (car argstreams))
      the-empty-stream
      (cons-stream
       (apply proc (map <proc> argstreams))
       (apply stream-map
              (cons proc (map <cdr> argstreams))))))

❌, replace <proc> with <car> and <cdr>!
