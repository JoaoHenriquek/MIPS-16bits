library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity mux is
    Port(
        mux_in1 : in  STD_LOGIC_VECTOR(15 downto 0);
        mux_in2 : in  STD_LOGIC_VECTOR(15 downto 0);
        mux_sel : in  STD_LOGIC;
        mux_out : out  STD_LOGIC_VECTOR(15 downto 0)
    );
end mux;

architecture Behavioral of mux is
begin
    process
    begin
        if mux_sel = '0' then
            mux_out <= mux_in1;
        else
            mux_out <= mux_in2;
        end if;
    end process;
end Behavioral;