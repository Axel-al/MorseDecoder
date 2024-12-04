library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Input_to_Morse is
    Port (
        clk       : in  STD_LOGIC;
        reset     : in  STD_LOGIC;
        button1   : in  STD_LOGIC;
        button2   : in  STD_LOGIC;
        morse_out : out STD_LOGIC_VECTOR(7 downto 0);
        letter_end : out STD_LOGIC
    ); -- Déclaration des ports d'entrée et de sortie
end Input_to_Morse;

architecture Behavioral of Input_to_Morse is
    signal bit_stream : STD_LOGIC_VECTOR(7 downto 0) := (others => '0'); -- Signal interne pour stocker le flux binaire généré
    signal count      : integer := 0; -- Compteur pour suivre la position actuelle dans bit_stream
    signal zero_count : integer := 0; -- Compteur pour détecter trois '0' consécutifs
begin
    process(clk, reset)
    begin
        if reset = '1' then -- Réinitialisation complète lorsque le signal de reset est activé
            bit_stream <= (others => '0');
            count <= 0;
            zero_count <= 0;
            letter_end <= '0';
        elsif rising_edge(clk) then -- Action au front montant de l'horloge
            if button1 = '1' then
                bit_stream(count) <= '1';
                count <= count + 1;
                zero_count <= 0;
            elsif button2 = '1' then
                bit_stream(count) <= '0';
                count <= count + 1;
                zero_count <= zero_count + 1;
            end if;

            if zero_count = 3 then -- Détection de trois zéros consécutifs pour indiquer la fin d'une lettre
                letter_end <= '1';
                count <= 0;
            else
                letter_end <= '0';
            end if;
        end if;
    end process;

    morse_out <= bit_stream; -- Sortie du flux binaire généré
end Behavioral;
