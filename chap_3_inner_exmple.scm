(define (make-withdraw balance)
  (lambda (amount)
    (if (>= balance amount)
	(begin (set! balance (- balance amount))
	       balance)
	"insuficient founds")
	)
    )

(define (make-account balance)
  (define (withdraw amount)
    (if (>= balance amount)
	(begin (set! balance (- balance amount))
	       balance
	       )
	"Insufficient founds"
	)
    )
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance
    )
  (define (dispatch m)
    (cond ((eq? m 'withdraw) withdraw)
	  ((eq? m 'deposit) deposit)
	  (else (error "Unknow request: MAKE-ACCOUNT" m))
	  )
    )
  dispatch)

;; 3.1 accumulator

(define (accumulator initial)
  (lambda (augment)
    (begin (set! initial (+ initial augment))
    initial)
  ))
