library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Shifter is
    Port ( B : in std_logic_vector (15 downto 0);
           FS : in std_logic_vector (2 downto 0);
           D : out std_logic_vector (15 downto 0);
           CO : out std_logic;
           OV : out std_logic);
end Shifter;

architecture structural of Shifter is
begin
    with FS select
    D <= (others => '-')        when "000" | "001",
         B(14 downto 0) & '0'   when "010",
         '0' & B(15 downto 1)   when "011",
         B(14 downto 0) & '0'   when "100",
         B(15) & B(15 downto 1) when "101",
         B(14 downto 0) & B(15) when "110",
         B(0) & B(15 downto 1)  when "111",
         (others => 'X')        when others;
         
     CO <= B(15) when FS(0)='0' else
           B(0) when FS(0)='1' else
           'X';
           
     OV <=  B(15) xor B(14) when FS(0)='0' else
            '0' when FS(0)='1' else
            'X';

end structural;