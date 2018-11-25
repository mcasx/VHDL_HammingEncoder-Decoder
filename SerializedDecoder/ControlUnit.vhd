LIBRARY decoder;
LIBRARY ieee;
LIBRARY storage;
USE ieee.std_logic_1164.all;

ENTITY ControlUnit IS
    PORT (
        clk, reset: in std_logic;
        line1, line2, line3, line4: out std_logic;
		  ready, out_reset: out std_logic
    );
END ControlUnit;

ARCHITECTURE behavior OF ControlUnit IS
	signal s_reset: std_logic;
	signal q1: std_logic_vector(3 downto 0);
BEGIN
	memory: decoder.ROM
	port map(
		index => q1,
		line1 => line1,
		line2 => line2,
		line3 => line3,
		line4 => line4
	);
	
	counter: decoder.RippleCounter
	port map(
		clk => clk,
		x => q1,
		reset => reset
	);
	
	out_reset <= not(q1(0) and q1(1) and q1(2) and q1(3));
	ready <= not q1(0) and q1(1) and q1(2) and q1(3);
END behavior;