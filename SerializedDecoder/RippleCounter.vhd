LIBRARY decoder;

LIBRARY storage;
LIBRARY ieee;

USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY RippleCounter IS
    PORT (
		  clk: in std_logic;
        x: out std_logic_vector(3 downto 0);
		  reset: in std_logic
    );
END RippleCounter;

ARCHITECTURE logicFunction OF RippleCounter IS 
	signal nq1, nq2, nq3, nq4: std_logic;
BEGIN
	flipFlopDSimul1: storage.flipFlopDSimul
	port map(
		clk => clk,
		D => nq1,
		nSet => reset,
		nRst => '1',
		Q => x(0),
		nQ => nq1
	);
	
	flipFlopDSimul2: storage.flipFlopDSimul
	port map(
		clk => nq1,
		D => nq2,
		nSet => reset,
		nRst => '1',
		Q => x(1),
		nQ => nq2
	);
	
	flipFlopDSimul3: storage.flipFlopDSimul
	port map(
		clk => nq2,
		D => nq3,
		nSet => reset,
		nRst => '1',
		Q => x(2),
		nQ => nq3
	);
	
	flipFlopDSimul4: storage.flipFlopDSimul
	port map(
		clk => nq3,
		D => nq4,
		nSet => reset,
		nRst => '1',
		Q => x(3),
		nQ => nq4
	);
END logicFunction;