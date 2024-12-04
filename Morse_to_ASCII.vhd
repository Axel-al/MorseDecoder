library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Morse_to_ASCII is
    Port (
        clk        : in  STD_LOGIC;
        reset      : in  STD_LOGIC;
        morse_in   : in  STD_LOGIC_VECTOR(7 downto 0);
        letter_end : in  STD_LOGIC;  -- Signal de fin de lettre
        ascii_out  : out STD_LOGIC_VECTOR(7 downto 0)  -- Code ASCII en sortie
    );
end Morse_to_ASCII;

architecture Behavioral of Morse_to_ASCII is
begin
    process(clk, reset)
    begin
        if reset = '1' then
            ascii_out <= (others => '0');
        elsif rising_edge(clk) then
            if letter_end = '1' then
                case morse_in is
                    when "1000101" => ascii_out <= X"45"; -- E
                    when "1100101" => ascii_out <= X"65"; -- e

                                -- Chiffres 0 à 9
                    when "1110111011101110111" => ascii_out <= "00110000"; -- '0'
                    when "10111011101110111" => ascii_out <= "00110001"; -- '1'
                    when "101011101110111" => ascii_out <= "00110010"; -- '2'
                    when "1010101110111" => ascii_out <= "00110011"; -- '3'
                    when "10101010111" => ascii_out <= "00110100"; -- '4'
                    when "101010101" => ascii_out <= "00110101"; -- '5'
                    when "11101010101" => ascii_out <= "00110110"; -- '6'
                    when "1110111010101" => ascii_out <= "00110111"; -- '7'
                    when "111011101110101" => ascii_out <= "00111000"; -- '8'
                    when "111011101110111" => ascii_out <= "00111001"; -- '9'
        
                    -- lettres de a - z
                    when "10111"                => ascii_out <= "01000001"; -- A
                    when "111010101"            => ascii_out <= "01000010"; -- B
                    when "11101011101"          => ascii_out <= "01000011"; -- C
                    when "1110101"              => ascii_out <= "01000100"; -- D
                    when "1"                    => ascii_out <= "01000101"; -- E
                    when "101011101"            => ascii_out <= "01000110"; -- F
                    when "111011101"            => ascii_out <= "01000111"; -- G
                    when "1010101"              => ascii_out <= "01001000"; -- H
                    when "101"                  => ascii_out <= "01001001"; -- I
                    when "1011101110111"        => ascii_out <= "01001010"; -- J
                    when "111010111"            => ascii_out <= "01001011"; -- K
                    when "101110101"            => ascii_out <= "01001100"; -- L
                    when "1110111"              => ascii_out <= "01001101"; -- M
                    when "11101"                => ascii_out <= "01001110"; -- N
                    when "11101110111"          => ascii_out <= "01001111"; -- O
                    when "10111011101"          => ascii_out <= "01010000"; -- P
                    when "1110111010111"        => ascii_out <= "01010001"; -- Q
                    when "1011101"              => ascii_out <= "01010010"; -- R
                    when "10101"                => ascii_out <= "01010011"; -- S
                    when "111"                  => ascii_out <= "01010100"; -- T
                    when "1010111"              => ascii_out <= "01010101"; -- U
                    when "101010111"            => ascii_out <= "01010110"; -- V
                    when "101110111"            => ascii_out <= "01010111"; -- W
                    when "11101010111"          => ascii_out <= "01011000"; -- X
                    when "1110101110111"        => ascii_out <= "01011001"; -- Y
                    when "11101110101"          => ascii_out <= "01011010"; -- Z
                    -- Ajouter les autres cas de décodage Morse ici
                    when others => ascii_out <= X"00"; -- Par défaut
                end case;
            end if;
        end if;
    end process;
end Behavioral;
