library IEEE; -- Importation de la bibliothèque IEEE
use IEEE.STD_LOGIC_1164.ALL; -- Utilisation des définitions de STD_LOGIC et STD_LOGIC_VECTOR

entity Input_to_Morse is
    Port (
        clk       : in  STD_LOGIC; -- Entrée d'horloge pour synchroniser les opérations
        reset     : in  STD_LOGIC; -- Entrée de réinitialisation pour remettre le circuit à l'état initial
        button1   : in  STD_LOGIC;  -- Bouton 1 pour représenter un '1' en binaire
        button2   : in  STD_LOGIC;  -- Bouton 2 pour représenter un '0' en binaire
        morse_out : out STD_LOGIC_VECTOR(7 downto 0); -- Sortie du flux binaire en code Morse (max 8 bits par lettre)
        letter_end : out STD_LOGIC  -- Signal de sortie pour indiquer la fin d'une lettre
    );
end Input_to_Morse;

architecture Behavioral of Input_to_Morse is
    signal bit_stream : STD_LOGIC_VECTOR(7 downto 0) := (others => '0'); -- Signal interne pour stocker le flux binaire généré
    signal count      : integer := 0; -- Compteur pour suivre la position actuelle dans bit_stream
    signal zero_count : integer := 0; -- Compteur pour détecter trois '0' consécutifs
begin
    process(clk, reset)
    begin
        if reset = '1' then -- Vérification du signal de réinitialisation
            bit_stream <= (others => '0'); -- Réinitialisation du flux binaire à zéro
            count <= 0; -- Réinitialisation du compteur à zéro
            zero_count <= 0; -- Réinitialisation du compteur de zéros à zéro
            letter_end <= '0'; -- Réinitialisation du signal de fin de lettre à zéro
        elsif rising_edge(clk) then -- Détection du front montant de l'horloge
            if button1 = '1' then -- Vérification si le bouton 1 est pressé
                bit_stream(count) <= '1'; -- Enregistrement d'un '1' à la position actuelle dans bit_stream
                count <= count + 1; -- Incrémentation du compteur pour passer à la prochaine position
                zero_count <= 0; -- Réinitialisation du compteur de zéros car un '1' a été enregistré
            elsif button2 = '1' then -- Vérification si le bouton 2 est pressé
                bit_stream(count) <= '0'; -- Enregistrement d'un '0' à la position actuelle dans bit_stream
                count <= count + 1; -- Incrémentation du compteur pour passer à la prochaine position
                zero_count <= zero_count + 1; -- Incrémentation du compteur de zéros
            end if;

            if zero_count = 3 then -- Vérification si trois zéros consécutifs ont été détectés
                letter_end <= '1'; -- Indication de la fin d'une lettre
                count <= 0; -- Réinitialisation du compteur pour la prochaine lettre
            else
                letter_end <= '0'; -- Réinitialisation du signal de fin de lettre si condition non remplie
            end if;
        end if;
    end process;

    morse_out <= bit_stream; -- Affectation du flux binaire à la sortie morse_out
end Behavioral;
