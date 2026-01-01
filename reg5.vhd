library ieee;
USE ieee.std_logic_1164.all;

entity reg5 is
	port(
		resetBar, en, clk : in std_logic;
		i_value	: in	std_logic_vector(4 downto 0);
		o_value	: out	std_logic_vector(4 downto 0));
end reg5;

architecture arch of reg5 is
	signal q, notq : std_logic_vector(4 downto 0);

	component enARdFF_2
		port(
			i_resetBar	: in	std_logic;
			i_d		: in	std_logic;
			i_enable	: in	std_logic;
			i_clock		: in	std_logic;
			o_q, o_qBar	: out	std_logic);
	end component;

	begin
		dff0: enARdFF_2 port map (resetBar, i_value(0), en, clk, q(0), notq(0));
		dff1: enARdFF_2 port map (resetBar, i_value(1), en, clk, q(1), notq(1));
		dff2: enARdFF_2 port map (resetBar, i_value(2), en, clk, q(2), notq(2));
		dff3: enARdFF_2 port map (resetBar, i_value(3), en, clk, q(3), notq(3));
		dff4: enARdFF_2 port map (resetBar, i_value(4), en, clk, q(4), notq(4));

		o_value <= q_value;

end arch;