library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity morse_to_binary is
    Port (
        clk_i     : in STD_LOGIC;
        reset_i   : in STD_LOGIC;
        lbutton_i : in STD_LOGIC;
        rbutton_i : in STD_LOGIC;
        morse_o   : out STD_LOGIC_VECTOR(7 downto 0)
    );
end morse_to_binary;

architecture Behavioral of morse_to_binary is
    signal morse : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    signal count : integer := 0;

begin
    process (clk_i, reset_i)
    begin
        if reset_i = '1' then
            morse <= (others => '0');
            count <= 0;
        elsif rising_edge(clk_i) then
            if lbutton_i = '1' then
                morse(count) <= '1';
                count <= count + 1;
            elsif rbutton_i = '1' then
                morse(count) <= '0';
                count <= count + 1;
            end if;

            if count = 7 then -- Réinitialisation après 8 bits
                count <= 0;
            end if;
        end if;
    end process;
    morse_o <= morse;
end Behavioral;