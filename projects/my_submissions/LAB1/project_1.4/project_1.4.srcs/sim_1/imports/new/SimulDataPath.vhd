library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity SimulDataPath is
end SimulDataPath;

architecture Behavioral of SimulDataPath is

function to_LVU(arg, size : natural) return std_logic_vector is
begin
    return std_logic_vector(to_unsigned(arg, size));
end;

component DataPath is
    Port (
       AA : in std_logic_vector (3 downto 0);
       BA : in std_logic_vector (3 downto 0);
       DA : in std_logic_vector (3 downto 0);
       FSRF : in std_logic_vector (1 downto 0);
       MA, MB : in std_logic;
       KNS : in std_logic_vector (15 downto 0);
       CLK : in std_logic;
       MW : in std_logic;
       FS : in std_logic_vector (3 downto 0);
       MD : in std_logic;
       D : out std_logic_vector (15 downto 0);
       FL : out std_logic_vector (3 downto 0));
end component;

signal  AA : std_logic_vector (3 downto 0);
signal  BA : std_logic_vector (3 downto 0);
signal  DA : std_logic_vector (3 downto 0);
signal  FSRF : std_logic_vector (1 downto 0);
signal  MA, MB : std_logic;
signal  KNS : std_logic_vector (15 downto 0);
signal  clock : std_logic := '0';
signal  MW : std_logic;
signal  FS : std_logic_vector (3 downto 0);
signal  MD : std_logic;
signal  D : std_logic_vector (15 downto 0);
signal  FL : std_logic_vector (3 downto 0);
    
  begin 
    process
    begin
        wait for 50 ns;
        clock <= not clock;
    end process;

   
    process 
     begin 
     wait until clock'event and clock='0';
         --R1 <= 76            --76/2=38=(0026)h  --- FS="0000"=>soma
          AA<=x"0" ;BA<=x"0"; DA<=x"1"; FSRF<="01"; MA<='1'; MB<='1'; KNS<=x"0026"; MW<='0'; FS<="0000"; MD<='0'; 
          
          wait until clock'event and clock='0'; 
          -- R2 <-56 --     --56/2=28=(001C)h
          AA<=x"0" ; BA<=x"0"; DA<=x"2"; FSRF<="01"; MA<='1'; MB<='1'; KNS<=x"001C"; MW<='0'; FS<="0000"; MD<='0';
          
           wait until clock'event and clock='0'; 
           -- R3 <- R1(através de RA)
           AA<=x"1" ; BA<=x"0"; DA<=x"3"; FSRF<="10"; MA<='0'; MB<='0'; KNS<=x"0000"; MW<='0'; FS<="0000"; MD<='0'; 
           
           wait until clock'event and clock='0';
           --R4 <- R2 (através de RB)
            AA<=x"0" ; BA<=x"2"; DA<=x"4"; FSRF<="11"; MA<='0'; MB<='0'; KNS<=x"0000"; MW<='0'; FS<="0000"; MD<='0';
     
    wait until clock'event and clock='0';
    --R1<= 2303 (08FF(h))  --2303/2=1151,5   --FS="0001"=>A+B+1
     AA<=x"0" ;BA<=x"0"; DA<=x"1"; FSRF<="01"; MA<='1'; MB<='1'; KNS<=x"047F"; MW<='0'; FS<="0001"; MD<='0'; 
     
     wait until clock'event and clock='0'; 
     --R2<= 257 (0101(h))  --257/2=128,5(0080(h))   --FS="0001"=>A+B+1
     AA<=x"0" ; BA<=x"0"; DA<=x"2"; FSRF<="01"; MA<='1'; MB<='1'; KNS<=x"0080"; MW<='0'; FS<="0001"; MD<='0';
     
      wait until clock'event and clock='0'; 
      --R3 <= R1 + R2 (8 bits)
      AA<=x"1" ; BA<=x"2"; DA<=x"3"; FSRF<="01"; MA<='0'; MB<='0'; KNS<=x"0000"; MW<='0'; FS<="0000"; MD<='0'; 
      
      wait until clock'event and clock='0';
      --R4 <= R1 + R2 (16 bits)
       AA<=x"0" ; BA<=x"2"; DA<=x"4"; FSRF<="01"; MA<='0'; MB<='0'; KNS<=x"0000"; MW<='0'; FS<="0000"; MD<='0';
       
        wait until clock'event and clock='0'; 
            --R5 <= R1 - R2 (8 bits)
            AA<=x"1" ; BA<=x"2"; DA<=x"5"; FSRF<="01"; MA<='0'; MB<='0'; KNS<=x"0000"; MW<='0'; FS<="0010"; MD<='0'; 
            
       wait until clock'event and clock='0';
            --R6 <= R1 - R2 (16 bits)
             AA<=x"1" ; BA<=x"2"; DA<=x"6"; FSRF<="01"; MA<='0'; MB<='0'; KNS<=x"0000"; MW<='0'; FS<="0010"; MD<='0'; 
       
        end process;
    
    DP0: DataPath port map (
        AA=>AA, BA=>BA, DA=>DA, FSRF=>FSRF, MA=>MA, MB=>MB, KNS=>KNS, MW=>MW, FS=>FS, MD=>MD, D=>D, FL=>FL, CLK=>clock
        );
    
end Behavioral;