library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity multiplier is
    Port (  X: in std_logic_vector (15 downto 0); 
            Y: in std_logic_vector (15 downto 0);
            Z: out std_logic_vector (31 downto 0));
end multiplier;

architecture structural of multiplier is
begin
    Z <= std_logic_vector(signed(X) * signed(Y));
end structural;
