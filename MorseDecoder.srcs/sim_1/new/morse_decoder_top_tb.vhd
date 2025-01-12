library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity morse_decoder_top_tb is
end morse_decoder_top_tb;

architecture Behavioral of morse_decoder_top_tb is
    -- Composant à tester
    component morse_decoder_top is
        Port (
            clk_i         : in STD_LOGIC;
            reset_i       : in STD_LOGIC;
            lbutton_i     : in STD_LOGIC;
            rbutton_i     : in STD_LOGIC;
            seg_display_o : out STD_LOGIC_VECTOR(6 downto 0); -- Sortie de l'afficheur 7 segments
            char_n_o      : out STD_LOGIC_VECTOR(3 downto 0) -- Sortie pour le numéro du caractère
        );
    end component;

    -- Signaux internes
    signal clk_i         : STD_LOGIC := '0';
    signal reset_i       : STD_LOGIC := '0';
    signal lbutton_i     : STD_LOGIC := '0';
    signal rbutton_i     : STD_LOGIC := '0';
    signal seg_display_o : STD_LOGIC_VECTOR(6 downto 0);
    signal char_n_o      : STD_LOGIC_VECTOR(3 downto 0);

    constant CLK_PERIOD : time := 10 ns;

begin
    -- Instanciation du module à tester
    uut: morse_decoder_top
        Port map (
            clk_i         => clk_i,
            reset_i       => reset_i,
            lbutton_i     => lbutton_i,
            rbutton_i     => rbutton_i,
            seg_display_o => seg_display_o,
            char_n_o      => char_n_o
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
        -- point
        lbutton_i <= '1';
        wait for CLK_PERIOD * 3; -- Point
        lbutton_i <= '0';
        wait for CLK_PERIOD * 3; -- Pause
        
        -- impultion suivante
        rbutton_i <= '1';
        wait for CLK_PERIOD * 3; -- impultion suivante
        rbutton_i <= '0';
        wait for CLK_PERIOD * 3; -- Pause
        
        -- tiret
        lbutton_i <= '1';
        wait for CLK_PERIOD * 3; -- Point
        lbutton_i <= '0';
        wait for CLK_PERIOD * 3; -- Pause
        lbutton_i <= '1';
        wait for CLK_PERIOD * 3; -- Point
        lbutton_i <= '0';
        wait for CLK_PERIOD * 3; -- Pause
        lbutton_i <= '1';
        wait for CLK_PERIOD * 3; -- Point
        lbutton_i <= '0';
        wait for CLK_PERIOD * 3; -- Pause
        
        -- Envoi de espace
        -- lettre suivante
        rbutton_i <= '1';
        wait for CLK_PERIOD * 3; -- impultion suivante
        rbutton_i <= '0';
        wait for CLK_PERIOD * 3; -- Pause
        rbutton_i <= '1';
        wait for CLK_PERIOD * 3; -- impultion suivante
        rbutton_i <= '0';
        wait for CLK_PERIOD * 3; -- Pause
        rbutton_i <= '1';
        wait for CLK_PERIOD * 3; -- impultion suivante
        rbutton_i <= '0';
        wait for CLK_PERIOD * 3; -- Pause
        
        -- lettre suivante
        rbutton_i <= '1';
        wait for CLK_PERIOD * 3; -- impultion suivante
        rbutton_i <= '0';
        wait for CLK_PERIOD * 3; -- Pause
        rbutton_i <= '1';
        wait for CLK_PERIOD * 3; -- impultion suivante
        rbutton_i <= '0';
        wait for CLK_PERIOD * 3; -- Pause
        rbutton_i <= '1';
        wait for CLK_PERIOD * 3; -- impultion suivante
        rbutton_i <= '0';
        wait for CLK_PERIOD * 3; -- Pause
        
        rbutton_i <= '1';
        wait for CLK_PERIOD * 3; -- impultion suivante
        rbutton_i <= '0';
        wait for CLK_PERIOD * 3; -- Pause
        
        
        -- Envoie de 0
        -- tiret
        lbutton_i <= '1';
        wait for CLK_PERIOD * 3; -- Point
        lbutton_i <= '0';
        wait for CLK_PERIOD * 3; -- Pause
        lbutton_i <= '1';
        wait for CLK_PERIOD * 3; -- Point
        lbutton_i <= '0';
        wait for CLK_PERIOD * 3; -- Pause
        lbutton_i <= '1';
        wait for CLK_PERIOD * 3; -- Point
        lbutton_i <= '0';
        wait for CLK_PERIOD * 3; -- Pause
        
        -- impultion suivante
        rbutton_i <= '1';
        wait for CLK_PERIOD * 3; -- impultion suivante
        rbutton_i <= '0';
        wait for CLK_PERIOD * 3; -- Pause
        
        -- tiret
        lbutton_i <= '1';
        wait for CLK_PERIOD * 3; -- Point
        lbutton_i <= '0';
        wait for CLK_PERIOD * 3; -- Pause
        lbutton_i <= '1';
        wait for CLK_PERIOD * 3; -- Point
        lbutton_i <= '0';
        wait for CLK_PERIOD * 3; -- Pause
        lbutton_i <= '1';
        wait for CLK_PERIOD * 3; -- Point
        lbutton_i <= '0';
        wait for CLK_PERIOD * 3; -- Pause
        
        -- impultion suivante
        rbutton_i <= '1';
        wait for CLK_PERIOD * 3; -- impultion suivante
        rbutton_i <= '0';
        wait for CLK_PERIOD * 3; -- Pause
        
        -- tiret
        lbutton_i <= '1';
        wait for CLK_PERIOD * 3; -- Point
        lbutton_i <= '0';
        wait for CLK_PERIOD * 3; -- Pause
        lbutton_i <= '1';
        wait for CLK_PERIOD * 3; -- Point
        lbutton_i <= '0';
        wait for CLK_PERIOD * 3; -- Pause
        lbutton_i <= '1';
        wait for CLK_PERIOD * 3; -- Point
        lbutton_i <= '0';
        wait for CLK_PERIOD * 3; -- Pause
        
        -- impultion suivante
        rbutton_i <= '1';
        wait for CLK_PERIOD * 3; -- impultion suivante
        rbutton_i <= '0';
        wait for CLK_PERIOD * 3; -- Pause
        
        -- tiret
        lbutton_i <= '1';
        wait for CLK_PERIOD * 3; -- Point
        lbutton_i <= '0';
        wait for CLK_PERIOD * 3; -- Pause
        lbutton_i <= '1';
        wait for CLK_PERIOD * 3; -- Point
        lbutton_i <= '0';
        wait for CLK_PERIOD * 3; -- Pause
        lbutton_i <= '1';
        wait for CLK_PERIOD * 3; -- Point
        lbutton_i <= '0';
        wait for CLK_PERIOD * 3; -- Pause
        
        -- impultion suivante
        rbutton_i <= '1';
        wait for CLK_PERIOD * 3; -- impultion suivante
        rbutton_i <= '0';
        wait for CLK_PERIOD * 3; -- Pause
        
        -- point
        lbutton_i <= '1';
        wait for CLK_PERIOD * 3; -- Point
        lbutton_i <= '0';
        wait for CLK_PERIOD * 3; -- Pause
        
        -- lettre suivante
        rbutton_i <= '1';
        wait for CLK_PERIOD * 3; -- impultion suivante
        rbutton_i <= '0';
        wait for CLK_PERIOD * 3; -- Pause
        rbutton_i <= '1';
        wait for CLK_PERIOD * 3; -- impultion suivante
        rbutton_i <= '0';
        wait for CLK_PERIOD * 3; -- Pause
        rbutton_i <= '1';
        wait for CLK_PERIOD * 3; -- impultion suivante
        rbutton_i <= '0';
        wait for CLK_PERIOD * 3; -- Pause
        
        wait;
    end process;

end Behavioral;
