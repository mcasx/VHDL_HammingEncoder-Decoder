LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY Register4Bit IS
    PORT (
        d1,d2,d3,d4, clk, rst: in std_logic;
        q1,q2,q3,q4: out std_logic
    );
END Register4Bit;

ARCHITECTURE behavior OF Register4Bit IS
		
BEGIN
	storage1: storage
	port map(
		clk => clk;
		D => d1;
		nSet => '0';
		nReset => rst;
		Q => q1
	);
	
	storage2: storage
	port map(
		clk => clk;
		D => d2;
		nSet => '0';
		nReset => rst;
		Q => q2
	);
	
	storage3: storage
	port map(
		clk => clk;
		D => d3;
		nSet => '0';
		nReset => rst;
		Q => q3
	);
	
	storage4: storage
	port map(
		clk => clk;
		D => d4;
		nSet => '0';
		nReset => rst;
		Q => q3
	);
	

END behavior;
