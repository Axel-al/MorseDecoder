library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity morse_decoder_top is
    Port (
        clk_i        : in STD_LOGIC;
        reset_i      : in STD_LOGIC;
        lbutton_i    : in STD_LOGIC;
        rbutton_i    : in STD_LOGIC;
        ascii_o      : out STD_LOGIC_VECTOR(7 downto 0); -- Code ASCII de la lettre ou chiffre
        new_letter_o : out STD_LOGIC -- Signal indiquant qu'une nouvelle lettre a été décodée
    );
end morse_decoder_top;

architecture Behavioral of morse_decoder_top is
    -- Signaux intermédiaires
    signal morse_code     : STD_LOGIC_VECTOR(0 to 18); -- Code Morse généré
    signal active_morse_o : STD_LOGIC; -- Code qui correspond à l'envoie d'une nouvelle lettre en code morse
    
    -- Composants
    component morse_to_binary is
        Port (
            clk_i     : in STD_LOGIC;
            reset_i   : in STD_LOGIC;
            lbutton_i : in STD_LOGIC;
            rbutton_i : in STD_LOGIC;
            active_o  : out STD_LOGIC;
            morse_o   : out STD_LOGIC_VECTOR(0 to 18)
        );
    end component;

    component binary_to_ascii is
        Port (
            clk_i        : in STD_LOGIC;
            reset_i      : in STD_LOGIC;
            morse_i      : in STD_LOGIC_VECTOR(0 to 18); -- Signal Morse reçu (jusqu'à 19 bits)
            active_i     : in STD_LOGIC; -- Indique si le signal Morse est valide
            ascii_o      : out STD_LOGIC_VECTOR(7 downto 0); -- Code ASCII de la lettre ou chiffre
            new_letter_o : out STD_LOGIC -- Signal indiquant qu'une nouvelle lettre a été décodée
        );
    end component;
    
begin
    -- Instanciation des composants
    u1: morse_to_binary
        Port map (
            clk_i     => clk_i,
            reset_i   => reset_i,
            lbutton_i => lbutton_i,
            rbutton_i => rbutton_i,
            active_o  => active_morse_o,
            morse_o   => morse_code
        );

    u2: binary_to_ascii
        Port map (
            clk_i        => clk_i,
            reset_i      => reset_i,
            morse_i      => morse_code,
            active_i     => active_morse_o,
            ascii_o      => ascii_o,
            new_letter_o => new_letter_o
        );
end Behavioral;
