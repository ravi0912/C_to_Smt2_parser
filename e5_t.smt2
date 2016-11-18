(set-option :produce-models true)

(declare-const n_t int)

(declare-const p_t int)

(declare-const m_t int)

(declare-const x_t int)

(declare-const y_t int)

(declare-const t_t int)

(declare-const t_t int)

(declare-const r_t int)

(assert( = m_t 2 ))

(assert( = n_t 3 ))

(assert( = x_t ( + n_t m_t ) ))

(assert( = y_t ( - n_t m_t ) ))

(assert( = t_t ( * n_t m_t ) ))

(assert( = t_t ( / n_t m_t ) ))

(assert( = r_t ( + 2 3 ) ))

(ite 

(( <= ( + x_t y_t ) ( - ( + m_t n_t ) ( - t_t t_t ) ) ))

(

(( = n_t t_t ))

)

(

(ite 

(( <= 0 0 ))

(

(( = n_t y_t ))

)

(

(( = n_t t_t ))

)

)

)

)

(declare-const n_s int)

(declare-const p_s int)

(declare-const m_s int)

(declare-const x_s int)

(declare-const y_s int)

(declare-const s_s int)

(declare-const t_s int)

(declare-const r_s int)

(declare-const b_s bool)

(assert( = m_s 2 ))

(assert( = n_s 3 ))

(assert( = x_s ( + n_s m_s ) ))

(assert( = y_s ( - n_s m_s ) ))

(assert( = s_s ( * n_s m_s ) ))

(assert( = t_s ( / n_s m_s ) ))

(assert<==)

(ite 

(b_s)

(

(( = r_s ( + 2 3 ) ))

(( = n_s s_s ))

)

(

(( = r_s ( + 2 3 ) ))

(ite 

(( <= 0 0 ))

(

(( = r_s ( + 2 3 ) ))

(( = n_s y_s ))

)

(

(( = r_s ( + 2 3 ) ))

(( = n_s t_s ))

)

)

)

)

(check-sat)

(exit)