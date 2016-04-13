
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ProgramCounter is
    Port ( Pcin : in  STD_LOGIC_VECTOR (31 downto 0);
           Clk : in  STD_LOGIC;
           Rst : in  STD_LOGIC;
           Pcout : out  STD_LOGIC_VECTOR (31 downto 0));
end ProgramCounter;

architecture Behavioral of ProgramCounter is

begin
process(Clk, Rst, Pcin)
	begin
	if(Rst = '1') then 
		Pcout <= (others=>'0');
	else
		if(rising_edge(clk)) then
			Pcout <= Pcin;
		end if;
	end if;
end process;

end Behavioral;

