library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity RegisterFile is
    Port ( Reset : in  STD_LOGIC;
			  RegisterSource1 : in  STD_LOGIC_VECTOR (5 downto 0);
           RegisterSource2 : in  STD_LOGIC_VECTOR (5 downto 0);
           RegisterDestination : in  STD_LOGIC_VECTOR (5 downto 0);
           DataToWrite : in  STD_LOGIC_VECTOR (31 downto 0);
           ContentRegisterSource1 : out  STD_LOGIC_VECTOR (31 downto 0);
           ContentRegisterSource2 : out  STD_LOGIC_VECTOR (31 downto 0));
end RegisterFile;

architecture Behavioral of RegisterFile is

	type ram_type is array (0 to 39) of std_logic_vector (31 downto 0);
	signal registers : ram_type := (x"00000000", x"00000001", x"00000010", x"00000000", x"00000000",
												x"00000000", x"00000000", x"00000000", x"00000000", x"00000000",
												x"00000000", x"00000000", x"00000000", x"00000000", x"00000000",
												x"00000000", x"00000000", x"00000000", x"00000000", x"00000000",
												x"00000000", x"00000000", x"00000000", x"00000000", x"00000000",
												x"00000000", x"00000000", x"00000000", x"00000000", x"00000000",
												x"00000000", x"00000000", x"00000000", x"00000000", x"00000000",
												x"00000000", x"00000000", x"00000000", x"00000000", x"00000000");--(others => x"00000000");

begin

	process(Reset,RegisterSource1,RegisterSource2,RegisterDestination,DataToWrite)
	begin
		if(Reset = '1')then
			ContentRegisterSource1 <= (others=>'0');
			ContentRegisterSource2 <= (others=>'0');
			registers <= (others => x"00000000");
		else
			ContentRegisterSource1 <= registers(conv_integer(RegisterSource1));
			ContentRegisterSource2 <= registers(conv_integer(RegisterSource2));
			if(RegisterDestination /= "000000")then
				registers(conv_integer(RegisterDestination)) <= DataToWrite;
			end if;
		end if;
	end process;

end Behavioral;

