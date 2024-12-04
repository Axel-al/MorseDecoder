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
            
            when X"41" => return "1110111"; -- A
            when X"42" => return "0011111"; -- b
            when X"43" => return "1001110"; -- C
            when X"44" => return "0111101"; --d
            when X"45" => return "1001111"; --E
            when X"46" => return "1000111"; --F
            when X"47" => return "1011110"; --G
            when X"48" => return "0010111"; --h
            when X"49" => return "0010000"; --i
            when X"4A" => return "0111100"; --J
            when X"4B" => return "1010111"; --K
            when X"4C" => return "0001110"; --L
            when X"4D" => return "1010101"; --M
            when X"4E" => return "0010101"; --n
            when X"4F" => return "0011101"; --o
            when X"50" => return "1100111"; --P
            when X"51" => return "1110011"; --q
            when X"52" => return "0000101"; --r
            when X"53" => return "1011010"; --S
            when X"54" => return "0001111"; --t
            when X"55" => return "0111110"; --U
            when X"56" => return "0101010"; --v
            when X"57" => return "0101011"; --W
            when X"58" => return "0110111"; --X
            when X"59" => return "0111011"; --y
            when X"5A" => return "1101100"; --Z
            when X"31" => return "0110000"; --1
            when X"32" => return "1101101"; --2
            when X"33" => return "1111001"; --3
            when X"34" => return "0110011"; --4
            when X"35" => return "1011011"; --5
            when X"36" => return "1011111"; --6
            when X"37" => return "1110000"; --7
            when X"38" => return "1111111"; --8
            when X"39" => return "1111011"; --9
            when X"30" => return "1111110"; --0

            -- Ajouter toutes les correspondances ASCII -> 7 segments
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
