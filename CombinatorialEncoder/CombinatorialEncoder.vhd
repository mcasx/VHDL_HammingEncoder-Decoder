LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY CombinatorialEncoder IS
    PORT (
        m1, m2, m3, m4, m5, m6, m7, m8, m9, m10, m11: in std_logic;
        x1, x2, x3, x4, x5, x6, x7, x8, x9, x10, x11, x12, x13, x14, x15: out std_logic
    );
END CombinatorialEncoder;

ARCHITECTURE combinatorialFunction OF CombinatorialEncoder IS
	signal m1_m11, m3_m4, m6_m7, m8_m9, m10_m11, m8_m9_m10_m11: std_logic;
BEGIN
	m1_m11 <= m1 xor m11;
	m3_m4 <= m3 xor m4;
	m6_m7 <= m6 xor m7;
	m8_m9 <= m8 xor m9;
	m10_m11 <= m10 xor m11;
	m8_m9_m10_m11 <= m8_m9 xor m10_m11;
	x1 <= (m1_m11 xor m2) xor ((m4 xor m5) xor (m2 xor m9));
	x2 <= m1_m11 xor m3_m4 xor m6_m7;
	x3 <= (m2 xor m3_m4) xor m8_m9_m10_m11;
	x4 <= (m5 xor m6_m7) xor m8_m9_m10_m11;
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