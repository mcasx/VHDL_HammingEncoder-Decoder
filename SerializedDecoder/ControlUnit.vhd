LIBRARY decoder;

LIBRARY ieee;
LIBRARY storage;
USE ieee.std_logic_1164.all;

ENTITY ControlUnit IS
    PORT (
        clk: in std_logic;
        line1, line2, line3, line4, finished: out std_logic
    );
END ControlUnit;

ARCHITECTURE behavior OF ControlUnit IS
	signal s1, q1: std_logic_vector(3 downto 0) := "0000";
	
BEGIN
	flipFlop1: storage.flipFlopDSimul
	port map(
		clk => clk,
		D => s1(0),
		nSet => '0',
		nRst => '0',
		Q => q1(0)
	);
	
	flipFlop2: storage.flipFlopDSimul
	port map(
		clk => clk,
		D => s1(1),
		nSet => '0',
		nRst => '0',
		Q => q1(1)
	);
	
	flipFlop3: storage.flipFlopDSimul
	port map(
		clk => clk,
		D => s1(2),
		nSet => '0',
		nRst => '0',
		Q => q1(2)
	);
	
	flipFlop4: storage.flipFlopDSimul
	port map(
		clk => clk,
		D => s1(3),
		nSet => '0',
		nRst => '0',
		Q => q1(3)
	);
	
	memory: decoder.ROM
	port map(
		index => q1,
		line1 => line1,
		line2 => line2,
		line3 => line3,
		line4 => line4
	);
	
	adder: decoder.OneAdder
	port map(
		a => q1,
		x => s1
	);
	
END behavior;