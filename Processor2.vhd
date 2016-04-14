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
		RegisterSource1 : IN std_logic_vector(4 downto 0);
		RegisterSource2 : IN std_logic_vector(4 downto 0);
		RegisterDestination : IN std_logic_vector(4 downto 0);
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
	
	signal nPCToPCAndAdder, AdderTonPC, PCToIM, MuxOutToAluCrs2, AluAluResultToRFDatatowrite, RFCrs1ToAluCrs1, 
				RFCrs2ToMuxContentRegister, SignExtToMuxImmediate, IMOut : std_logic_vector(31 downto 0);
	signal CUAluopToAluAluop: std_logic_vector(5 downto 0);
begin

	Inst_NextProgramCounter: ProgramCounter PORT MAP(
		Pcin => AdderTonPC,
		Clk => Clk,
		Rst => Reset,
		Pcout => nPCToPCAndAdder
	);
	
	Inst_ProgramCounter: ProgramCounter PORT MAP(
		Pcin => nPCToPCAndAdder,
		Clk => Clk,
		Rst => Reset,
		Pcout => PCToIM
	);
	
	Inst_Adder: Adder PORT MAP(
		AddIn => nPCToPCAndAdder,
		Increment => "00000000000000000000000000000001",
		AddOut => AdderTonPC
	);
	
	Inst_InstructionMemory: InstructionMemory PORT MAP(
		Address => PCToIM,
		Reset => Reset,
		OutInstruction => IMOut
	);
	
	Inst_ControlUnity: ControlUnity PORT MAP(
		Op => IMOut(31 downto 30),
		Op3 => IMOut(24 downto 19),
		AluOp => CUAluopToAluAluop
	);
	
	Inst_RegisterFile: RegisterFile PORT MAP(
		Reset => Reset,
		RegisterSource1 => IMOut(18 downto 14),
		RegisterSource2 => IMOut(4 downto 0),
		RegisterDestination => IMOut(29 downto 25),
		DataToWrite => AluAluResultToRFDatatowrite,
		ContentRegisterSource1 => RFCrs1ToAluCrs1,
		ContentRegisterSource2 => RFCrs2ToMuxContentRegister
	);
	
	Inst_SignExtensionUnit: SignExtensionUnit PORT MAP(
		Imm13 => IMOut(12 downto 0),
		Sign_Ext => SignExtToMuxImmediate
	);
	
	Inst_Mux: Mux PORT MAP(
		ContentRegister => RFCrs2ToMuxContentRegister,
		Immediate => SignExtToMuxImmediate,
		ControlSignal => IMOut(13),
		MuxOut => MuxOutToAluCrs2
	);
	
	Inst_Alu: Alu PORT MAP(
		Crs1 => RFCrs1ToAluCrs1,
		Crs2 => MuxOutToAluCrs2,
		AluOp => CUAluopToAluAluop,
		AluResult => AluAluResultToRFDatatowrite
	);
	
	Result <= AluAluResultToRFDatatowrite;

end Behavioral;

