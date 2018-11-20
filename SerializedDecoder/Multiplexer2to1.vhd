LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY Multiplexer IS
    PORT (
        a, b, sel: in std_logic;
        c: out std_logic
    );
END Multiplexer;

ARCHITECTURE combinatorialFunction OF Multiplexer IS
BEGIN
	c <= (a and not sel) or (b and sel);
END combinatorialFunction;