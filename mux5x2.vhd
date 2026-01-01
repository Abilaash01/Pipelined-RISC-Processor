library ieee;
use ieee.std_logic_1164.all;

entity mux5x2 is
	port(
		a, b : in std_logic_vector(4 downto 0);
		sel : in std_logic;
		y : out std_logic_vector(4 downto 0));
end mux5x2;

architecture arch of mux5x2 is
begin
with sel select
	y 	<= a when '0',
			b when others;
end arch;