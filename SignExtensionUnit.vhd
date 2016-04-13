library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SignExtensionUnit is
    Port ( Imm13 : in  STD_LOGIC_VECTOR (12 downto 0);
           Sign_Ext : out  STD_LOGIC_VECTOR (31 downto 0));
end SignExtensionUnit;

architecture Behavioral of SignExtensionUnit is

begin
	
	process(Imm13)
	begin
		Sign_Ext(12 downto 0) <= Imm13;
		if(Imm13(12) = '1')then
			Sign_Ext(31 downto 13) <= (others=>'1');
		else
			Sign_Ext(31 downto 13) <= (others=>'0');
		end if;
	end process;

end Behavioral;

