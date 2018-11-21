LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY ShiftRegister IS
    PORT (
        m, clk: in std_logic;
        o1, o2, o3, o4, o5, o6, o7, o8, o9, o10, o11: out std_logic
    );
END ShiftRegister;

ARCHITECTURE behavior OF ShiftRegister IS
		signal q1, q2, q3, q4, q5, q6, q7, q8, q9, q10, q11: std_logic;
BEGIN
	storage1: storage
	port map(
		clk => clk;
		D => m;
		nSet => '0';
		nReset => '0';
		Q => q1
	);
	
	storage2: storage
	port map(
		clk => clk;
		D => q1;
		nSet => '0';
		nReset => '0';
		Q => q2
	);
	
	storage3: storage
	port map(
		clk => clk;
		D => q2;
		nSet => '0';
		nReset => '0';
		Q => q3
	);
	
	storage4: storage
	port map(
		clk => clk;
		D => q3;
		nSet => '0';
		nReset => '0';
		Q => q4
	);
	
	storage5: storage
	port map(
		clk => clk;
		D => q4;
		nSet => '0';
		nReset => '0';
		Q => q5
	);
	
	storage6: storage
	port map(
		clk => clk;
		D => q5;
		nSet => '0';
		nReset => '0';
		Q => q6
	);
	
	storage7: storage
	port map(
		clk => clk;
		D => q6;
		nSet => '0';
		nReset => '0';
		Q => q7
	);
	
	storage8: storage
	port map(
		clk => clk;
		D => q7;
		nSet => '0';
		nReset => '0';
		Q => q8
	);
	
	storage9: storage
	port map(
		clk => clk;
		D => q8;
		nSet => '0';
		nReset => '0';
		Q => q9
	);
	
	storage10: storage
	port map(
		clk => clk;
		D => q9;
		nSet => '0';
		nReset => '0';
		Q => q10
	);
	
	storage11: storage
	port map(
		clk => clk;
		D => q10;
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
