library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity mux_ligas is
   port (
      liga_falsa : in  std_logic_vector(2 downto 0); 
      liga_verdadera : in  std_logic_vector(2 downto 0); 
      selector : in  std_logic;
      estado_siguiente   : out std_logic_vector(2 downto 0)
   );
end mux_ligas;

architecture rtl of mux_ligas is

begin

   process(liga_falsa, liga_verdadera, selector)
   begin
      if selector = '1' then
         estado_siguiente <= liga_verdadera;
      else
         estado_siguiente <= liga_falsa;
      end if;
   end process;

end architecture;