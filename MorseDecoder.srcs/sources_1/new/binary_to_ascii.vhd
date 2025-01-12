library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity binary_to_ascii is
    Port (
        clk_i        : in STD_LOGIC;
        reset_i      : in STD_LOGIC;
        morse_i      : in STD_LOGIC_VECTOR(0 to 18); -- Signal Morse reçu (jusqu'à 19 bits)
        active_i     : in STD_LOGIC; -- Indique si le signal Morse est valide
        ascii_o      : out STD_LOGIC_VECTOR(7 downto 0); -- Code ASCII de la lettre ou chiffre
        new_letter_o : out STD_LOGIC -- Signal indiquant qu'une nouvelle lettre a été décodée
    );
end binary_to_ascii;

architecture Behavioral of binary_to_ascii is
    type vector_array is array (0 to 36) of STD_LOGIC_VECTOR(0 to 18); -- Tableau des séquences Morse
    type ascii_array is array (0 to 36) of STD_LOGIC_VECTOR(7 downto 0); -- Tableau des codes ASCII
    -- Tableau par orde décroissant par longueur
    constant morse_table : vector_array := (
        "0000000000000000000", -- espace
        "1110111011101110111", -- 0 : -----
        "1011101110111011100", -- 1 : .----
        "1110111011101110100", -- 9 : ----.
        "1010111011101110000", -- 2 : ..---
        "1110111011101010000", -- 8 : ---..
        "1010101110111000000", -- 3 : ...--
        "1110111010101000000", -- 7 : --...
        "1011101110111000000", -- J : .---
        "1110111010111000000", -- Q : --.-
        "1110101110111000000", -- Y : -.--
        "1010101011100000000", -- 4 : ....-
        "1110101010100000000", -- 6 : -....
        "1110101110100000000", -- C : -.-.
        "1110111011100000000", -- O : ---
        "1011101110100000000", -- P : .--.
        "1110101011100000000", -- X : -..-
        "1110111010100000000", -- Z : --..
        "1010101010000000000", -- 5 : .....
        "1110101010000000000", -- B : -...
        "1010111010000000000", -- F : ..-.
        "1110111010000000000", -- G : --.
        "1110101110000000000", -- K : -.-
        "1011101010000000000", -- L : .-..
        "1010101110000000000", -- V : ...-
        "1011101110000000000", -- W : .--
        "1110101000000000000", -- D : -..
        "1010101000000000000", -- H : ....
        "1110111000000000000", -- M : --
        "1011101000000000000", -- R : .-.
        "1010111000000000000", -- U : ..-
        "1011100000000000000", -- A : .-
        "1110100000000000000", -- N : -.
        "1010100000000000000", -- S : ...
        "1010000000000000000", -- I : ..
        "1110000000000000000", -- T : -
        "1000000000000000000"  -- E : .
    );
    -- tableau pour que les symboles précédents soit correspondant au niveau des indices
    constant ascii_table : ascii_array := (
        "00100000", -- espace
        "00110000", -- 0
        "00110001", -- 1
        "00111001", -- 9
        "00110010", -- 2
        "00111000", -- 8
        "00110011", -- 3
        "00110111", -- 7
        "01001010", -- J
        "01010001", -- Q
        "01011001", -- Y
        "00110100", -- 4
        "00110110", -- 6
        "01000011", -- C
        "01001111", -- O
        "01010000", -- P
        "01011000", -- X
        "01011010", -- Z
        "00110101", -- 5
        "01000010", -- B
        "01000110", -- F
        "01000111", -- G
        "01001011", -- K
        "01001100", -- L
        "01010110", -- V
        "01010111", -- W
        "01000100", -- D
        "01001000", -- H
        "01001101", -- M
        "01010010", -- R
        "01010101", -- U
        "01000001", -- A
        "01001110", -- N
        "01010011", -- S
        "01001001", -- I
        "01010100", -- T
        "01000101"  -- E
    );

    signal ascii_reg : STD_LOGIC_VECTOR(7 downto 0) := "00100000"; -- Registre pour stocker le code ASCII
    signal new_letter_reg : STD_LOGIC := '0'; -- Registre pour suivre l'état de la nouvelle lettre

begin
    process(clk_i, reset_i)
    begin
        if reset_i = '1' then
            ascii_reg <= "00100000"; -- Réinitialisation (espace par défaut)
            new_letter_reg <= '0'; -- Aucune nouvelle lettre
        elsif rising_edge(clk_i) then
            if active_i = '1' then
                -- Comparaison avec la table Morse
                for i in morse_table'range loop
                    if morse_i = morse_table(i) then
                        ascii_reg <= ascii_table(i); -- Stocker le code ASCII correspondant
                        new_letter_reg <= '1'; -- Nouvelle lettre valide reçue
                        exit;
                    end if;
                end loop;
            else
                ascii_reg <= "00100000"; -- Espace par défaut si 'active_i = 0'
                new_letter_reg <= '0';   -- Aucun caractère valide en cours
            end if;
        end if;
    end process;

    ascii_o <= ascii_reg;
    new_letter_o <= new_letter_reg; -- Sortie pour indiquer qu'une nouvelle lettre a été reçue
end Behavioral;
