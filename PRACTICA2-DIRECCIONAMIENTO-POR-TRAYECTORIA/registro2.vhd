
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity register2 is
	port (
      clk : in std_logic;
      reset : in std_logic;
      liga : in std_logic_vector(2 downto 0);  -- Liga
      edo_siguiente : out std_logic_vector(2 downto 0) -- Estado_Siguiente
	);
end register2;

architecture rtl of register2 is

   signal internal_value : std_logic_vector(2 downto 0) := b"000";

begin
   process(clk, reset, liga)
   begin
      if reset = '1' then
         internal_value <= b"000";
      elsif rising_edge(clk) then
         internal_value <= liga;         
      end if;
   end process;

   process(internal_value)
   begin
	edo_siguiente <= internal_value;
   end process;
end architecture;
