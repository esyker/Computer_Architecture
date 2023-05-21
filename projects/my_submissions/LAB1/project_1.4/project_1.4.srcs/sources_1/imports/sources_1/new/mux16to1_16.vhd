library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux16to1_16 is
    Port ( S : in std_logic_vector (3 downto 0);
           I0 : in std_logic_vector (15 downto 0);
           I1 : in std_logic_vector (15 downto 0);
           I2 : in std_logic_vector (15 downto 0);
           I3 : in std_logic_vector (15 downto 0);
           I4 : in std_logic_vector (15 downto 0);
           I5 : in std_logic_vector (15 downto 0);
           I6 : in std_logic_vector (15 downto 0);
           I7 : in std_logic_vector (15 downto 0);
           I8 : in std_logic_vector (15 downto 0);
           I9 : in std_logic_vector (15 downto 0);
           I10 : in std_logic_vector (15 downto 0);
           I11 : in std_logic_vector (15 downto 0);
           I12 : in std_logic_vector (15 downto 0);
           I13 : in std_logic_vector (15 downto 0);
           I14 : in std_logic_vector (15 downto 0);
           I15 : in std_logic_vector (15 downto 0);
           O : out std_logic_vector (15 downto 0));
end mux16to1_16;

architecture structural of mux16to1_16 is
component mux16to1 is
    Port ( S : in std_logic_vector (3 downto 0);
           I0 : in std_logic;
           I1 : in std_logic;
           I2 : in std_logic;
           I3 : in std_logic;
           I4 : in std_logic;
           I5 : in std_logic;
           I6 : in std_logic;
           I7 : in std_logic;
           I8 : in std_logic;
           I9 : in std_logic;
           I10 : in std_logic;
           I11 : in std_logic;
           I12 : in std_logic;
           I13 : in std_logic;
           I14 : in std_logic;
           I15 : in std_logic;
           O : out std_logic);
end component;

begin
    muxGen: for I in 15 downto 0 generate
        Mux: mux16to1 port map (S => S, I0 => I0(I), I1 => I1(I), I2 => I2(I), I3 => I3(I), I4 => I4(I), I5 => I5(I), I6 => I6(I), I7 => I7(I), I8 => I8(I), I9=>I9(I), I10=>I10(I), I11=>I11(I), I12=>I12(I), I13=>I13(I), I14=>I14(I), I15=>I15(I), O=>O(I));
    end generate muxGen;

end structural;
