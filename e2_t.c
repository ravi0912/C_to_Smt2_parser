//Note : after every semicolon change the line
/*if{
	
}este{

}*/

#include <stdio.h>

int main(){
	int n_t , p_t;
	int m_t;
	m_t=2;
	n_t=3;
	p_t=3;
	int d_t,k_t;
	k_t = p_t * p_t;
	d_t = n_t * m_t + n_t + p_t * p_t;
	p_t = p_t * p_t + m_t * n_t;
	bool b_t;
	b_t = d_t <= p_t;
		
	return 0;
}