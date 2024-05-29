library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity register3 is
   port (
      clk              : in std_logic;
      reset            : in std_logic;
      estado_siguiente : in std_logic_vector(2 downto 0);
      estado_actual    : out std_logic_vector(2 downto 0)
   );
end register3;

architecture rtl of register3 is

   signal internal_value : std_logic_vector(2 downto 0);

begin
   process(clk, reset)
   begin
      if reset = '1' then
         internal_value <= "000";
      elsif rising_edge(clk) then
         internal_value <= estado_siguiente;
      end if;
   end process;

   -- Asignamos la señal internal_value al puerto estado_actual directamente
   estado_actual <= internal_value;
end architecture;
