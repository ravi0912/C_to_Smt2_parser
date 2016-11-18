(set-option :produce-models true)

(declare-const d_t int)

(declare-const c_t int)

(declare-const x_t int)

(assert( = d_t 5 ))

(assert( = c_t 4 ))

(assert( = x_t 0 ))

(ite 

(( == c_t d_t ))

(

(( = x_t 3 ))

)

)

(assert( = x_t 5 ))

)

(declare-const d_s int)

(declare-const c_s int)

(declare-const x_s int)

(declare-const p_s int)

(assert( = d_s ( + 2 3 ) ))

(assert( = c_s ( + 2 2 ) ))

(assert( = x_s 0 ))

(ite 

(( == c_s d_s ))

(

(( = x_s 3 ))

)

(

(( = x_s 5 ))

)

)

(check-sat)

(exit)