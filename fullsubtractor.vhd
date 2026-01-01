library ieee;
use ieee.STD_LOGIC_1164.all;
use ieee.STD_LOGIC_ARITH.all;
use ieee.STD_LOGIC_UNSIGNED.all;

entity fullsubstractor is
Port ( 
	A, B, C : in  STD_LOGIC;
	diff, borr : out  STD_LOGIC
);
end fullsubstractor;

architecture arch of fullsubstractor is
begin

diff <= A xor B xor C;
borr <= ((not A) and (B or C)) or (B and C);

end arch;