library ieee;
use ieee.std_logic_1164.all;

entity mux1x2 is
	port(
		a, b : in std_logic;
		sel : in std_logic;
		y : out std_logic
	);
end mux1x2;

architecture arch of mux1x2 is
begin
with sel select
	y 	<= a when '0',
			b when others;
end arch;