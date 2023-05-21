library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity InstructionFetch is
    Port ( 
           CLK          : in std_logic;
           StageEnable  : in std_logic;
           PCLoadEnable : in std_logic;
           PCLoadValue  : in std_logic_vector(31 downto 0);
           Instruction  : out std_logic_vector(31 downto 0);
           PCCurrValue  : out std_logic_vector(31 downto 0)
         );
end InstructionFetch;

architecture Structural of InstructionFetch is

component InstructionMemory
    Port ( Address : in STD_LOGIC_VECTOR (7 downto 0);
           DataOut : out STD_LOGIC_VECTOR (31 downto 0));
end component;

component AdderN is
    Generic (n_bits : in integer := 32);
    Port ( A : in STD_LOGIC_VECTOR (n_bits-1 downto 0);
           B : in STD_LOGIC_VECTOR (n_bits-1 downto 0);
           S : out STD_LOGIC_VECTOR (n_bits-1 downto 0));
end component;

component RegisterN
    generic(n_bits : natural := 31);
	port(	CLK: in std_logic;
            D: in std_logic_vector(n_bits-1 downto 0);
			Enable: in std_logic;
			Q: out std_logic_vector(n_bits-1 downto 0)
			);
end component;

signal PC, NextPC, PCplusOne : std_logic_vector(7 downto 0) := (others=>'0');

begin

-- Asyncronous Instruction Memory
InstMem: InstructionMemory port map(Address => PC, DataOut => Instruction);

-- Increment PC
PCAdder: AdderN generic map(n_bits=>8) port map (A=>PC,B=>x"01",S=>PCplusOne);

-- select PC value to load
with PCLoadEnable select
    NextPC <= PCplusOne when '0',
              PCLoadValue(7 downto 0) when others;

-- PC register
PCReg: RegisterN generic map(n_bits=>8) port map(CLK=>CLK, D=>NextPC, Enable=>StageEnable, Q=>PC);

-- Output PC Value for current inst
PCCurrValue <= (31 downto 8=>'0') & PC;

end Structural;
