(defrecord Point [x y])

(defn dist [p]
  (let [x (:x p) y (:y p)]
    (Math/sqrt (+ (* x x) (* y y)))))

(defn approximation [c]
  (letfn
    [(random-point [] (Point. (rand) (rand)))
     (random-points [c]
       (if (zero? c) []
         (cons (random-point) (random-points (dec c)))))]
    (let [in-circle (count (filter (fn [p] (<= (dist p) 1)) (random-points c)))]
      (* 4 (/ in-circle c)))))

(for [c (range 100000)]
  (printf "%6d %f\n" c (approximation c)))
