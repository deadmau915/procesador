library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

entity Adder is
    Port ( AddIn, Increment : in  STD_LOGIC_VECTOR (31 downto 0);
           AddOut : out  STD_LOGIC_VECTOR (31 downto 0));
end Adder;

architecture Behavioral of Adder is
begin
	
	AddOut <= AddIn + Increment;

end Behavioral;

