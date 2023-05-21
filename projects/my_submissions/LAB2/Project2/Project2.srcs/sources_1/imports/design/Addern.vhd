library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Addern is
    Generic (
        n_bits : in integer := 32
    );
    Port ( A : in STD_LOGIC_VECTOR (n_bits-1 downto 0);
           B : in STD_LOGIC_VECTOR (n_bits-1 downto 0);
           S : out STD_LOGIC_VECTOR (n_bits-1 downto 0));
end Addern;

architecture Structural of Addern is

component FullAdder is
	port(X: in std_logic;
		Y: in std_logic;
		CI: in std_logic;
		O: out std_logic;
		CO: out std_logic);
end component;

signal C : STD_LOGIC_VECTOR (n_bits downto 0);

begin

C(0) <= '0';
AdderGen: for i in 0 to n_bits-1 generate
    FAi: FullAdder port map (X=>A(i), Y=>B(i), CI=>C(i), O=>S(i), CO=>C(i+1));
end generate AdderGen;

end Structural;
