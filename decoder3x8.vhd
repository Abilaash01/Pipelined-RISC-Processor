library ieee;
use ieee.std_logic_1164.all;

entity decoder3x8 is
port(
	a: in std_logic_vector(2 downto 0);
	o: out std_logic_vector(7 downto 0)
);
end decoder3x8;

architecture arch of decoder3x8 is
begin
	o <= "10000000" when a = "000" else
		  "01000000" when a = "001" else
		  "00100000" when a = "010" else
		  "00010000" when a = "011" else
		  "00001000" when a = "100" else
		  "00000100" when a = "101" else
		  "00000010" when a = "110" else
		  "00000001";
end arch;