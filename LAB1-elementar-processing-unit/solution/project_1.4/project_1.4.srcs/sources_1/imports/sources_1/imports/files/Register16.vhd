library ieee;
use ieee.std_logic_1164.all;

entity Register16 is
	port(	D: in std_logic_vector(15 downto 0);
			Load: in std_logic;
			CLK: in std_logic;
			Q: out std_logic_vector(15 downto 0):=(others => '0')
			);
end Register16;

architecture structural of Register16 is
begin
	Q <= D when CLK'event and CLK='1' and Load='1';
end structural;
