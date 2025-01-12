library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ascii_to_display is
    Port (
        clk_i         : in  STD_LOGIC;
        reset_i       : in  STD_LOGIC;
        ascii_i       : in  STD_LOGIC_VECTOR(7 downto 0); -- Entrée ASCII
        new_letter_i  : in  STD_LOGIC; -- Signal indiquant une nouvelle lettre
        seg_display_o : out STD_LOGIC_VECTOR(6 downto 0); -- Sortie pour l'afficheur 7 segments
        char_n_o      : out STD_LOGIC_VECTOR(3 downto 0) -- Signal pour sélectionner le caractère actif
    );
end ascii_to_display;

architecture Behavioral of ascii_to_display is
    constant NB_DIGITS : integer := 4; -- Nombre de chiffres/lettres sur l'écran

    -- Signaux internes
    type Display_Array is array (3 downto 0) of STD_LOGIC_VECTOR(6 downto 0);
    signal display_buffer : Display_Array := (others => (others => '1')); -- Buffer pour les caractères
    signal refresh_counter : integer range 0 to 100000 := 0; -- Compteur pour rafraîchissement
    signal digit_select : integer range 0 to NB_DIGITS - 1 := 0; -- Sélection du digit actif
    signal new_letter_i_prev : STD_LOGIC := '0';

    -- LUT pour convertir ASCII en segments
    function ASCII_to_7Seg(ascii : STD_LOGIC_VECTOR(7 downto 0)) return STD_LOGIC_VECTOR is
    begin
        case ascii is
            when X"41" => return "0001000"; -- A
            when X"42" => return "0000011"; -- b
            when X"43" => return "1000110"; -- C
            when X"44" => return "0100001"; -- d
            when X"45" => return "0000110"; -- E
            when X"46" => return "0001110"; -- F
            when X"47" => return "1000010"; -- G
            when X"48" => return "0001011"; -- h
            when X"49" => return "1111011"; -- i
            when X"4A" => return "1100001"; -- J
            when X"4B" => return "0001010"; -- K
            when X"4C" => return "1000111"; -- L
            when X"4D" => return "0101010"; -- M
            when X"4E" => return "0101011"; -- n
            when X"4F" => return "0100011"; -- o
            when X"50" => return "0001100"; -- P
            when X"51" => return "0011000"; -- q
            when X"52" => return "0101111"; -- r
            when X"53" => return "1010010"; -- S
            when X"54" => return "0000111"; -- t
            when X"55" => return "1000001"; -- U
            when X"56" => return "1100011"; -- v
            when X"57" => return "0010101"; -- W
            when X"58" => return "0001001"; -- X
            when X"59" => return "0010001"; -- y
            when X"5A" => return "1100100"; -- Z
            when X"30" => return "1000000"; -- 0
            when X"31" => return "1111001"; -- 1
            when X"32" => return "0100100"; -- 2
            when X"33" => return "0110000"; -- 3
            when X"34" => return "0011001"; -- 4
            when X"35" => return "0010010"; -- 5
            when X"36" => return "0000010"; -- 6
            when X"37" => return "1111000"; -- 7
            when X"38" => return "0000000"; -- 8
            when X"39" => return "0010000"; -- 9
            when others => return "1111111"; -- Éteint
        end case;
    end function;

begin
    -- Gestion du rafraîchissement de l'écran
    process(clk_i, reset_i)
    begin
        if reset_i = '1' then
            refresh_counter <= 0;
            digit_select <= 0;
        elsif rising_edge(clk_i) then
            if refresh_counter = 100000 then
                refresh_counter <= 0;
                digit_select <= (digit_select + 1) mod NB_DIGITS;
            else
                refresh_counter <= refresh_counter + 1;
            end if;
        end if;
    end process;

    -- Gestion des nouveaux caractères
    process(clk_i, reset_i)
    begin
        if reset_i = '1' then
            display_buffer <= (others => (others => '1'));
            new_letter_i_prev <= '0';
        elsif rising_edge(clk_i) then
            if (new_letter_i = '1' and new_letter_i_prev = '0') then
                display_buffer(3) <= display_buffer(2);
                display_buffer(2) <= display_buffer(1);
                display_buffer(1) <= display_buffer(0);
                display_buffer(0) <= ASCII_to_7Seg(ascii_i);
            end if;
            -- Mémorisation de l'état précédent de new_letter_i
            new_letter_i_prev <= new_letter_i;
        end if;
    end process;

    -- Sortie des segments et activation des digits
    seg_display_o <= display_buffer(digit_select);
    char_n_o <= "0111" when digit_select = 0 else
                "1011" when digit_select = 1 else
                "1101" when digit_select = 2 else
                "1110";

end Behavioral;
