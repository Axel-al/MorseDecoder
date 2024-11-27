library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ASCII_to_Display is
    Port (
        clk        : in  STD_LOGIC;
        reset      : in  STD_LOGIC;
        ascii_in   : in  STD_LOGIC_VECTOR(7 downto 0);
        display_out : out STD_LOGIC_VECTOR(27 downto 0)  -- 4 caractères, 7 segments chacun
    );
end ASCII_to_Display;

architecture Behavioral of ASCII_to_Display is
    type Display_Array is array (3 downto 0) of STD_LOGIC_VECTOR(7 downto 0);
    signal display_buffer : Display_Array := (others => (others => '0'));

    function ASCII_to_7Seg(ascii : STD_LOGIC_VECTOR(7 downto 0)) return STD_LOGIC_VECTOR is
    begin
        case ascii is
            when X"45" => return "0110000"; -- E
            when X"65" => return "1110001"; -- e
            -- Ajouter les autres mappings ASCII -> 7 segments
            when others => return "0000000"; -- Aucun affichage
        end case;
    end function;
begin
    process(clk, reset)
    begin
        if reset = '1' then
            display_buffer <= (others => (others => '0'));
        elsif rising_edge(clk) then
            -- Défilement
            display_buffer(3) <= display_buffer(2);
            display_buffer(2) <= display_buffer(1);
            display_buffer(1) <= display_buffer(0);
            display_buffer(0) <= ASCII_to_7Seg(ascii_in);
        end if;
    end process;

    display_out <= display_buffer(3) & display_buffer(2) & display_buffer(1) & display_buffer(0);
end Behavioral;
