library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity ascii_to_display is
    Port (
        clk           : in STD_LOGIC;
        reset         : in STD_LOGIC;
        ascii_in      : in STD_LOGIC_VECTOR(7 downto 0);
        lcd_display   : out STD_LOGIC_VECTOR(6 downto 0)
    );
end ascii_to_display;

architecture Behavioral of ascii_to_display is
    type display_array is array (0 to 15) of STD_LOGIC_VECTOR(6 downto 0);
    signal display_buffer : display_array := (others => (others => '0'));
    signal index          : integer range 0 to 15 := 0;

begin
    process (clk, reset)
    begin
        if reset = '1' then
            display_buffer <= (others => (others => '0'));
            index <= 0;
        elsif rising_edge(clk) then
            display_buffer(index) <= ascii_in(6 downto 0);
            index <= index + 1;
            if index = 15 then
                index <= 0;
            end if;
        end if;
    end process;
    lcd_display <= display_buffer(0); -- Affiche le premier caractère
end Behavioral;