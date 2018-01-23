(define (interleave x xs)
  `((,x . ,xs) . ,(if (null? xs) '()
		    (map (lambda (lis) (cons (car xs) lis))
			 (interleave x (cdr xs))))))

(define (permutations xs)
  (if (null? xs) '(())
    (apply append (map (lambda (lis) (interleave (car xs) lis))
		       (permutations (cdr xs))))))
