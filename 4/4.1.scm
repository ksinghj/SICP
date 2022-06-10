(define (list-of-values exps env)
  (if (no-operands? exps)
      '()
      (cons (eval (car exps) env)
            (list-of-values (cdr exps) env))))

; should have created variables first, left and right,
; then `cons`ed them in the desired order:

 (define (list-of-values-lr exps env) 
   (if (no-operands? exps) 
       '() 
       (let ((first (eval (first-operand exps) env))) 
         (let ((rest (list-of-values-lr (rest-operands exps) env))) 
           (cons first rest))))) 
  
 (define (list-of-values-rl exps env) 
   (if (no-operands? exps) 
       '() 
       (let ((rest (list-of-values-rl (rest-operands exps) env))) 
         (let ((first (eval (first-operand exps) env))) 
           (cons first rest))))) 
