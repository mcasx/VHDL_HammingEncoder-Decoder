LIBRARY decoder;
LIBRARY ieee;

USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY OneAdder IS
    PORT (
        a: in std_logic_vector(3 downto 0);
        x: out std_logic_vector(3 downto 0)
    );
END OneAdder;

ARCHITECTURE logicFunction OF OneAdder IS
    signal c: std_logic_vector(2 downto 0);
BEGIN
    x(0) <= not a(0);
	 x(1) <= a(0) xor a(1);
    x(2) <= (not a(2) and a(1) and a(0)) or (a(1) and not a(0) and a(2));
	 x(3) <= (a(3) and not a(2)) or (a(1) and a(0) and not a(3) and a(2)) or (a(3) and a(2) and not a(1)) or (a(3) and a(2) and a(1) and not a(0));
END logicFunction;