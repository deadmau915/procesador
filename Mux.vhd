library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux is
    Port ( ContentRegister : in  STD_LOGIC_VECTOR (31 downto 0);
           Immediate : in  STD_LOGIC_VECTOR (31 downto 0);
			  ControlSignal : in  STD_LOGIC;
           MuxOut : out  STD_LOGIC_VECTOR (31 downto 0));
end Mux;

architecture Behavioral of Mux is

begin

	process(ContentRegister, Immediate, ControlSignal)
	begin
		if(ControlSignal = '0') then
			MuxOut <= ContentRegister;
		elsif(ControlSignal = '1') then
			MuxOut <= Immediate;
		end if;			
	end process;

end Behavioral;

