library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Processor2 is
    Port ( Clk : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           Result : out  STD_LOGIC_VECTOR (31 downto 0));
end Processor2;

architecture Behavioral of Processor2 is

	COMPONENT ProgramCounter
	PORT(
		Pcin : IN std_logic_vector(31 downto 0);
		Clk : IN std_logic;
		Rst : IN std_logic;          
		Pcout : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT Adder
	PORT(
		AddIn : IN std_logic_vector(31 downto 0);
		Increment : IN std_logic_vector(31 downto 0);          
		AddOut : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT InstructionMemory
	PORT(
		Address : IN std_logic_vector(31 downto 0);
		Reset : IN std_logic;          
		OutInstruction : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT ControlUnity
	PORT(
		Op : IN std_logic_vector(1 downto 0);
		Op3 : IN std_logic_vector(5 downto 0);          
		AluOp : OUT std_logic_vector(5 downto 0)
		);
	END COMPONENT;
	
	COMPONENT RegisterFile
	PORT(
		Reset : IN std_logic;
		RegisterSource1 : IN std_logic_vector(5 downto 0);
		RegisterSource2 : IN std_logic_vector(5 downto 0);
		RegisterDestination : IN std_logic_vector(5 downto 0);
		DataToWrite : IN std_logic_vector(31 downto 0);          
		ContentRegisterSource1 : OUT std_logic_vector(31 downto 0);
		ContentRegisterSource2 : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT SignExtensionUnit
	PORT(
		Imm13 : IN std_logic_vector(12 downto 0);          
		Sign_Ext : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT Mux
	PORT(
		ContentRegister : IN std_logic_vector(31 downto 0);
		Immediate : IN std_logic_vector(31 downto 0);
		ControlSignal : IN std_logic;          
		MuxOut : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT Alu
	PORT(
		Crs1 : IN std_logic_vector(31 downto 0);
		Crs2 : IN std_logic_vector(31 downto 0);
		AluOp : IN std_logic_vector(5 downto 0);          
		AluResult : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	

begin

	Inst_NextProgramCounter: ProgramCounter PORT MAP(
		Pcin => ,
		Clk => Clk,
		Rst => Reset,
		Pcout => 
	);
	
	Inst_ProgramCounter: ProgramCounter PORT MAP(
		Pcin => ,
		Clk => Clk,
		Rst => Reset,
		Pcout => 
	);
	
	Inst_Adder: Adder PORT MAP(
		AddIn => ,
		Increment => ,
		AddOut => 
	);
	
	Inst_InstructionMemory: InstructionMemory PORT MAP(
		Address => ,
		Reset => Reset,
		OutInstruction => 
	);
	
	Inst_ControlUnity: ControlUnity PORT MAP(
		Op => ,
		Op3 => ,
		AluOp => 
	);
	
	Inst_RegisterFile: RegisterFile PORT MAP(
		Reset => Reset,
		RegisterSource1 => ,
		RegisterSource2 => ,
		RegisterDestination => ,
		DataToWrite => ,
		ContentRegisterSource1 => ,
		ContentRegisterSource2 => 
	);
	
	Inst_SignExtensionUnit: SignExtensionUnit PORT MAP(
		Imm13 => ,
		Sign_Ext => 
	);
	
	Inst_Mux: Mux PORT MAP(
		ContentRegister => ,
		Immediate => ,
		ControlSignal => ,
		MuxOut => 
	);
	
	Inst_Alu: Alu PORT MAP(
		Crs1 => ,
		Crs2 => ,
		AluOp => ,
		AluResult => 
	);

end Behavioral;

