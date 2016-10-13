(set-option :produce-models true)

(declare-const n int)

(declare-const p int)

(declare-const m int)

(declare-const d int)

(assert ( = n 2 ))

(assert ( = n 3 ))

(assert ( = d ( + n m ) ))

(assert ( = b ( < ( + x y ) ( - ( + m n ) ( - s t ) ) ) ))

(check-sat)

(exit)

