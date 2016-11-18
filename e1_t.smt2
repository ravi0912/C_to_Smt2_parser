(set-option :produce-models true)

(declare-const n_t int)

(declare-const m_t int)

(declare-const p_t int)

(declare-const f_t int)

(declare-const g_t int)

(declare-const h_t int)

(declare-const i_t int)

(declare-const j_t int)

(declare-const m_t int)

(declare-const d int)

(declare-const e int)

(assert( = n_t 2 ))

(assert( = m_t 3 ))

(assert( = p_t 1 ))

(assert( = f_t 9 ))

(assert( = g_t 7 ))

(assert( = h_t 5 ))

(assert( = i_t 0 ))

(assert( = j_t 3 ))

(assert( = e_t ( + ( + ( - ( * f_t ( + ( / g_t h_t ) f_t ) ) i_t ) ( * ( + n_t m_t ) p_t ) ) 0 ) ))

(assert( = d_t ( + ( - ( * ( * p_t 1 ) ( + n_t m_t ) ) i_t ) ( * ( + ( * ( / g_t h_t ) 1 ) f_t ) f_t ) ) ))

(declare-const n_s int)

(declare-const m_s int)

(declare-const p_s int)

(declare-const f_s int)

(declare-const g_s int)

(declare-const h_s int)

(declare-const i_s int)

(declare-const j_s int)

(declare-const m_s int)

(declare-const d int)

(declare-const e int)

(assert( = n_s 2 ))

(assert( = m_s 3 ))

(assert( = p_s 1 ))

(assert( = f_s 9 ))

(assert( = g_s 7 ))

(assert( = h_s 5 ))

(assert( = i_s 0 ))

(assert( = j_s 3 ))

(assert( = d_s ( + ( - ( * p_s ( + n_s m_s ) ) i_s ) ( * ( + ( / g_s h_s ) f_s ) f_s ) ) ))

(assert( = e_s ( + ( - ( * f_s ( + ( / g_s h_s ) f_s ) ) i_s ) ( * ( + n_s m_s ) p_s ) ) ))

(check-sat)

(exit)