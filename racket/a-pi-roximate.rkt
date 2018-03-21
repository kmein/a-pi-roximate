#lang racket

(define radius 20.0)

(define (dist p)
  (let ([x (car p)]
        [y (cdr p)])
    (sqrt (+ (expt x 2) (expt y 2)))))

(define (approximation count)
  (define (random-points count)
    (let ([random-point
            (lambda ()
              (let ([x (* radius (random))]
                    [y (* radius (random))])
                (cons x y)))])
      (if (zero? count) '()
          (cons (random-point) (random-points (- count 1))))))
  (let ([in-circle
          (length (filter (lambda (p) (<= (dist p) radius))
                          (random-points count)))])
    (* 4 (/ in-circle count))))

(for ([count (in-range 1 100000)])
     (printf "~a ~a ~n"
             (~r count #:min-width 6)
             (~r (approximation count) #:notation 'positional)))
