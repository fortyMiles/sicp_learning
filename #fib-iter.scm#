(define (func n) 
  (if (< n 3) n 
      (+ (func (- n 1))
	 (* 2 (func (- n 2)))
	 (* 3 (func (- n 3)))
	 )
      )
  )

(define (_f a0 a1 a2) (+ a2 (* 2 a1) (* 3 a0)))
; define a function _f to create f(n)

(define (func-by-iter n) 
      (_iter 0 1 2 n)
  )

(define (_iter a0 a1 a2 count) 
  (if (= count 0) a0
      (_iter a1 a2 (_f a0 a1 a2) (- count 1))
      )
  )