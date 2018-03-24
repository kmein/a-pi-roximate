#lang racket

(define (dist p)
  (let ([x (car p)]
        [y (cdr p)])
    (sqrt (+ (expt x 2) (expt y 2)))))

(define (approximation count)
  (define (random-points count)
    (let ([random-point (lambda () (cons (random) (random)))])
      (if (zero? count) '()
          (cons (random-point) (random-points (- count 1))))))
  (let ([in-circle
          (length (filter (lambda (p) (<= (dist p) 1))
                          (random-points count)))])
    (* 4 (/ in-circle count))))

(for ([count (in-range 1 100000)])
     (printf "~a ~a ~n"
             (~r count #:min-width 6)
             (~r (approximation count) #:notation 'positional)))
