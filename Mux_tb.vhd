LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY Mux_tb IS
END Mux_tb;
 
ARCHITECTURE behavior OF Mux_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Mux
    PORT(
         ContentRegister : IN  std_logic_vector(31 downto 0);
         Immediate : IN  std_logic_vector(31 downto 0);
         ControlSignal : IN  std_logic;
         MuxOut : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal ContentRegister : std_logic_vector(31 downto 0) := (others => '0');
   signal Immediate : std_logic_vector(31 downto 0) := (others => '0');
   signal ControlSignal : std_logic := '0';

 	--Outputs
   signal MuxOut : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
--   constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Mux PORT MAP (
          ContentRegister => ContentRegister,
          Immediate => Immediate,
          ControlSignal => ControlSignal,
          MuxOut => MuxOut
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
	
		ContentRegister <= "00000000000000000000000000000000";
		Immediate <= "11111111111111111111111111111111";
		ControlSignal <= '0';
      wait for 100 ns;	

		ContentRegister <= "00000000000000000000000000000000";
		Immediate <= "11111111111111111111111111111111";
		ControlSignal <= '1';
      wait for 100 ns;

		ContentRegister <= "00000000000000000000000000000000";
		Immediate <= "11111111111111111111111111111111";
		ControlSignal <= '0';
      wait for 100 ns;
		
		ContentRegister <= "00000000000000000000000000000000";
		Immediate <= "11111111111111111111111111111111";
		ControlSignal <= '0';
      wait for 100 ns;
		
		ContentRegister <= "00000000000000000000000000000000";
		Immediate <= "11111111111111111111111111111111";
		ControlSignal <= '1';
      wait for 100 ns;

      -- insert stimulus here 

      wait;
   end process;

END;
