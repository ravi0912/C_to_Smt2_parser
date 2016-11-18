(set-option :produce-models true)

(declare-const n_t int)

(declare-const p_t int)

(declare-const m_t int)

(declare-const d_t int)

(declare-const k_t int)

(declare-const b_t bool)

(assert( = m_t 2 ))

(assert( = n_t 3 ))

(assert( = p_t 3 ))

(assert( = k_t ( * p_t p_t ) ))

(assert( = d_t ( + ( + ( * n_t m_t ) n_t ) ( * p_t p_t ) ) ))

(assert( = p_t ( + ( * p_t p_t ) ( * m_t n_t ) ) ))

(assert<==)

(declare-const n_s int)

(declare-const m_s int)

(declare-const d_s int)

(declare-const k_s int)

(declare-const b_s bool)

(assert( = m_s 2 ))

(assert( = n_s 3 ))

(assert( = p_s 3 ))

(assert( = d_s ( + ( + ( * n_s m_s ) n_s ) ( * p_s p_s ) ) ))

(assert( = p_s ( + ( * p_s p_s ) ( * m_s n_s ) ) ))

(assert<==)

(check-sat)

(exit)