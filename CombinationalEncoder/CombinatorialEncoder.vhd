LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY CombinatorialEncoder IS
    PORT (
        m1, m2, m3, m4, m5, m6, m7, m8, m9, m10, m11: in std_logic;
        x1, x2, x3, x4, x5, x6, x7, x8, x9, x10, x11, x12, x13, x14, x15: out std_logic
    );
END CombinatorialEncoder;

ARCHITECTURE combinatorialFunction OF CombinatorialEncoder IS

	COMPONENT m_xor
    PORT (
        a,b: in std_logic;
		  q: out std_logic
    );
	END COMPONENT;

	signal m1_m11, m3_m4, m6_m7, m8_m9, m10_m11, m8_m9_m10_m11, m2_m9, m4_m5, m4_m5_m2_m9, m1_m11_m2, m1_m11_m3_m4, m2_m3_m4, m5_m6_m7: std_logic;
BEGIN

	xor1: m_xor PORT MAP (m1, m11, m1_m11);
	xor2: m_xor PORT MAP (m3, m4, m3_m4);
	xor3: m_xor PORT MAP (m6, m7, m6_m7);
	xor4: m_xor PORT MAP (m8, m9, m8_m9);
	xor5: m_xor PORT MAP (m10, m11, m10_m11);
	xor6: m_xor PORT MAP (m8_m9, m10_m11, m8_m9_m10_m11);
	
	--x1
	xor7: m_xor PORT MAP (m4, m5, m4_m5);
	xor8: m_xor PORT MAP (m2, m9, m2_m9);
	xor9: m_xor PORT MAP (m4_m5, m2_m9, m4_m5_m2_m9);
	xor10:m_xor PORT MAP (m1_m11, m2, m1_m11_m2);
	xor11:m_xor PORT MAP (m4_m5_m2_m9, m1_m11_m2, x1);
	
	--x2
	xor12:m_xor PORT MAP (m1_m11, m3_m4, m1_m11_m3_m4);
	xor13:m_xor PORT MAP (m1_m11_m3_m4, m6_m7, x2);
	
	--x3
	xor14:m_xor PORT MAP (m2, m3_m4, m2_m3_m4);
	xor15:m_xor PORT MAP (m2_m3_m4, m8_m9_m10_m11, x3);
	
	--x4
	xor16:m_xor PORT MAP (m5, m6_m7, m5_m6_m7);
	xor17:m_xor PORT MAP (m5_m6_m7, m8_m9_m10_m11, x4);
	
	
	
	--x1 <= (m1_m11 xor m2) xor ((m4 xor m5) xor (m2 xor m9));
	--x2 <= m1_m11 xor m3_m4 xor m6_m7;
	--x3 <= (m2 xor m3_m4) xor m8_m9_m10_m11;
	--x4 <= (m5 xor m6_m7) xor m8_m9_m10_m11;
	
	
	x5 <= m1;
	x6 <= m2;
	x7 <= m3;
	x8 <= m4;
	x9 <= m5;
	x10 <= m6;
	x11 <= m7;
	x12 <= m8;
	x13 <= m9;
	x14 <= m10;
	x15 <= m11;
END combinatorialFunction;