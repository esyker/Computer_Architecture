library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity WriteBack is
  Port (
        Enable   : in STD_LOGIC;
        DA       : in STD_LOGIC_VECTOR(3 downto 0);
        MD       : in STD_LOGIC;
        ALUData  : in STD_LOGIC_VECTOR(31 downto 0);
        MemData  : in STD_LOGIC_VECTOR(31 downto 0);
        WR       : out STD_LOGIC;
        RFData   : out STD_LOGIC_VECTOR(31 downto 0)
        );
end WriteBack;

architecture Behavioral of WriteBack is

begin

WR <= Enable and (DA(0) or not DA(1) or not DA(2) or not DA(3)); 

with MD select
    RFData <= ALUData when '0',
              MemData when others;
    
end Behavioral;
