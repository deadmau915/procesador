--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:22:45 04/09/2016
-- Design Name:   
-- Module Name:   /home/mauricio/Escritorio/procesador/ProgramCounter_tb.vhd
-- Project Name:  procesador
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ProgramCounter
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY ProgramCounter_tb IS
END ProgramCounter_tb;
 
ARCHITECTURE behavior OF ProgramCounter_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ProgramCounter
    PORT(
         Pcin : IN  std_logic_vector(31 downto 0);
         Clk : IN  std_logic;
         Rst : IN  std_logic;
         Pcout : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Pcin : std_logic_vector(31 downto 0) := (others => '0');
   signal Clk : std_logic := '0';
   signal Rst : std_logic := '0';

 	--Outputs
   signal Pcout : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ProgramCounter PORT MAP (
          Pcin => Pcin,
          Clk => Clk,
          Rst => Rst,
          Pcout => Pcout
        );

   -- Clock process definitions
   Clk_process :process
   begin
		Clk <= '0';
		wait for Clk_period/2;
		Clk <= '1';
		wait for Clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		Rst <= '1';
      wait for 100 ns;
		
		wait for clk_period*10;
		Pcin <= "00000000000000000000000000000000";
		Rst <= '0';
		
		wait for clk_period*10;
		Pcin <= "00001001000000000010001001001000";
		Rst <= '0';
		
		wait for clk_period*10;
		Pcin <= "00010010001000100010000000000000";
		Rst <= '0';
      -- insert stimulus here

      wait;
   end process;

END;
