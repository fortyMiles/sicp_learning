`(define (sum  term a next b)
  (if (> a b)
    0
    (+ (term a)
       (sum term (next a) next b)
       )
    )
  )

(define (inc n) (+ n 1))

(define (cube a) (* a a a))

(define (sum-cubes a b)
  (sum cube a inc b)
  )

(define (equal x) x)

(define (sum-integer a b) 
  (sum equal a inc b)
  )

(define (double x)
  (* 2 x)
  )

(define (integral f a b)
  (define dx 0.001)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b)
     dx)
  ))


(define (f x y) 
  (let ((a (+ 1 (* x y)))
	(b (- 1 y)))
    
    (+ (* x (square a))
       (* y b)
       (* a b )
       )
    )
 )


(define (average x y) (/ (+ x y) 2.0))
(define (close-enough? x y)
  (< (abs (- x y) 0.001))
  )

(define (search f neg-point pos-point)
  (let (mid-point (average neg-point pos-point))
    (if (close-enough? neg-point pos-point)
	mid-point
	(let ((test-value (f mid-point)))
	  (cond (> test-value 0) (search f neg-point mid-point)
		(< test-value 0) (search f mid-point pos-point)
		(else mid-point)
		)
	  )
l	)
    )
  )

(define (half-inteval-method f a b)
  (let ( (a-value (f a))
	 (b-value (f b)))
    (cond ((and (> a-value 0) (< b-value 0))
	   (search f b a)
	   )

	  ((and (< a-value 0) (< b-value 1))
	   (search f a b)
	   )

	  (else 
	   (error "value are not of opposite sign" a b)
	   )
     )
    )
  )
