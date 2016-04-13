LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Alu_tb IS
END Alu_tb;
 
ARCHITECTURE behavior OF Alu_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Alu
    PORT(
         Crs1 : IN  std_logic_vector(31 downto 0);
         Crs2 : IN  std_logic_vector(31 downto 0);
         AluOp : IN  std_logic_vector(5 downto 0);
         AluResult : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Crs1 : std_logic_vector(31 downto 0) := (others => '0');
   signal Crs2 : std_logic_vector(31 downto 0) := (others => '0');
   signal AluOp : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal AluResult : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
--   constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Alu PORT MAP (
          Crs1 => Crs1,
          Crs2 => Crs2,
          AluOp => AluOp,
          AluResult => AluResult
        );

   -- Clock process definitions
--   <clock>_process :process
--   begin
--		<clock> <= '0';
--		wait for <clock>_period/2;
--		<clock> <= '1';
--		wait for <clock>_period/2;
--   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		Crs1 <= "00000000000000000000000000000000";
		Crs2 <= "11111111111111111111111111111111";
		AluOp <= "000010";
		
		wait for 100 ns;
		Crs1 <= "00000000000000000000000000000000";
		Crs2 <= "11111111111111111111111111111111";
		AluOp <= "000100";
		
		wait for 100 ns;
		Crs1 <= "00000000000000000000000000000000";
		Crs2 <= "11111111111111111111111111111111";
		AluOp <= "000000";
		
		wait for 100 ns;
		Crs1 <= "00000000000000000000000000000000";
		Crs2 <= "11111111111111111111111111111111";
		AluOp <= "011100";

      -- insert stimulus here 

      wait;
   end process;

END;
