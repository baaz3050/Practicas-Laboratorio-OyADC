-- Copyright (C) 2020  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- PROGRAM		"Quartus Prime"
-- VERSION		"Version 20.1.0 Build 711 06/05/2020 SJ Lite Edition"
-- CREATED		"Fri Apr 05 01:11:13 2024"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY practica1 IS 
	PORT
	(
		CLK :  IN  STD_LOGIC;
		RESET :  IN  STD_LOGIC;
		A :  OUT  STD_LOGIC;
		B :  OUT  STD_LOGIC;
		C :  OUT  STD_LOGIC;
		D :  OUT  STD_LOGIC
	);
END practica1;

ARCHITECTURE bdf_type OF practica1 IS 

ATTRIBUTE black_box : BOOLEAN;
ATTRIBUTE noopt : BOOLEAN;

COMPONENT \74193_0\
	PORT(CLR : IN STD_LOGIC;
		 UP : IN STD_LOGIC;
		 QB : OUT STD_LOGIC;
		 QA : OUT STD_LOGIC;
		 QD : OUT STD_LOGIC;
		 QC : OUT STD_LOGIC);
END COMPONENT;
ATTRIBUTE black_box OF \74193_0\: COMPONENT IS true;
ATTRIBUTE noopt OF \74193_0\: COMPONENT IS true;



BEGIN 



b2v_inst : 74193_0
PORT MAP(CLR => RESET,
		 UP => CLK,
		 QB => B,
		 QA => A,
		 QD => D,
		 QC => C);


END bdf_type;