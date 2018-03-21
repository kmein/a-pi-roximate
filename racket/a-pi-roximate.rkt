#lang racket

(define radius 20.0)

(define (dist p)
  (let ([x (car p)]
        [y (cdr p)])
    (sqrt (+ (expt x 2) (expt y 2)))))

(define (random-point)
  (let ([x (* (random) radius)]
        [y (* (random) radius)])
    (cons x y)))

(define (random-points count)
  (if (zero? count)
    '()
    (cons (random-point) (random-points (- count 1)))))

(define (approximation count)
  (let ([in-circle
          (length (filter (lambda (p) (<= (dist p) radius))
                          (random-points count)))])
    (* 4 (/ in-circle count))))

(for ([count (in-range 1 100000)])
     (printf "~a ~a ~n"
             (~r count #:min-width 6)
             (~r (approximation count) #:notation 'positional)))
