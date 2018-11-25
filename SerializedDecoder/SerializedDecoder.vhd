LIBRARY decoder;
LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY SerializedDecoder IS
    PORT (
        y, clk: in std_logic;
		  a_rst: in std_logic;
        m1, m2, m3, m4, m5, m6, m7, m8, m9, m10, m11: out std_logic;
		  ready: out std_logic
    );
END SerializedDecoder;

ARCHITECTURE iterativeFunction OF SerializedDecoder IS
	
	signal s_line1, s_line2, s_line3, s_line4, s_q1, s_q2, s_q3, s_q4: std_logic; 
	signal s_l1, s_l2, s_l3, s_l4: std_logic;
	signal s_d1, s_d2, s_d3, s_d4: std_logic; 
	signal s_o1, s_o2, s_o3, s_o4, s_o5, s_o6, s_o7, s_o8, s_o9, s_o10, s_o11: std_logic;
	signal s_shift_o1, s_shift_o2, s_shift_o3, s_shift_o4, s_shift_o5, s_shift_o6, s_shift_o7, s_shift_o8, s_shift_o9, s_shift_o10, s_shift_o11: std_logic;
	signal s_reset: std_logic;
	signal reg_reset: std_logic;
	
BEGIN
	
	control: decoder.ControlUnit PORT MAP(clk, a_rst, s_line1, s_line2, s_line3, s_line4, ready, s_reset);
	
	reg_reset <= s_reset and a_rst;
	
	s_l1 <= y and s_line1;
	s_l2 <= y and s_line2;
	s_l3 <= y and s_line3;
	s_l4 <= y and s_line4;
	
	xor1: decoder.m_xor PORT MAP(s_l1, s_q1, s_d1);
	xor2: decoder.m_xor PORT MAP(s_l2, s_q2, s_d2);
	xor3: decoder.m_xor PORT MAP(s_l3, s_q3, s_d3);
	xor4: decoder.m_xor PORT MAP(s_l4, s_q4, s_d4);
	
										
	reg: decoder.Register4Bit PORT MAP( s_d1, s_d2, s_d3, s_d4, clk, reg_reset, s_q1, s_q2, s_q3, s_q4);
	
	decode: decoder.Decoder4to11 PORT MAP(s_d1, s_d2, s_d3, s_d4, s_o1, s_o2, s_o3, s_o4, s_o5, s_o6, s_o7, s_o8, s_o9, s_o10, s_o11);
	
	shift_reg: decoder.ShiftRegister PORT MAP(y, clk, s_shift_o1, s_shift_o2, s_shift_o3, s_shift_o4, s_shift_o5, s_shift_o6, s_shift_o7, s_shift_o8, s_shift_o9, s_shift_o10, s_shift_o11);
	
	out_xor1: decoder.m_xor PORT MAP(s_o1, s_shift_o1, m1);
	out_xor2: decoder.m_xor PORT MAP(s_o2, s_shift_o2, m2);
	out_xor3: decoder.m_xor PORT MAP(s_o3, s_shift_o3, m3);
	out_xor4: decoder.m_xor PORT MAP(s_o4, s_shift_o4, m4);
	out_xor5: decoder.m_xor PORT MAP(s_o5, s_shift_o5, m5);
	out_xor6: decoder.m_xor PORT MAP(s_o6, s_shift_o6, m6);
	out_xor7: decoder.m_xor PORT MAP(s_o7, s_shift_o7, m7);
	out_xor8: decoder.m_xor PORT MAP(s_o8, s_shift_o8, m8);
	out_xor9: decoder.m_xor PORT MAP(s_o9, s_shift_o9, m9);
	out_xor10: decoder.m_xor PORT MAP(s_o10, s_shift_o10, m10);
	out_xor11: decoder.m_xor PORT MAP(s_o11, s_shift_o11, m11);
	

	
	
END iterativeFunction;