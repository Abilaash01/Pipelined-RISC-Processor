library ieee;
use ieee.std_logic_1164.all;

entity ALUcontroller is
port (
	F				: in std_logic_vector(5 downto 0);
	ALUOP			: in std_logic_vector(1 downto 0);
	op				: out std_logic_vector(2 downto 0)
);
end ALUcontroller;

architecture struct of ALUcontroller is

begin

op(0) <= ALUOP(1) and (F(0) or F(3));
op(1) <= (not F(2)) or (not ALUOP(1));
op(2) <= ALUOP(0) or (ALUOP(1) and F(1));

end struct;