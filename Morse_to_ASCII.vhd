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
                    -- Ajouter les autres cas de décodage Morse ici
                    when others => ascii_out <= X"00"; -- Par défaut
                end case;
            end if;
        end if;
    end process;
end Behavioral;
