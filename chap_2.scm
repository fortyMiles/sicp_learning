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
  (if (null? L)
      '()
      (append (reverse (cdr L))
	      (cons (car L) '())
	      )
      ))

(define (deep-reverse L)
  (reverse (map reverse L))
  )

(define (deep-reverse-test L)
  (map reverse L)
  )

(define (d-r-r L)
  (if (not (pair? L))
      L
      (reverse (map d-r-r L)))
  )

;; 2.20 same-parity

(define (same-parity . items)
  (let ((yes? (if (even? (car items))
		 even?
(define (same-parity . items)
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


(define (square-list items)
  (if (null? items)
      '()
      (cons (* (car items) (car items)) (square-list (cdr items)))
      )
  )

(define (square-list-with-map items)
  (map (lambda (x) (* x x)) items)
  )

(define (count-leaves x)
  (cond ((null? x) 0)
	((not (pair? x) 1))
	(else (+ (count-leaves (car x))
		 (count-leaves (cdr x))
		 ))
	)
  )

  )

;; 2.28 refrign print the tree's leaves from left to right

(define (refringe tree)
  (cond ((null? tree) '())
	((not (pair? tree)) (list tree))
	(else (append (refringe (car tree)) (refringe (cdr tree))))
  ))

;; 2.30

(define (tree-map proc tree)
  (map (lambda (sub-tree)
	 (if (pair? sub-tree)
	     (tree-map proc sub-tree)
	     (proc sub-tree)
	     )
	 ) tree)
  )

(define (square-tree tree)
  (tree-map square tree)
  )

(define (subsets s)
  (if (null? s)
      (list '())
      (let ((rest (subsets (cdr s))))
	(append rest (map (lambda (e)
			    (cons (car s) e))
			  rest))))
  )

(define (filter predicate sequence)
  (cond ((null? sequence) '())
	((predicate (car sequence))
	 (cons (car sequence)
	       (filter predicate (cdr sequence))
	       )
	 )
	(else (filter predicate (cdr sequence)))
  ))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence) (accumulate op initial (cdr sequence)))
      )
  )

;; 2.33

(define (map p sequence)
  (accumulate (lambda (x y) (cons (p x) y)) '() sequence)
  )
;; accumulate is that define an operation, and the initial or firts element with this operation and the accumulated result of remained list

(define (append seq1 seq2)
  (accumulate cons seq2 seq1)
  )

(define (length sequence)
  (accumulate (lambda (x y) (+ 1 y)) 0 sequence)
  )

;; horner-eval

(define (horner-eval x coefficient-sequence)
  (accumulate (lambda (this-coeff higher-terms)
		(+ this-coeff (* x higher-terms)))
	      0
	      coefficient-sequence
	      )
  )

;; count-leaves

(define (count-leaves t)
  (accumulate + 0 (map (lambda (x)
			 (if (pair? x)
			     (count-leaves x)
			     1
			     ))
		       t))
  )

;; binary tree

(define (make-tree entry left right) (list entry left right))

(define (entry tree) (car tree))

(define (left-branch tree) (cadr tree))

(define (right-branch tree) (caddr tree))

