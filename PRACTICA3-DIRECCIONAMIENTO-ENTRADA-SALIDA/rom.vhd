library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity rom is
    Port (
        estado_actual : in STD_LOGIC_VECTOR(2 downto 0);
        salidas : out STD_LOGIC_VECTOR(3 downto 0); -- 4 salidas verdaderas de un bit cada una
        prueba : out STD_LOGIC_VECTOR(1 downto 0); -- 2 bits para el MUX de entradas
		  liga_verdadera : out STD_LOGIC_VECTOR(2 downto 0); -- 3 bits para salida de liga verdadera
		  liga_falsa : out STD_LOGIC_VECTOR(2 downto 0) -- 3 bits para salida de liga falsa
    );
end rom;

architecture rtl of rom is
   type mem is array (0 to 7) of std_logic_vector(11 downto 0);
   signal internal_mem : mem;

begin
   -- Inicialización de internal_mem
	-- Estructura de la salida
	-- & prueba & Liga_verdadera & Liga_Falsa & Salidas &
   internal_mem(0) <= "000010010001";  -- S0, liga = "001"
   internal_mem(1) <= "000100110010";  -- S1, liga = "010"
   internal_mem(2) <= "110011001011";  -- S2, liga = "101"
   internal_mem(3) <= "001011011100";  -- S3, liga = "011"
   internal_mem(4) <= "100001010100";  -- S4, liga = "100"
   internal_mem(5) <= "011101110010";  -- S5, liga = "110"
   internal_mem(6) <= "000010011000";  -- S6, liga = "111"
   internal_mem(7) <= "000110110100";  -- S7, liga = "001"
   
   process (estado_actual)
   begin
      salidas <= internal_mem(to_integer(unsigned(estado_actual)))(3 downto 0);  			-- Extraer salidas verdaderas de la ROM
      liga_falsa <= internal_mem(to_integer(unsigned(estado_actual)))(6 downto 4);        -- Extraer liga falsa
		liga_verdadera <= internal_mem(to_integer(unsigned(estado_actual)))(9 downto 7);    -- Extraer liga verdadera
		prueba <= internal_mem(to_integer(unsigned(estado_actual)))(11 downto 10);       	-- Extraer prueba (entrada)
   end process;
end architecture;
