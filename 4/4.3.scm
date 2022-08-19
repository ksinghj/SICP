; eval
(define (eval exp env)
    (cond ((self-evaluating? exp) exp)
          ((variable? exp) (lookup-variable-value exp env))
          ((quoted? exp) (text-of-quotation exp))
          ((assignment? exp) (eval-assignment exp env)) ; assignments
          ((definition? exp) (eval-definition exp env))
          ((if? exp) (eval-if exp env))
          ((lambda? exp) (make-procedure (lambda-parameters exp)
            (lambda-body exp)
            env))
          ((begin? exp)
            (eval-sequence (begin-actions exp) env))
          ((cond? exp) (eval (cond->if exp) env))
          ((application? exp)                           ; applications
            (apply (eval (operator exp) env)
                   (list-of-values (operands exp) env)))
          (else
            (error "Unknown expression type: EVAL" exp))))


(define (operator exp) (car exp))
(define (operands exp) (cdr exp))

; install-eval-package required?
(define (install-eval-package)
  (define (self-evaluating? exp) exp)
  (define (variable? exp)
    (lookup-variable-value exp env))
  (define (quoted? exp) (text-of-quotation exp))
    
  (define (tag x) (attach-tag 'eval x))
  (put 'self-evaluating? '(eval) self-evaluating?)
  (put 'variable? '(eval) variable?)
  (put 'quoted? '(eval) quoted?))

; Sphinxsky:
(define (eval- exp env)
  ; ...
  (else
    (let ((op (get 'eval (car exp)))
      (op exp env)))))

; think modular procedure, not case by case!!
