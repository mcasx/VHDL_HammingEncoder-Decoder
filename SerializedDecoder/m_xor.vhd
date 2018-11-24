LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY m_xor IS
    PORT (
        a,b: in std_logic;
		  q: out std_logic
    );
END m_xor;

ARCHITECTURE behavioral OF m_xor IS
	--signal s0, s1 : std_logic;
BEGIN
	q <= (not(a and b)) and (b or a);
END behavioral;