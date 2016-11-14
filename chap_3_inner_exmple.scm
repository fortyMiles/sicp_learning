(define (make-withdraw balance)
  (lambda (amount)
    (if (>= balance amount)
	(begin (set! balance (- balance amount))
	       balance)
	"insuficient founds")
	)
  )

(define (make-account balance password)
  (let ((wrong-psd-time 0))
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

    (define (call-cops)
      (error "call the police now!")
      )

    (define (wrong-password)
      (begin
	;(set! wrong-psd-time (+ wrong-psd-time 1))
	     (display "incorrect password")
	;     (call-cops)
      ))

    (define (access 'm)
      (begin (set! wrong-psd-time 0)
	     (cond ((eq? m 'withdraw) withdraw)
		   ((eq? m 'deposit) deposit)
		   (else (error "Unknow request: MAKE-ACCOUNT" m))
		   )))

    (define (dispatch psd m)
      (if (not (eq? psd password))
	  wrong-password
	  (access 'm)))

    dispatch))

;; 3.1 accumulator

(define (accumulator initial)
  (lambda (augment)
    (begin (set! initial (+ initial augment))
	   initial)
    ))

;; 3.2 

(define (make-monitored proc)
  (let ((called-time 0))
    (define (origin-proc args)
      (begin (set! called-time (+ called-time 1))
	     (apply proc args)))
    (define (reset)
      (set! called-time 0)
      )
    (define (mf arg . args)
      (cond ((eq? arg 'how-many-calls?) called-time)
	    ((eq? arg 'reset-count) (reset))
	    (else (origin-proc (cons arg args)))
	    )
      )
    mf))

;; notice 1. the real use of apply
;; notice 2. (test) is a proce, test is a var


