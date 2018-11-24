LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY SerializedDecoder IS
    PORT (
        y, clk: in std_logic;
        m1, m2, m3, m4, m5, m6, m7, m8, m9, m10, m11: out std_logic
    );
END SerializedDecoder;

ARCHITECTURE iterativeFunction OF SerializedDecoder IS

	COMPONENT m_xor
    PORT (
        a,b: in std_logic;
		  q: out std_logic
    );
	END COMPONENT;
	
	COMPONENT ShiftRegister
    PORT (
        m, clk: in std_logic;
        o1, o2, o3, o4, o5, o6, o7, o8, o9, o10, o11: out std_logic
    );
	END COMPONENT;
	
	COMPONENT ControlUnit
		PORT(
			clk: in std_logic;
			line1, line2, line3, line4, rst : out std_logic
		);
	END COMPONENT;
	
	COMPONENT Decoder4to11
    PORT (
        i1, i2, i3, i4: in std_logic;
        o1, o2, o3, o4, o5, o6, o7, o8, o9, o10, o11: out std_logic
    );
	END COMPONENT;

	COMPONENT Register4Bit
    PORT (
        d1,d2,d3,d4, clk, rst: in std_logic;
        q1,q2,q3,q4: out std_logic
    );
	END COMPONENT;
	
	signal s_line1, s_line2, s_line3, s_line4, s_q1, s_q2, s_q3, s_q4: std_logic; 
	signal s_d1, s_d2, s_d3, s_d4: std_logic; 
	signal s_o1, s_o2, s_o3, s_o4, s_o5, s_o6, s_o7, s_o8, s_o9, s_o10, s_o11: std_logic;
	signal s_shift_o1, s_shift_o2, s_shift_o3, s_shift_o4, s_shift_o5, s_shift_o6, s_shift_o7, s_shift_o8, s_shift_o9, s_shift_o10, s_shift_o11: std_logic;
	signal s_rst: std_logic;
	
BEGIN

	s_line1 <= y and s_q1;
	s_line2 <= y and s_q2;
	s_line3 <= y and s_q3;
	s_line4 <= y and s_q4;
	
	
	xor1: m_xor PORT MAP(s_line1, s_q1, s_d1);
	xor2: m_xor PORT MAP(s_line2, s_q2, s_d2);
	xor3: m_xor PORT MAP(s_line3, s_q3, s_d3);
	xor4: m_xor PORT MAP(s_line4, s_q4, s_d4);
	
	reg: Register4Bit PORT MAP(s_d1, s_d2, s_d3, s_d4, clk, s_rst, s_q1, s_q2, s_q3, s_q4);
	
	decoder: Decoder4to11 PORT MAP(s_q1, s_q2, s_q3, s_q4, s_o1, s_o2, s_o3, s_o4, s_o5, s_o6, s_o7, s_o8, s_o9, s_o10, s_o11);
	
	shift_reg: ShiftRegister PORT MAP(y, clk, s_shift_o1, s_shift_o2, s_shift_o3, s_shift_o4, s_shift_o5, s_shift_o6, s_shift_o7, s_shift_o8, s_shift_o9, s_shift_o10, s_shift_o11);
	
	
	out_xor1: m_xor PORT MAP(s_o1, s_shift_o1, m1);
	out_xor2: m_xor PORT MAP(s_o2, s_shift_o2, m2);
	out_xor3: m_xor PORT MAP(s_o3, s_shift_o3, m3);
	out_xor4: m_xor PORT MAP(s_o4, s_shift_o4, m4);
	out_xor5: m_xor PORT MAP(s_o5, s_shift_o5, m5);
	out_xor6: m_xor PORT MAP(s_o6, s_shift_o6, m6);
	out_xor7: m_xor PORT MAP(s_o7, s_shift_o7, m7);
	out_xor8: m_xor PORT MAP(s_o8, s_shift_o8, m8);
	out_xor9: m_xor PORT MAP(s_o9, s_shift_o9, m9);
	out_xor10: m_xor PORT MAP(s_o10, s_shift_o10, m10);
	out_xor11: m_xor PORT MAP(s_o11, s_shift_o11, m11);
	
	
	--x1 <= (m1_m11 xor m2) xor ((m4 xor m5) xor (m2 xor m9));
	--x2 <= m1_m11 xor m3_m4 xor m6_m7;
	--x3 <= (m2 xor m3_m4) xor m8_m9_m10_m11;
	--x4 <= (m5 xor m6_m7) xor m8_m9_m10_m11;
	
	
END iterativeFunction;