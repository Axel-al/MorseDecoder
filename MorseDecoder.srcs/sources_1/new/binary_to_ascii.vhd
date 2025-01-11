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
    constant morse_table : vector_array := (
        -- Lettres A-Z
        "10111",           -- A : .-
        "111010101",       -- B : -...
        "11101011101",     -- C : -.-.
        "1110101",         -- D : -..
        "1",               -- E : .
        "101011101",       -- F : ..-.
        "111011101",       -- G : --.
        "1010101",         -- H : ....
        "101",             -- I : ..
        "1011101110111",   -- J : .---
        "111010111",       -- K : -.-
        "101110101",       -- L : .-..
        "1110111",         -- M : --
        "11101",           -- N : -.
        "11101110111",     -- O : ---
        "10111011101",     -- P : .--.
        "1110111010111",   -- Q : --.-
        "1011101",         -- R : .-.
        "10101",           -- S : ...
        "111",             -- T : -
        "1010111",         -- U : ..-
        "101010111",       -- V : ...-
        "101110111",       -- W : .--
        "11101010111",     -- X : -..-
        "1110101110111",   -- Y : -.--
        "11101110101",     -- Z : --..
        
        -- Chiffres 0-9
        "1110111011101110111", -- 0 : -----
        "10111011101110111",   -- 1 : .----
        "101011101110111",     -- 2 : ..---
        "1010101110111",       -- 3 : ...--
        "10101010111",         -- 4 : ....-
        "101010101",           -- 5 : .....
        "11101010101",         -- 6 : -....
        "1110111010101",       -- 7 : --...
        "111011101110101",     -- 8 : ---..
        "11101110111011101",   -- 9 : ----.
        
        "0000000000000000000"  -- espace
    );
    constant ascii_table : ascii_array := (
        -- Lettres A-Z
        "01000001", -- A
        "01000010", -- B
        "01000011", -- C
        "01000100", -- D
        "01000101", -- E
        "01000110", -- F
        "01000111", -- G
        "01001000", -- H
        "01001001", -- I
        "01001010", -- J
        "01001011", -- K
        "01001100", -- L
        "01001101", -- M
        "01001110", -- N
        "01001111", -- O
        "01010000", -- P
        "01010001", -- Q
        "01010010", -- R
        "01010011", -- S
        "01010100", -- T
        "01010101", -- U
        "01010110", -- V
        "01010111", -- W
        "01011000", -- X
        "01011001", -- Y
        "01011010", -- Z
        
        -- Chiffres 0-9
        "00110000", -- 0
        "00110001", -- 1
        "00110010", -- 2
        "00110011", -- 3
        "00110100", -- 4
        "00110101", -- 5
        "00110110", -- 6
        "00110111", -- 7
        "00111000", -- 8
        "00111001", -- 9
        
        "00100000" -- espace
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
