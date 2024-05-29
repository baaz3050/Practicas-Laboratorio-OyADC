library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity mux_salidas is
   port (
      salida_f : in  std_logic_vector(4 downto 0);
      salida_v : in  std_logic_vector(4 downto 0);
      selector : in  std_logic;
      salida   : out std_logic_vector(4 downto 0)
   );
end mux_salidas;

architecture rtl of mux_salidas is

begin

   process(salida_f, salida_v, selector)
   begin
      if selector = '1' then
         salida <= salida_f;
      else
         salida <= salida_v;      end if;
   end process;

end architecture;