library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity rom is
    Port (
        estado_actual : in STD_LOGIC_VECTOR(2 downto 0);  -- Estado actual como entrada
        entradas : in STD_LOGIC_VECTOR(3 downto 0);       -- Entradas como un vector de 4 bits X, Y, Z, W
        salidas : out STD_LOGIC_VECTOR(3 downto 0);       -- Salidas verdaderas de un bit cada una
        estado_sig : out STD_LOGIC_VECTOR(2 downto 0)     -- Ligas de salida
    );
end rom;

architecture rtl of rom is
   type mem is array (0 to 11) of std_logic_vector(6 downto 0);
   signal internal_mem : mem;

begin
   -- Inicialización de internal_mem
   -- Cada entrada de la memoria contiene 3 bits para las ligas y 4 bits para las salidas verdaderas
   internal_mem(0) <= "0010110";  -- S0, liga = "001", salidas = "0110"
   internal_mem(1) <= "0100000";  -- S1, liga = "010", salidas = "0000"
   internal_mem(2) <= "1011000";  -- S2, liga = "101", salidas = "1000"
   internal_mem(3) <= "0110000";  -- S3, liga = "011", salidas = "0000"
   internal_mem(4) <= "1000000";  -- S4, liga = "100", salidas = "0000"
   internal_mem(5) <= "1100100";  -- S5, liga = "110", salidas = "0100"
   internal_mem(6) <= "1110100";  -- S6, liga = "111", salidas = "0100"
   internal_mem(7) <= "0010010";  -- S7, liga = "001", salidas = "0010"
   internal_mem(8) <= "0100001";  -- S8, liga = "010", salidas = "0001"
   internal_mem(9) <= "1110100";  -- S9, liga = "111", salidas = "0100"
   internal_mem(10) <= "0001000"; -- S10, liga = "000", salidas = "1000"
   internal_mem(11) <= "0000010"; -- S11, liga = "000", salidas = "0010"

   process (estado_actual, entradas)
   begin

		--		 X				 Y				 Z				 W	
		-- entradas(3) entradas(2) entradas(1) entradas(0)
      -- Ajustar las salidas basadas en las entradas seleccionadas
      case estado_actual is
         when "000" =>
            if entradas(3) = '1' and entradas(0) = '1' then
               estado_sig <= internal_mem(2)(6 downto 4);					
               salidas <= internal_mem(2)(3 downto 0);
					
            elsif entradas(3) = '1' and entradas(0) = '0' then
               estado_sig <= internal_mem(1)(6 downto 4);
               salidas <= internal_mem(1)(3 downto 0);
					
            elsif entradas(3) = '0' then
               estado_sig <= internal_mem(0)(6 downto 4);
               salidas <= internal_mem(0)(3 downto 0);
					
            else
               salidas <= (others => '0'); -- Si no hay coincidencias, establecer salidas en '0000'
            
				end if;

         when "001" =>
				if entradas(1) = '1' then
					estado_sig <= internal_mem(4)(6 downto 4);
					salidas <= internal_mem(4)(3 downto 0);
				
				elsif entradas(1) = '0' then
					estado_sig <= internal_mem(3)(6 downto 4);
					salidas <= internal_mem(3)(3 downto 0);
				
				end if;
				
			when "010" =>
				if entradas(2) = '1' then
					estado_sig <= internal_mem(6)(6 downto 4);
					salidas <= internal_mem(6)(3 downto 0);
				
				elsif entradas(2) = '0' then
					estado_sig <= internal_mem(5)(6 downto 4);
					salidas <= internal_mem(5)(3 downto 0);
				
				end if;
				
			when "011" =>
					estado_sig <= internal_mem(7)(6 downto 4);
					salidas <= internal_mem(7)(3 downto 0);
            
			when "100" =>
					estado_sig <= internal_mem(8)(6 downto 4);
					salidas <= internal_mem(8)(3 downto 0);
        
			when "101" =>
					estado_sig <= internal_mem(9)(6 downto 4);
					salidas <= internal_mem(9)(3 downto 0);
					
			when "110" =>
					estado_sig <= internal_mem(10)(6 downto 4);
					salidas <= internal_mem(10)(3 downto 0);
					
			when "111" =>
					estado_sig <= internal_mem(11)(6 downto 4);
					salidas <= internal_mem(11)(3 downto 0);

         when others =>
            null; -- No hay condiciones adicionales, mantener las salidas sin cambios
      end case;
   end process;
end architecture;