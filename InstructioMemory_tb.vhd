LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY InstructioMemory_tb IS
END InstructioMemory_tb;
 
ARCHITECTURE behavior OF InstructioMemory_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT InstructionMemory
    PORT(
         Address : IN  std_logic_vector(31 downto 0);
         Reset : IN  std_logic;
         OutInstruction : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Address : std_logic_vector(31 downto 0) := (others => '0');
   signal Reset : std_logic := '0';

 	--Outputs
   signal OutInstruction : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
--   constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: InstructionMemory PORT MAP (
          Address => Address,
          Reset => Reset,
          OutInstruction => OutInstruction
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
		Reset <= '1';
      wait for 100 ns;	

		wait for 100 ns;
		Reset <= '0';
		Address <= "00000000000000000000000000000000";
		
		wait for 100 ns;
		Reset <= '0';
		Address <= "00000000000000000000000000000001";
		
		wait for 100 ns;
		Reset <= '0';
		Address <= "00000000000000000000000000000010";
		
		wait for 100 ns;
		Reset <= '0';
		Address <= "00000000000000000000000000000011";
		
		wait for 100 ns;
		Reset <= '0';
		Address <= "00000000000000000000000000001000";
      -- insert stimulus here 

      wait;
   end process;

END;
