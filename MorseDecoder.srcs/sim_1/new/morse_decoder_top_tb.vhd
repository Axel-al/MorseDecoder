library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity morse_decoder_top_tb is
end morse_decoder_top_tb;

architecture Behavioral of morse_decoder_top_tb is
    -- Composant à tester
    component morse_decoder_top is
        Port (
            clk_i        : in STD_LOGIC;
            reset_i      : in STD_LOGIC;
            lbutton_i    : in STD_LOGIC;
            rbutton_i    : in STD_LOGIC;
            ascii_o      : out STD_LOGIC_VECTOR(7 downto 0);
            new_letter_o : out STD_LOGIC
        );
    end component;

    -- Signaux internes
    signal clk_i        : STD_LOGIC := '0';
    signal reset_i      : STD_LOGIC := '0';
    signal lbutton_i    : STD_LOGIC := '0';
    signal rbutton_i    : STD_LOGIC := '0';
    signal ascii_o      : STD_LOGIC_VECTOR(7 downto 0);
    signal new_letter_o : STD_LOGIC;

    constant CLK_PERIOD : time := 10 ns;

begin
    -- Instanciation du module à tester
    uut: morse_decoder_top
        Port map (
            clk_i        => clk_i,
            reset_i      => reset_i,
            lbutton_i    => lbutton_i,
            rbutton_i    => rbutton_i,
            ascii_o      => ascii_o,
            new_letter_o => new_letter_o
        );

    -- Génération de l'horloge
    clk_process : process
    begin
        while true loop
            clk_i <= '0';
            wait for CLK_PERIOD / 2;
            clk_i <= '1';
            wait for CLK_PERIOD / 2;
        end loop;
    end process;

    -- Simulation des entrées
    stimulus_process : process
    begin
        -- Initialisation
        reset_i <= '1';
        wait for CLK_PERIOD * 5;
        reset_i <= '0';

        -- Envoi de la lettre A (.- en Morse)
        lbutton_i <= '1'; -- Point
        wait for CLK_PERIOD * 3;
        lbutton_i <= '0';
        wait for CLK_PERIOD * 3;

        rbutton_i <= '1'; -- Pause
        wait for CLK_PERIOD * 3;
        rbutton_i <= '0';
        wait for CLK_PERIOD * 3;

        lbutton_i <= '1'; -- Tiret
        wait for CLK_PERIOD * 9;
        lbutton_i <= '0';
        wait for CLK_PERIOD * 3;

        -- Pause avant la lettre suivante
        wait for CLK_PERIOD * 10;

        -- Envoi de la lettre B (-... en Morse)
        lbutton_i <= '1'; -- Tiret
        wait for CLK_PERIOD * 9;
        lbutton_i <= '0';
        wait for CLK_PERIOD * 3;

        rbutton_i <= '1'; -- Pause
        wait for CLK_PERIOD * 3;
        rbutton_i <= '0';
        wait for CLK_PERIOD * 3;

        lbutton_i <= '1'; -- Point
        wait for CLK_PERIOD * 3;
        lbutton_i <= '0';
        wait for CLK_PERIOD * 3;

        rbutton_i <= '1'; -- Pause
        wait for CLK_PERIOD * 3;
        rbutton_i <= '0';
        wait for CLK_PERIOD * 3;

        lbutton_i <= '1'; -- Point
        wait for CLK_PERIOD * 3;
        lbutton_i <= '0';
        wait for CLK_PERIOD * 3;

        rbutton_i <= '1'; -- Pause
        wait for CLK_PERIOD * 3;
        rbutton_i <= '0';
        wait for CLK_PERIOD * 3;

        lbutton_i <= '1'; -- Point
        wait for CLK_PERIOD * 3;
        lbutton_i <= '0';
        wait for CLK_PERIOD * 3;

        -- Pause avant la fin de la simulation
        wait for CLK_PERIOD * 20;
        wait;
    end process;

end Behavioral;
