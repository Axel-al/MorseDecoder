----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/11/2024 02:52:59 PM
-- Design Name: 
-- Module Name: morse_decoder_top - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity morse_decoder_top is
    Port (
        clk_i           : in STD_LOGIC;
        reset_i         : in STD_LOGIC; -- Ajout du signal reset
        lbutton_i       : in STD_LOGIC; -- Bouton pour point
        rbutton_i       : in STD_LOGIC; -- Bouton pour espace
        lcd_display_o   : out STD_LOGIC_VECTOR(6 downto 0) -- Sortie vers écran LCD 7 segments
    );
end morse_decoder_top;

architecture Behavioral of morse_decoder_top is
    -- Signaux intermédiaires
    signal morse_code   : STD_LOGIC_VECTOR(7 downto 0); -- Code Morse généré
    signal ascii_code   : STD_LOGIC_VECTOR(7 downto 0); -- Code ASCII correspondant
    signal display_data : STD_LOGIC_VECTOR(6 downto 0); -- Données pour affichage
    
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
            morse_i   : in STD_LOGIC_VECTOR(7 downto 0);
            ascii_o  : out STD_LOGIC_VECTOR(7 downto 0)
        );
    end component;

    component ascii_to_display is
        Port (
            clk_i         : in STD_LOGIC;
            reset_i       : in STD_LOGIC;
            ascii_i      : in STD_LOGIC_VECTOR(7 downto 0);
            lcd_display_o   : out STD_LOGIC_VECTOR(6 downto 0)
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
            morse_o => morse_code
        );

    u2: binary_to_ascii
        Port map (
            morse_i  => morse_code,
            ascii_o => ascii_code
        );

    u3: ascii_to_display
        Port map (
            clk_i         => clk_i,
            reset_i       => reset_i,
            ascii_i       => ascii_code,
            lcd_display_o => lcd_display_o
        );
end Behavioral;
