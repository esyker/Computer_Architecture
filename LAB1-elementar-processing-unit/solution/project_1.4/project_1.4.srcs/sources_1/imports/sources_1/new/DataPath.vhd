library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DataPath is
    Port (   
       DA:in std_logic_vector (3 downto 0);
       FSRF: in std_logic_vector (1 downto 0);
       FS : in std_logic_vector (3 downto 0);
       AA : in std_logic_vector (3 downto 0);
       BA : in std_logic_vector (3 downto 0);
       MA : in std_logic;
       MB : in std_logic;
       KNS : in std_logic_vector (15 downto 0);
       CLK : in std_logic;
       MW : in std_logic;
       MD : in std_logic;
       D :  out std_logic_vector (15 downto 0);
       FL : out std_logic_vector (3 downto 0));
end DataPath;

architecture structural of DataPath is
component RegisterFile is
    Port ( DA:in std_logic_vector (3 downto 0);
           FSRF: in std_logic_vector (1 downto 0);
           CLK : in std_logic;
           Data : in std_logic_vector (15 downto 0);
           AA : in std_logic_vector (3 downto 0);
           BA : in std_logic_vector (3 downto 0);
           A : inout std_logic_vector (15 downto 0);
           B : inout std_logic_vector (15 downto 0));
end component;

component FunctionalUnit is
    Port ( A : in std_logic_vector (15 downto 0);
           B : in std_logic_vector (15 downto 0);
           FS : in std_logic_vector (3 downto 0);
           D : out std_logic_vector (15 downto 0);
           FL : out std_logic_vector (3 downto 0));
end component;

component DataMemory is
    Port ( Address : in std_logic_vector (15 downto 0);
           Data : in std_logic_vector (15 downto 0);
           WR : in std_logic;
           CLK : in std_logic;
           DataOut : out std_logic_vector (15 downto 0));
end component;

signal FS_X :std_logic_vector (3 downto 0);
signal A, B, AK, BK, DM, DF, DI: std_logic_vector (15 downto 0);

begin
    
    
                
    RF1 : RegisterFile port map (FSRF=>FSRF,CLK => CLK, DATA=> DI, DA=>DA, AA=>AA, BA=>BA, A=>A, B=>B);
    AK <= A when MA='0' else
          KNS when MA='1' else (others => 'X');
    BK <= B when MB='0' else
          KNS when MB='1' else (others => 'X');
    FU1 : FunctionalUnit port map (A=>AK, B=>BK, FS=>FS, D=>DF, FL=>FL);
    DM1 : DataMemory port map (Address=>BK, Data=>AK, WR=>MW, CLK=>CLK, DataOut=>DM);
    DI <= DF when MD='0' else
          DM when MD='1' else (others => 'X');
    D <= DI;
    
end structural;