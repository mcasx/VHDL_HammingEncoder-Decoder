LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY ShiftRegister IS
    PORT (
        m, enable, clk: in std_logic;
        o1, o2, o3, o4, o5, o6, o7, o8, o9, o10, o11: out std_logic
    );
END ShiftRegister;

ARCHITECTURE behavior OF ShiftRegister IS
		signal c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11: std_logic;
		signal q1, q2, q3, q4, q5, q6, q7, q8, q9, q10, q11: std_logic;
BEGIN
	mult1: Multiplexer2to1
	port map(
		a => q1;
		b => m;
		sel => enable;
		c => c1
	);
	
	storage1: storage
	port map(
		clk => clk;
		D => c1;
		nSet => '0';
		nReset => '0';
		Q => q1
	);
	
	mult2: Multiplexer2to1
	port map(
		a => q2;
		b => q1;
		sel => enable;
		c => c2
	);
	
	storage2: storage
	port map(
		clk => clk;
		D => c2;
		nSet => '0';
		nReset => '0';
		Q => q2
	);
	
	mult3: Multiplexer2to1
	port map(
		a => q3;
		b => q2;
		sel => enable;
		c => c3
	);
	
	storage3: storage
	port map(
		clk => clk;
		D => c3;
		nSet => '0';
		nReset => '0';
		Q => q3
	);
	
	mult4: Multiplexer2to1
	port map(
		a => q4;
		b => q3;
		sel => enable;
		c => c4
	);
	
	storage4: storage
	port map(
		clk => clk;
		D => c4;
		nSet => '0';
		nReset => '0';
		Q => q4
	);
	
	mult5: Multiplexer2to1
	port map(
		a => q5;
		b => q4;
		sel => enable;
		c => c5
	);
	
	storage5: storage
	port map(
		clk => clk;
		D => c5;
		nSet => '0';
		nReset => '0';
		Q => q5
	);
	
	mult6: Multiplexer2to1
	port map(
		a => q6;
		b => q5;
		sel => enable;
		c => c6
	);
	
	storage6: storage
	port map(
		clk => clk;
		D => c6;
		nSet => '0';
		nReset => '0';
		Q => q6
	);
	
	mult7: Multiplexer2to1
	port map(
		a => q7;
		b => q6;
		sel => enable;
		c => c7
	);
	
	storage7: storage
	port map(
		clk => clk;
		D => c7;
		nSet => '0';
		nReset => '0';
		Q => q7
	);
	
	mult8: Multiplexer2to1
	port map(
		a => q8;
		b => q7;
		sel => enable;
		c => c8
	);
	
	storage8: storage
	port map(
		clk => clk;
		D => c8;
		nSet => '0';
		nReset => '0';
		Q => q8
	);
	
	mult9: Multiplexer2to1
	port map(
		a => q9;
		b => q8;
		sel => enable;
		c => c9
	);
	
	storage9: storage
	port map(
		clk => clk;
		D => c9;
		nSet => '0';
		nReset => '0';
		Q => q9
	);
	
	mult10: Multiplexer2to1
	port map(
		a => q10;
		b => q9;
		sel => enable;
		c => c10
	);
	
	storage10: storage
	port map(
		clk => clk;
		D => c10;
		nSet => '0';
		nReset => '0';
		Q => q10
	);
	
	mult11: Multiplexer2to1
	port map(
		a => q11;
		b => q10;
		sel => enable;
		c => c11
	);
	
	storage11: storage
	port map(
		clk => clk;
		D => c11;
		nSet => '0';
		nReset => '0';
		Q => q11
	);
	
	o1 <= q1;
	o2 <= q2;
	o3 <= q3;
	o4 <= q4;
	o5 <= q5;
	o6 <= q6;
	o7 <= q7;
	o8 <= q8;
	o9 <= q9;
	o10 <= q10;
	o11 <= q11;
	
END behavior;