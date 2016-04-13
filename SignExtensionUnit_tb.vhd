LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY SignExtensionUnit_tb IS
END SignExtensionUnit_tb;
 
ARCHITECTURE behavior OF SignExtensionUnit_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT SignExtensionUnit
    PORT(
         Imm13 : IN  std_logic_vector(12 downto 0);
         Sign_Ext : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Imm13 : std_logic_vector(12 downto 0) := (others => '0');

 	--Outputs
   signal Sign_Ext : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
--   constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SignExtensionUnit PORT MAP (
          Imm13 => Imm13,
          Sign_Ext => Sign_Ext
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
      
		Imm13 <= "1110001110001";
      wait for 100 ns;
		
		Imm13 <= "0110001110001";
      wait for 100 ns;

      -- insert stimulus here 

      wait;
   end process;

END;
