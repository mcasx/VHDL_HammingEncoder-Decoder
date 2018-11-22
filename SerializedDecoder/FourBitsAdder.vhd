LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY FourBitsFullAdder IS
    PORT (
        a, b : in std_logic_vector(3 downto 0);
        x: out std_logic_vector(4 downto 0)
    );
END FourBitsFullAdder;

ARCHITECTURE logicFunction OF FourBitsFullAdder IS
    signal c: std_logic_vector(2 downto 0);
BEGIN
    x(0) <= a(0) xor b(0);
    c(0) <= a(0) and b(0);
    
    x(1) <= a(1) xor b(1) xor c(0);
    c(1) <= (a(1) and b(1)) or (a(1) and c(0)) or (b(1) and c(0));
    
    x(2) <= a(2) xor b(2) xor c(1);
	 c(2) <= (a(2) and b(2)) or (a(2) and c(1)) or (b(2) and c(1));

    x(3) <= a(3) xor b(3) xor c(2);
	 
	 x(4) <= (a(3) and b(3)) or (a(3) and c(2)) or (b(3) and c(2));
END logicFunction;