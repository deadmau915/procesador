LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY ControlUnity_tb IS
END ControlUnity_tb;
 
ARCHITECTURE behavior OF ControlUnity_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ControlUnity
    PORT(
         Op : IN  std_logic_vector(1 downto 0);
         Op3 : IN  std_logic_vector(5 downto 0);
         AluOp : OUT  std_logic_vector(5 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Op : std_logic_vector(1 downto 0) := (others => '0');
   signal Op3 : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal AluOp : std_logic_vector(5 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
--   constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ControlUnity PORT MAP (
          Op => Op,
          Op3 => Op3,
          AluOp => AluOp
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		Op <= "10";
		Op3 <= "000000";
		
		wait for 100 ns;
		Op <= "10";
		Op3 <= "000100";
		
		wait for 100 ns;
		Op <= "11";
		Op3 <= "000100";   

      wait;
   end process;

END;
