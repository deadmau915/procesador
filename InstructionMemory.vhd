library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use std.textio.all;

entity InstructionMemory is
    Port ( Address : in  STD_LOGIC_VECTOR (31 downto 0);
           Reset : in  STD_LOGIC;
           OutInstruction : out  STD_LOGIC_VECTOR (31 downto 0));
end InstructionMemory;

architecture Behavioral of InstructionMemory is

	type rom_type is array (0 to 63) of std_logic_vector (31 downto 0);
		
	impure function InitRomFromFile (RomFileName : in string) return rom_type is
		FILE RomFile : text open read_mode is RomFileName;
		variable RomFileLine : line;
		variable temp_bv : bit_vector(31 downto 0);
		variable temp_mem : rom_type;
		begin
			for I in rom_type'range loop
				readline (RomFile, RomFileLine);
				read(RomFileLine, temp_bv);
				temp_mem(i) := to_stdlogicvector(temp_bv);
			end loop;
		return temp_mem;
	end function;
	
	signal instructions : rom_type := InitRomFromFile("testJMPL.data");

begin

	process(Reset, Address, instructions)
	begin
		if(Reset = '1')then
			OutInstruction <= (others=>'0');
		else
			OutInstruction <= instructions(conv_integer(Address(5 downto 0)));
		end if;
	end process;

end Behavioral;

