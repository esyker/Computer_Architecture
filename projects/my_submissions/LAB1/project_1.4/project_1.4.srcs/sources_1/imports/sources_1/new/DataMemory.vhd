library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity DataMemory is
    Port ( Address : in std_logic_vector (15 downto 0);
           Data : in std_logic_vector (15 downto 0);
           WR : in std_logic;
           CLK : in std_logic;
           DataOut : out std_logic_vector (15 downto 0));
end DataMemory;

architecture structural of DataMemory is
type storage_type is array (0 to 255) of std_logic_vector(15 downto 0);
signal storage: storage_type := (
	 0 => x"1000", 		-- 
	 1 => x"0001",	   	-- 
	 2 => x"0111",	   	-- 
	 3 => x"1010",	   	-- 
	 4 => x"1111",	   	-- 
	 5 => x"0100",	   	-- 
	 6 => x"1110",	   	-- 
	 7 => x"0000",	   	-- 
	 8 => x"1000",	   	-- 
	 others => x"0000");
begin
	DataOut <= storage(to_integer(unsigned(Address(7 downto 0)))) when not Is_X(Address) else (others=>'X');
	storage(to_integer(unsigned(Address(7 downto 0))))<=Data when CLK'event and CLK='1' and WR='1' and not Is_X(Address);
end structural;