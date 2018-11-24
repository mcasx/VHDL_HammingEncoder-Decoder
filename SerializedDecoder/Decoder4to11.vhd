LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY Decoder4to11 IS
    PORT (
        in1, in2, in3, in4: in std_logic;
        o1, o2, o3, o4, o5, o6, o7, o8, o9, o10, o11: out std_logic
    );
END Decoder4to11;

ARCHITECTURE combinatorialFunction OF Decoder4to11 IS
	signal s1, s2, s3, s4, s5, s6, s7: std_logic;
BEGIN
	s1 <= in3 and not in4;
	s2 <= not in3 and not in4;
	s3 <= in1 and not in2;
	s4 <= in4 and not in3;
	s5 <= in1 and in2;
	s6 <= in2 and not in1;
	s7 <= not in1 and not in2;
	
	o1 <= s3 and s2;
	o2 <= s6 and s2;
	o3 <= s5 and s2;
	o4 <= s1 and s7;
	o5 <= s3 and s1;
	o6 <= s6 and s1;
	o7 <= s5 and s1;
	o8 <= s4 and s7;
	o9 <= s3 and s4;
	o10 <= s6 and s4;
	o11 <= s5 and s4;
END combinatorialFunction;