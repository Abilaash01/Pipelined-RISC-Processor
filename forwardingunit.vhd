library ieee;
use ieee.std_logic_1164.all;

entity forwardingunit is
	port (
		EXMEMRegWrite, MEMWBRegWrite: in std_logic;
		EXMEMrd, IDEXrs, IDEXrt, MEMWBrd: in std_logic_vector(4 downto 0);
		forwardA, forwardB: out std_logic_vector(1 downto 0)
	);
end forwardingunit;

architecture arch of forwardingunit is

signal q0, q1, q2, q3, eqEXMEMrs, eqEXMEMrt, eqMEMWBrs, eqMEMWBrt: std_logic;

begin

eqEXMEMrs <= (EXMEMrd(4) xnor IDEXrs(4)) and (EXMEMrd(3) xnor IDEXrs(3)) and (EXMEMrd(2) xnor IDEXrs(2)) 
					and (EXMEMrd(1) xnor IDEXrs(1)) and (EXMEMrd(0) xnor IDEXrs(0));

eqEXMEMrt <= (EXMEMrd(4) xnor IDEXrt(4)) and (EXMEMrd(3) xnor IDEXrt(3)) and (EXMEMrd(2) xnor IDEXrt(2))
					and (EXMEMrd(1) xnor IDEXrt(1)) and (EXMEMrd(0) xnor IDEXrt(0));

eqMEMWBrs <= (MEMWBrd(4) xnor IDEXrs(4)) and (MEMWBrd(3) xnor IDEXrs(3)) and (MEMWBrd(2) xnor IDEXrs(2))
					and (MEMWBrd(1) xnor IDEXrs(1)) and (MEMWBrd(0) xnor IDEXrs(0));

eqMEMWBrt <= (MEMWBrd(4) xnor IDEXrt(4)) and (MEMWBrd(3) xnor IDEXrt(3)) and (MEMWBrd(2) xnor IDEXrt(2))
					and (MEMWBrd(1) xnor IDEXrt(1)) and (MEMWBrd(0) xnor IDEXrt(0));

q0 <= EXMEMRegWrite and (EXMEMrd(4) or EXMEMrd(3) or EXMEMrd(2) or EXMEMrd(1) or EXMEMrd(0)) and eqEXMEMrs;
q1 <= EXMEMRegWrite and (EXMEMrd(4) or EXMEMrd(3) or EXMEMrd(2) or EXMEMrd(1) or EXMEMrd(0)) and eqEXMEMrt;
q2 <= MEMWBRegWrite and (MEMWBrd(4) or MEMWBrd(3) or MEMWBrd(2) or MEMWBrd(1) or MEMWBrd(0)) and eqMEMWBrs;
q3 <= MEMWBRegWrite and (MEMWBrd(4) or MEMWBrd(3) or MEMWBrd(2) or MEMWBrd(1) or MEMWBrd(0)) and eqMEMWBrt;

forwardA <= ((not q0) and q2) & q0;
forwardB <= ((not q1) and q3) & q1;

end arch;