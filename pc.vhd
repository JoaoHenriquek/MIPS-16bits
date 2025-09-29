library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity pcr is
    Port(
        clk : in  STD_LOGIC;
        rst : in  STD_LOGIC;
        pc_out : out STD_LOGIC_VECTOR(15 downto 0);
        pc_in : in  STD_LOGIC_VECTOR(15 downto 0);
        pc_sel : in  STD_LOGIC
    );
end pcr;

architecture Behavioral of pcr is
    signal pc_reg : STD_LOGIC_VECTOR(15 downto 0);
begin
    process(clk, rst)
    begin
        if rst = '1' then
            pc_reg <= (others => '0');
        elsif rising_edge(clk) then
            if pc_sel = '1' then
                pc_reg <= pc_in;
            else
                pc_reg <= pc_reg; -- mantém o valor atual
            end if;
        end if;
    end process;

    pc_out <= pc_reg; 
end Behavioral;