library ieee;
use ieee.std_logic_1164.all;

entity or_8 is
	port (
			A, B : in std_logic_vector (7 downto 0);
			O: out std_logic_vector(7 downto 0)
		);
end or_8;

architecture arch of or_8 is

begin
	O <= A OR B;
end arch;