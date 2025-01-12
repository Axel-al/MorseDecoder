library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity morse_to_binary is
    Port (
        clk_i     : in STD_LOGIC;
        reset_i   : in STD_LOGIC;
        lbutton_i : in STD_LOGIC;
        rbutton_i : in STD_LOGIC;
        active_o  : out STD_LOGIC;
        morse_o   : out STD_LOGIC_VECTOR(0 to 18)
    );
end morse_to_binary;

architecture Behavioral of morse_to_binary is
    constant COUNTER_MAX : integer := 100000; -- Durée de stabilisation (cycles d'horloge)

    signal active_out  : STD_LOGIC := '0';
    signal morse       : STD_LOGIC_VECTOR(0 to 21) := (others => '0');
    signal lbutton_del : STD_LOGIC := '0'; -- Détecteur de transition pour lbutton_i
    signal rbutton_del : STD_LOGIC := '0'; -- Détecteur de transition pour rbutton_i

    -- Signaux filtrés pour les boutons
    signal lbutton_filtered : STD_LOGIC := '0';
    signal rbutton_filtered : STD_LOGIC := '0';

    -- Compteurs pour le filtre anti-rebond
    signal lbutton_counter  : integer range 0 to COUNTER_MAX := 0;
    signal rbutton_counter  : integer range 0 to COUNTER_MAX := 0;

begin

    -- Processus pour le filtre anti-rebond
    debounce_process : process(clk_i, reset_i)
    begin
        if reset_i = '1' then
            lbutton_filtered <= '0';
            rbutton_filtered <= '0';
            lbutton_counter <= 0;
            rbutton_counter <= 0;
        elsif rising_edge(clk_i) then
            -- Filtrage pour lbutton_i
            if lbutton_i = lbutton_filtered then
                lbutton_counter <= 0; -- Réinitialise le compteur si l'état est stable
            else
                if lbutton_counter < COUNTER_MAX then
                    lbutton_counter <= lbutton_counter + 1;
                else
                    lbutton_filtered <= lbutton_i; -- Met à jour l'état filtré
                    lbutton_counter <= 0;
                end if;
            end if;

            -- Filtrage pour rbutton_i
            if rbutton_i = rbutton_filtered then
                rbutton_counter <= 0; -- Réinitialise le compteur si l'état est stable
            else
                if rbutton_counter < COUNTER_MAX then
                    rbutton_counter <= rbutton_counter + 1;
                else
                    rbutton_filtered <= rbutton_i; -- Met à jour l'état filtré
                    rbutton_counter <= 0;
                end if;
            end if;
        end if;
    end process;

    -- Processus principal
    process(clk_i, reset_i)
        variable count      : integer range 0 to 22 := 0;
        variable zcount     : integer range 0 to 3 := 0;
        variable active_cnt : integer range 0 to 5 := 0;
    begin
        if reset_i = '1' then
            morse <= (others => '0');
            count := 0;
            zcount := 0;
            active_cnt := 0;
            active_out <= '0';
            lbutton_del <= '0';
            rbutton_del <= '0';
        elsif rising_edge(clk_i) then
            -- Mettre à jour les signaux retardés
            lbutton_del <= lbutton_filtered;
            rbutton_del <= rbutton_filtered;

            if active_out = '1' then
                active_cnt := active_cnt + 1;
                if active_cnt = 5 then
                    active_out <= '0';
                    active_cnt := 0;
                    morse <= (others => '0');
                end if;
            else
                -- Détection de transition montante pour lbutton_filtered
                if (lbutton_filtered = '1' and lbutton_del = '0') then
                    if count = zcount then -- Pour effacer des éventuelles 'espaces' vides au début des inputs
                        count := 0;
                    end if;
                    morse(count) <= '1';
                    zcount := 0;
                    count := count + 1;

                -- Détection de transition montante pour rbutton_filtered
                elsif (rbutton_filtered = '1' and rbutton_del = '0') then
                    morse(count) <= '0';
                    count := count + 1;
                    zcount := zcount + 1;
                end if;

                if (count = 22) or (zcount = 3) then
                    count := 0;
                    zcount := 0;
                    active_cnt := 0;
                    active_out <= '1';
                end if;
            end if;
        end if;
    end process;

    morse_o <= morse(0 to 18) when active_out = '1' else (others => '0');
    active_o <= active_out;

end Behavioral;
