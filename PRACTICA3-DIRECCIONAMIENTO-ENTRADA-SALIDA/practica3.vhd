library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity practica3 is
    Port ( clk, reset : in  STD_LOGIC;
           input1, input2, input3, input4 : in  STD_LOGIC;
           output1, output2, output3, output4 : out  STD_LOGIC);
end practica3;

architecture Behavioral of practica3 is
    constant STATE_WIDTH : integer := 3; -- Ancho de bits para representar estados (8 estados)
    constant INPUT_WIDTH : integer := 4; -- Ancho de bits para las entradas
    constant OUTPUT_WIDTH : integer := 4; -- Ancho de bits para las salidas
    type state_type is array (0 to 2**STATE_WIDTH-1) of std_logic_vector(OUTPUT_WIDTH-1 downto 0);
    signal rom : state_type := (
                    -- Define aquí la tabla de estados y las salidas condicionales
                    -- Por ejemplo: (output1, output2, output3, output4)
                    -- Estado 0: 0000 (salidas condicionales)
                    -- Estado 1: 0011 (salidas condicionales)
                    -- ...
                    -- Estado 7: 1111 (salidas condicionales)
                    -- Puedes llenar esta matriz con tus valores específicos
                );
    signal current_state, next_state : std_logic_vector(STATE_WIDTH-1 downto 0);
    signal inputs : std_logic_vector(INPUT_WIDTH-1 downto 0);
    signal outputs : std_logic_vector(OUTPUT_WIDTH-1 downto 0);

begin

    -- Lógica de control
    process(clk, reset)
    begin
        if reset = '1' then
            current_state <= (others => '0');
            outputs <= (others => '0');
        elsif rising_edge(clk) then
            current_state <= next_state;
            outputs <= rom(to_integer(unsigned(current_state)));
        end if;
    end process;

    -- Actualización del estado siguiente basado en las entradas
    process(current_state, input1, input2, input3, input4)
    begin
        -- Actualiza las entradas
        inputs <= input4 & input3 & input2 & input1;
        
        -- Lógica para definir el estado siguiente basado en las entradas y el estado actual
        -- Aquí debes definir la lógica de transición de estados
        -- Puedes usar estructuras condicionales, operadores lógicos, etc.
        -- Por ejemplo:
        case unsigned(current_state) is
            when 0 =>
                if inputs = "0000" then
                    next_state <= "001";
                elsif inputs = "0001" then
                    next_state <= "010";
                -- Agregar condiciones para otros estados
                end if;
            when 1 =>
                -- Lógica para el estado 1
            -- Agregar casos para otros estados
            when others =>
                -- Por defecto, ir al estado inicial
                next_state <= (others => '0');
        end case;
    end process;

    -- Asignación de salidas
    output1 <= outputs(0);
    output2 <= outputs(1);
    output3 <= outputs(2);
    output4 <= outputs(3);

end Behavioral;
