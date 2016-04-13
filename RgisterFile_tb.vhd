LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY RgisterFile_tb IS
END RgisterFile_tb;
 
ARCHITECTURE behavior OF RgisterFile_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT RegisterFile
    PORT(
         Reset : IN  std_logic;
         RegisterSource1 : IN  std_logic_vector(5 downto 0);
         RegisterSource2 : IN  std_logic_vector(5 downto 0);
         RegisterDestination : IN  std_logic_vector(5 downto 0);
         DataToWrite : IN  std_logic_vector(31 downto 0);
         ContentRegisterSource1 : OUT  std_logic_vector(31 downto 0);
         ContentRegisterSource2 : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Reset : std_logic := '0';
   signal RegisterSource1 : std_logic_vector(5 downto 0) := (others => '0');
   signal RegisterSource2 : std_logic_vector(5 downto 0) := (others => '0');
   signal RegisterDestination : std_logic_vector(5 downto 0) := (others => '0');
   signal DataToWrite : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal ContentRegisterSource1 : std_logic_vector(31 downto 0);
   signal ContentRegisterSource2 : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
--   constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RegisterFile PORT MAP (
          Reset => Reset,
          RegisterSource1 => RegisterSource1,
          RegisterSource2 => RegisterSource2,
          RegisterDestination => RegisterDestination,
          DataToWrite => DataToWrite,
          ContentRegisterSource1 => ContentRegisterSource1,
          ContentRegisterSource2 => ContentRegisterSource2
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

		Reset <= '0';
		RegisterSource1 <= "000010";
		RegisterSource2 <= "000011";
		RegisterDestination <= "000100";
		DataToWrite <= "01000000000000000000000000000011";
		wait for 100 ns;
		
		Reset <= '0';
		RegisterSource1 <= "000100";
		RegisterSource2 <= "000100";
		RegisterDestination <= "000000";
		DataToWrite <= "01000000000000000000000000000011";
		wait for 100 ns;
		
		Reset <= '0';
		RegisterSource1 <= "000100";
		RegisterSource2 <= "000000";
		RegisterDestination <= "000000";
		DataToWrite <= "01000000000000000000000000000011";
		wait for 100 ns;

      -- insert stimulus here 

      wait;
   end process;

END;
