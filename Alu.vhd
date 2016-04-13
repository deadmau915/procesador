library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Alu is
    Port ( Crs1 : in  STD_LOGIC_VECTOR (31 downto 0);
           Crs2 : in  STD_LOGIC_VECTOR (31 downto 0);
           AluOp : in  STD_LOGIC_VECTOR (5 downto 0);
           AluResult : out  STD_LOGIC_VECTOR (31 downto 0));
end Alu;

architecture Behavioral of Alu is

begin
process(AluOp)
	begin
	case (AluOp) is 
		when "000000" => --Add
			AluResult <= Crs1 + Crs2;
		when "000001" => --Sub
			AluResult <= Crs1 - Crs2;
		when "000010" => --And
			AluResult <= Crs1 and Crs2;
		when "000011" => --AndN
			AluResult <= Crs1 nand Crs2;
		when "000100" => --Or
			AluResult <= Crs1 or Crs2;
		when "000101" => --OrN
			AluResult <= Crs1 nor Crs2;
		when "000110" => --Xor
			AluResult <= Crs1 xor Crs2;
		when "000111" => --Xnor
			AluResult <= Crs1 xnor Crs2;
		when others =>
			AluResult <= (others=>'1');
	end case;
end process;

end Behavioral;

