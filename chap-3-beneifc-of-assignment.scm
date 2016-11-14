(define (estimate-pi trials)
  (sqrt (/ 6 (monte-carlo trails cesaro-test)))
  )

(define (cesaro-test)
  (= (gcd (rand) (rand)) 1)
  )

o(define (m-s-withdraw balance)
   (lambda (amount)
     (set! balance (- balance amount))
     balance
     )
   )

(define (make-decrementer balance)
  (lambda (amount)
    (- balance amount)
    )
  )

;; 3.8

(define (f num)
  (let ((first-assigned '()))
    (if (null? first-assigned)
	((set! first-assigned num)
	 num)
	num
	)
    )
  )
