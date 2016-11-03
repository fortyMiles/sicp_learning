(define (make-segment x y) (cons x y))
(define (start-segment s) (car s))
(define (end-segment s) (cdr s))
(define (make-point x y) (cons x y))
(define x-point car)
(define y-point cdr)
(define (mid-segment seg)
  (let (
	(p1 (start-segment seg))
	(p2 (end-segment seg))
	)
	(make-point (/ (+ (x-point p1) (x-point p2)) 2)
		    (/ (+ (y-point p1) (y-point p2)) 2)
		    ))
  )

(define (list-ref items n)
  (if (= n 0)
      (car items)
      (list-ref (cdr items) (- n 1))
      )
  )

(define (length items)
  (if (null? items)
      0
      (+ 1 (length (cdr items)))
      )
  )

;; 2.17 return the last element of a list

(define (last-pair L)
  (if (null? (cdr L))
      L
      (last-pair (cdr L))
      )
  )

;; 2.18 reverse a list

(define (reverse L)
  (if (null? (cdr L))
      L
      (append (reverse (cdr L))
	      (cons (car L) '())
	      )
      ))

;; 2.20 same-parity

(define (same-parity . items)
  (let ((yes? (if (even? (car items))
		 even?
		 odd?
		 )))
    (define (iter items result)
      (if (null? items)
	  (reverse result)
	  (iter (cdr items) (if (yes? (car items))
				(cons (car items) result)
				result
				))
	  )
      )
  (iter (cdr items) (list (car items))))
  )

