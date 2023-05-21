library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ArithmeticUnit is
    Port ( A : in std_logic_vector (15 downto 0);
           B : in std_logic_vector (15 downto 0);
           FS : in std_logic_vector (2 downto 0);
           D : out std_logic_vector (15 downto 0);
           CO : out std_logic;
           OV : out std_logic);
end ArithmeticUnit;

architecture structural of ArithmeticUnit is
component ArithmeticUnitI is
    Port ( Ai : in std_logic;
       Bi : in std_logic;
       FS : in std_logic_vector(2 downto 0);
       CI : in std_logic;
       Di : out std_logic;
       CO : out std_logic);
end component;
signal Yn : std_logic;
signal Z : std_logic_vector (15 downto 0);
signal C : std_logic_vector (16 downto 0);
signal FS_2signal : std_logic;

begin
    with FS(2) select FS_2signal <= C(8) when '0',
                                    FS(0) when '1',
                                    'X' when others;
                   
    
    C(0) <= FS(0);
    aritGen: for I in 7 downto 0 generate
        AUi: ArithmeticUnitI port map (Ai=>A(I), Bi=>B(I), FS=>FS, CI=>C(I), Di=>Z(I), CO=>C(I+1));
    end generate aritGen;
    
     AUi: ArithmeticUnitI port map (Ai=>A(8), Bi=>B(8), FS=>FS, CI=>FS_2signal, Di=>Z(8), CO=>C(9));
    
    aritGen2:for I in 15 downto 9 generate
           AUi: ArithmeticUnitI port map (Ai=>A(I), Bi=>B(I), FS=>FS, CI=>C(I), Di=>Z(I), CO=>C(I+1));
       end generate aritGen2;
       D <= Z;
    
    -- carry
    CO <= C(16);
    -- overflow
    Yn <= (B(15) and not FS(1)) or (not B(15) and FS(1));
    OV <= (A(15) and Yn and not Z(15)) or (not A(15) and not Yn and Z(15));
    
end structural;