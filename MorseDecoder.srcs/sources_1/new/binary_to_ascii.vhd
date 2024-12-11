library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity binary_to_ascii is
    Port (
        morse_in   : in STD_LOGIC_VECTOR(7 downto 0);
        ascii_out  : out STD_LOGIC_VECTOR(7 downto 0)
    );
end binary_to_ascii;

architecture Behavioral of binary_to_ascii is
begin
    process (morse_in)
    begin
        case morse_in is
            when "101"    => ascii_out <= "01000001"; -- A
            when "111000" => ascii_out <= "01000010"; -- B
            when others    => ascii_out <= "00100000"; -- Default (space)
        end case;
    end process;
end Behavioral;