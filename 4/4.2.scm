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

; Louis's evaluator
(define (eval exp env)
    (cond ((self-evaluating? exp) exp)
          ((variable? exp) (lookup-variable-value exp env))
          ((quoted? exp) (text-of-quotation exp))
          (application? exp)                            ; applications
            (if (equal ('call (car exp)))               ; 4.2b now we only recognise procedure application if it begins with call
                (apply (eval (operator exp) env)
                    (list-of-values (operands exp) env))))
          ((assignment? exp) (eval-assignment exp env)) ; assignments
          ((definition? exp) (eval-definition exp env))
          ((if? exp) (eval-if exp env))
          ((lambda? exp) (make-procedure (lambda-parameters exp)
            (lambda-body exp)
            env))
          ((begin? exp)
            (eval-sequence (begin-actions exp) env))
          ((cond? exp) (eval (cond->if exp) env))
          (else
            (error "Unknown expression type: EVAL" exp))))

; hint/example
(define (x 3))

; 4.2a
; Louis eval will not be able to evaluate the above definition of x,
; because it will process it as a procedure application.
; then in `assignment?`, the code `(operator exp)` will throw an 
; error, as x will not be defined! ✅

; 4.2b
; see modified `application` procedure above. 
; Procedure application must be prefixed with 'call'
; before it is evaluated. ✅

; ❗️ Correct, but I missed out that `operator` and `operands` 
; would also have to be changed!
(define (operator exp) (cadr exp)) 
(define (operands exp) (cddr exp))
