-- Modulo Secuenciador
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity secuenciador is
   port (
      clk     : in std_logic;
      sel     : in std_logic;
      liga    : in std_logic_vector(2 downto 0);    -- salida de registro uPC
      transf  : in std_logic_vector(2 downto 0);    -- salida de registro transf
      int     : in std_logic_vector(2 downto 0);    -- salida de registro interrupcion
      Y       : out std_logic_vector(2 downto 0)
   );
end secuenciador;

architecture rtl of secuenciador is
   signal mPC : std_logic_vector(2 downto 0) := "000";
   signal aux : std_logic_vector(2 downto 0);
begin
   process(clk, sel, liga, transf, int)
   begin
      if rising_edge(clk) then
         case sel is
            when '0' =>
               Y <= mPC;
               aux <= mPC;
               
            when '1' =>
               if liga(2) = '1' then
                  Y <= liga;
                  aux <= liga;
               elsif transf(2) = '1' then
                  Y <= transf;
                  aux <= transf;
               else
                  Y <= int;
                  aux <= int;
               end if;
         end case;
      end if;

      mPC <= aux + 1;
   end process;
end architecture;
