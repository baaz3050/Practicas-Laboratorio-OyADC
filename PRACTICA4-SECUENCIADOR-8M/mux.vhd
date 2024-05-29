--Modulo Mux
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity mux is
   port (
      entradas : in std_logic_vector(3 downto 0); -- X,Y,Z,INT
      prueba   : in std_logic_vector(1 downto 0);
      Qsel   : out std_logic   --> Qsel
   );
end mux;

architecture rtl of mux is

begin
   process(entradas, prueba)
   begin
      case prueba is
         when "11" =>
            Qsel <= entradas(0);  -- Seleccionar INT cuando prueba es "11"
         when "00" =>
            Qsel <= entradas(1);  -- Seleccionar X cuando prueba es "00"
         when "01" =>
            Qsel <= entradas(2);  -- Seleccionar Y cuando prueba es "01"
         when "10" =>
            Qsel <= entradas(3);  -- Seleccionar Z cuando prueba es "10"
         when others =>
            Qsel <= '0';          -- Valor predeterminado si prueba no coincide con ninguno de los casos
      end case;
   end process;
end architecture;
