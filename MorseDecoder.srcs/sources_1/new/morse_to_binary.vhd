library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

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
    signal active_out  : STD_LOGIC := '0';
    signal morse       : STD_LOGIC_VECTOR(0 to 21) := (others => '0');
    signal lbutton_del : STD_LOGIC := '0'; -- Détecteur de transition pour lbutton_i
    signal rbutton_del : STD_LOGIC := '0'; -- Détecteur de transition pour rbutton_i
begin
    process (clk_i, reset_i)
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
            lbutton_del <= lbutton_i;
            rbutton_del <= rbutton_i;

            if active_out = '1' then
                active_cnt := active_cnt + 1;
                if active_cnt = 5 then
                    active_out <= '0';
                    active_cnt := 0;
                    morse <= (others => '0');
                end if;
            else
                -- Détection de transition montante pour lbutton_i
                if (lbutton_i = '1' and lbutton_del = '0') then
                    if count = zcount then -- pour effacer des éventuelles 'espaces' vides au début des inputs
                        count := 0;
                    end if;
                    morse(count) <= '1';
                    zcount := 0;
                    count := count + 1;

                -- Détection de transition montante pour rbutton_i
                elsif (rbutton_i = '1' and rbutton_del = '0') then
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
