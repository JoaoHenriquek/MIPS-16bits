library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity alu is
    port (
        -- operandos
        a, b   : in  std_logic_vector(15 downto 0);

        -- seletor da opera��o
        sel    : in  std_logic_vector(2 downto 0);

        -- resultado
        result : out std_logic_vector(15 downto 0);

        -- flags para a UC
        zero    : out std_logic;
        greater : out std_logic;
        less    : out std_logic
    );
end entity;

architecture rtl of alu is
    signal a_s, b_s : signed(15 downto 0);
    signal r_s      : signed(15 downto 0);
begin
    a_s <= signed(a);
    b_s <= signed(b);

    process(a_s, b_s, sel)
begin
    case sel is
        when "000" => r_s <= a_s + b_s; -- ADD
        when "001" => r_s <= a_s - b_s; -- SUB
        when "010" => r_s <= resize(a_s * b_s, 16); -- MUL
        when "011" =>
            if b_s /= 0 then
                r_s <= resize(a_s / b_s, 16); -- DIV
            else
                r_s <= (others => '0');
            end if;
        when others =>
            r_s <= (others => '0');
    end case;
end process;


    -- resultado
    result <= std_logic_vector(r_s);

    -- flags
    zero    <= '1' when r_s = 0 else '0';
    greater <= '1' when a_s > b_s else '0';
    less    <= '1' when a_s < b_s else '0';
end architecture;
