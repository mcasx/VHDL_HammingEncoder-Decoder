LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY ControlUnit IS
    PORT (
        clk: in std_logic;
        line1, line2, line3, line4, finished: out std_logic
    );
END ControlUnit;

ARCHITECTURE behavior OF ControlUnit IS
	constant word1: std_logic_vector(10 downto 0) = "110110101010001";
	constant word2: std_logic_vector(10 downto 0) = "101101100110010";
	constant word3: std_logic_vector(10 downto 0) = "011100011110100";
	constant word4: std_logic_vector(10 downto 0) = "000011111111000";
	
	signal s1, q1: std_logic := '0';
BEGIN
	storage1: storage
	port map(
		clk => clk;
		D => s1;
		nSet => '0';
		nReset => '0';
		Q => q1
	);
	
	adder: FourBitsFullAdder
	port map(
		a => q1;
		b => '0001';
		x => s1;
	);
END behavior;
