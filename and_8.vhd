library ieee;
use ieee.std_logic_1164.all;

entity and_8 is
	port (
			A, B : in std_logic_vector (7 downto 0);
			O: out std_logic_vector(7 downto 0)
		);
end and_8;

architecture arch of and_8 is
begin
	O <= A AND B;
end arch;