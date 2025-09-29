library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity somador is
    Port(
        somador_in : in  STD_LOGIC_VECTOR(15 downto 0);
        somador_out : out  STD_LOGIC_VECTOR(15 downto 0)
    );
end somador;

architecture Behavioral of somador is
begin
    process
    begin
        somador_out <= std_logic_vector(unsigned(somador_in) + 1);
    end process;
end Behavioral;