LIBRARY decoder;

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY ROM IS
    PORT (
        index: in std_logic_vector(3 downto 0);
        line1, line2, line3, line4: out std_logic
    );
END ROM;

ARCHITECTURE behavior OF ROM IS
	constant word1: std_logic_vector(14 downto 0) := "110110101010001";
	constant word2: std_logic_vector(14 downto 0) := "101101100110010";
	constant word3: std_logic_vector(14 downto 0) := "011100011110100";
	constant word4: std_logic_vector(14 downto 0) := "000011111111000";
	
BEGIN
	line1 <= word1(to_integer(unsigned(index)));
	line2 <= word2(to_integer(unsigned(index)));
	line3 <= word3(to_integer(unsigned(index)));
	line4 <= word4(to_integer(unsigned(index)));
END behavior;