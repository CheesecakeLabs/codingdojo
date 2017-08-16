; Solution to 2016's Advent of Code - Day 2
; http://adventofcode.com/2016/day/2
;
; Position system:
;
; | -1,+1   0,+1  +1,+1 |   | 1  2  3 |
; | -1, 0   0, 0  +1, 0 | = | 4  5  6 |
; | -1,-1   0,-1  +1,-1 |   | 7  8  9 |

(defn pos-to-digit
    "Convert from position to number"
    [pos]
    (cond
      (= pos [-1  1]) 1
      (= pos [ 0  1]) 2
      (= pos [ 1  1]) 3
      (= pos [-1  0]) 4
      (= pos [ 0  0]) 5
      (= pos [ 1  0]) 6
      (= pos [-1 -1]) 7
      (= pos [ 0 -1]) 8
      (= pos [ 1 -1]) 9))


(defn instruction-to-vector
  "Convert instruction to vector"
  [instruction-char]
  (cond
    (= instruction-char \U) [ 0  1]
    (= instruction-char \D) [ 0 -1]
    (= instruction-char \R) [ 1  0]
    (= instruction-char \L) [-1  0]))


(defn instruction-string-to-vector-list
  "Convert instruction list to a list of vectors"
  [instruction-string]
  (map (fn [^Character c] (instruction-to-vector c)) instruction-string))


(defn apply-vector-to-position
  "Apply a vector to a position, respecting the constraints"
  [[pos-x pos-y] [vector-x vector-y]]
  (cond
    (or
      (> (Math/abs (+ vector-x pos-x)) 1)
      (> (Math/abs (+ vector-y pos-y)) 1)) [pos-x pos-y]
    "else" [(+ vector-x pos-x) (+ vector-y pos-y)]))


(defn find-end-position
  "Find the end position, based on an instruction string and an initial position"
  [instruction-string pos]
  (let [instruction-list (instruction-string-to-vector-list instruction-string)]
    (reduce apply-vector-to-position pos instruction-list)))


(defn process-recipe
  ([instruction-string-list]
   (process-recipe instruction-string-list [0 0] []))
  ([instruction-string-list current-pos pos-list]
   (cond
     (= (count instruction-string-list) 0) (map pos-to-digit pos-list)
     "else" (let
              [new-pos (find-end-position (first instruction-string-list) current-pos)
               new-pos-list (conj pos-list new-pos)
               remaining-list (rest instruction-string-list)]
              (process-recipe remaining-list new-pos new-pos-list)))))
