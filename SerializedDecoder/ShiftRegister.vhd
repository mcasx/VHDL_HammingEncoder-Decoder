LIBRARY storage;
LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY ShiftRegister IS
    PORT (
        m, clk: in std_logic;
        o1, o2, o3, o4, o5, o6, o7, o8, o9, o10, o11: out std_logic
    );
END ShiftRegister;

ARCHITECTURE behavior OF ShiftRegister IS
		signal q1, q2, q3, q4, q5, q6, q7, q8, q9, q10, q11, q12, q13, q14, q15: std_logic;
BEGIN
	flipFlopDSimul1: storage.flipFlopDSimul
	port map(
		clk => clk,
		D => m,
		nSet => '1',
		nRst => '1',
		Q => q1
	);
	
	flipFlopDSimul2: storage.flipFlopDSimul
	port map(
		clk => clk,
		D => q1,
		nSet => '1',
		nRst => '1',
		Q => q2
	);
	
	flipFlopDSimul3: storage.flipFlopDSimul
	port map(
		clk => clk,
		D => q2,
		nSet => '1',
		nRst => '1',
		Q => q3
	);
	
	flipFlopDSimul4: storage.flipFlopDSimul
	port map(
		clk => clk,
		D => q3,
		nSet => '1',
		nRst => '1',
		Q => q4
	);
	
	flipFlopDSimul5: storage.flipFlopDSimul
	port map(
		clk => clk,
		D => q4,
		nSet => '1',
		nRst => '1',
		Q => q5
	);
	
	flipFlopDSimul6: storage.flipFlopDSimul
	port map(
		clk => clk,
		D => q5,
		nSet => '1',
		nRst => '1',
		Q => q6
	);
	
	flipFlopDSimul7: storage.flipFlopDSimul
	port map(
		clk => clk,
		D => q6,
		nSet => '1',
		nRst => '1',
		Q => q7
	);
	
	flipFlopDSimul8: storage.flipFlopDSimul
	port map(
		clk => clk,
		D => q7,
		nSet => '1',
		nRst => '1',
		Q => q8
	);
	
	flipFlopDSimul9: storage.flipFlopDSimul
	port map(
		clk => clk,
		D => q8,
		nSet => '1',
		nRst => '1',
		Q => q9
	);
	
	flipFlopDSimul10: storage.flipFlopDSimul
	port map(
		clk => clk,
		D => q9,
		nSet => '1',
		nRst => '1',
		Q => q10
	);
	
	flipFlopDSimul11: storage.flipFlopDSimul
	port map(
		clk => clk,
		D => q10,
		nSet => '1',
		nRst => '1',
		Q => q11
	);
	
	flipFlopDSimul12: storage.flipFlopDSimul
	port map(
		clk => clk,
		D => q11,
		nSet => '1',
		nRst => '1',
		Q => q12
	);
	
	flipFlopDSimul13: storage.flipFlopDSimul
	port map(
		clk => clk,
		D => q12,
		nSet => '1',
		nRst => '1',
		Q => q13
	);
	
	flipFlopDSimul14: storage.flipFlopDSimul
	port map(
		clk => clk,
		D => q13,
		nSet => '1',
		nRst => '1',
		Q => q14
	);
	
	flipFlopDSimul15: storage.flipFlopDSimul
	port map(
		clk => clk,
		D => q14,
		nSet => '1',
		nRst => '1',
		Q => q15
	);
	
	o11 <= q5;
	o10 <= q6;
	o9  <= q7;
	o8  <= q8;
	o7  <= q9;
	o6  <= q10;
	o5  <= q11;
	o4  <= q12;
	o3  <= q13;
	o2 <= q14;
	o1 <= q15;
	
END behavior;
