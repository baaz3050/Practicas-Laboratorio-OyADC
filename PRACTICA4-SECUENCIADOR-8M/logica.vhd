--Modulo Logica
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity logica is
   port (
      CC   : in std_logic;
      MI   : in std_logic_vector(2 downto 0);  -- Microinstruccion de 3 bits
      Sel  : out std_logic;
      PL   : out std_logic;
      NMAP : out std_logic;
      VECT : out std_logic
   );
end logica;

architecture rtl of logica is

begin
   process(MI, CC)
   begin
      case MI is
         -- Paso continuo (incondicional)
         when "000" =>
            Sel   <= '0';    -- uPC
            PL    <= '1';
            NMAP  <= '1';
            VECT  <= '1';

         -- Salto condicional cuando Qsel=0
         when "001" =>
            if CC = '0' then
               Sel   <= '1';
               PL    <= '0';
               NMAP  <= '1';
               VECT  <= '1';
            else
               Sel   <= '0';
               PL    <= '1';
               NMAP  <= '1';
               VECT  <= '1';
            end if;
         
         -- Salto condicional cuando Qsel=1
         when "010" =>
            if CC = '1' then
               Sel   <= '0';
               PL    <= '1';
               NMAP  <= '1';
               VECT  <= '1';
            else
               Sel   <= '1';
               PL    <= '0';
               NMAP  <= '1';
               VECT  <= '1';
            end if;

         -- Salto de transformación (incondicional)
         when "011" =>
            Sel   <= '1';
            PL    <= '1';
            NMAP  <= '0';
            VECT  <= '1';

         -- Salto por interrupción cuando INT=0
         when "100" =>
            if CC = '0' then
               Sel   <= '1';
               PL    <= '1';
               NMAP  <= '1';
               VECT  <= '0';
            else
               Sel   <= '0';
               PL    <= '1';
               NMAP  <= '1';
               VECT  <= '1';
            end if;

         -- Salto por interrupción cuando INT=1
         when "101" =>
            if CC = '1' then
               Sel   <= '0';
               PL    <= '1';
               NMAP  <= '1';
               VECT  <= '1';
            else
               Sel   <= '1';
               PL    <= '1';
               NMAP  <= '1';
               VECT  <= '0';
            end if;

         -- Salto forzado (incondicional, pero salta a donde diga la liga)
         when "110" =>
            Sel   <= '1';
            PL    <= '0';
            NMAP  <= '1';
            VECT  <= '1';

         -- Autodestrucción (incondicional)
         when "111" =>
            Sel   <= '1';
            PL    <= '0';
            NMAP  <= '0';
            VECT  <= '0';

         -- En caso de otro valor de MI no especificado
         when others =>
            Sel   <= '0';
            PL    <= '0';
            NMAP  <= '0';
            VECT  <= '0';
      end case;
   end process;
end architecture;