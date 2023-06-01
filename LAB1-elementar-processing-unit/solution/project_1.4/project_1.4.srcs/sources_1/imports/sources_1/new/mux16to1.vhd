library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux16to1 is
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
end mux16to1;

architecture structural of mux16to1 is
begin
O <=    (I0 and not S(3) and not S(2) and not S(1) and not S(0)) or
        (I1 and not S(3) and not S(2) and not S(1) and     S(0)) or
        (I2 and not S(3) and not S(2) and     S(1) and not S(0)) or
        (I3 and not S(3) and not S(2) and     S(1) and     S(0)) or
        (I4 and not S(3) and     S(2) and not S(1) and not S(0)) or
        (I5 and not S(3) and     S(2) and not S(1) and     S(0)) or
        (I6 and not S(3) and     S(2) and     S(1) and not S(0)) or
        (I7 and not S(3) and     S(2) and     S(1) and     S(0)) or
        (I8 and     S(3) and not S(2) and not S(1) and not S(0)) or
        (I9 and     S(3) and not S(2) and not S(1) and     S(0)) or
        (I10 and    S(3) and not S(2) and     S(1) and not S(0)) or
        (I11 and    S(3) and not S(2) and     S(1) and     S(0)) or
        (I12 and    S(3) and     S(2) and not S(1) and not S(0)) or
        (I13 and    S(3) and     S(2) and not S(1) and     S(0)) or
        (I14 and    S(3) and     S(2) and     S(1) and not S(0)) or
        (I15 and    S(3) and     S(2) and     S(1) and     S(0));

end structural;
