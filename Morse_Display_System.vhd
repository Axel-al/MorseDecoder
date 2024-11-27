library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Morse_Display_System is
    Port (
        clk       : in  STD_LOGIC;
        reset     : in  STD_LOGIC;
        button1   : in  STD_LOGIC;
        button2   : in  STD_LOGIC;
        display   : out STD_LOGIC_VECTOR(27 downto 0)
    );
end Morse_Display_System;

architecture Structural of Morse_Display_System is
    signal morse_out : STD_LOGIC_VECTOR(7 downto 0);
    signal letter_end : STD_LOGIC;
    signal ascii_out : STD_LOGIC_VECTOR(7 downto 0);
begin
    u1: entity work.Input_to_Morse
        port map (
            clk => clk,
            reset => reset,
            button1 => button1,
            button2 => button2,
            morse_out => morse_out,
            letter_end => letter_end
        );

    u2: entity work.Morse_to_ASCII
        port map (
            clk => clk,
            reset => reset,
            morse_in => morse_out,
            letter_end => letter_end,
            ascii_out => ascii_out
        );

    u3: entity work.ASCII_to_Display
        port map (
            clk => clk,
            reset => reset,
            ascii_in => ascii_out,
            display_out => display
        );
end Structural;
