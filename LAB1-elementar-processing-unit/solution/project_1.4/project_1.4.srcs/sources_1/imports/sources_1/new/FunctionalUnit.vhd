library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FunctionalUnit is
    Port ( A : in std_logic_vector (15 downto 0);
           B : in std_logic_vector (15 downto 0);
           FS : in std_logic_vector (3 downto 0);
           D : out std_logic_vector (15 downto 0);
           FL : out std_logic_vector (3 downto 0));
end FunctionalUnit;

architecture structural of FunctionalUnit is
component ArithmeticUnit is
    Port ( A : in std_logic_vector (15 downto 0);
           B : in std_logic_vector (15 downto 0);
           FS : in std_logic_vector (2 downto 0);
           D : out std_logic_vector (15 downto 0);
           CO : out std_logic;
           OV : out std_logic);
end component;

component LogicUnit is
    Port ( A : in std_logic_vector (15 downto 0);
           B : in std_logic_vector (15 downto 0);
           FS : in std_logic_vector (2 downto 0);
           D : out std_logic_vector (15 downto 0));
end component;

component Shifter is
    Port ( B : in std_logic_vector (15 downto 0);
           FS : in std_logic_vector (2 downto 0);
           D : out std_logic_vector (15 downto 0);
           CO : out std_logic;
           OV : out std_logic);
end component;

component Zero is
    port(   Data : in std_logic_vector (15 downto 0); D : out std_logic);
end component;

component Buf is
    port(   I : in std_logic;  D : out std_logic);
end component;

signal DI : std_logic_vector (15 downto 0);     -- D internal
signal DA : std_logic_vector (15 downto 0);     -- D Arithmetic 
signal DL : std_logic_vector (15 downto 0);     -- D Logic
signal DS : std_logic_vector (15 downto 0);     -- D Shifter
signal COA, OVA, COS, OVS : std_logic;
signal Z, N, C, O : std_logic;

begin
    AU1 : ArithmeticUnit port map (A => A, B=>B, FS=> FS(2 downto 0), D=>DA, CO=>COA, OV=>OVA);
    LU1 : LogicUnit port map (A => A, B=>B, FS=> FS(2 downto 0), D=>DL);
    SH1 : Shifter port map (B=>B, FS=>FS(2 downto 0), D=>DS, CO=>COS, OV=>OVS);

    with FS(3 downto 1) select
    DI <=   DA when "000" | "001"|"010"|"011",
            DL when  "100",
            DS when "101" | "110" | "111",
            (others => 'X') when others;
           
    -- zero
    Zero1: Zero port map (Data=>DI, D=>Z); 

    -- negative
    Buf1: Buf port map (I=> DI(15), D=> N);
    
    -- cary
    with FS(3 downto 1) select
    C <=    COA when "000" | "001" |"010" | "011",
                '-' when "100",
                COS when "101" | "110" | "111",
                'X' when others;
    
    -- overflow
    with FS(3 downto 1) select
    O <=    OVA when "000" | "001" |"010" | "011",
                '-' when  "100",
                OVS when "101" | "110" | "111",
                'X' when others;

     D <= DI;
     FL <= Z & N & C & O;
end structural;
