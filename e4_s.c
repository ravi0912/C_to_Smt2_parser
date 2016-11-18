//Note : after every semicolon change the line
/*if{
	
}else{

}*/

#include <stdio.h>

int main(){
	int n_s , p_s;
	int m_s;
	m_s=2;
	n_s=3;
	int x_s,y_s,s_s,t_s,r_s;
	x_s = n_s + m_s;
	y_s = n_s - m_s;
	s_s = n_s * m_s;
	t_s = n_s / m_s;
	bool b_s;
	b_s = (x_s + y_s) <= (m_s + n_s - (s_s - t_s));
	if( b_s ){
		r_s = 2+3;

		if(x_s <= 1000){
			r_s = 2+3;
			n_s = y_s;
		}else{
			r_s = 2 + 3;
			n_s = t_s;
		}
	}else{
		r_s = 2 + 3;
		n_s = s_s;
	}
	
	return 0;

}