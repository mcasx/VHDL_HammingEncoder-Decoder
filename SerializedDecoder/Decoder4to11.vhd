LIBRARY decoder;
LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY Decoder4to11 IS
    PORT (
        in1, in2, in3, in4: in std_logic;
        o1, o2, o3, o4, o5, o6, o7, o8, o9, o10, o11: out std_logic
    );
END Decoder4to11;

ARCHITECTURE combinatorialFunction OF Decoder4to11 IS
	signal s1, s2, s3, s4, s5, s6, s7, s8: std_logic;
BEGIN
	s1 <= in3 and in4;
	s2 <= in4 and not in3;
	s3 <= in3 and not in4;
	s4 <= in1 and not in2;
	s5 <= in1 and in2;
	s6 <= in2 and not in1;
	s7 <= not in1 and not in2;
    s8 <= not in3 and not in4;
	
	o1 <= s5 and s8;
	o2 <= s4 and s3;
	o3 <= s6 and s3;
	o4 <= s4 and s3;
	o5 <= s4 and s2;
	o6 <= s6 and s2;
	o7 <= s5 and s2;
	o8 <= s1 and s7;
	o9 <= s1 and s4;
	o10 <= s1 and s6;
	o11 <= s1 and s5;
END combinatorialFunction;
