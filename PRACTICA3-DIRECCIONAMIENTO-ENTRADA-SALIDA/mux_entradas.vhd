library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity mux_entradas is
   port (
      entradas : in  std_logic_vector(3 downto 0); --X, Y, Z, W
      prueba   : in  std_logic_vector(1 downto 0);
      selector : out std_logic
   );
end mux_entradas;

architecture rtl of mux_entradas is
begin

   process(prueba, entradas)
   begin
      case prueba is
         -- X --> 00
         when "00" =>
            selector <= entradas(3);
         -- Y --> 01
         when "01" =>
            selector <= entradas(2);
         -- Z --> 10
         when "10" =>
            selector <= entradas(1);
         -- W --> 11
         when "11" =>
            selector <= entradas(0);
         -- Manejo de caso inválido
         when others =>
            selector <= '0';  -- Asignación de valor predeterminado en caso de entrada inválida
      end case;
   end process;

end architecture;
