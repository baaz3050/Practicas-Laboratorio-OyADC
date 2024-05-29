--Modulo Memoria
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity memoria is
   port (
      clk              : in  std_logic;                    -- Señal de reloj
      estado_presente : in  std_logic_vector(2 downto 0);
      liga            : out std_logic_vector(2 downto 0);
      instruccion     : out std_logic_vector(2 downto 0);  -- Microinstruccion
      prueba          : out std_logic_vector(1 downto 0);
      salida          : out std_logic_vector(3 downto 0)
   );
end memoria;

architecture rtl of memoria is
   type mem is array (0 to 7) of std_logic_vector(11 downto 0);
   signal internal_mem : mem;

begin
   -- Inicializacion de la memoria
   -- Direccion       LIGA   INSTRUCCION    PRUEBA    SALIDAS
   internal_mem(0)  <= "000001011010";    -- LIGA:000, INSTRUCCION:001, PRUEBA:01, SALIDAS:1010
   internal_mem(1)  <= "011010000001";    -- LIGA:011, INSTRUCCION:010, PRUEBA:00, SALIDAS:0001
   internal_mem(2)  <= "000011001000";    -- LIGA:***, INSTRUCCION:011, PRUEBA:**, SALIDAS:1000
   internal_mem(3)  <= "000100110010";    -- LIGA:***, INSTRUCCION:100, PRUEBA:11, SALIDAS:0010
   internal_mem(4)  <= "000110000001";    -- LIGA:000, INSTRUCCION:110, PRUEBA:**, SALIDAS:0001
   internal_mem(5)  <= "111010101100";    -- LIGA:111, INSTRUCCION:010, PRUEBA:10, SALIDAS:1100
   internal_mem(6)  <= "000110000110";    -- LIGA:000, INSTRUCCION:110, PRUEBA:**, SALIDAS:0110
   internal_mem(7)  <= "000111001001";    -- LIGA:***, INSTRUCCION:111, PRUEBA:**, SALIDAS:1001
       
   process(clk)
   begin
      if rising_edge(clk) then
         salida <= internal_mem(to_integer(unsigned(estado_presente)))(3 downto 0);
         prueba <= internal_mem(to_integer(unsigned(estado_presente)))(5 downto 4);
         instruccion <= internal_mem(to_integer(unsigned(estado_presente)))(8 downto 6);
         liga <= internal_mem(to_integer(unsigned(estado_presente)))(11 downto 9);
      end if;
   end process;
end architecture;
