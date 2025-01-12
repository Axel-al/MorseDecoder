-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.1.3 (lin64) Build 2644227 Wed Sep  4 09:44:18 MDT 2019
-- Date        : Sat Jan 11 23:52:02 2025
-- Host        : axel-GL62M-7RDX running 64-bit Ubuntu 22.04.5 LTS
-- Command     : write_vhdl -mode funcsim -nolib -force -file
--               /home/axel/Documents/Vivado/CoCiNum/MorseDecoder/MorseDecoder.sim/sim_1/impl/func/xsim/morse_decoder_top_tb_func_impl.vhd
-- Design      : morse_decoder_top
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a35tcpg236-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity ascii_to_display is
  port (
    seg_display_o_OBUF : out STD_LOGIC_VECTOR ( 6 downto 0 );
    char_n_o_OBUF : out STD_LOGIC_VECTOR ( 3 downto 0 );
    CLK : in STD_LOGIC;
    AR : in STD_LOGIC_VECTOR ( 0 to 0 );
    Q : in STD_LOGIC_VECTOR ( 6 downto 0 );
    E : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end ascii_to_display;

architecture STRUCTURE of ascii_to_display is
  signal ASCII_to_7Seg : STD_LOGIC_VECTOR ( 0 to 6 );
  signal data0 : STD_LOGIC_VECTOR ( 19 downto 1 );
  signal digit_select : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \digit_select[0]_i_1_n_0\ : STD_LOGIC;
  signal \digit_select[1]_i_1_n_0\ : STD_LOGIC;
  signal \display_buffer[0][0]_i_2_n_0\ : STD_LOGIC;
  signal \display_buffer[0][0]_i_3_n_0\ : STD_LOGIC;
  signal \display_buffer[0][1]_i_2_n_0\ : STD_LOGIC;
  signal \display_buffer[0][1]_i_3_n_0\ : STD_LOGIC;
  signal \display_buffer[0][2]_i_2_n_0\ : STD_LOGIC;
  signal \display_buffer[0][2]_i_3_n_0\ : STD_LOGIC;
  signal \display_buffer[0][3]_i_2_n_0\ : STD_LOGIC;
  signal \display_buffer[0][3]_i_3_n_0\ : STD_LOGIC;
  signal \display_buffer[0][4]_i_2_n_0\ : STD_LOGIC;
  signal \display_buffer[0][4]_i_3_n_0\ : STD_LOGIC;
  signal \display_buffer[0][5]_i_2_n_0\ : STD_LOGIC;
  signal \display_buffer[0][5]_i_3_n_0\ : STD_LOGIC;
  signal \display_buffer[0][6]_i_2_n_0\ : STD_LOGIC;
  signal \display_buffer[0][6]_i_3_n_0\ : STD_LOGIC;
  signal \display_buffer_reg[0]\ : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal \display_buffer_reg[1]\ : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal \display_buffer_reg[2]\ : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal \display_buffer_reg[3]\ : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal refresh_counter : STD_LOGIC_VECTOR ( 19 downto 0 );
  signal \refresh_counter0_carry__0_n_0\ : STD_LOGIC;
  signal \refresh_counter0_carry__1_n_0\ : STD_LOGIC;
  signal \refresh_counter0_carry__2_n_0\ : STD_LOGIC;
  signal refresh_counter0_carry_n_0 : STD_LOGIC;
  signal \refresh_counter[19]_i_2_n_0\ : STD_LOGIC;
  signal \refresh_counter[19]_i_3_n_0\ : STD_LOGIC;
  signal \refresh_counter[19]_i_4_n_0\ : STD_LOGIC;
  signal \refresh_counter[19]_i_5_n_0\ : STD_LOGIC;
  signal \refresh_counter[19]_i_6_n_0\ : STD_LOGIC;
  signal refresh_counter_0 : STD_LOGIC_VECTOR ( 19 downto 0 );
  signal NLW_refresh_counter0_carry_CO_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_refresh_counter0_carry__0_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_refresh_counter0_carry__1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_refresh_counter0_carry__2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_refresh_counter0_carry__3_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_refresh_counter0_carry__3_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \digit_select[0]_i_1\ : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of \digit_select[1]_i_1\ : label is "soft_lutpair31";
  attribute OPT_MODIFIED : string;
  attribute OPT_MODIFIED of refresh_counter0_carry : label is "SWEEP";
  attribute OPT_MODIFIED of \refresh_counter0_carry__0\ : label is "SWEEP";
  attribute OPT_MODIFIED of \refresh_counter0_carry__1\ : label is "SWEEP";
  attribute OPT_MODIFIED of \refresh_counter0_carry__2\ : label is "SWEEP";
  attribute OPT_MODIFIED of \refresh_counter0_carry__3\ : label is "SWEEP";
  attribute SOFT_HLUTNM of \refresh_counter[10]_i_1\ : label is "soft_lutpair39";
  attribute SOFT_HLUTNM of \refresh_counter[11]_i_1\ : label is "soft_lutpair35";
  attribute SOFT_HLUTNM of \refresh_counter[12]_i_1\ : label is "soft_lutpair38";
  attribute SOFT_HLUTNM of \refresh_counter[13]_i_1\ : label is "soft_lutpair38";
  attribute SOFT_HLUTNM of \refresh_counter[14]_i_1\ : label is "soft_lutpair35";
  attribute SOFT_HLUTNM of \refresh_counter[15]_i_1\ : label is "soft_lutpair37";
  attribute SOFT_HLUTNM of \refresh_counter[16]_i_1\ : label is "soft_lutpair36";
  attribute SOFT_HLUTNM of \refresh_counter[17]_i_1\ : label is "soft_lutpair34";
  attribute SOFT_HLUTNM of \refresh_counter[18]_i_1\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of \refresh_counter[19]_i_1\ : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of \refresh_counter[1]_i_1\ : label is "soft_lutpair39";
  attribute SOFT_HLUTNM of \refresh_counter[3]_i_1\ : label is "soft_lutpair37";
  attribute SOFT_HLUTNM of \refresh_counter[4]_i_1\ : label is "soft_lutpair40";
  attribute SOFT_HLUTNM of \refresh_counter[5]_i_1\ : label is "soft_lutpair36";
  attribute SOFT_HLUTNM of \refresh_counter[6]_i_1\ : label is "soft_lutpair40";
  attribute SOFT_HLUTNM of \refresh_counter[7]_i_1\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of \refresh_counter[8]_i_1\ : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of \refresh_counter[9]_i_1\ : label is "soft_lutpair34";
begin
\char_n_o_OBUF[0]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => digit_select(1),
      I1 => digit_select(0),
      O => char_n_o_OBUF(0)
    );
\char_n_o_OBUF[1]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => digit_select(0),
      I1 => digit_select(1),
      O => char_n_o_OBUF(1)
    );
\char_n_o_OBUF[2]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => digit_select(1),
      I1 => digit_select(0),
      O => char_n_o_OBUF(2)
    );
\char_n_o_OBUF[3]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => digit_select(1),
      I1 => digit_select(0),
      O => char_n_o_OBUF(3)
    );
\digit_select[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \refresh_counter[19]_i_2_n_0\,
      I1 => digit_select(0),
      O => \digit_select[0]_i_1_n_0\
    );
\digit_select[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"D2"
    )
        port map (
      I0 => digit_select(0),
      I1 => \refresh_counter[19]_i_2_n_0\,
      I2 => digit_select(1),
      O => \digit_select[1]_i_1_n_0\
    );
\digit_select_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \digit_select[0]_i_1_n_0\,
      Q => digit_select(0)
    );
\digit_select_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \digit_select[1]_i_1_n_0\,
      Q => digit_select(1)
    );
\display_buffer[0][0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"030000007C000000"
    )
        port map (
      I0 => Q(0),
      I1 => Q(1),
      I2 => Q(2),
      I3 => Q(5),
      I4 => Q(4),
      I5 => Q(3),
      O => \display_buffer[0][0]_i_2_n_0\
    );
\display_buffer[0][0]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000001197E95E"
    )
        port map (
      I0 => Q(1),
      I1 => Q(2),
      I2 => Q(0),
      I3 => Q(3),
      I4 => Q(4),
      I5 => Q(5),
      O => \display_buffer[0][0]_i_3_n_0\
    );
\display_buffer[0][1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"141D000000000000"
    )
        port map (
      I0 => Q(1),
      I1 => Q(2),
      I2 => Q(3),
      I3 => Q(0),
      I4 => Q(4),
      I5 => Q(5),
      O => \display_buffer[0][1]_i_2_n_0\
    );
\display_buffer[0][1]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000011FD25FA"
    )
        port map (
      I0 => Q(1),
      I1 => Q(2),
      I2 => Q(0),
      I3 => Q(3),
      I4 => Q(4),
      I5 => Q(5),
      O => \display_buffer[0][1]_i_3_n_0\
    );
\display_buffer[0][2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0400000007000000"
    )
        port map (
      I0 => Q(3),
      I1 => Q(1),
      I2 => Q(0),
      I3 => Q(4),
      I4 => Q(5),
      I5 => Q(2),
      O => \display_buffer[0][2]_i_2_n_0\
    );
\display_buffer[0][2]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000000347EFFE"
    )
        port map (
      I0 => Q(1),
      I1 => Q(2),
      I2 => Q(0),
      I3 => Q(3),
      I4 => Q(4),
      I5 => Q(5),
      O => \display_buffer[0][2]_i_3_n_0\
    );
\display_buffer[0][3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"161B000000000000"
    )
        port map (
      I0 => Q(1),
      I1 => Q(2),
      I2 => Q(3),
      I3 => Q(0),
      I4 => Q(4),
      I5 => Q(5),
      O => \display_buffer[0][3]_i_2_n_0\
    );
\display_buffer[0][3]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00001E8E00002C66"
    )
        port map (
      I0 => Q(1),
      I1 => Q(2),
      I2 => Q(3),
      I3 => Q(4),
      I4 => Q(5),
      I5 => Q(0),
      O => \display_buffer[0][3]_i_3_n_0\
    );
\display_buffer[0][4]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0F3B000000000000"
    )
        port map (
      I0 => Q(0),
      I1 => Q(1),
      I2 => Q(3),
      I3 => Q(2),
      I4 => Q(4),
      I5 => Q(5),
      O => \display_buffer[0][4]_i_2_n_0\
    );
\display_buffer[0][4]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000037276D12"
    )
        port map (
      I0 => Q(1),
      I1 => Q(4),
      I2 => Q(2),
      I3 => Q(0),
      I4 => Q(3),
      I5 => Q(5),
      O => \display_buffer[0][4]_i_3_n_0\
    );
\display_buffer[0][5]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2177000000000000"
    )
        port map (
      I0 => Q(1),
      I1 => Q(3),
      I2 => Q(0),
      I3 => Q(2),
      I4 => Q(4),
      I5 => Q(5),
      O => \display_buffer[0][5]_i_2_n_0\
    );
\display_buffer[0][5]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000001D390124"
    )
        port map (
      I0 => Q(1),
      I1 => Q(2),
      I2 => Q(3),
      I3 => Q(0),
      I4 => Q(4),
      I5 => Q(5),
      O => \display_buffer[0][5]_i_3_n_0\
    );
\display_buffer[0][6]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1E1B000000000000"
    )
        port map (
      I0 => Q(1),
      I1 => Q(2),
      I2 => Q(3),
      I3 => Q(0),
      I4 => Q(4),
      I5 => Q(5),
      O => \display_buffer[0][6]_i_2_n_0\
    );
\display_buffer[0][6]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00020060003100F8"
    )
        port map (
      I0 => Q(1),
      I1 => Q(2),
      I2 => Q(0),
      I3 => Q(5),
      I4 => Q(4),
      I5 => Q(3),
      O => \display_buffer[0][6]_i_3_n_0\
    );
\display_buffer_reg[0][0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => E(0),
      CLR => AR(0),
      D => ASCII_to_7Seg(6),
      Q => \display_buffer_reg[0]\(0)
    );
\display_buffer_reg[0][0]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \display_buffer[0][0]_i_2_n_0\,
      I1 => \display_buffer[0][0]_i_3_n_0\,
      O => ASCII_to_7Seg(6),
      S => Q(6)
    );
\display_buffer_reg[0][1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => E(0),
      CLR => AR(0),
      D => ASCII_to_7Seg(5),
      Q => \display_buffer_reg[0]\(1)
    );
\display_buffer_reg[0][1]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \display_buffer[0][1]_i_2_n_0\,
      I1 => \display_buffer[0][1]_i_3_n_0\,
      O => ASCII_to_7Seg(5),
      S => Q(6)
    );
\display_buffer_reg[0][2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => E(0),
      CLR => AR(0),
      D => ASCII_to_7Seg(4),
      Q => \display_buffer_reg[0]\(2)
    );
\display_buffer_reg[0][2]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \display_buffer[0][2]_i_2_n_0\,
      I1 => \display_buffer[0][2]_i_3_n_0\,
      O => ASCII_to_7Seg(4),
      S => Q(6)
    );
\display_buffer_reg[0][3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => E(0),
      CLR => AR(0),
      D => ASCII_to_7Seg(3),
      Q => \display_buffer_reg[0]\(3)
    );
\display_buffer_reg[0][3]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \display_buffer[0][3]_i_2_n_0\,
      I1 => \display_buffer[0][3]_i_3_n_0\,
      O => ASCII_to_7Seg(3),
      S => Q(6)
    );
\display_buffer_reg[0][4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => E(0),
      CLR => AR(0),
      D => ASCII_to_7Seg(2),
      Q => \display_buffer_reg[0]\(4)
    );
\display_buffer_reg[0][4]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \display_buffer[0][4]_i_2_n_0\,
      I1 => \display_buffer[0][4]_i_3_n_0\,
      O => ASCII_to_7Seg(2),
      S => Q(6)
    );
\display_buffer_reg[0][5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => E(0),
      CLR => AR(0),
      D => ASCII_to_7Seg(1),
      Q => \display_buffer_reg[0]\(5)
    );
\display_buffer_reg[0][5]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \display_buffer[0][5]_i_2_n_0\,
      I1 => \display_buffer[0][5]_i_3_n_0\,
      O => ASCII_to_7Seg(1),
      S => Q(6)
    );
\display_buffer_reg[0][6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => E(0),
      CLR => AR(0),
      D => ASCII_to_7Seg(0),
      Q => \display_buffer_reg[0]\(6)
    );
\display_buffer_reg[0][6]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \display_buffer[0][6]_i_2_n_0\,
      I1 => \display_buffer[0][6]_i_3_n_0\,
      O => ASCII_to_7Seg(0),
      S => Q(6)
    );
\display_buffer_reg[1][0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => E(0),
      CLR => AR(0),
      D => \display_buffer_reg[0]\(0),
      Q => \display_buffer_reg[1]\(0)
    );
\display_buffer_reg[1][1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => E(0),
      CLR => AR(0),
      D => \display_buffer_reg[0]\(1),
      Q => \display_buffer_reg[1]\(1)
    );
\display_buffer_reg[1][2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => E(0),
      CLR => AR(0),
      D => \display_buffer_reg[0]\(2),
      Q => \display_buffer_reg[1]\(2)
    );
\display_buffer_reg[1][3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => E(0),
      CLR => AR(0),
      D => \display_buffer_reg[0]\(3),
      Q => \display_buffer_reg[1]\(3)
    );
\display_buffer_reg[1][4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => E(0),
      CLR => AR(0),
      D => \display_buffer_reg[0]\(4),
      Q => \display_buffer_reg[1]\(4)
    );
\display_buffer_reg[1][5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => E(0),
      CLR => AR(0),
      D => \display_buffer_reg[0]\(5),
      Q => \display_buffer_reg[1]\(5)
    );
\display_buffer_reg[1][6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => E(0),
      CLR => AR(0),
      D => \display_buffer_reg[0]\(6),
      Q => \display_buffer_reg[1]\(6)
    );
\display_buffer_reg[2][0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => E(0),
      CLR => AR(0),
      D => \display_buffer_reg[1]\(0),
      Q => \display_buffer_reg[2]\(0)
    );
\display_buffer_reg[2][1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => E(0),
      CLR => AR(0),
      D => \display_buffer_reg[1]\(1),
      Q => \display_buffer_reg[2]\(1)
    );
\display_buffer_reg[2][2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => E(0),
      CLR => AR(0),
      D => \display_buffer_reg[1]\(2),
      Q => \display_buffer_reg[2]\(2)
    );
\display_buffer_reg[2][3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => E(0),
      CLR => AR(0),
      D => \display_buffer_reg[1]\(3),
      Q => \display_buffer_reg[2]\(3)
    );
\display_buffer_reg[2][4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => E(0),
      CLR => AR(0),
      D => \display_buffer_reg[1]\(4),
      Q => \display_buffer_reg[2]\(4)
    );
\display_buffer_reg[2][5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => E(0),
      CLR => AR(0),
      D => \display_buffer_reg[1]\(5),
      Q => \display_buffer_reg[2]\(5)
    );
\display_buffer_reg[2][6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => E(0),
      CLR => AR(0),
      D => \display_buffer_reg[1]\(6),
      Q => \display_buffer_reg[2]\(6)
    );
\display_buffer_reg[3][0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => E(0),
      CLR => AR(0),
      D => \display_buffer_reg[2]\(0),
      Q => \display_buffer_reg[3]\(0)
    );
\display_buffer_reg[3][1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => E(0),
      CLR => AR(0),
      D => \display_buffer_reg[2]\(1),
      Q => \display_buffer_reg[3]\(1)
    );
\display_buffer_reg[3][2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => E(0),
      CLR => AR(0),
      D => \display_buffer_reg[2]\(2),
      Q => \display_buffer_reg[3]\(2)
    );
\display_buffer_reg[3][3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => E(0),
      CLR => AR(0),
      D => \display_buffer_reg[2]\(3),
      Q => \display_buffer_reg[3]\(3)
    );
\display_buffer_reg[3][4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => E(0),
      CLR => AR(0),
      D => \display_buffer_reg[2]\(4),
      Q => \display_buffer_reg[3]\(4)
    );
\display_buffer_reg[3][5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => E(0),
      CLR => AR(0),
      D => \display_buffer_reg[2]\(5),
      Q => \display_buffer_reg[3]\(5)
    );
\display_buffer_reg[3][6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => E(0),
      CLR => AR(0),
      D => \display_buffer_reg[2]\(6),
      Q => \display_buffer_reg[3]\(6)
    );
refresh_counter0_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => refresh_counter0_carry_n_0,
      CO(2 downto 0) => NLW_refresh_counter0_carry_CO_UNCONNECTED(2 downto 0),
      CYINIT => refresh_counter(0),
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(4 downto 1),
      S(3 downto 0) => refresh_counter(4 downto 1)
    );
\refresh_counter0_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => refresh_counter0_carry_n_0,
      CO(3) => \refresh_counter0_carry__0_n_0\,
      CO(2 downto 0) => \NLW_refresh_counter0_carry__0_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(8 downto 5),
      S(3 downto 0) => refresh_counter(8 downto 5)
    );
\refresh_counter0_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \refresh_counter0_carry__0_n_0\,
      CO(3) => \refresh_counter0_carry__1_n_0\,
      CO(2 downto 0) => \NLW_refresh_counter0_carry__1_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(12 downto 9),
      S(3 downto 0) => refresh_counter(12 downto 9)
    );
\refresh_counter0_carry__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \refresh_counter0_carry__1_n_0\,
      CO(3) => \refresh_counter0_carry__2_n_0\,
      CO(2 downto 0) => \NLW_refresh_counter0_carry__2_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(16 downto 13),
      S(3 downto 0) => refresh_counter(16 downto 13)
    );
\refresh_counter0_carry__3\: unisim.vcomponents.CARRY4
     port map (
      CI => \refresh_counter0_carry__2_n_0\,
      CO(3 downto 0) => \NLW_refresh_counter0_carry__3_CO_UNCONNECTED\(3 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \NLW_refresh_counter0_carry__3_O_UNCONNECTED\(3),
      O(2 downto 0) => data0(19 downto 17),
      S(3) => '0',
      S(2 downto 0) => refresh_counter(19 downto 17)
    );
\refresh_counter[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => refresh_counter(0),
      O => refresh_counter_0(0)
    );
\refresh_counter[10]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \refresh_counter[19]_i_2_n_0\,
      I1 => data0(10),
      O => refresh_counter_0(10)
    );
\refresh_counter[11]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \refresh_counter[19]_i_2_n_0\,
      I1 => data0(11),
      O => refresh_counter_0(11)
    );
\refresh_counter[12]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \refresh_counter[19]_i_2_n_0\,
      I1 => data0(12),
      O => refresh_counter_0(12)
    );
\refresh_counter[13]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \refresh_counter[19]_i_2_n_0\,
      I1 => data0(13),
      O => refresh_counter_0(13)
    );
\refresh_counter[14]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \refresh_counter[19]_i_2_n_0\,
      I1 => data0(14),
      O => refresh_counter_0(14)
    );
\refresh_counter[15]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \refresh_counter[19]_i_2_n_0\,
      I1 => data0(15),
      O => refresh_counter_0(15)
    );
\refresh_counter[16]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \refresh_counter[19]_i_2_n_0\,
      I1 => data0(16),
      O => refresh_counter_0(16)
    );
\refresh_counter[17]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \refresh_counter[19]_i_2_n_0\,
      I1 => data0(17),
      O => refresh_counter_0(17)
    );
\refresh_counter[18]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \refresh_counter[19]_i_2_n_0\,
      I1 => data0(18),
      O => refresh_counter_0(18)
    );
\refresh_counter[19]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \refresh_counter[19]_i_2_n_0\,
      I1 => data0(19),
      O => refresh_counter_0(19)
    );
\refresh_counter[19]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFF7FFF"
    )
        port map (
      I0 => refresh_counter(1),
      I1 => refresh_counter(0),
      I2 => refresh_counter(3),
      I3 => refresh_counter(2),
      I4 => \refresh_counter[19]_i_3_n_0\,
      I5 => \refresh_counter[19]_i_4_n_0\,
      O => \refresh_counter[19]_i_2_n_0\
    );
\refresh_counter[19]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF7FFF"
    )
        port map (
      I0 => refresh_counter(14),
      I1 => refresh_counter(15),
      I2 => refresh_counter(12),
      I3 => refresh_counter(13),
      I4 => \refresh_counter[19]_i_5_n_0\,
      O => \refresh_counter[19]_i_3_n_0\
    );
\refresh_counter[19]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF7FFF"
    )
        port map (
      I0 => refresh_counter(6),
      I1 => refresh_counter(7),
      I2 => refresh_counter(4),
      I3 => refresh_counter(5),
      I4 => \refresh_counter[19]_i_6_n_0\,
      O => \refresh_counter[19]_i_4_n_0\
    );
\refresh_counter[19]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => refresh_counter(17),
      I1 => refresh_counter(16),
      I2 => refresh_counter(19),
      I3 => refresh_counter(18),
      O => \refresh_counter[19]_i_5_n_0\
    );
\refresh_counter[19]_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => refresh_counter(9),
      I1 => refresh_counter(8),
      I2 => refresh_counter(11),
      I3 => refresh_counter(10),
      O => \refresh_counter[19]_i_6_n_0\
    );
\refresh_counter[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \refresh_counter[19]_i_2_n_0\,
      I1 => data0(1),
      O => refresh_counter_0(1)
    );
\refresh_counter[2]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \refresh_counter[19]_i_2_n_0\,
      I1 => data0(2),
      O => refresh_counter_0(2)
    );
\refresh_counter[3]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \refresh_counter[19]_i_2_n_0\,
      I1 => data0(3),
      O => refresh_counter_0(3)
    );
\refresh_counter[4]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \refresh_counter[19]_i_2_n_0\,
      I1 => data0(4),
      O => refresh_counter_0(4)
    );
\refresh_counter[5]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \refresh_counter[19]_i_2_n_0\,
      I1 => data0(5),
      O => refresh_counter_0(5)
    );
\refresh_counter[6]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \refresh_counter[19]_i_2_n_0\,
      I1 => data0(6),
      O => refresh_counter_0(6)
    );
\refresh_counter[7]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \refresh_counter[19]_i_2_n_0\,
      I1 => data0(7),
      O => refresh_counter_0(7)
    );
\refresh_counter[8]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \refresh_counter[19]_i_2_n_0\,
      I1 => data0(8),
      O => refresh_counter_0(8)
    );
\refresh_counter[9]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \refresh_counter[19]_i_2_n_0\,
      I1 => data0(9),
      O => refresh_counter_0(9)
    );
\refresh_counter_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => refresh_counter_0(0),
      Q => refresh_counter(0)
    );
\refresh_counter_reg[10]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => refresh_counter_0(10),
      Q => refresh_counter(10)
    );
\refresh_counter_reg[11]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => refresh_counter_0(11),
      Q => refresh_counter(11)
    );
\refresh_counter_reg[12]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => refresh_counter_0(12),
      Q => refresh_counter(12)
    );
\refresh_counter_reg[13]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => refresh_counter_0(13),
      Q => refresh_counter(13)
    );
\refresh_counter_reg[14]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => refresh_counter_0(14),
      Q => refresh_counter(14)
    );
\refresh_counter_reg[15]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => refresh_counter_0(15),
      Q => refresh_counter(15)
    );
\refresh_counter_reg[16]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => refresh_counter_0(16),
      Q => refresh_counter(16)
    );
\refresh_counter_reg[17]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => refresh_counter_0(17),
      Q => refresh_counter(17)
    );
\refresh_counter_reg[18]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => refresh_counter_0(18),
      Q => refresh_counter(18)
    );
\refresh_counter_reg[19]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => refresh_counter_0(19),
      Q => refresh_counter(19)
    );
\refresh_counter_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => refresh_counter_0(1),
      Q => refresh_counter(1)
    );
\refresh_counter_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => refresh_counter_0(2),
      Q => refresh_counter(2)
    );
\refresh_counter_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => refresh_counter_0(3),
      Q => refresh_counter(3)
    );
\refresh_counter_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => refresh_counter_0(4),
      Q => refresh_counter(4)
    );
\refresh_counter_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => refresh_counter_0(5),
      Q => refresh_counter(5)
    );
\refresh_counter_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => refresh_counter_0(6),
      Q => refresh_counter(6)
    );
\refresh_counter_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => refresh_counter_0(7),
      Q => refresh_counter(7)
    );
\refresh_counter_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => refresh_counter_0(8),
      Q => refresh_counter(8)
    );
\refresh_counter_reg[9]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => refresh_counter_0(9),
      Q => refresh_counter(9)
    );
\seg_display_o_OBUF[0]_inst_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCFFAAF0CC00AAF0"
    )
        port map (
      I0 => \display_buffer_reg[2]\(0),
      I1 => \display_buffer_reg[3]\(0),
      I2 => \display_buffer_reg[0]\(0),
      I3 => digit_select(1),
      I4 => digit_select(0),
      I5 => \display_buffer_reg[1]\(0),
      O => seg_display_o_OBUF(0)
    );
\seg_display_o_OBUF[1]_inst_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCFFAAF0CC00AAF0"
    )
        port map (
      I0 => \display_buffer_reg[2]\(1),
      I1 => \display_buffer_reg[3]\(1),
      I2 => \display_buffer_reg[0]\(1),
      I3 => digit_select(1),
      I4 => digit_select(0),
      I5 => \display_buffer_reg[1]\(1),
      O => seg_display_o_OBUF(1)
    );
\seg_display_o_OBUF[2]_inst_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCFFAAF0CC00AAF0"
    )
        port map (
      I0 => \display_buffer_reg[2]\(2),
      I1 => \display_buffer_reg[3]\(2),
      I2 => \display_buffer_reg[0]\(2),
      I3 => digit_select(1),
      I4 => digit_select(0),
      I5 => \display_buffer_reg[1]\(2),
      O => seg_display_o_OBUF(2)
    );
\seg_display_o_OBUF[3]_inst_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCFFAAF0CC00AAF0"
    )
        port map (
      I0 => \display_buffer_reg[2]\(3),
      I1 => \display_buffer_reg[3]\(3),
      I2 => \display_buffer_reg[0]\(3),
      I3 => digit_select(1),
      I4 => digit_select(0),
      I5 => \display_buffer_reg[1]\(3),
      O => seg_display_o_OBUF(3)
    );
\seg_display_o_OBUF[4]_inst_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCFFAAF0CC00AAF0"
    )
        port map (
      I0 => \display_buffer_reg[2]\(4),
      I1 => \display_buffer_reg[3]\(4),
      I2 => \display_buffer_reg[0]\(4),
      I3 => digit_select(1),
      I4 => digit_select(0),
      I5 => \display_buffer_reg[1]\(4),
      O => seg_display_o_OBUF(4)
    );
\seg_display_o_OBUF[5]_inst_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCFFAAF0CC00AAF0"
    )
        port map (
      I0 => \display_buffer_reg[2]\(5),
      I1 => \display_buffer_reg[3]\(5),
      I2 => \display_buffer_reg[0]\(5),
      I3 => digit_select(1),
      I4 => digit_select(0),
      I5 => \display_buffer_reg[1]\(5),
      O => seg_display_o_OBUF(5)
    );
\seg_display_o_OBUF[6]_inst_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCFFAAF0CC00AAF0"
    )
        port map (
      I0 => \display_buffer_reg[2]\(6),
      I1 => \display_buffer_reg[3]\(6),
      I2 => \display_buffer_reg[0]\(6),
      I3 => digit_select(1),
      I4 => digit_select(0),
      I5 => \display_buffer_reg[1]\(6),
      O => seg_display_o_OBUF(6)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity binary_to_ascii is
  port (
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    Q : out STD_LOGIC_VECTOR ( 6 downto 0 );
    \ascii_reg_reg[0]_0\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    active_morse : in STD_LOGIC;
    CLK : in STD_LOGIC;
    AR : in STD_LOGIC_VECTOR ( 0 to 0 );
    D : in STD_LOGIC_VECTOR ( 6 downto 0 )
  );
end binary_to_ascii;

architecture STRUCTURE of binary_to_ascii is
begin
\ascii_reg_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \ascii_reg_reg[0]_0\(0),
      CLR => AR(0),
      D => D(0),
      Q => Q(0)
    );
\ascii_reg_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \ascii_reg_reg[0]_0\(0),
      CLR => AR(0),
      D => D(1),
      Q => Q(1)
    );
\ascii_reg_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \ascii_reg_reg[0]_0\(0),
      CLR => AR(0),
      D => D(2),
      Q => Q(2)
    );
\ascii_reg_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \ascii_reg_reg[0]_0\(0),
      CLR => AR(0),
      D => D(3),
      Q => Q(3)
    );
\ascii_reg_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \ascii_reg_reg[0]_0\(0),
      CLR => AR(0),
      D => D(4),
      Q => Q(4)
    );
\ascii_reg_reg[5]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => CLK,
      CE => \ascii_reg_reg[0]_0\(0),
      D => D(5),
      PRE => AR(0),
      Q => Q(5)
    );
\ascii_reg_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \ascii_reg_reg[0]_0\(0),
      CLR => AR(0),
      D => D(6),
      Q => Q(6)
    );
new_letter_reg_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \ascii_reg_reg[0]_0\(0),
      CLR => AR(0),
      D => active_morse,
      Q => E(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity morse_to_binary is
  port (
    active_morse : out STD_LOGIC;
    D : out STD_LOGIC_VECTOR ( 6 downto 0 );
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    lbutton_i_IBUF : in STD_LOGIC;
    CLK : in STD_LOGIC;
    AR : in STD_LOGIC_VECTOR ( 0 to 0 );
    rbutton_i_IBUF : in STD_LOGIC
  );
end morse_to_binary;

architecture STRUCTURE of morse_to_binary is
  signal \active_cnt[0]_i_1_n_0\ : STD_LOGIC;
  signal \active_cnt[1]_i_1_n_0\ : STD_LOGIC;
  signal \active_cnt[2]_i_1_n_0\ : STD_LOGIC;
  signal \active_cnt[2]_i_2_n_0\ : STD_LOGIC;
  signal \active_cnt_reg_n_0_[0]\ : STD_LOGIC;
  signal \active_cnt_reg_n_0_[1]\ : STD_LOGIC;
  signal \active_cnt_reg_n_0_[2]\ : STD_LOGIC;
  signal \^active_morse\ : STD_LOGIC;
  signal active_out_i_1_n_0 : STD_LOGIC;
  signal \ascii_reg[0]_i_10_n_0\ : STD_LOGIC;
  signal \ascii_reg[0]_i_11_n_0\ : STD_LOGIC;
  signal \ascii_reg[0]_i_12_n_0\ : STD_LOGIC;
  signal \ascii_reg[0]_i_2_n_0\ : STD_LOGIC;
  signal \ascii_reg[0]_i_3_n_0\ : STD_LOGIC;
  signal \ascii_reg[0]_i_4_n_0\ : STD_LOGIC;
  signal \ascii_reg[0]_i_5_n_0\ : STD_LOGIC;
  signal \ascii_reg[0]_i_6_n_0\ : STD_LOGIC;
  signal \ascii_reg[0]_i_7_n_0\ : STD_LOGIC;
  signal \ascii_reg[0]_i_8_n_0\ : STD_LOGIC;
  signal \ascii_reg[0]_i_9_n_0\ : STD_LOGIC;
  signal \ascii_reg[1]_i_10_n_0\ : STD_LOGIC;
  signal \ascii_reg[1]_i_11_n_0\ : STD_LOGIC;
  signal \ascii_reg[1]_i_12_n_0\ : STD_LOGIC;
  signal \ascii_reg[1]_i_2_n_0\ : STD_LOGIC;
  signal \ascii_reg[1]_i_3_n_0\ : STD_LOGIC;
  signal \ascii_reg[1]_i_4_n_0\ : STD_LOGIC;
  signal \ascii_reg[1]_i_5_n_0\ : STD_LOGIC;
  signal \ascii_reg[1]_i_6_n_0\ : STD_LOGIC;
  signal \ascii_reg[1]_i_7_n_0\ : STD_LOGIC;
  signal \ascii_reg[1]_i_8_n_0\ : STD_LOGIC;
  signal \ascii_reg[1]_i_9_n_0\ : STD_LOGIC;
  signal \ascii_reg[2]_i_10_n_0\ : STD_LOGIC;
  signal \ascii_reg[2]_i_11_n_0\ : STD_LOGIC;
  signal \ascii_reg[2]_i_12_n_0\ : STD_LOGIC;
  signal \ascii_reg[2]_i_2_n_0\ : STD_LOGIC;
  signal \ascii_reg[2]_i_3_n_0\ : STD_LOGIC;
  signal \ascii_reg[2]_i_4_n_0\ : STD_LOGIC;
  signal \ascii_reg[2]_i_5_n_0\ : STD_LOGIC;
  signal \ascii_reg[2]_i_6_n_0\ : STD_LOGIC;
  signal \ascii_reg[2]_i_7_n_0\ : STD_LOGIC;
  signal \ascii_reg[2]_i_8_n_0\ : STD_LOGIC;
  signal \ascii_reg[2]_i_9_n_0\ : STD_LOGIC;
  signal \ascii_reg[3]_i_10_n_0\ : STD_LOGIC;
  signal \ascii_reg[3]_i_11_n_0\ : STD_LOGIC;
  signal \ascii_reg[3]_i_12_n_0\ : STD_LOGIC;
  signal \ascii_reg[3]_i_13_n_0\ : STD_LOGIC;
  signal \ascii_reg[3]_i_14_n_0\ : STD_LOGIC;
  signal \ascii_reg[3]_i_2_n_0\ : STD_LOGIC;
  signal \ascii_reg[3]_i_3_n_0\ : STD_LOGIC;
  signal \ascii_reg[3]_i_4_n_0\ : STD_LOGIC;
  signal \ascii_reg[3]_i_5_n_0\ : STD_LOGIC;
  signal \ascii_reg[3]_i_6_n_0\ : STD_LOGIC;
  signal \ascii_reg[3]_i_7_n_0\ : STD_LOGIC;
  signal \ascii_reg[3]_i_8_n_0\ : STD_LOGIC;
  signal \ascii_reg[3]_i_9_n_0\ : STD_LOGIC;
  signal \ascii_reg[4]_i_10_n_0\ : STD_LOGIC;
  signal \ascii_reg[4]_i_11_n_0\ : STD_LOGIC;
  signal \ascii_reg[4]_i_12_n_0\ : STD_LOGIC;
  signal \ascii_reg[4]_i_13_n_0\ : STD_LOGIC;
  signal \ascii_reg[4]_i_14_n_0\ : STD_LOGIC;
  signal \ascii_reg[4]_i_2_n_0\ : STD_LOGIC;
  signal \ascii_reg[4]_i_3_n_0\ : STD_LOGIC;
  signal \ascii_reg[4]_i_4_n_0\ : STD_LOGIC;
  signal \ascii_reg[4]_i_5_n_0\ : STD_LOGIC;
  signal \ascii_reg[4]_i_6_n_0\ : STD_LOGIC;
  signal \ascii_reg[4]_i_7_n_0\ : STD_LOGIC;
  signal \ascii_reg[4]_i_8_n_0\ : STD_LOGIC;
  signal \ascii_reg[4]_i_9_n_0\ : STD_LOGIC;
  signal \ascii_reg[6]_i_10_n_0\ : STD_LOGIC;
  signal \ascii_reg[6]_i_11_n_0\ : STD_LOGIC;
  signal \ascii_reg[6]_i_12_n_0\ : STD_LOGIC;
  signal \ascii_reg[6]_i_13_n_0\ : STD_LOGIC;
  signal \ascii_reg[6]_i_14_n_0\ : STD_LOGIC;
  signal \ascii_reg[6]_i_15_n_0\ : STD_LOGIC;
  signal \ascii_reg[6]_i_16_n_0\ : STD_LOGIC;
  signal \ascii_reg[6]_i_17_n_0\ : STD_LOGIC;
  signal \ascii_reg[6]_i_18_n_0\ : STD_LOGIC;
  signal \ascii_reg[6]_i_19_n_0\ : STD_LOGIC;
  signal \ascii_reg[6]_i_20_n_0\ : STD_LOGIC;
  signal \ascii_reg[6]_i_21_n_0\ : STD_LOGIC;
  signal \ascii_reg[6]_i_22_n_0\ : STD_LOGIC;
  signal \ascii_reg[6]_i_23_n_0\ : STD_LOGIC;
  signal \ascii_reg[6]_i_24_n_0\ : STD_LOGIC;
  signal \ascii_reg[6]_i_25_n_0\ : STD_LOGIC;
  signal \ascii_reg[6]_i_26_n_0\ : STD_LOGIC;
  signal \ascii_reg[6]_i_27_n_0\ : STD_LOGIC;
  signal \ascii_reg[6]_i_28_n_0\ : STD_LOGIC;
  signal \ascii_reg[6]_i_29_n_0\ : STD_LOGIC;
  signal \ascii_reg[6]_i_30_n_0\ : STD_LOGIC;
  signal \ascii_reg[6]_i_31_n_0\ : STD_LOGIC;
  signal \ascii_reg[6]_i_32_n_0\ : STD_LOGIC;
  signal \ascii_reg[6]_i_33_n_0\ : STD_LOGIC;
  signal \ascii_reg[6]_i_34_n_0\ : STD_LOGIC;
  signal \ascii_reg[6]_i_35_n_0\ : STD_LOGIC;
  signal \ascii_reg[6]_i_36_n_0\ : STD_LOGIC;
  signal \ascii_reg[6]_i_37_n_0\ : STD_LOGIC;
  signal \ascii_reg[6]_i_38_n_0\ : STD_LOGIC;
  signal \ascii_reg[6]_i_39_n_0\ : STD_LOGIC;
  signal \ascii_reg[6]_i_3_n_0\ : STD_LOGIC;
  signal \ascii_reg[6]_i_40_n_0\ : STD_LOGIC;
  signal \ascii_reg[6]_i_41_n_0\ : STD_LOGIC;
  signal \ascii_reg[6]_i_42_n_0\ : STD_LOGIC;
  signal \ascii_reg[6]_i_43_n_0\ : STD_LOGIC;
  signal \ascii_reg[6]_i_44_n_0\ : STD_LOGIC;
  signal \ascii_reg[6]_i_45_n_0\ : STD_LOGIC;
  signal \ascii_reg[6]_i_46_n_0\ : STD_LOGIC;
  signal \ascii_reg[6]_i_4_n_0\ : STD_LOGIC;
  signal \ascii_reg[6]_i_5_n_0\ : STD_LOGIC;
  signal \ascii_reg[6]_i_6_n_0\ : STD_LOGIC;
  signal \ascii_reg[6]_i_7_n_0\ : STD_LOGIC;
  signal \ascii_reg[6]_i_8_n_0\ : STD_LOGIC;
  signal \ascii_reg[6]_i_9_n_0\ : STD_LOGIC;
  signal \count[0]_i_1_n_0\ : STD_LOGIC;
  signal \count[0]_i_2_n_0\ : STD_LOGIC;
  signal \count[1]_i_10_n_0\ : STD_LOGIC;
  signal \count[1]_i_11_n_0\ : STD_LOGIC;
  signal \count[1]_i_12_n_0\ : STD_LOGIC;
  signal \count[1]_i_1_n_0\ : STD_LOGIC;
  signal \count[1]_i_2_n_0\ : STD_LOGIC;
  signal \count[1]_i_3_n_0\ : STD_LOGIC;
  signal \count[1]_i_4_n_0\ : STD_LOGIC;
  signal \count[1]_i_5_n_0\ : STD_LOGIC;
  signal \count[1]_i_6_n_0\ : STD_LOGIC;
  signal \count[1]_i_7_n_0\ : STD_LOGIC;
  signal \count[1]_i_8_n_0\ : STD_LOGIC;
  signal \count[1]_i_9_n_0\ : STD_LOGIC;
  signal \count[2]_i_1_n_0\ : STD_LOGIC;
  signal \count[2]_i_2_n_0\ : STD_LOGIC;
  signal \count[2]_i_3_n_0\ : STD_LOGIC;
  signal \count[2]_i_4_n_0\ : STD_LOGIC;
  signal \count[2]_i_5_n_0\ : STD_LOGIC;
  signal \count[2]_i_6_n_0\ : STD_LOGIC;
  signal \count[3]_i_1_n_0\ : STD_LOGIC;
  signal \count[4]_i_1_n_0\ : STD_LOGIC;
  signal \count[4]_i_2_n_0\ : STD_LOGIC;
  signal \count[4]_i_3_n_0\ : STD_LOGIC;
  signal \count[4]_i_4_n_0\ : STD_LOGIC;
  signal \count[4]_i_5_n_0\ : STD_LOGIC;
  signal \count[4]_i_6_n_0\ : STD_LOGIC;
  signal \count[4]_i_7_n_0\ : STD_LOGIC;
  signal \count[4]_i_8_n_0\ : STD_LOGIC;
  signal \count[4]_i_9_n_0\ : STD_LOGIC;
  signal \count_reg_n_0_[0]\ : STD_LOGIC;
  signal \count_reg_n_0_[1]\ : STD_LOGIC;
  signal \count_reg_n_0_[2]\ : STD_LOGIC;
  signal \count_reg_n_0_[3]\ : STD_LOGIC;
  signal \count_reg_n_0_[4]\ : STD_LOGIC;
  signal lbutton_del : STD_LOGIC;
  signal morse : STD_LOGIC_VECTOR ( 0 to 18 );
  signal \morse[0]_i_1_n_0\ : STD_LOGIC;
  signal \morse[0]_i_3_n_0\ : STD_LOGIC;
  signal \morse[0]_i_4_n_0\ : STD_LOGIC;
  signal \morse[0]_i_5_n_0\ : STD_LOGIC;
  signal \morse[0]_i_6_n_0\ : STD_LOGIC;
  signal \morse[0]_i_7_n_0\ : STD_LOGIC;
  signal \morse[10]_i_1_n_0\ : STD_LOGIC;
  signal \morse[11]_i_1_n_0\ : STD_LOGIC;
  signal \morse[12]_i_1_n_0\ : STD_LOGIC;
  signal \morse[13]_i_1_n_0\ : STD_LOGIC;
  signal \morse[14]_i_1_n_0\ : STD_LOGIC;
  signal \morse[15]_i_1_n_0\ : STD_LOGIC;
  signal \morse[16]_i_1_n_0\ : STD_LOGIC;
  signal \morse[16]_i_2_n_0\ : STD_LOGIC;
  signal \morse[16]_i_3_n_0\ : STD_LOGIC;
  signal \morse[17]_i_1_n_0\ : STD_LOGIC;
  signal \morse[18]_i_1_n_0\ : STD_LOGIC;
  signal \morse[1]_i_1_n_0\ : STD_LOGIC;
  signal \morse[1]_i_2_n_0\ : STD_LOGIC;
  signal \morse[2]_i_1_n_0\ : STD_LOGIC;
  signal \morse[2]_i_2_n_0\ : STD_LOGIC;
  signal \morse[3]_i_1_n_0\ : STD_LOGIC;
  signal \morse[3]_i_2_n_0\ : STD_LOGIC;
  signal \morse[3]_i_3_n_0\ : STD_LOGIC;
  signal \morse[3]_i_4_n_0\ : STD_LOGIC;
  signal \morse[4]_i_1_n_0\ : STD_LOGIC;
  signal \morse[4]_i_2_n_0\ : STD_LOGIC;
  signal \morse[4]_i_3_n_0\ : STD_LOGIC;
  signal \morse[5]_i_1_n_0\ : STD_LOGIC;
  signal \morse[6]_i_1_n_0\ : STD_LOGIC;
  signal \morse[6]_i_2_n_0\ : STD_LOGIC;
  signal \morse[7]_i_1_n_0\ : STD_LOGIC;
  signal \morse[8]_i_1_n_0\ : STD_LOGIC;
  signal \morse[8]_i_2_n_0\ : STD_LOGIC;
  signal \morse[9]_i_1_n_0\ : STD_LOGIC;
  signal \morse[9]_i_2_n_0\ : STD_LOGIC;
  signal p_0_in : STD_LOGIC;
  signal p_1_in : STD_LOGIC_VECTOR ( 21 to 21 );
  signal rbutton_del : STD_LOGIC;
  signal zcount : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \zcount[0]_i_1_n_0\ : STD_LOGIC;
  signal \zcount[1]_i_2_n_0\ : STD_LOGIC;
  signal \zcount[1]_i_3_n_0\ : STD_LOGIC;
  signal \zcount[1]_i_4_n_0\ : STD_LOGIC;
  signal \zcount[1]_i_5_n_0\ : STD_LOGIC;
  signal \zcount[1]_i_6_n_0\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \active_cnt[0]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \active_cnt[1]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \active_cnt[2]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of active_out_i_1 : label is "soft_lutpair4";
begin
  active_morse <= \^active_morse\;
\active_cnt[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"4444A0AA"
    )
        port map (
      I0 => \^active_morse\,
      I1 => \active_cnt[2]_i_2_n_0\,
      I2 => \active_cnt_reg_n_0_[1]\,
      I3 => \active_cnt_reg_n_0_[2]\,
      I4 => \active_cnt_reg_n_0_[0]\,
      O => \active_cnt[0]_i_1_n_0\
    );
\active_cnt[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4EA0"
    )
        port map (
      I0 => \^active_morse\,
      I1 => \active_cnt[2]_i_2_n_0\,
      I2 => \active_cnt_reg_n_0_[0]\,
      I3 => \active_cnt_reg_n_0_[1]\,
      O => \active_cnt[1]_i_1_n_0\
    );
\active_cnt[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"4EE4A000"
    )
        port map (
      I0 => \^active_morse\,
      I1 => \active_cnt[2]_i_2_n_0\,
      I2 => \active_cnt_reg_n_0_[1]\,
      I3 => \active_cnt_reg_n_0_[0]\,
      I4 => \active_cnt_reg_n_0_[2]\,
      O => \active_cnt[2]_i_1_n_0\
    );
\active_cnt[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000007FDF0FDF7"
    )
        port map (
      I0 => zcount(1),
      I1 => zcount(0),
      I2 => \zcount[1]_i_6_n_0\,
      I3 => \zcount[1]_i_5_n_0\,
      I4 => \zcount[1]_i_4_n_0\,
      I5 => \zcount[1]_i_3_n_0\,
      O => \active_cnt[2]_i_2_n_0\
    );
\active_cnt_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \active_cnt[0]_i_1_n_0\,
      Q => \active_cnt_reg_n_0_[0]\
    );
\active_cnt_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \active_cnt[1]_i_1_n_0\,
      Q => \active_cnt_reg_n_0_[1]\
    );
\active_cnt_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \active_cnt[2]_i_1_n_0\,
      Q => \active_cnt_reg_n_0_[2]\
    );
active_out_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BBBBB1BB"
    )
        port map (
      I0 => \^active_morse\,
      I1 => \active_cnt[2]_i_2_n_0\,
      I2 => \active_cnt_reg_n_0_[0]\,
      I3 => \active_cnt_reg_n_0_[2]\,
      I4 => \active_cnt_reg_n_0_[1]\,
      O => active_out_i_1_n_0
    );
active_out_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => active_out_i_1_n_0,
      Q => \^active_morse\
    );
\ascii_reg[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => \ascii_reg[2]_i_5_n_0\,
      I1 => \ascii_reg[0]_i_2_n_0\,
      I2 => \ascii_reg[0]_i_3_n_0\,
      I3 => \ascii_reg[0]_i_4_n_0\,
      I4 => \ascii_reg[2]_i_3_n_0\,
      O => D(0)
    );
\ascii_reg[0]_i_10\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFF040"
    )
        port map (
      I0 => morse(14),
      I1 => morse(13),
      I2 => \^active_morse\,
      I3 => morse(15),
      I4 => \ascii_reg[0]_i_12_n_0\,
      O => \ascii_reg[0]_i_10_n_0\
    );
\ascii_reg[0]_i_11\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
        port map (
      I0 => morse(0),
      I1 => morse(3),
      I2 => morse(7),
      O => \ascii_reg[0]_i_11_n_0\
    );
\ascii_reg[0]_i_12\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"4040F000"
    )
        port map (
      I0 => morse(10),
      I1 => morse(7),
      I2 => \^active_morse\,
      I3 => morse(11),
      I4 => morse(3),
      O => \ascii_reg[0]_i_12_n_0\
    );
\ascii_reg[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFF04"
    )
        port map (
      I0 => \ascii_reg[0]_i_5_n_0\,
      I1 => \^active_morse\,
      I2 => morse(1),
      I3 => \ascii_reg[0]_i_6_n_0\,
      I4 => \ascii_reg[0]_i_7_n_0\,
      I5 => \ascii_reg[0]_i_8_n_0\,
      O => \ascii_reg[0]_i_2_n_0\
    );
\ascii_reg[0]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFEAAAEAEA"
    )
        port map (
      I0 => \ascii_reg[0]_i_9_n_0\,
      I1 => morse(5),
      I2 => \^active_morse\,
      I3 => morse(3),
      I4 => morse(8),
      I5 => \ascii_reg[0]_i_10_n_0\,
      O => \ascii_reg[0]_i_3_n_0\
    );
\ascii_reg[0]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000005503FFFF"
    )
        port map (
      I0 => morse(7),
      I1 => morse(1),
      I2 => morse(9),
      I3 => morse(3),
      I4 => morse(8),
      I5 => \ascii_reg[4]_i_2_n_0\,
      O => \ascii_reg[0]_i_4_n_0\
    );
\ascii_reg[0]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"DDDDDDDDDDDDD0DD"
    )
        port map (
      I0 => morse(0),
      I1 => morse(6),
      I2 => \ascii_reg[6]_i_18_n_0\,
      I3 => morse(8),
      I4 => morse(7),
      I5 => morse(3),
      O => \ascii_reg[0]_i_5_n_0\
    );
\ascii_reg[0]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFF000000000000"
    )
        port map (
      I0 => morse(17),
      I1 => morse(18),
      I2 => morse(1),
      I3 => morse(13),
      I4 => morse(16),
      I5 => \^active_morse\,
      O => \ascii_reg[0]_i_6_n_0\
    );
\ascii_reg[0]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0008888888888888"
    )
        port map (
      I0 => morse(14),
      I1 => \^active_morse\,
      I2 => morse(1),
      I3 => morse(13),
      I4 => morse(5),
      I5 => morse(9),
      O => \ascii_reg[0]_i_7_n_0\
    );
\ascii_reg[0]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4C0C4C004C0C4400"
    )
        port map (
      I0 => \ascii_reg[0]_i_11_n_0\,
      I1 => \^active_morse\,
      I2 => morse(10),
      I3 => morse(1),
      I4 => morse(9),
      I5 => morse(5),
      O => \ascii_reg[0]_i_8_n_0\
    );
\ascii_reg[0]_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2F002F002F002200"
    )
        port map (
      I0 => morse(3),
      I1 => morse(0),
      I2 => morse(16),
      I3 => \^active_morse\,
      I4 => morse(17),
      I5 => morse(18),
      O => \ascii_reg[0]_i_9_n_0\
    );
\ascii_reg[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFF4FFF4FFFFFFF4"
    )
        port map (
      I0 => \ascii_reg[1]_i_2_n_0\,
      I1 => \^active_morse\,
      I2 => \ascii_reg[1]_i_3_n_0\,
      I3 => \ascii_reg[1]_i_4_n_0\,
      I4 => \ascii_reg[1]_i_5_n_0\,
      I5 => \ascii_reg[1]_i_6_n_0\,
      O => D(1)
    );
\ascii_reg[1]_i_10\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => morse(7),
      I1 => morse(3),
      O => \ascii_reg[1]_i_10_n_0\
    );
\ascii_reg[1]_i_11\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => morse(1),
      I1 => morse(13),
      I2 => morse(16),
      O => \ascii_reg[1]_i_11_n_0\
    );
\ascii_reg[1]_i_12\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => morse(6),
      I1 => morse(8),
      O => \ascii_reg[1]_i_12_n_0\
    );
\ascii_reg[1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAAAAA8880"
    )
        port map (
      I0 => \ascii_reg[1]_i_7_n_0\,
      I1 => \ascii_reg[1]_i_8_n_0\,
      I2 => \ascii_reg[1]_i_9_n_0\,
      I3 => \ascii_reg[6]_i_21_n_0\,
      I4 => morse(10),
      I5 => \ascii_reg[1]_i_10_n_0\,
      O => \ascii_reg[1]_i_2_n_0\
    );
\ascii_reg[1]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000004000000000"
    )
        port map (
      I0 => morse(7),
      I1 => morse(3),
      I2 => \ascii_reg[4]_i_11_n_0\,
      I3 => morse(8),
      I4 => \ascii_reg[6]_i_14_n_0\,
      I5 => morse(6),
      O => \ascii_reg[1]_i_3_n_0\
    );
\ascii_reg[1]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0010FFFF00100010"
    )
        port map (
      I0 => \ascii_reg[3]_i_10_n_0\,
      I1 => \ascii_reg[6]_i_21_n_0\,
      I2 => morse(7),
      I3 => morse(1),
      I4 => \ascii_reg[3]_i_8_n_0\,
      I5 => \ascii_reg[1]_i_11_n_0\,
      O => \ascii_reg[1]_i_4_n_0\
    );
\ascii_reg[1]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00808080"
    )
        port map (
      I0 => morse(5),
      I1 => \^active_morse\,
      I2 => morse(10),
      I3 => morse(12),
      I4 => morse(9),
      O => \ascii_reg[1]_i_5_n_0\
    );
\ascii_reg[1]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFEFFFF"
    )
        port map (
      I0 => morse(14),
      I1 => morse(11),
      I2 => morse(3),
      I3 => morse(7),
      I4 => morse(1),
      I5 => \ascii_reg[6]_i_21_n_0\,
      O => \ascii_reg[1]_i_6_n_0\
    );
\ascii_reg[1]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFD"
    )
        port map (
      I0 => morse(1),
      I1 => \ascii_reg[6]_i_28_n_0\,
      I2 => \ascii_reg[1]_i_12_n_0\,
      I3 => \ascii_reg[6]_i_39_n_0\,
      I4 => \ascii_reg[4]_i_12_n_0\,
      I5 => morse(3),
      O => \ascii_reg[1]_i_7_n_0\
    );
\ascii_reg[1]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => \ascii_reg[6]_i_39_n_0\,
      I1 => morse(13),
      I2 => morse(16),
      I3 => morse(6),
      I4 => morse(8),
      I5 => \ascii_reg[6]_i_28_n_0\,
      O => \ascii_reg[1]_i_8_n_0\
    );
\ascii_reg[1]_i_9\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFEFF"
    )
        port map (
      I0 => morse(11),
      I1 => morse(14),
      I2 => morse(12),
      I3 => morse(5),
      I4 => morse(9),
      O => \ascii_reg[1]_i_9_n_0\
    );
\ascii_reg[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFAE"
    )
        port map (
      I0 => \ascii_reg[2]_i_2_n_0\,
      I1 => \^active_morse\,
      I2 => \ascii_reg[6]_i_12_n_0\,
      I3 => \ascii_reg[2]_i_3_n_0\,
      I4 => \ascii_reg[2]_i_4_n_0\,
      I5 => \ascii_reg[2]_i_5_n_0\,
      O => D(2)
    );
\ascii_reg[2]_i_10\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"D1FF"
    )
        port map (
      I0 => morse(14),
      I1 => morse(16),
      I2 => morse(15),
      I3 => \^active_morse\,
      O => \ascii_reg[2]_i_10_n_0\
    );
\ascii_reg[2]_i_11\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000F444"
    )
        port map (
      I0 => morse(11),
      I1 => morse(12),
      I2 => morse(5),
      I3 => morse(9),
      I4 => morse(14),
      O => \ascii_reg[2]_i_11_n_0\
    );
\ascii_reg[2]_i_12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000FFF80000"
    )
        port map (
      I0 => morse(3),
      I1 => morse(8),
      I2 => morse(5),
      I3 => morse(9),
      I4 => \^active_morse\,
      I5 => morse(10),
      O => \ascii_reg[2]_i_12_n_0\
    );
\ascii_reg[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFAAAB"
    )
        port map (
      I0 => \ascii_reg[2]_i_6_n_0\,
      I1 => morse(7),
      I2 => \ascii_reg[4]_i_2_n_0\,
      I3 => \ascii_reg[6]_i_18_n_0\,
      I4 => \ascii_reg[2]_i_7_n_0\,
      I5 => \ascii_reg[6]_i_35_n_0\,
      O => \ascii_reg[2]_i_2_n_0\
    );
\ascii_reg[2]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4FFF00004F440000"
    )
        port map (
      I0 => morse(10),
      I1 => morse(11),
      I2 => morse(4),
      I3 => morse(6),
      I4 => \^active_morse\,
      I5 => morse(8),
      O => \ascii_reg[2]_i_3_n_0\
    );
\ascii_reg[2]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0F040FFF0FF40FF"
    )
        port map (
      I0 => morse(11),
      I1 => \ascii_reg[2]_i_8_n_0\,
      I2 => \ascii_reg[2]_i_9_n_0\,
      I3 => \ascii_reg[2]_i_10_n_0\,
      I4 => morse(5),
      I5 => morse(9),
      O => \ascii_reg[2]_i_4_n_0\
    );
\ascii_reg[2]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAA8A00AAAAAAAA"
    )
        port map (
      I0 => \^active_morse\,
      I1 => \ascii_reg[6]_i_18_n_0\,
      I2 => morse(8),
      I3 => morse(7),
      I4 => \ascii_reg[2]_i_11_n_0\,
      I5 => \ascii_reg[6]_i_36_n_0\,
      O => \ascii_reg[2]_i_5_n_0\
    );
\ascii_reg[2]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EAAAFFAAEAAAEAAA"
    )
        port map (
      I0 => \ascii_reg[2]_i_12_n_0\,
      I1 => morse(13),
      I2 => morse(15),
      I3 => \^active_morse\,
      I4 => morse(4),
      I5 => morse(3),
      O => \ascii_reg[2]_i_6_n_0\
    );
\ascii_reg[2]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCCCC0CC80888088"
    )
        port map (
      I0 => morse(1),
      I1 => \^active_morse\,
      I2 => morse(3),
      I3 => morse(8),
      I4 => morse(11),
      I5 => morse(9),
      O => \ascii_reg[2]_i_7_n_0\
    );
\ascii_reg[2]_i_8\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => morse(8),
      I1 => morse(3),
      O => \ascii_reg[2]_i_8_n_0\
    );
\ascii_reg[2]_i_9\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"10"
    )
        port map (
      I0 => morse(13),
      I1 => morse(1),
      I2 => \^active_morse\,
      O => \ascii_reg[2]_i_9_n_0\
    );
\ascii_reg[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFF4"
    )
        port map (
      I0 => \ascii_reg[3]_i_2_n_0\,
      I1 => \ascii_reg[3]_i_3_n_0\,
      I2 => \ascii_reg[3]_i_4_n_0\,
      I3 => \ascii_reg[3]_i_5_n_0\,
      I4 => \ascii_reg[3]_i_6_n_0\,
      I5 => \ascii_reg[3]_i_7_n_0\,
      O => D(3)
    );
\ascii_reg[3]_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFBFFFFFEF"
    )
        port map (
      I0 => \ascii_reg[6]_i_18_n_0\,
      I1 => morse(10),
      I2 => \^active_morse\,
      I3 => morse(12),
      I4 => morse(11),
      I5 => morse(14),
      O => \ascii_reg[3]_i_10_n_0\
    );
\ascii_reg[3]_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0001000000000000"
    )
        port map (
      I0 => morse(3),
      I1 => morse(16),
      I2 => morse(13),
      I3 => \ascii_reg[6]_i_39_n_0\,
      I4 => morse(6),
      I5 => morse(8),
      O => \ascii_reg[3]_i_11_n_0\
    );
\ascii_reg[3]_i_12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000400"
    )
        port map (
      I0 => morse(4),
      I1 => morse(2),
      I2 => \ascii_reg[6]_i_40_n_0\,
      I3 => morse(0),
      I4 => \ascii_reg[1]_i_10_n_0\,
      I5 => \ascii_reg[4]_i_9_n_0\,
      O => \ascii_reg[3]_i_12_n_0\
    );
\ascii_reg[3]_i_13\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFD"
    )
        port map (
      I0 => morse(6),
      I1 => morse(16),
      I2 => morse(13),
      I3 => \ascii_reg[6]_i_39_n_0\,
      I4 => morse(8),
      O => \ascii_reg[3]_i_13_n_0\
    );
\ascii_reg[3]_i_14\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFFFFFFFFFF"
    )
        port map (
      I0 => morse(14),
      I1 => morse(6),
      I2 => morse(8),
      I3 => morse(5),
      I4 => \^active_morse\,
      I5 => morse(10),
      O => \ascii_reg[3]_i_14_n_0\
    );
\ascii_reg[3]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => \^active_morse\,
      I1 => morse(3),
      O => \ascii_reg[3]_i_2_n_0\
    );
\ascii_reg[3]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000400000"
    )
        port map (
      I0 => \ascii_reg[6]_i_21_n_0\,
      I1 => morse(10),
      I2 => \ascii_reg[6]_i_20_n_0\,
      I3 => morse(1),
      I4 => morse(7),
      I5 => \ascii_reg[6]_i_18_n_0\,
      O => \ascii_reg[3]_i_3_n_0\
    );
\ascii_reg[3]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4F44444444444444"
    )
        port map (
      I0 => \ascii_reg[3]_i_8_n_0\,
      I1 => \ascii_reg[3]_i_9_n_0\,
      I2 => \ascii_reg[3]_i_10_n_0\,
      I3 => morse(1),
      I4 => morse(7),
      I5 => \ascii_reg[3]_i_11_n_0\,
      O => \ascii_reg[3]_i_4_n_0\
    );
\ascii_reg[3]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000002000000000"
    )
        port map (
      I0 => \ascii_reg[4]_i_7_n_0\,
      I1 => morse(10),
      I2 => \^active_morse\,
      I3 => morse(3),
      I4 => morse(7),
      I5 => morse(1),
      O => \ascii_reg[3]_i_5_n_0\
    );
\ascii_reg[3]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAA0020AAAA0222"
    )
        port map (
      I0 => \ascii_reg[4]_i_11_n_0\,
      I1 => morse(7),
      I2 => morse(3),
      I3 => \ascii_reg[6]_i_21_n_0\,
      I4 => \ascii_reg[3]_i_12_n_0\,
      I5 => \ascii_reg[3]_i_13_n_0\,
      O => \ascii_reg[3]_i_6_n_0\
    );
\ascii_reg[3]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000004"
    )
        port map (
      I0 => \ascii_reg[4]_i_2_n_0\,
      I1 => \ascii_reg[6]_i_18_n_0\,
      I2 => morse(14),
      I3 => morse(11),
      I4 => \ascii_reg[4]_i_10_n_0\,
      I5 => morse(12),
      O => \ascii_reg[3]_i_7_n_0\
    );
\ascii_reg[3]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFEFFFFF"
    )
        port map (
      I0 => \ascii_reg[6]_i_39_n_0\,
      I1 => \ascii_reg[3]_i_14_n_0\,
      I2 => morse(12),
      I3 => morse(11),
      I4 => morse(9),
      I5 => \ascii_reg[1]_i_10_n_0\,
      O => \ascii_reg[3]_i_8_n_0\
    );
\ascii_reg[3]_i_9\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"82"
    )
        port map (
      I0 => morse(1),
      I1 => morse(16),
      I2 => morse(13),
      O => \ascii_reg[3]_i_9_n_0\
    );
\ascii_reg[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFF4"
    )
        port map (
      I0 => \ascii_reg[4]_i_2_n_0\,
      I1 => \ascii_reg[6]_i_5_n_0\,
      I2 => \ascii_reg[4]_i_3_n_0\,
      I3 => \ascii_reg[4]_i_4_n_0\,
      I4 => \ascii_reg[4]_i_5_n_0\,
      I5 => \ascii_reg[4]_i_6_n_0\,
      O => D(4)
    );
\ascii_reg[4]_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFEFFFFFF"
    )
        port map (
      I0 => morse(16),
      I1 => morse(13),
      I2 => \ascii_reg[6]_i_39_n_0\,
      I3 => morse(6),
      I4 => morse(8),
      I5 => \ascii_reg[4]_i_13_n_0\,
      O => \ascii_reg[4]_i_10_n_0\
    );
\ascii_reg[4]_i_11\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0010"
    )
        port map (
      I0 => morse(1),
      I1 => morse(10),
      I2 => \^active_morse\,
      I3 => \ascii_reg[6]_i_28_n_0\,
      O => \ascii_reg[4]_i_11_n_0\
    );
\ascii_reg[4]_i_12\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => morse(13),
      I1 => morse(16),
      O => \ascii_reg[4]_i_12_n_0\
    );
\ascii_reg[4]_i_13\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"EF"
    )
        port map (
      I0 => morse(3),
      I1 => morse(7),
      I2 => morse(1),
      O => \ascii_reg[4]_i_13_n_0\
    );
\ascii_reg[4]_i_14\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => morse(10),
      I1 => \^active_morse\,
      O => \ascii_reg[4]_i_14_n_0\
    );
\ascii_reg[4]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => \^active_morse\,
      I1 => morse(10),
      O => \ascii_reg[4]_i_2_n_0\
    );
\ascii_reg[4]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000008"
    )
        port map (
      I0 => \ascii_reg[4]_i_7_n_0\,
      I1 => \^active_morse\,
      I2 => morse(1),
      I3 => morse(10),
      I4 => morse(3),
      I5 => morse(7),
      O => \ascii_reg[4]_i_3_n_0\
    );
\ascii_reg[4]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"010101010101010F"
    )
        port map (
      I0 => \ascii_reg[4]_i_8_n_0\,
      I1 => \ascii_reg[4]_i_9_n_0\,
      I2 => \ascii_reg[6]_i_28_n_0\,
      I3 => \ascii_reg[3]_i_2_n_0\,
      I4 => \ascii_reg[6]_i_21_n_0\,
      I5 => \ascii_reg[6]_i_19_n_0\,
      O => \ascii_reg[4]_i_4_n_0\
    );
\ascii_reg[4]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => \ascii_reg[4]_i_10_n_0\,
      I1 => \ascii_reg[4]_i_2_n_0\,
      I2 => morse(9),
      I3 => morse(11),
      I4 => morse(14),
      I5 => morse(12),
      O => \ascii_reg[4]_i_5_n_0\
    );
\ascii_reg[4]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000C000000400000"
    )
        port map (
      I0 => morse(7),
      I1 => \ascii_reg[4]_i_11_n_0\,
      I2 => morse(3),
      I3 => \ascii_reg[6]_i_14_n_0\,
      I4 => morse(6),
      I5 => morse(8),
      O => \ascii_reg[4]_i_6_n_0\
    );
\ascii_reg[4]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000503"
    )
        port map (
      I0 => \ascii_reg[1]_i_9_n_0\,
      I1 => \ascii_reg[6]_i_28_n_0\,
      I2 => morse(8),
      I3 => morse(6),
      I4 => \ascii_reg[4]_i_12_n_0\,
      I5 => \ascii_reg[6]_i_39_n_0\,
      O => \ascii_reg[4]_i_7_n_0\
    );
\ascii_reg[4]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFBFFFFFFFF"
    )
        port map (
      I0 => morse(4),
      I1 => morse(2),
      I2 => \ascii_reg[6]_i_40_n_0\,
      I3 => \ascii_reg[4]_i_13_n_0\,
      I4 => \ascii_reg[4]_i_14_n_0\,
      I5 => morse(0),
      O => \ascii_reg[4]_i_8_n_0\
    );
\ascii_reg[4]_i_9\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => morse(6),
      I1 => morse(8),
      O => \ascii_reg[4]_i_9_n_0\
    );
\ascii_reg[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000000000005D"
    )
        port map (
      I0 => \^active_morse\,
      I1 => \ascii_reg[6]_i_12_n_0\,
      I2 => \ascii_reg[6]_i_11_n_0\,
      I3 => \ascii_reg[6]_i_10_n_0\,
      I4 => \ascii_reg[6]_i_9_n_0\,
      I5 => \ascii_reg[6]_i_8_n_0\,
      O => D(5)
    );
\ascii_reg[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFBBB"
    )
        port map (
      I0 => \ascii_reg[6]_i_3_n_0\,
      I1 => \ascii_reg[6]_i_4_n_0\,
      I2 => \ascii_reg[6]_i_5_n_0\,
      I3 => morse(10),
      I4 => \ascii_reg[6]_i_6_n_0\,
      I5 => \ascii_reg[6]_i_7_n_0\,
      O => E(0)
    );
\ascii_reg[6]_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF00002E00"
    )
        port map (
      I0 => morse(14),
      I1 => morse(16),
      I2 => morse(15),
      I3 => \^active_morse\,
      I4 => morse(9),
      I5 => \ascii_reg[6]_i_35_n_0\,
      O => \ascii_reg[6]_i_10_n_0\
    );
\ascii_reg[6]_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF7FFDFFFD"
    )
        port map (
      I0 => \ascii_reg[6]_i_36_n_0\,
      I1 => morse(8),
      I2 => morse(0),
      I3 => morse(6),
      I4 => morse(4),
      I5 => \ascii_reg[6]_i_37_n_0\,
      O => \ascii_reg[6]_i_11_n_0\
    );
\ascii_reg[6]_i_12\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0080AAAA"
    )
        port map (
      I0 => \ascii_reg[6]_i_38_n_0\,
      I1 => morse(3),
      I2 => morse(11),
      I3 => morse(17),
      I4 => morse(15),
      O => \ascii_reg[6]_i_12_n_0\
    );
\ascii_reg[6]_i_13\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => morse(10),
      I1 => morse(3),
      I2 => morse(7),
      O => \ascii_reg[6]_i_13_n_0\
    );
\ascii_reg[6]_i_14\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => morse(16),
      I1 => morse(13),
      I2 => \ascii_reg[6]_i_39_n_0\,
      O => \ascii_reg[6]_i_14_n_0\
    );
\ascii_reg[6]_i_15\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => morse(9),
      I1 => morse(11),
      I2 => morse(14),
      I3 => morse(12),
      O => \ascii_reg[6]_i_15_n_0\
    );
\ascii_reg[6]_i_16\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => morse(12),
      I1 => morse(14),
      I2 => morse(11),
      I3 => \ascii_reg[6]_i_18_n_0\,
      I4 => morse(8),
      I5 => morse(6),
      O => \ascii_reg[6]_i_16_n_0\
    );
\ascii_reg[6]_i_17\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAFEFFFE"
    )
        port map (
      I0 => \ascii_reg[6]_i_40_n_0\,
      I1 => morse(1),
      I2 => morse(4),
      I3 => morse(2),
      I4 => morse(0),
      O => \ascii_reg[6]_i_17_n_0\
    );
\ascii_reg[6]_i_18\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => morse(5),
      I1 => morse(9),
      O => \ascii_reg[6]_i_18_n_0\
    );
\ascii_reg[6]_i_19\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => morse(1),
      I1 => morse(7),
      O => \ascii_reg[6]_i_19_n_0\
    );
\ascii_reg[6]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFEFFFFFEFEFEFE"
    )
        port map (
      I0 => \ascii_reg[6]_i_8_n_0\,
      I1 => \ascii_reg[6]_i_9_n_0\,
      I2 => \ascii_reg[6]_i_10_n_0\,
      I3 => \ascii_reg[6]_i_11_n_0\,
      I4 => \ascii_reg[6]_i_12_n_0\,
      I5 => \^active_morse\,
      O => D(6)
    );
\ascii_reg[6]_i_20\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => morse(12),
      I1 => morse(11),
      I2 => morse(14),
      O => \ascii_reg[6]_i_20_n_0\
    );
\ascii_reg[6]_i_21\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFF7"
    )
        port map (
      I0 => morse(8),
      I1 => morse(6),
      I2 => \ascii_reg[6]_i_39_n_0\,
      I3 => morse(13),
      I4 => morse(16),
      O => \ascii_reg[6]_i_21_n_0\
    );
\ascii_reg[6]_i_22\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFEFFFFFFFFFFFF"
    )
        port map (
      I0 => morse(14),
      I1 => morse(16),
      I2 => morse(13),
      I3 => \ascii_reg[6]_i_39_n_0\,
      I4 => morse(6),
      I5 => morse(8),
      O => \ascii_reg[6]_i_22_n_0\
    );
\ascii_reg[6]_i_23\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00004000FFFFFFFF"
    )
        port map (
      I0 => \ascii_reg[1]_i_10_n_0\,
      I1 => morse(1),
      I2 => morse(12),
      I3 => morse(5),
      I4 => morse(9),
      I5 => \ascii_reg[6]_i_41_n_0\,
      O => \ascii_reg[6]_i_23_n_0\
    );
\ascii_reg[6]_i_24\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF79FFFF"
    )
        port map (
      I0 => morse(1),
      I1 => morse(13),
      I2 => morse(16),
      I3 => \ascii_reg[6]_i_39_n_0\,
      I4 => \ascii_reg[6]_i_42_n_0\,
      O => \ascii_reg[6]_i_24_n_0\
    );
\ascii_reg[6]_i_25\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFACFFFFFFF"
    )
        port map (
      I0 => \ascii_reg[6]_i_43_n_0\,
      I1 => \ascii_reg[6]_i_44_n_0\,
      I2 => morse(18),
      I3 => morse(17),
      I4 => morse(13),
      I5 => morse(15),
      O => \ascii_reg[6]_i_25_n_0\
    );
\ascii_reg[6]_i_26\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => morse(16),
      I1 => morse(4),
      I2 => morse(2),
      I3 => morse(0),
      O => \ascii_reg[6]_i_26_n_0\
    );
\ascii_reg[6]_i_27\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => morse(12),
      I1 => morse(14),
      I2 => morse(6),
      I3 => morse(8),
      O => \ascii_reg[6]_i_27_n_0\
    );
\ascii_reg[6]_i_28\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => morse(9),
      I1 => morse(5),
      I2 => morse(11),
      I3 => morse(14),
      I4 => morse(12),
      O => \ascii_reg[6]_i_28_n_0\
    );
\ascii_reg[6]_i_29\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FEFF"
    )
        port map (
      I0 => morse(11),
      I1 => morse(14),
      I2 => morse(12),
      I3 => morse(10),
      O => \ascii_reg[6]_i_29_n_0\
    );
\ascii_reg[6]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00200020AAAA0020"
    )
        port map (
      I0 => \ascii_reg[6]_i_13_n_0\,
      I1 => \ascii_reg[6]_i_14_n_0\,
      I2 => morse(6),
      I3 => \ascii_reg[6]_i_15_n_0\,
      I4 => \ascii_reg[6]_i_16_n_0\,
      I5 => \ascii_reg[6]_i_17_n_0\,
      O => \ascii_reg[6]_i_3_n_0\
    );
\ascii_reg[6]_i_30\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => morse(8),
      I1 => \ascii_reg[6]_i_39_n_0\,
      I2 => morse(13),
      I3 => morse(16),
      O => \ascii_reg[6]_i_30_n_0\
    );
\ascii_reg[6]_i_31\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => morse(1),
      I1 => morse(12),
      I2 => morse(14),
      I3 => morse(11),
      I4 => morse(5),
      I5 => morse(9),
      O => \ascii_reg[6]_i_31_n_0\
    );
\ascii_reg[6]_i_32\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F0808080"
    )
        port map (
      I0 => morse(15),
      I1 => morse(9),
      I2 => \^active_morse\,
      I3 => morse(11),
      I4 => morse(13),
      O => \ascii_reg[6]_i_32_n_0\
    );
\ascii_reg[6]_i_33\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000040"
    )
        port map (
      I0 => morse(16),
      I1 => morse(14),
      I2 => \^active_morse\,
      I3 => morse(1),
      I4 => morse(13),
      O => \ascii_reg[6]_i_33_n_0\
    );
\ascii_reg[6]_i_34\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FAFABAFAAAEAAAEA"
    )
        port map (
      I0 => \ascii_reg[6]_i_45_n_0\,
      I1 => morse(12),
      I2 => \^active_morse\,
      I3 => morse(10),
      I4 => morse(11),
      I5 => morse(5),
      O => \ascii_reg[6]_i_34_n_0\
    );
\ascii_reg[6]_i_35\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"50F0F040"
    )
        port map (
      I0 => morse(16),
      I1 => morse(15),
      I2 => \^active_morse\,
      I3 => morse(17),
      I4 => morse(18),
      O => \ascii_reg[6]_i_35_n_0\
    );
\ascii_reg[6]_i_36\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00A1"
    )
        port map (
      I0 => morse(0),
      I1 => morse(4),
      I2 => morse(2),
      I3 => \ascii_reg[6]_i_46_n_0\,
      O => \ascii_reg[6]_i_36_n_0\
    );
\ascii_reg[6]_i_37\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4444404044FF4040"
    )
        port map (
      I0 => morse(14),
      I1 => morse(9),
      I2 => morse(1),
      I3 => morse(11),
      I4 => morse(12),
      I5 => morse(5),
      O => \ascii_reg[6]_i_37_n_0\
    );
\ascii_reg[6]_i_38\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"E0C0F0FF"
    )
        port map (
      I0 => morse(1),
      I1 => morse(15),
      I2 => morse(14),
      I3 => morse(13),
      I4 => morse(16),
      O => \ascii_reg[6]_i_38_n_0\
    );
\ascii_reg[6]_i_39\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFF7F"
    )
        port map (
      I0 => morse(4),
      I1 => morse(2),
      I2 => morse(0),
      I3 => morse(17),
      I4 => morse(18),
      I5 => morse(15),
      O => \ascii_reg[6]_i_39_n_0\
    );
\ascii_reg[6]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAA8AAAAAA"
    )
        port map (
      I0 => \^active_morse\,
      I1 => \ascii_reg[6]_i_18_n_0\,
      I2 => \ascii_reg[6]_i_19_n_0\,
      I3 => \ascii_reg[6]_i_20_n_0\,
      I4 => morse(10),
      I5 => \ascii_reg[6]_i_21_n_0\,
      O => \ascii_reg[6]_i_4_n_0\
    );
\ascii_reg[6]_i_40\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => morse(16),
      I1 => morse(13),
      I2 => morse(17),
      I3 => morse(18),
      I4 => morse(15),
      O => \ascii_reg[6]_i_40_n_0\
    );
\ascii_reg[6]_i_41\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFEFFFFBFFF"
    )
        port map (
      I0 => morse(3),
      I1 => morse(12),
      I2 => morse(7),
      I3 => morse(11),
      I4 => morse(5),
      I5 => morse(9),
      O => \ascii_reg[6]_i_41_n_0\
    );
\ascii_reg[6]_i_42\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00001000"
    )
        port map (
      I0 => morse(3),
      I1 => morse(7),
      I2 => morse(5),
      I3 => morse(9),
      I4 => morse(11),
      O => \ascii_reg[6]_i_42_n_0\
    );
\ascii_reg[6]_i_43\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFF7FFFF"
    )
        port map (
      I0 => morse(7),
      I1 => morse(11),
      I2 => morse(5),
      I3 => morse(9),
      I4 => morse(3),
      I5 => morse(1),
      O => \ascii_reg[6]_i_43_n_0\
    );
\ascii_reg[6]_i_44\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFDFFFFFFFFFF"
    )
        port map (
      I0 => morse(1),
      I1 => morse(3),
      I2 => morse(7),
      I3 => morse(5),
      I4 => morse(11),
      I5 => morse(9),
      O => \ascii_reg[6]_i_44_n_0\
    );
\ascii_reg[6]_i_45\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2222FFF200000000"
    )
        port map (
      I0 => morse(3),
      I1 => morse(15),
      I2 => morse(9),
      I3 => morse(1),
      I4 => morse(10),
      I5 => \^active_morse\,
      O => \ascii_reg[6]_i_45_n_0\
    );
\ascii_reg[6]_i_46\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"54FF545454545454"
    )
        port map (
      I0 => morse(12),
      I1 => morse(11),
      I2 => morse(14),
      I3 => morse(16),
      I4 => morse(13),
      I5 => morse(1),
      O => \ascii_reg[6]_i_46_n_0\
    );
\ascii_reg[6]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4FFF4F4F44444444"
    )
        port map (
      I0 => \ascii_reg[6]_i_22_n_0\,
      I1 => \ascii_reg[6]_i_23_n_0\,
      I2 => \ascii_reg[6]_i_24_n_0\,
      I3 => \ascii_reg[6]_i_25_n_0\,
      I4 => \ascii_reg[6]_i_26_n_0\,
      I5 => \ascii_reg[6]_i_27_n_0\,
      O => \ascii_reg[6]_i_5_n_0\
    );
\ascii_reg[6]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000005000700"
    )
        port map (
      I0 => \ascii_reg[6]_i_28_n_0\,
      I1 => \ascii_reg[6]_i_29_n_0\,
      I2 => \ascii_reg[6]_i_21_n_0\,
      I3 => morse(1),
      I4 => morse(7),
      I5 => morse(3),
      O => \ascii_reg[6]_i_6_n_0\
    );
\ascii_reg[6]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000020230003333"
    )
        port map (
      I0 => \ascii_reg[6]_i_30_n_0\,
      I1 => \ascii_reg[6]_i_31_n_0\,
      I2 => morse(7),
      I3 => morse(3),
      I4 => morse(10),
      I5 => \ascii_reg[6]_i_21_n_0\,
      O => \ascii_reg[6]_i_7_n_0\
    );
\ascii_reg[6]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFA828"
    )
        port map (
      I0 => \^active_morse\,
      I1 => morse(11),
      I2 => morse(7),
      I3 => morse(1),
      I4 => \ascii_reg[6]_i_32_n_0\,
      I5 => \ascii_reg[6]_i_33_n_0\,
      O => \ascii_reg[6]_i_8_n_0\
    );
\ascii_reg[6]_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF00015555"
    )
        port map (
      I0 => \ascii_reg[4]_i_2_n_0\,
      I1 => morse(9),
      I2 => morse(1),
      I3 => morse(11),
      I4 => morse(0),
      I5 => \ascii_reg[6]_i_34_n_0\,
      O => \ascii_reg[6]_i_9_n_0\
    );
\count[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BAAAAAAAAABAAAAA"
    )
        port map (
      I0 => \count[2]_i_2_n_0\,
      I1 => \count[0]_i_2_n_0\,
      I2 => \zcount[1]_i_6_n_0\,
      I3 => \count_reg_n_0_[1]\,
      I4 => zcount(0),
      I5 => zcount(1),
      O => \count[0]_i_1_n_0\
    );
\count[0]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => \count_reg_n_0_[2]\,
      I1 => \count_reg_n_0_[3]\,
      I2 => \count_reg_n_0_[4]\,
      O => \count[0]_i_2_n_0\
    );
\count[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFAABA"
    )
        port map (
      I0 => \count[1]_i_2_n_0\,
      I1 => \count[4]_i_3_n_0\,
      I2 => \count_reg_n_0_[3]\,
      I3 => \count[1]_i_3_n_0\,
      I4 => \count[1]_i_4_n_0\,
      I5 => \count[1]_i_5_n_0\,
      O => \count[1]_i_1_n_0\
    );
\count[1]_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000DFDFFFDF"
    )
        port map (
      I0 => \count_reg_n_0_[4]\,
      I1 => \count_reg_n_0_[3]\,
      I2 => \count_reg_n_0_[2]\,
      I3 => rbutton_i_IBUF,
      I4 => rbutton_del,
      I5 => zcount(1),
      O => \count[1]_i_10_n_0\
    );
\count[1]_i_11\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"DF"
    )
        port map (
      I0 => \count_reg_n_0_[0]\,
      I1 => \count_reg_n_0_[1]\,
      I2 => \count_reg_n_0_[2]\,
      O => \count[1]_i_11_n_0\
    );
\count[1]_i_12\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => rbutton_del,
      I1 => rbutton_i_IBUF,
      I2 => zcount(1),
      O => \count[1]_i_12_n_0\
    );
\count[1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000BA8A8A8A"
    )
        port map (
      I0 => \count[1]_i_6_n_0\,
      I1 => \count_reg_n_0_[4]\,
      I2 => zcount(0),
      I3 => zcount(1),
      I4 => \zcount[1]_i_5_n_0\,
      I5 => \count[1]_i_3_n_0\,
      O => \count[1]_i_2_n_0\
    );
\count[1]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => \count_reg_n_0_[1]\,
      I1 => \count_reg_n_0_[0]\,
      O => \count[1]_i_3_n_0\
    );
\count[1]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1110110000100010"
    )
        port map (
      I0 => \count_reg_n_0_[2]\,
      I1 => \count[1]_i_3_n_0\,
      I2 => \zcount[1]_i_5_n_0\,
      I3 => \zcount[1]_i_6_n_0\,
      I4 => zcount(0),
      I5 => zcount(1),
      O => \count[1]_i_4_n_0\
    );
\count[1]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F1F1F1F1F1F1F1FF"
    )
        port map (
      I0 => \count[1]_i_7_n_0\,
      I1 => \morse[6]_i_2_n_0\,
      I2 => \count[1]_i_8_n_0\,
      I3 => \zcount[1]_i_5_n_0\,
      I4 => zcount(0),
      I5 => \count[1]_i_9_n_0\,
      O => \count[1]_i_5_n_0\
    );
\count[1]_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => lbutton_del,
      I1 => lbutton_i_IBUF,
      I2 => \count_reg_n_0_[2]\,
      O => \count[1]_i_6_n_0\
    );
\count[1]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000000001FFFF"
    )
        port map (
      I0 => zcount(0),
      I1 => \count_reg_n_0_[4]\,
      I2 => \count_reg_n_0_[3]\,
      I3 => \count_reg_n_0_[2]\,
      I4 => \count[4]_i_9_n_0\,
      I5 => \count[1]_i_10_n_0\,
      O => \count[1]_i_7_n_0\
    );
\count[1]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"888F888F888F8888"
    )
        port map (
      I0 => \morse[3]_i_4_n_0\,
      I1 => \count[4]_i_8_n_0\,
      I2 => \count_reg_n_0_[4]\,
      I3 => \count[1]_i_11_n_0\,
      I4 => \zcount[1]_i_6_n_0\,
      I5 => \count[1]_i_12_n_0\,
      O => \count[1]_i_8_n_0\
    );
\count[1]_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF2FFF3FFF2F0F0F"
    )
        port map (
      I0 => \count_reg_n_0_[4]\,
      I1 => \count_reg_n_0_[3]\,
      I2 => \count_reg_n_0_[1]\,
      I3 => \count_reg_n_0_[0]\,
      I4 => \count_reg_n_0_[2]\,
      I5 => \zcount[1]_i_6_n_0\,
      O => \count[1]_i_9_n_0\
    );
\count[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFF0B0000"
    )
        port map (
      I0 => \count_reg_n_0_[3]\,
      I1 => \count_reg_n_0_[4]\,
      I2 => \count[4]_i_4_n_0\,
      I3 => \count[2]_i_2_n_0\,
      I4 => \count_reg_n_0_[2]\,
      I5 => \count[2]_i_3_n_0\,
      O => \count[2]_i_1_n_0\
    );
\count[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"07000707F0FDF0F0"
    )
        port map (
      I0 => zcount(1),
      I1 => zcount(0),
      I2 => \zcount[1]_i_6_n_0\,
      I3 => rbutton_del,
      I4 => rbutton_i_IBUF,
      I5 => \count_reg_n_0_[0]\,
      O => \count[2]_i_2_n_0\
    );
\count[2]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0F000044"
    )
        port map (
      I0 => \count[2]_i_4_n_0\,
      I1 => \count_reg_n_0_[2]\,
      I2 => \count[2]_i_5_n_0\,
      I3 => \count_reg_n_0_[0]\,
      I4 => \count_reg_n_0_[1]\,
      O => \count[2]_i_3_n_0\
    );
\count[2]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"AA08"
    )
        port map (
      I0 => zcount(1),
      I1 => rbutton_i_IBUF,
      I2 => rbutton_del,
      I3 => zcount(0),
      O => \count[2]_i_4_n_0\
    );
\count[2]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"DDFCCCFFDCFCCCFC"
    )
        port map (
      I0 => \count[2]_i_6_n_0\,
      I1 => \count_reg_n_0_[2]\,
      I2 => \morse[16]_i_3_n_0\,
      I3 => \zcount[1]_i_6_n_0\,
      I4 => zcount(0),
      I5 => zcount(1),
      O => \count[2]_i_5_n_0\
    );
\count[2]_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \count_reg_n_0_[4]\,
      I1 => \count_reg_n_0_[3]\,
      O => \count[2]_i_6_n_0\
    );
\count[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"54535757A8A0A8A8"
    )
        port map (
      I0 => \count[4]_i_2_n_0\,
      I1 => \zcount[1]_i_5_n_0\,
      I2 => \zcount[1]_i_6_n_0\,
      I3 => zcount(0),
      I4 => zcount(1),
      I5 => \count_reg_n_0_[3]\,
      O => \count[3]_i_1_n_0\
    );
\count[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF0200F200"
    )
        port map (
      I0 => \count[4]_i_2_n_0\,
      I1 => \count[4]_i_3_n_0\,
      I2 => \count_reg_n_0_[4]\,
      I3 => \count_reg_n_0_[3]\,
      I4 => \count[4]_i_4_n_0\,
      I5 => \count[4]_i_5_n_0\,
      O => \count[4]_i_1_n_0\
    );
\count[4]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => \count_reg_n_0_[1]\,
      I1 => \count_reg_n_0_[0]\,
      I2 => \count_reg_n_0_[2]\,
      O => \count[4]_i_2_n_0\
    );
\count[4]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0FF2022F0FFF0FF"
    )
        port map (
      I0 => zcount(1),
      I1 => zcount(0),
      I2 => lbutton_del,
      I3 => lbutton_i_IBUF,
      I4 => rbutton_del,
      I5 => rbutton_i_IBUF,
      O => \count[4]_i_3_n_0\
    );
\count[4]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCDCDCDCC0D0D000"
    )
        port map (
      I0 => \zcount[1]_i_6_n_0\,
      I1 => \count_reg_n_0_[1]\,
      I2 => zcount(1),
      I3 => \zcount[1]_i_5_n_0\,
      I4 => zcount(0),
      I5 => \count_reg_n_0_[0]\,
      O => \count[4]_i_4_n_0\
    );
\count[4]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF04FF00000000"
    )
        port map (
      I0 => zcount(1),
      I1 => \morse[3]_i_4_n_0\,
      I2 => \count_reg_n_0_[3]\,
      I3 => \count[4]_i_6_n_0\,
      I4 => \count[4]_i_7_n_0\,
      I5 => \count_reg_n_0_[4]\,
      O => \count[4]_i_5_n_0\
    );
\count[4]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFAF8AA00AA88"
    )
        port map (
      I0 => \count_reg_n_0_[2]\,
      I1 => \count_reg_n_0_[1]\,
      I2 => zcount(0),
      I3 => \count_reg_n_0_[0]\,
      I4 => \zcount[1]_i_5_n_0\,
      I5 => zcount(1),
      O => \count[4]_i_6_n_0\
    );
\count[4]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BFFFBFBF88888888"
    )
        port map (
      I0 => \count[4]_i_8_n_0\,
      I1 => \count_reg_n_0_[0]\,
      I2 => \count_reg_n_0_[2]\,
      I3 => \count_reg_n_0_[3]\,
      I4 => \count_reg_n_0_[1]\,
      I5 => \count[4]_i_9_n_0\,
      O => \count[4]_i_7_n_0\
    );
\count[4]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000DD0DDD0DDD0D"
    )
        port map (
      I0 => rbutton_i_IBUF,
      I1 => rbutton_del,
      I2 => lbutton_i_IBUF,
      I3 => lbutton_del,
      I4 => zcount(0),
      I5 => zcount(1),
      O => \count[4]_i_8_n_0\
    );
\count[4]_i_9\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"22F200F0"
    )
        port map (
      I0 => rbutton_i_IBUF,
      I1 => rbutton_del,
      I2 => lbutton_i_IBUF,
      I3 => lbutton_del,
      I4 => zcount(0),
      O => \count[4]_i_9_n_0\
    );
\count_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => p_0_in,
      CLR => AR(0),
      D => \count[0]_i_1_n_0\,
      Q => \count_reg_n_0_[0]\
    );
\count_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => p_0_in,
      CLR => AR(0),
      D => \count[1]_i_1_n_0\,
      Q => \count_reg_n_0_[1]\
    );
\count_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => p_0_in,
      CLR => AR(0),
      D => \count[2]_i_1_n_0\,
      Q => \count_reg_n_0_[2]\
    );
\count_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => p_0_in,
      CLR => AR(0),
      D => \count[3]_i_1_n_0\,
      Q => \count_reg_n_0_[3]\
    );
\count_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => p_0_in,
      CLR => AR(0),
      D => \count[4]_i_1_n_0\,
      Q => \count_reg_n_0_[4]\
    );
lbutton_del_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => lbutton_i_IBUF,
      Q => lbutton_del
    );
\morse[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAABBBAAAAA888"
    )
        port map (
      I0 => p_1_in(21),
      I1 => \morse[0]_i_3_n_0\,
      I2 => \morse[0]_i_4_n_0\,
      I3 => \morse[0]_i_5_n_0\,
      I4 => \morse[0]_i_6_n_0\,
      I5 => morse(0),
      O => \morse[0]_i_1_n_0\
    );
\morse[0]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => lbutton_del,
      I1 => lbutton_i_IBUF,
      I2 => \^active_morse\,
      O => p_1_in(21)
    );
\morse[0]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80220A00"
    )
        port map (
      I0 => \morse[0]_i_7_n_0\,
      I1 => \count_reg_n_0_[1]\,
      I2 => \count_reg_n_0_[0]\,
      I3 => zcount(1),
      I4 => zcount(0),
      O => \morse[0]_i_3_n_0\
    );
\morse[0]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => \count_reg_n_0_[3]\,
      I1 => \count_reg_n_0_[4]\,
      I2 => \^active_morse\,
      I3 => \count_reg_n_0_[2]\,
      O => \morse[0]_i_4_n_0\
    );
\morse[0]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0010001011110010"
    )
        port map (
      I0 => \count_reg_n_0_[1]\,
      I1 => \count_reg_n_0_[0]\,
      I2 => rbutton_i_IBUF,
      I3 => rbutton_del,
      I4 => lbutton_i_IBUF,
      I5 => lbutton_del,
      O => \morse[0]_i_5_n_0\
    );
\morse[0]_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0400"
    )
        port map (
      I0 => \active_cnt_reg_n_0_[1]\,
      I1 => \active_cnt_reg_n_0_[2]\,
      I2 => \active_cnt_reg_n_0_[0]\,
      I3 => \^active_morse\,
      O => \morse[0]_i_6_n_0\
    );
\morse[0]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000004"
    )
        port map (
      I0 => \^active_morse\,
      I1 => lbutton_i_IBUF,
      I2 => lbutton_del,
      I3 => \count_reg_n_0_[4]\,
      I4 => \count_reg_n_0_[3]\,
      I5 => \count_reg_n_0_[2]\,
      O => \morse[0]_i_7_n_0\
    );
\morse[10]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BBBBBBBA8888888A"
    )
        port map (
      I0 => p_1_in(21),
      I1 => \morse[0]_i_6_n_0\,
      I2 => \count_reg_n_0_[2]\,
      I3 => \morse[9]_i_2_n_0\,
      I4 => \morse[6]_i_2_n_0\,
      I5 => morse(10),
      O => \morse[10]_i_1_n_0\
    );
\morse[11]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BBBABBBB888A8888"
    )
        port map (
      I0 => p_1_in(21),
      I1 => \morse[0]_i_6_n_0\,
      I2 => \count_reg_n_0_[2]\,
      I3 => \morse[9]_i_2_n_0\,
      I4 => \morse[3]_i_4_n_0\,
      I5 => morse(11),
      O => \morse[11]_i_1_n_0\
    );
\morse[12]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BABBBBBB8A888888"
    )
        port map (
      I0 => p_1_in(21),
      I1 => \morse[0]_i_6_n_0\,
      I2 => \morse[9]_i_2_n_0\,
      I3 => \morse[4]_i_3_n_0\,
      I4 => \count_reg_n_0_[2]\,
      I5 => morse(12),
      O => \morse[12]_i_1_n_0\
    );
\morse[13]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BBBABBBB888A8888"
    )
        port map (
      I0 => p_1_in(21),
      I1 => \morse[0]_i_6_n_0\,
      I2 => \morse[9]_i_2_n_0\,
      I3 => \count[1]_i_3_n_0\,
      I4 => \count_reg_n_0_[2]\,
      I5 => morse(13),
      O => \morse[13]_i_1_n_0\
    );
\morse[14]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BBBABBBB888A8888"
    )
        port map (
      I0 => p_1_in(21),
      I1 => \morse[0]_i_6_n_0\,
      I2 => \morse[9]_i_2_n_0\,
      I3 => \morse[6]_i_2_n_0\,
      I4 => \count_reg_n_0_[2]\,
      I5 => morse(14),
      O => \morse[14]_i_1_n_0\
    );
\morse[15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BABBBBBB8A888888"
    )
        port map (
      I0 => p_1_in(21),
      I1 => \morse[0]_i_6_n_0\,
      I2 => \morse[9]_i_2_n_0\,
      I3 => \morse[3]_i_4_n_0\,
      I4 => \count_reg_n_0_[2]\,
      I5 => morse(15),
      O => \morse[15]_i_1_n_0\
    );
\morse[16]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BBBBBABB88888A88"
    )
        port map (
      I0 => p_1_in(21),
      I1 => \morse[0]_i_6_n_0\,
      I2 => \morse[16]_i_2_n_0\,
      I3 => \morse[4]_i_3_n_0\,
      I4 => \morse[16]_i_3_n_0\,
      I5 => morse(16),
      O => \morse[16]_i_1_n_0\
    );
\morse[16]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFD"
    )
        port map (
      I0 => \count_reg_n_0_[4]\,
      I1 => \count_reg_n_0_[3]\,
      I2 => \^active_morse\,
      I3 => \count_reg_n_0_[2]\,
      O => \morse[16]_i_2_n_0\
    );
\morse[16]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B0BB"
    )
        port map (
      I0 => lbutton_del,
      I1 => lbutton_i_IBUF,
      I2 => rbutton_del,
      I3 => rbutton_i_IBUF,
      O => \morse[16]_i_3_n_0\
    );
\morse[17]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BBBBBBBA8888888A"
    )
        port map (
      I0 => p_1_in(21),
      I1 => \morse[0]_i_6_n_0\,
      I2 => \count[1]_i_3_n_0\,
      I3 => \morse[16]_i_2_n_0\,
      I4 => \morse[16]_i_3_n_0\,
      I5 => morse(17),
      O => \morse[17]_i_1_n_0\
    );
\morse[18]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BBBBBBBA8888888A"
    )
        port map (
      I0 => p_1_in(21),
      I1 => \morse[0]_i_6_n_0\,
      I2 => \morse[6]_i_2_n_0\,
      I3 => \morse[16]_i_2_n_0\,
      I4 => \morse[16]_i_3_n_0\,
      I5 => morse(18),
      O => \morse[18]_i_1_n_0\
    );
\morse[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"040404FF04040400"
    )
        port map (
      I0 => lbutton_del,
      I1 => lbutton_i_IBUF,
      I2 => \^active_morse\,
      I3 => \morse[0]_i_6_n_0\,
      I4 => \morse[1]_i_2_n_0\,
      I5 => morse(1),
      O => \morse[1]_i_1_n_0\
    );
\morse[1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000FFB00000"
    )
        port map (
      I0 => zcount(1),
      I1 => zcount(0),
      I2 => \morse[0]_i_7_n_0\,
      I3 => \morse[3]_i_2_n_0\,
      I4 => \count_reg_n_0_[0]\,
      I5 => \count_reg_n_0_[1]\,
      O => \morse[1]_i_2_n_0\
    );
\morse[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"040404FF04040400"
    )
        port map (
      I0 => lbutton_del,
      I1 => lbutton_i_IBUF,
      I2 => \^active_morse\,
      I3 => \morse[0]_i_6_n_0\,
      I4 => \morse[2]_i_2_n_0\,
      I5 => morse(2),
      O => \morse[2]_i_1_n_0\
    );
\morse[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2222222220002020"
    )
        port map (
      I0 => \count_reg_n_0_[1]\,
      I1 => \count_reg_n_0_[0]\,
      I2 => \morse[0]_i_7_n_0\,
      I3 => zcount(0),
      I4 => zcount(1),
      I5 => \morse[3]_i_2_n_0\,
      O => \morse[2]_i_2_n_0\
    );
\morse[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAABBBBBAAA88888"
    )
        port map (
      I0 => p_1_in(21),
      I1 => \morse[0]_i_6_n_0\,
      I2 => \morse[3]_i_2_n_0\,
      I3 => \morse[3]_i_3_n_0\,
      I4 => \morse[3]_i_4_n_0\,
      I5 => morse(3),
      O => \morse[3]_i_1_n_0\
    );
\morse[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000004"
    )
        port map (
      I0 => \zcount[1]_i_6_n_0\,
      I1 => \zcount[1]_i_5_n_0\,
      I2 => \count_reg_n_0_[2]\,
      I3 => \^active_morse\,
      I4 => \count_reg_n_0_[4]\,
      I5 => \count_reg_n_0_[3]\,
      O => \morse[3]_i_2_n_0\
    );
\morse[3]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000010001000100"
    )
        port map (
      I0 => \count_reg_n_0_[2]\,
      I1 => \count_reg_n_0_[3]\,
      I2 => \count_reg_n_0_[4]\,
      I3 => p_1_in(21),
      I4 => zcount(0),
      I5 => zcount(1),
      O => \morse[3]_i_3_n_0\
    );
\morse[3]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \count_reg_n_0_[0]\,
      I1 => \count_reg_n_0_[1]\,
      O => \morse[3]_i_4_n_0\
    );
\morse[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BABBBBBB8A888888"
    )
        port map (
      I0 => p_1_in(21),
      I1 => \morse[0]_i_6_n_0\,
      I2 => \morse[4]_i_2_n_0\,
      I3 => \morse[4]_i_3_n_0\,
      I4 => \count_reg_n_0_[2]\,
      I5 => morse(4),
      O => \morse[4]_i_1_n_0\
    );
\morse[4]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \morse[16]_i_3_n_0\,
      I1 => \count_reg_n_0_[4]\,
      I2 => \count_reg_n_0_[3]\,
      I3 => \^active_morse\,
      O => \morse[4]_i_2_n_0\
    );
\morse[4]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \count_reg_n_0_[0]\,
      I1 => \count_reg_n_0_[1]\,
      O => \morse[4]_i_3_n_0\
    );
\morse[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BBBABBBB888A8888"
    )
        port map (
      I0 => p_1_in(21),
      I1 => \morse[0]_i_6_n_0\,
      I2 => \morse[4]_i_2_n_0\,
      I3 => \count[1]_i_3_n_0\,
      I4 => \count_reg_n_0_[2]\,
      I5 => morse(5),
      O => \morse[5]_i_1_n_0\
    );
\morse[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BBBABBBB888A8888"
    )
        port map (
      I0 => p_1_in(21),
      I1 => \morse[0]_i_6_n_0\,
      I2 => \morse[4]_i_2_n_0\,
      I3 => \morse[6]_i_2_n_0\,
      I4 => \count_reg_n_0_[2]\,
      I5 => morse(6),
      O => \morse[6]_i_1_n_0\
    );
\morse[6]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => \count_reg_n_0_[0]\,
      I1 => \count_reg_n_0_[1]\,
      O => \morse[6]_i_2_n_0\
    );
\morse[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BABBBBBB8A888888"
    )
        port map (
      I0 => p_1_in(21),
      I1 => \morse[0]_i_6_n_0\,
      I2 => \morse[4]_i_2_n_0\,
      I3 => \morse[3]_i_4_n_0\,
      I4 => \count_reg_n_0_[2]\,
      I5 => morse(7),
      O => \morse[7]_i_1_n_0\
    );
\morse[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BBBBBBBA8888888A"
    )
        port map (
      I0 => p_1_in(21),
      I1 => \morse[0]_i_6_n_0\,
      I2 => \morse[8]_i_2_n_0\,
      I3 => \count_reg_n_0_[0]\,
      I4 => \count_reg_n_0_[1]\,
      I5 => morse(8),
      O => \morse[8]_i_1_n_0\
    );
\morse[8]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFEF"
    )
        port map (
      I0 => \count_reg_n_0_[2]\,
      I1 => \^active_morse\,
      I2 => \count_reg_n_0_[3]\,
      I3 => \count_reg_n_0_[4]\,
      I4 => \morse[16]_i_3_n_0\,
      O => \morse[8]_i_2_n_0\
    );
\morse[9]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BBBBBBBA8888888A"
    )
        port map (
      I0 => p_1_in(21),
      I1 => \morse[0]_i_6_n_0\,
      I2 => \morse[9]_i_2_n_0\,
      I3 => \count_reg_n_0_[2]\,
      I4 => \count[1]_i_3_n_0\,
      I5 => morse(9),
      O => \morse[9]_i_1_n_0\
    );
\morse[9]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFEF"
    )
        port map (
      I0 => \morse[16]_i_3_n_0\,
      I1 => \count_reg_n_0_[4]\,
      I2 => \count_reg_n_0_[3]\,
      I3 => \^active_morse\,
      O => \morse[9]_i_2_n_0\
    );
\morse_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \morse[0]_i_1_n_0\,
      Q => morse(0)
    );
\morse_reg[10]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \morse[10]_i_1_n_0\,
      Q => morse(10)
    );
\morse_reg[11]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \morse[11]_i_1_n_0\,
      Q => morse(11)
    );
\morse_reg[12]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \morse[12]_i_1_n_0\,
      Q => morse(12)
    );
\morse_reg[13]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \morse[13]_i_1_n_0\,
      Q => morse(13)
    );
\morse_reg[14]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \morse[14]_i_1_n_0\,
      Q => morse(14)
    );
\morse_reg[15]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \morse[15]_i_1_n_0\,
      Q => morse(15)
    );
\morse_reg[16]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \morse[16]_i_1_n_0\,
      Q => morse(16)
    );
\morse_reg[17]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \morse[17]_i_1_n_0\,
      Q => morse(17)
    );
\morse_reg[18]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \morse[18]_i_1_n_0\,
      Q => morse(18)
    );
\morse_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \morse[1]_i_1_n_0\,
      Q => morse(1)
    );
\morse_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \morse[2]_i_1_n_0\,
      Q => morse(2)
    );
\morse_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \morse[3]_i_1_n_0\,
      Q => morse(3)
    );
\morse_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \morse[4]_i_1_n_0\,
      Q => morse(4)
    );
\morse_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \morse[5]_i_1_n_0\,
      Q => morse(5)
    );
\morse_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \morse[6]_i_1_n_0\,
      Q => morse(6)
    );
\morse_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \morse[7]_i_1_n_0\,
      Q => morse(7)
    );
\morse_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \morse[8]_i_1_n_0\,
      Q => morse(8)
    );
\morse_reg[9]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \morse[9]_i_1_n_0\,
      Q => morse(9)
    );
rbutton_del_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => rbutton_i_IBUF,
      Q => rbutton_del
    );
\zcount[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000300000050"
    )
        port map (
      I0 => \zcount[1]_i_3_n_0\,
      I1 => \zcount[1]_i_4_n_0\,
      I2 => \zcount[1]_i_5_n_0\,
      I3 => \zcount[1]_i_6_n_0\,
      I4 => zcount(1),
      I5 => zcount(0),
      O => \zcount[0]_i_1_n_0\
    );
\zcount[1]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^active_morse\,
      O => p_0_in
    );
\zcount[1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000500300"
    )
        port map (
      I0 => \zcount[1]_i_3_n_0\,
      I1 => \zcount[1]_i_4_n_0\,
      I2 => zcount(0),
      I3 => zcount(1),
      I4 => \zcount[1]_i_5_n_0\,
      I5 => \zcount[1]_i_6_n_0\,
      O => \zcount[1]_i_2_n_0\
    );
\zcount[1]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00200000"
    )
        port map (
      I0 => \count_reg_n_0_[4]\,
      I1 => \count_reg_n_0_[3]\,
      I2 => \count_reg_n_0_[2]\,
      I3 => \count_reg_n_0_[1]\,
      I4 => \count_reg_n_0_[0]\,
      O => \zcount[1]_i_3_n_0\
    );
\zcount[1]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00200000"
    )
        port map (
      I0 => \count_reg_n_0_[4]\,
      I1 => \count_reg_n_0_[3]\,
      I2 => \count_reg_n_0_[2]\,
      I3 => \count_reg_n_0_[0]\,
      I4 => \count_reg_n_0_[1]\,
      O => \zcount[1]_i_4_n_0\
    );
\zcount[1]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => rbutton_i_IBUF,
      I1 => rbutton_del,
      O => \zcount[1]_i_5_n_0\
    );
\zcount[1]_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => lbutton_i_IBUF,
      I1 => lbutton_del,
      O => \zcount[1]_i_6_n_0\
    );
\zcount_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => p_0_in,
      CLR => AR(0),
      D => \zcount[0]_i_1_n_0\,
      Q => zcount(0)
    );
\zcount_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => p_0_in,
      CLR => AR(0),
      D => \zcount[1]_i_2_n_0\,
      Q => zcount(1)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity morse_decoder_top is
  port (
    clk_i : in STD_LOGIC;
    reset_i : in STD_LOGIC;
    lbutton_i : in STD_LOGIC;
    rbutton_i : in STD_LOGIC;
    seg_display_o : out STD_LOGIC_VECTOR ( 6 downto 0 );
    char_n_o : out STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of morse_decoder_top : entity is true;
  attribute ECO_CHECKSUM : string;
  attribute ECO_CHECKSUM of morse_decoder_top : entity is "153bb370";
end morse_decoder_top;

architecture STRUCTURE of morse_decoder_top is
  signal active_morse : STD_LOGIC;
  signal ascii_reg : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal char_n_o_OBUF : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal clk_i_IBUF : STD_LOGIC;
  signal clk_i_IBUF_BUFG : STD_LOGIC;
  signal lbutton_i_IBUF : STD_LOGIC;
  signal new_letter_reg : STD_LOGIC;
  signal rbutton_i_IBUF : STD_LOGIC;
  signal reset_i_IBUF : STD_LOGIC;
  signal seg_display_o_OBUF : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal u1_n_1 : STD_LOGIC;
  signal u1_n_2 : STD_LOGIC;
  signal u1_n_3 : STD_LOGIC;
  signal u1_n_4 : STD_LOGIC;
  signal u1_n_5 : STD_LOGIC;
  signal u1_n_6 : STD_LOGIC;
  signal u1_n_7 : STD_LOGIC;
  signal u1_n_8 : STD_LOGIC;
begin
\char_n_o_OBUF[0]_inst\: unisim.vcomponents.OBUF
     port map (
      I => char_n_o_OBUF(0),
      O => char_n_o(0)
    );
\char_n_o_OBUF[1]_inst\: unisim.vcomponents.OBUF
     port map (
      I => char_n_o_OBUF(1),
      O => char_n_o(1)
    );
\char_n_o_OBUF[2]_inst\: unisim.vcomponents.OBUF
     port map (
      I => char_n_o_OBUF(2),
      O => char_n_o(2)
    );
\char_n_o_OBUF[3]_inst\: unisim.vcomponents.OBUF
     port map (
      I => char_n_o_OBUF(3),
      O => char_n_o(3)
    );
clk_i_IBUF_BUFG_inst: unisim.vcomponents.BUFG
     port map (
      I => clk_i_IBUF,
      O => clk_i_IBUF_BUFG
    );
clk_i_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => clk_i,
      O => clk_i_IBUF
    );
lbutton_i_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => lbutton_i,
      O => lbutton_i_IBUF
    );
rbutton_i_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => rbutton_i,
      O => rbutton_i_IBUF
    );
reset_i_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => reset_i,
      O => reset_i_IBUF
    );
\seg_display_o_OBUF[0]_inst\: unisim.vcomponents.OBUF
     port map (
      I => seg_display_o_OBUF(0),
      O => seg_display_o(0)
    );
\seg_display_o_OBUF[1]_inst\: unisim.vcomponents.OBUF
     port map (
      I => seg_display_o_OBUF(1),
      O => seg_display_o(1)
    );
\seg_display_o_OBUF[2]_inst\: unisim.vcomponents.OBUF
     port map (
      I => seg_display_o_OBUF(2),
      O => seg_display_o(2)
    );
\seg_display_o_OBUF[3]_inst\: unisim.vcomponents.OBUF
     port map (
      I => seg_display_o_OBUF(3),
      O => seg_display_o(3)
    );
\seg_display_o_OBUF[4]_inst\: unisim.vcomponents.OBUF
     port map (
      I => seg_display_o_OBUF(4),
      O => seg_display_o(4)
    );
\seg_display_o_OBUF[5]_inst\: unisim.vcomponents.OBUF
     port map (
      I => seg_display_o_OBUF(5),
      O => seg_display_o(5)
    );
\seg_display_o_OBUF[6]_inst\: unisim.vcomponents.OBUF
     port map (
      I => seg_display_o_OBUF(6),
      O => seg_display_o(6)
    );
u1: entity work.morse_to_binary
     port map (
      AR(0) => reset_i_IBUF,
      CLK => clk_i_IBUF_BUFG,
      D(6) => u1_n_1,
      D(5) => u1_n_2,
      D(4) => u1_n_3,
      D(3) => u1_n_4,
      D(2) => u1_n_5,
      D(1) => u1_n_6,
      D(0) => u1_n_7,
      E(0) => u1_n_8,
      active_morse => active_morse,
      lbutton_i_IBUF => lbutton_i_IBUF,
      rbutton_i_IBUF => rbutton_i_IBUF
    );
u2: entity work.binary_to_ascii
     port map (
      AR(0) => reset_i_IBUF,
      CLK => clk_i_IBUF_BUFG,
      D(6) => u1_n_1,
      D(5) => u1_n_2,
      D(4) => u1_n_3,
      D(3) => u1_n_4,
      D(2) => u1_n_5,
      D(1) => u1_n_6,
      D(0) => u1_n_7,
      E(0) => new_letter_reg,
      Q(6 downto 0) => ascii_reg(6 downto 0),
      active_morse => active_morse,
      \ascii_reg_reg[0]_0\(0) => u1_n_8
    );
u3: entity work.ascii_to_display
     port map (
      AR(0) => reset_i_IBUF,
      CLK => clk_i_IBUF_BUFG,
      E(0) => new_letter_reg,
      Q(6 downto 0) => ascii_reg(6 downto 0),
      char_n_o_OBUF(3 downto 0) => char_n_o_OBUF(3 downto 0),
      seg_display_o_OBUF(6 downto 0) => seg_display_o_OBUF(6 downto 0)
    );
end STRUCTURE;
