LIBRARY decoder;
LIBRARY ieee;
LIBRARY storage;
USE ieee.std_logic_1164.all;

ENTITY ControlUnit IS
    PORT (
        clk: in std_logic;
        line1, line2, line3, line4: out std_logic;
		  ready: out std_logic;
		  reset: out std_logic
    );
END ControlUnit;

ARCHITECTURE behavior OF ControlUnit IS
	signal s1, q1: std_logic_vector(3 downto 0) := "1111";
	signal s_reset: std_logic;
BEGIN
	flipFlop1: storage.flipFlopDSimul
	port map(
		clk => clk,
		D => s1(0),
		nSet => '1',
		nRst => '1',
		Q => q1(0)
	);
	
	flipFlop2: storage.flipFlopDSimul
	port map(
		clk => clk,
		D => s1(1),
		nSet => '1',
		nRst => '1',
		Q => q1(1)
	);
	
	flipFlop3: storage.flipFlopDSimul
	port map(
		clk => clk,
		D => s1(2),
		nSet => '1',
		nRst => '1',
		Q => q1(2)
	);
	
	flipFlop4: storage.flipFlopDSimul
	port map(
		clk => clk,
		D => s1(3),
		nSet => '1',
		nRst => '1',
		Q => q1(3)
	);
	
	memory: decoder.ROM
	port map(
		index => s1,
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
	
	ready <= not q1(0) and q1(1) and q1(2) and q1(3);
	reset <= q1(0) and q1(1) and q1(2) and q1(3);
END behavior;