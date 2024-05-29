-- Modulo Registro_transf
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity registro_transf is
   port (
      NMAP     : in std_logic;								--hab
      entrada  : in std_logic_vector(2 downto 0);		--entrada del registro
      salida   : out std_logic_vector(2 downto 0)		--Estado siguiente
   );
end registro_transf;

architecture rtl of registro_transf is
   signal internal_value : std_logic_vector(2 downto 0) := "000";
begin
   process(entrada)
   begin
      internal_value <= entrada;
   end process;

   process(internal_value, NMAP)
   begin
      if NMAP = '1' then
         salida <= internal_value;
      end if;
   end process;
end architecture;
