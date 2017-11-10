--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : lab4_seven_segment_display.vhf
-- /___/   /\     Timestamp : 08/18/2017 14:37:23
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: /opt/Xilinx/14.7/ISE_DS/ISE/bin/lin64/unwrapped/sch2hdl -intstyle ise -family artix7 -flat -suppress -vhdl lab4_seven_segment_display.vhf -w /home/dual/cs5160401/Project3/lab4_seven_segment_display.sch
--Design Name: lab4_seven_segment_display
--Device: artix7
--Purpose:
--    This vhdl netlist is translated from an ECS schematic. It can be 
--    synthesized and simulated, but it should not be modified. 
--
----- CELL NOR6_HXILINX_lab4_seven_segment_display -----
  
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity NOR6_HXILINX_lab4_seven_segment_display is
  
port(
    O  : out std_logic;

    I0  : in std_logic;
    I1  : in std_logic;
    I2  : in std_logic;
    I3  : in std_logic;
    I4  : in std_logic;
    I5  : in std_logic
  );
end NOR6_HXILINX_lab4_seven_segment_display;

architecture NOR6_HXILINX_lab4_seven_segment_display_V of NOR6_HXILINX_lab4_seven_segment_display is
begin
  O <= not (I0 or I1 or I2 or I3 or I4 or I5);
end NOR6_HXILINX_lab4_seven_segment_display_V;

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity inv4bus_MUSER_lab4_seven_segment_display is
   port ( inp  : in    std_logic_vector (3 downto 0); 
          outp : out   std_logic_vector (3 downto 0));
end inv4bus_MUSER_lab4_seven_segment_display;

architecture BEHAVIORAL of inv4bus_MUSER_lab4_seven_segment_display is
   attribute BOX_TYPE   : string ;
   component INV
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
   
begin
   XLXI_1 : INV
      port map (I=>inp(0),
                O=>outp(0));
   
   XLXI_2 : INV
      port map (I=>inp(1),
                O=>outp(1));
   
   XLXI_3 : INV
      port map (I=>inp(2),
                O=>outp(2));
   
   XLXI_4 : INV
      port map (I=>inp(3),
                O=>outp(3));
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity BinToF_MUSER_lab4_seven_segment_display is
   port ( b0 : in    std_logic; 
          b1 : in    std_logic; 
          b2 : in    std_logic; 
          b3 : in    std_logic; 
          F  : out   std_logic);
end BinToF_MUSER_lab4_seven_segment_display;

architecture BEHAVIORAL of BinToF_MUSER_lab4_seven_segment_display is
   attribute BOX_TYPE   : string ;
   signal XLXN_7  : std_logic;
   signal XLXN_8  : std_logic;
   signal XLXN_10 : std_logic;
   signal XLXN_14 : std_logic;
   signal XLXN_20 : std_logic;
   signal XLXN_21 : std_logic;
   signal XLXN_22 : std_logic;
   signal XLXN_23 : std_logic;
   signal XLXN_24 : std_logic;
   component INV
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
   
   component AND4
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND4 : component is "BLACK_BOX";
   
   component NOR5
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             I4 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of NOR5 : component is "BLACK_BOX";
   
begin
   XLXI_1 : INV
      port map (I=>b3,
                O=>XLXN_14);
   
   XLXI_2 : INV
      port map (I=>b2,
                O=>XLXN_7);
   
   XLXI_3 : INV
      port map (I=>b1,
                O=>XLXN_8);
   
   XLXI_4 : INV
      port map (I=>b0,
                O=>XLXN_10);
   
   XLXI_5 : AND4
      port map (I0=>b0,
                I1=>XLXN_8,
                I2=>XLXN_7,
                I3=>XLXN_14,
                O=>XLXN_20);
   
   XLXI_6 : AND4
      port map (I0=>XLXN_10,
                I1=>b1,
                I2=>XLXN_7,
                I3=>XLXN_14,
                O=>XLXN_21);
   
   XLXI_7 : AND4
      port map (I0=>b0,
                I1=>b1,
                I2=>XLXN_7,
                I3=>XLXN_14,
                O=>XLXN_22);
   
   XLXI_8 : AND4
      port map (I0=>b0,
                I1=>b1,
                I2=>b2,
                I3=>XLXN_14,
                O=>XLXN_23);
   
   XLXI_9 : AND4
      port map (I0=>b0,
                I1=>XLXN_8,
                I2=>b2,
                I3=>b3,
                O=>XLXN_24);
   
   XLXI_10 : NOR5
      port map (I0=>XLXN_24,
                I1=>XLXN_23,
                I2=>XLXN_22,
                I3=>XLXN_21,
                I4=>XLXN_20,
                O=>F);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity BinToG_MUSER_lab4_seven_segment_display is
   port ( b0 : in    std_logic; 
          b1 : in    std_logic; 
          b2 : in    std_logic; 
          b3 : in    std_logic; 
          G  : out   std_logic);
end BinToG_MUSER_lab4_seven_segment_display;

architecture BEHAVIORAL of BinToG_MUSER_lab4_seven_segment_display is
   attribute BOX_TYPE   : string ;
   signal XLXN_5  : std_logic;
   signal XLXN_8  : std_logic;
   signal XLXN_9  : std_logic;
   signal XLXN_10 : std_logic;
   signal XLXN_17 : std_logic;
   signal XLXN_18 : std_logic;
   signal XLXN_19 : std_logic;
   signal XLXN_20 : std_logic;
   component INV
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
   
   component AND4
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND4 : component is "BLACK_BOX";
   
   component NOR4
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of NOR4 : component is "BLACK_BOX";
   
begin
   XLXI_1 : INV
      port map (I=>b3,
                O=>XLXN_5);
   
   XLXI_2 : INV
      port map (I=>b2,
                O=>XLXN_10);
   
   XLXI_3 : INV
      port map (I=>b1,
                O=>XLXN_9);
   
   XLXI_4 : INV
      port map (I=>b0,
                O=>XLXN_8);
   
   XLXI_5 : AND4
      port map (I0=>XLXN_8,
                I1=>XLXN_9,
                I2=>XLXN_10,
                I3=>XLXN_5,
                O=>XLXN_17);
   
   XLXI_6 : AND4
      port map (I0=>b0,
                I1=>XLXN_9,
                I2=>XLXN_10,
                I3=>XLXN_5,
                O=>XLXN_18);
   
   XLXI_7 : AND4
      port map (I0=>b0,
                I1=>b1,
                I2=>b2,
                I3=>XLXN_5,
                O=>XLXN_19);
   
   XLXI_8 : AND4
      port map (I0=>XLXN_8,
                I1=>XLXN_9,
                I2=>b2,
                I3=>b3,
                O=>XLXN_20);
   
   XLXI_9 : NOR4
      port map (I0=>XLXN_20,
                I1=>XLXN_19,
                I2=>XLXN_18,
                I3=>XLXN_17,
                O=>G);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity BinToE_MUSER_lab4_seven_segment_display is
   port ( b0 : in    std_logic; 
          b1 : in    std_logic; 
          b2 : in    std_logic; 
          b3 : in    std_logic; 
          E  : out   std_logic);
end BinToE_MUSER_lab4_seven_segment_display;

architecture BEHAVIORAL of BinToE_MUSER_lab4_seven_segment_display is
   attribute BOX_TYPE   : string ;
   attribute HU_SET     : string ;
   signal XLXN_10 : std_logic;
   signal XLXN_11 : std_logic;
   signal XLXN_17 : std_logic;
   signal XLXN_18 : std_logic;
   signal XLXN_19 : std_logic;
   signal XLXN_20 : std_logic;
   signal XLXN_21 : std_logic;
   signal XLXN_22 : std_logic;
   signal XLXN_23 : std_logic;
   signal XLXN_24 : std_logic;
   component INV
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
   
   component AND4
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND4 : component is "BLACK_BOX";
   
   component NOR6_HXILINX_lab4_seven_segment_display
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             I4 : in    std_logic; 
             I5 : in    std_logic; 
             O  : out   std_logic);
   end component;
   
   attribute HU_SET of XLXI_11 : label is "XLXI_11_0";
begin
   XLXI_1 : INV
      port map (I=>b3,
                O=>XLXN_10);
   
   XLXI_2 : INV
      port map (I=>b2,
                O=>XLXN_18);
   
   XLXI_3 : INV
      port map (I=>b1,
                O=>XLXN_17);
   
   XLXI_4 : INV
      port map (I=>b0,
                O=>XLXN_11);
   
   XLXI_5 : AND4
      port map (I0=>b0,
                I1=>XLXN_17,
                I2=>XLXN_18,
                I3=>XLXN_10,
                O=>XLXN_19);
   
   XLXI_6 : AND4
      port map (I0=>b0,
                I1=>b1,
                I2=>XLXN_18,
                I3=>XLXN_10,
                O=>XLXN_20);
   
   XLXI_7 : AND4
      port map (I0=>XLXN_11,
                I1=>XLXN_17,
                I2=>b2,
                I3=>XLXN_10,
                O=>XLXN_21);
   
   XLXI_8 : AND4
      port map (I0=>b0,
                I1=>XLXN_17,
                I2=>b2,
                I3=>XLXN_10,
                O=>XLXN_22);
   
   XLXI_9 : AND4
      port map (I0=>b0,
                I1=>b1,
                I2=>b2,
                I3=>XLXN_10,
                O=>XLXN_23);
   
   XLXI_10 : AND4
      port map (I0=>b0,
                I1=>XLXN_17,
                I2=>XLXN_18,
                I3=>b3,
                O=>XLXN_24);
   
   XLXI_11 : NOR6_HXILINX_lab4_seven_segment_display
      port map (I0=>XLXN_24,
                I1=>XLXN_23,
                I2=>XLXN_22,
                I3=>XLXN_21,
                I4=>XLXN_20,
                I5=>XLXN_19,
                O=>E);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity BinToD_MUSER_lab4_seven_segment_display is
   port ( b0 : in    std_logic; 
          b1 : in    std_logic; 
          b2 : in    std_logic; 
          b3 : in    std_logic; 
          D  : out   std_logic);
end BinToD_MUSER_lab4_seven_segment_display;

architecture BEHAVIORAL of BinToD_MUSER_lab4_seven_segment_display is
   attribute BOX_TYPE   : string ;
   signal XLXN_8  : std_logic;
   signal XLXN_10 : std_logic;
   signal XLXN_11 : std_logic;
   signal XLXN_15 : std_logic;
   signal XLXN_19 : std_logic;
   signal XLXN_20 : std_logic;
   signal XLXN_21 : std_logic;
   signal XLXN_22 : std_logic;
   signal XLXN_23 : std_logic;
   component INV
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
   
   component AND4
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND4 : component is "BLACK_BOX";
   
   component NOR5
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             I4 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of NOR5 : component is "BLACK_BOX";
   
begin
   XLXI_1 : INV
      port map (I=>b3,
                O=>XLXN_10);
   
   XLXI_2 : INV
      port map (I=>b2,
                O=>XLXN_15);
   
   XLXI_3 : INV
      port map (I=>b1,
                O=>XLXN_8);
   
   XLXI_4 : INV
      port map (I=>b0,
                O=>XLXN_11);
   
   XLXI_5 : AND4
      port map (I0=>b0,
                I1=>XLXN_8,
                I2=>XLXN_15,
                I3=>XLXN_10,
                O=>XLXN_19);
   
   XLXI_6 : AND4
      port map (I0=>XLXN_11,
                I1=>XLXN_8,
                I2=>b2,
                I3=>XLXN_10,
                O=>XLXN_20);
   
   XLXI_7 : AND4
      port map (I0=>b0,
                I1=>b1,
                I2=>b2,
                I3=>XLXN_10,
                O=>XLXN_21);
   
   XLXI_8 : AND4
      port map (I0=>XLXN_11,
                I1=>b1,
                I2=>XLXN_15,
                I3=>b3,
                O=>XLXN_22);
   
   XLXI_9 : AND4
      port map (I0=>b0,
                I1=>b1,
                I2=>b2,
                I3=>b3,
                O=>XLXN_23);
   
   XLXI_10 : NOR5
      port map (I0=>XLXN_23,
                I1=>XLXN_22,
                I2=>XLXN_21,
                I3=>XLXN_20,
                I4=>XLXN_19,
                O=>D);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity BinToC_MUSER_lab4_seven_segment_display is
   port ( b0 : in    std_logic; 
          b1 : in    std_logic; 
          b2 : in    std_logic; 
          b3 : in    std_logic; 
          C  : out   std_logic);
end BinToC_MUSER_lab4_seven_segment_display;

architecture BEHAVIORAL of BinToC_MUSER_lab4_seven_segment_display is
   attribute BOX_TYPE   : string ;
   signal XLXN_6  : std_logic;
   signal XLXN_7  : std_logic;
   signal XLXN_11 : std_logic;
   signal XLXN_12 : std_logic;
   signal XLXN_17 : std_logic;
   signal XLXN_18 : std_logic;
   signal XLXN_19 : std_logic;
   signal XLXN_20 : std_logic;
   component INV
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
   
   component AND4
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND4 : component is "BLACK_BOX";
   
   component NOR4
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of NOR4 : component is "BLACK_BOX";
   
begin
   XLXI_1 : INV
      port map (I=>b3,
                O=>XLXN_6);
   
   XLXI_2 : INV
      port map (I=>b2,
                O=>XLXN_7);
   
   XLXI_3 : INV
      port map (I=>b1,
                O=>XLXN_11);
   
   XLXI_4 : INV
      port map (I=>b0,
                O=>XLXN_12);
   
   XLXI_5 : AND4
      port map (I0=>XLXN_12,
                I1=>b1,
                I2=>XLXN_7,
                I3=>XLXN_6,
                O=>XLXN_17);
   
   XLXI_6 : AND4
      port map (I0=>XLXN_12,
                I1=>XLXN_11,
                I2=>b2,
                I3=>b3,
                O=>XLXN_18);
   
   XLXI_7 : AND4
      port map (I0=>XLXN_12,
                I1=>b1,
                I2=>b2,
                I3=>b3,
                O=>XLXN_19);
   
   XLXI_8 : AND4
      port map (I0=>b0,
                I1=>b1,
                I2=>b2,
                I3=>b3,
                O=>XLXN_20);
   
   XLXI_9 : NOR4
      port map (I0=>XLXN_20,
                I1=>XLXN_19,
                I2=>XLXN_18,
                I3=>XLXN_17,
                O=>C);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity BinToB_MUSER_lab4_seven_segment_display is
   port ( b0 : in    std_logic; 
          b1 : in    std_logic; 
          b2 : in    std_logic; 
          b3 : in    std_logic; 
          B  : out   std_logic);
end BinToB_MUSER_lab4_seven_segment_display;

architecture BEHAVIORAL of BinToB_MUSER_lab4_seven_segment_display is
   attribute BOX_TYPE   : string ;
   attribute HU_SET     : string ;
   signal XLXN_6  : std_logic;
   signal XLXN_7  : std_logic;
   signal XLXN_12 : std_logic;
   signal XLXN_16 : std_logic;
   signal XLXN_20 : std_logic;
   signal XLXN_21 : std_logic;
   signal XLXN_22 : std_logic;
   signal XLXN_23 : std_logic;
   signal XLXN_24 : std_logic;
   signal XLXN_25 : std_logic;
   component INV
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
   
   component AND4
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND4 : component is "BLACK_BOX";
   
   component NOR6_HXILINX_lab4_seven_segment_display
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             I4 : in    std_logic; 
             I5 : in    std_logic; 
             O  : out   std_logic);
   end component;
   
   attribute HU_SET of XLXI_17 : label is "XLXI_17_1";
begin
   XLXI_1 : INV
      port map (I=>b3,
                O=>XLXN_6);
   
   XLXI_2 : INV
      port map (I=>b2,
                O=>XLXN_12);
   
   XLXI_3 : INV
      port map (I=>b1,
                O=>XLXN_7);
   
   XLXI_4 : INV
      port map (I=>b0,
                O=>XLXN_16);
   
   XLXI_5 : AND4
      port map (I0=>b0,
                I1=>XLXN_7,
                I2=>b2,
                I3=>XLXN_6,
                O=>XLXN_20);
   
   XLXI_11 : AND4
      port map (I0=>XLXN_16,
                I1=>b1,
                I2=>b2,
                I3=>XLXN_6,
                O=>XLXN_21);
   
   XLXI_12 : AND4
      port map (I0=>b0,
                I1=>b1,
                I2=>XLXN_12,
                I3=>b3,
                O=>XLXN_22);
   
   XLXI_13 : AND4
      port map (I0=>XLXN_16,
                I1=>XLXN_7,
                I2=>b2,
                I3=>b3,
                O=>XLXN_23);
   
   XLXI_14 : AND4
      port map (I0=>XLXN_16,
                I1=>b1,
                I2=>b2,
                I3=>b3,
                O=>XLXN_24);
   
   XLXI_15 : AND4
      port map (I0=>b0,
                I1=>b1,
                I2=>b2,
                I3=>b3,
                O=>XLXN_25);
   
   XLXI_17 : NOR6_HXILINX_lab4_seven_segment_display
      port map (I0=>XLXN_25,
                I1=>XLXN_24,
                I2=>XLXN_23,
                I3=>XLXN_22,
                I4=>XLXN_21,
                I5=>XLXN_20,
                O=>B);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity BinToA_MUSER_lab4_seven_segment_display is
   port ( b0 : in    std_logic; 
          b1 : in    std_logic; 
          b2 : in    std_logic; 
          b3 : in    std_logic; 
          A  : out   std_logic);
end BinToA_MUSER_lab4_seven_segment_display;

architecture BEHAVIORAL of BinToA_MUSER_lab4_seven_segment_display is
   attribute BOX_TYPE   : string ;
   signal XLXN_6  : std_logic;
   signal XLXN_8  : std_logic;
   signal XLXN_10 : std_logic;
   signal XLXN_11 : std_logic;
   signal XLXN_16 : std_logic;
   signal XLXN_17 : std_logic;
   signal XLXN_18 : std_logic;
   signal XLXN_19 : std_logic;
   component INV
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
   
   component AND4
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND4 : component is "BLACK_BOX";
   
   component NOR4
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of NOR4 : component is "BLACK_BOX";
   
begin
   XLXI_1 : INV
      port map (I=>b3,
                O=>XLXN_8);
   
   XLXI_2 : INV
      port map (I=>b2,
                O=>XLXN_11);
   
   XLXI_3 : INV
      port map (I=>b1,
                O=>XLXN_6);
   
   XLXI_4 : INV
      port map (I=>b0,
                O=>XLXN_10);
   
   XLXI_5 : AND4
      port map (I0=>b0,
                I1=>XLXN_6,
                I2=>XLXN_11,
                I3=>XLXN_8,
                O=>XLXN_16);
   
   XLXI_6 : AND4
      port map (I0=>XLXN_10,
                I1=>XLXN_6,
                I2=>b2,
                I3=>XLXN_8,
                O=>XLXN_17);
   
   XLXI_7 : AND4
      port map (I0=>b0,
                I1=>b1,
                I2=>XLXN_11,
                I3=>b3,
                O=>XLXN_18);
   
   XLXI_8 : AND4
      port map (I0=>b0,
                I1=>XLXN_6,
                I2=>b2,
                I3=>b3,
                O=>XLXN_19);
   
   XLXI_9 : NOR4
      port map (I0=>XLXN_19,
                I1=>XLXN_18,
                I2=>XLXN_17,
                I3=>XLXN_16,
                O=>A);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity BinTo7Seg_MUSER_lab4_seven_segment_display is
   port ( b0 : in    std_logic; 
          b1 : in    std_logic; 
          b2 : in    std_logic; 
          b3 : in    std_logic; 
          A  : out   std_logic; 
          B  : out   std_logic; 
          C  : out   std_logic; 
          D  : out   std_logic; 
          E  : out   std_logic; 
          F  : out   std_logic; 
          G  : out   std_logic);
end BinTo7Seg_MUSER_lab4_seven_segment_display;

architecture BEHAVIORAL of BinTo7Seg_MUSER_lab4_seven_segment_display is
   component BinToA_MUSER_lab4_seven_segment_display
      port ( A  : out   std_logic; 
             b0 : in    std_logic; 
             b1 : in    std_logic; 
             b2 : in    std_logic; 
             b3 : in    std_logic);
   end component;
   
   component BinToB_MUSER_lab4_seven_segment_display
      port ( B  : out   std_logic; 
             b0 : in    std_logic; 
             b1 : in    std_logic; 
             b2 : in    std_logic; 
             b3 : in    std_logic);
   end component;
   
   component BinToC_MUSER_lab4_seven_segment_display
      port ( b0 : in    std_logic; 
             b1 : in    std_logic; 
             b2 : in    std_logic; 
             b3 : in    std_logic; 
             C  : out   std_logic);
   end component;
   
   component BinToD_MUSER_lab4_seven_segment_display
      port ( b0 : in    std_logic; 
             b1 : in    std_logic; 
             b2 : in    std_logic; 
             b3 : in    std_logic; 
             D  : out   std_logic);
   end component;
   
   component BinToE_MUSER_lab4_seven_segment_display
      port ( b0 : in    std_logic; 
             b1 : in    std_logic; 
             b2 : in    std_logic; 
             b3 : in    std_logic; 
             E  : out   std_logic);
   end component;
   
   component BinToF_MUSER_lab4_seven_segment_display
      port ( b0 : in    std_logic; 
             b1 : in    std_logic; 
             b2 : in    std_logic; 
             b3 : in    std_logic; 
             F  : out   std_logic);
   end component;
   
   component BinToG_MUSER_lab4_seven_segment_display
      port ( b0 : in    std_logic; 
             b1 : in    std_logic; 
             b2 : in    std_logic; 
             b3 : in    std_logic; 
             G  : out   std_logic);
   end component;
   
begin
   XLXI_5 : BinToA_MUSER_lab4_seven_segment_display
      port map (b0=>b0,
                b1=>b1,
                b2=>b2,
                b3=>b3,
                A=>A);
   
   XLXI_6 : BinToB_MUSER_lab4_seven_segment_display
      port map (b0=>b0,
                b1=>b1,
                b2=>b2,
                b3=>b3,
                B=>B);
   
   XLXI_7 : BinToC_MUSER_lab4_seven_segment_display
      port map (b0=>b0,
                b1=>b1,
                b2=>b2,
                b3=>b3,
                C=>C);
   
   XLXI_8 : BinToD_MUSER_lab4_seven_segment_display
      port map (b0=>b0,
                b1=>b1,
                b2=>b2,
                b3=>b3,
                D=>D);
   
   XLXI_9 : BinToE_MUSER_lab4_seven_segment_display
      port map (b0=>b0,
                b1=>b1,
                b2=>b2,
                b3=>b3,
                E=>E);
   
   XLXI_10 : BinToF_MUSER_lab4_seven_segment_display
      port map (b0=>b0,
                b1=>b1,
                b2=>b2,
                b3=>b3,
                F=>F);
   
   XLXI_11 : BinToG_MUSER_lab4_seven_segment_display
      port map (b0=>b0,
                b1=>b1,
                b2=>b2,
                b3=>b3,
                G=>G);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity mux4in4_MUSER_lab4_seven_segment_display is
   port ( b0 : in    std_logic; 
          b1 : in    std_logic; 
          b2 : in    std_logic; 
          b3 : in    std_logic; 
          s0 : in    std_logic; 
          s1 : in    std_logic; 
          s2 : in    std_logic; 
          s3 : in    std_logic; 
          O  : out   std_logic);
end mux4in4_MUSER_lab4_seven_segment_display;

architecture BEHAVIORAL of mux4in4_MUSER_lab4_seven_segment_display is
   attribute BOX_TYPE   : string ;
   signal XLXN_10 : std_logic;
   signal XLXN_16 : std_logic;
   signal XLXN_17 : std_logic;
   signal XLXN_36 : std_logic;
   signal XLXN_37 : std_logic;
   signal XLXN_38 : std_logic;
   signal XLXN_39 : std_logic;
   signal XLXN_41 : std_logic;
   component INV
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
   
   component AND5
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             I4 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND5 : component is "BLACK_BOX";
   
   component OR4
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR4 : component is "BLACK_BOX";
   
begin
   XLXI_1 : INV
      port map (I=>s0,
                O=>XLXN_41);
   
   XLXI_2 : INV
      port map (I=>s1,
                O=>XLXN_10);
   
   XLXI_3 : INV
      port map (I=>s2,
                O=>XLXN_16);
   
   XLXI_4 : INV
      port map (I=>s3,
                O=>XLXN_17);
   
   XLXI_5 : AND5
      port map (I0=>s0,
                I1=>XLXN_10,
                I2=>XLXN_16,
                I3=>XLXN_17,
                I4=>b0,
                O=>XLXN_39);
   
   XLXI_6 : AND5
      port map (I0=>XLXN_41,
                I1=>s1,
                I2=>XLXN_16,
                I3=>XLXN_17,
                I4=>b1,
                O=>XLXN_38);
   
   XLXI_7 : AND5
      port map (I0=>XLXN_41,
                I1=>XLXN_10,
                I2=>s2,
                I3=>XLXN_17,
                I4=>b2,
                O=>XLXN_37);
   
   XLXI_8 : AND5
      port map (I0=>XLXN_41,
                I1=>XLXN_10,
                I2=>XLXN_16,
                I3=>s3,
                I4=>b3,
                O=>XLXN_36);
   
   XLXI_9 : OR4
      port map (I0=>XLXN_39,
                I1=>XLXN_38,
                I2=>XLXN_37,
                I3=>XLXN_36,
                O=>O);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity MuxBin_MUSER_lab4_seven_segment_display is
   port ( anode : in    std_logic_vector (3 downto 0); 
          b     : in    std_logic_vector (15 downto 0); 
          O0    : out   std_logic; 
          O1    : out   std_logic; 
          O2    : out   std_logic; 
          O3    : out   std_logic);
end MuxBin_MUSER_lab4_seven_segment_display;

architecture BEHAVIORAL of MuxBin_MUSER_lab4_seven_segment_display is
   component mux4in4_MUSER_lab4_seven_segment_display
      port ( b0 : in    std_logic; 
             b1 : in    std_logic; 
             b2 : in    std_logic; 
             b3 : in    std_logic; 
             O  : out   std_logic; 
             s0 : in    std_logic; 
             s1 : in    std_logic; 
             s2 : in    std_logic; 
             s3 : in    std_logic);
   end component;
   
begin
   XLXI_1 : mux4in4_MUSER_lab4_seven_segment_display
      port map (b0=>b(0),
                b1=>b(4),
                b2=>b(8),
                b3=>b(12),
                s0=>anode(0),
                s1=>anode(1),
                s2=>anode(2),
                s3=>anode(3),
                O=>O0);
   
   XLXI_10 : mux4in4_MUSER_lab4_seven_segment_display
      port map (b0=>b(1),
                b1=>b(5),
                b2=>b(9),
                b3=>b(13),
                s0=>anode(0),
                s1=>anode(1),
                s2=>anode(2),
                s3=>anode(3),
                O=>O1);
   
   XLXI_11 : mux4in4_MUSER_lab4_seven_segment_display
      port map (b0=>b(2),
                b1=>b(6),
                b2=>b(10),
                b3=>b(14),
                s0=>anode(0),
                s1=>anode(1),
                s2=>anode(2),
                s3=>anode(3),
                O=>O2);
   
   XLXI_12 : mux4in4_MUSER_lab4_seven_segment_display
      port map (b0=>b(3),
                b1=>b(7),
                b2=>b(11),
                b3=>b(15),
                s0=>anode(0),
                s1=>anode(1),
                s2=>anode(2),
                s3=>anode(3),
                O=>O3);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity RingCount_MUSER_lab4_seven_segment_display is
   port ( clock : in    std_logic; 
          anode : out   std_logic_vector (3 downto 0));
end RingCount_MUSER_lab4_seven_segment_display;

architecture BEHAVIORAL of RingCount_MUSER_lab4_seven_segment_display is
   attribute BOX_TYPE   : string ;
   signal XLXN_8      : std_logic;
   signal XLXN_10     : std_logic;
   signal XLXN_16     : std_logic;
   signal XLXN_22     : std_logic;
   signal anode_DUMMY : std_logic_vector (3 downto 0);
   component FDC
      generic( INIT : bit :=  '0');
      port ( C   : in    std_logic; 
             CLR : in    std_logic; 
             D   : in    std_logic; 
             Q   : out   std_logic);
   end component;
   attribute BOX_TYPE of FDC : component is "BLACK_BOX";
   
   component FDP
      generic( INIT : bit :=  '1');
      port ( C   : in    std_logic; 
             D   : in    std_logic; 
             PRE : in    std_logic; 
             Q   : out   std_logic);
   end component;
   attribute BOX_TYPE of FDP : component is "BLACK_BOX";
   
   component FD
      generic( INIT : bit :=  '0');
      port ( C : in    std_logic; 
             D : in    std_logic; 
             Q : out   std_logic);
   end component;
   attribute BOX_TYPE of FD : component is "BLACK_BOX";
   
   component INV
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
   
begin
   XLXN_8 <= '1';
   anode(3 downto 0) <= anode_DUMMY(3 downto 0);
   XLXI_5 : FDC
      port map (C=>clock,
                CLR=>XLXN_10,
                D=>anode_DUMMY(0),
                Q=>anode_DUMMY(1));
   
   XLXI_6 : FDC
      port map (C=>clock,
                CLR=>XLXN_10,
                D=>anode_DUMMY(1),
                Q=>anode_DUMMY(2));
   
   XLXI_7 : FDC
      port map (C=>clock,
                CLR=>XLXN_10,
                D=>anode_DUMMY(2),
                Q=>anode_DUMMY(3));
   
   XLXI_9 : FDP
      port map (C=>clock,
                D=>anode_DUMMY(3),
                PRE=>XLXN_10,
                Q=>anode_DUMMY(0));
   
   XLXI_10 : FD
      port map (C=>XLXN_22,
                D=>XLXN_8,
                Q=>XLXN_16);
   
   XLXI_12 : INV
      port map (I=>XLXN_16,
                O=>XLXN_10);
   
   XLXI_13 : INV
      port map (I=>clock,
                O=>XLXN_22);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity FreqDiv15_MUSER_lab4_seven_segment_display is
   port ( i : in    std_logic; 
          o : out   std_logic);
end FreqDiv15_MUSER_lab4_seven_segment_display;

architecture BEHAVIORAL of FreqDiv15_MUSER_lab4_seven_segment_display is
   attribute BOX_TYPE   : string ;
   signal XLXN_1  : std_logic;
   signal XLXN_3  : std_logic;
   signal XLXN_4  : std_logic;
   signal XLXN_6  : std_logic;
   signal XLXN_7  : std_logic;
   signal XLXN_59 : std_logic;
   signal XLXN_61 : std_logic;
   signal XLXN_62 : std_logic;
   signal XLXN_64 : std_logic;
   signal XLXN_65 : std_logic;
   signal XLXN_68 : std_logic;
   signal XLXN_70 : std_logic;
   signal XLXN_71 : std_logic;
   signal XLXN_73 : std_logic;
   signal XLXN_74 : std_logic;
   signal XLXN_77 : std_logic;
   signal XLXN_79 : std_logic;
   signal XLXN_80 : std_logic;
   signal XLXN_82 : std_logic;
   signal XLXN_83 : std_logic;
   signal XLXN_86 : std_logic;
   signal XLXN_88 : std_logic;
   signal XLXN_89 : std_logic;
   signal XLXN_91 : std_logic;
   signal XLXN_94 : std_logic;
   signal XLXN_95 : std_logic;
   signal XLXN_96 : std_logic;
   signal XLXN_97 : std_logic;
   signal XLXN_98 : std_logic;
   signal o_DUMMY : std_logic;
   component FD
      generic( INIT : bit :=  '0');
      port ( C : in    std_logic; 
             D : in    std_logic; 
             Q : out   std_logic);
   end component;
   attribute BOX_TYPE of FD : component is "BLACK_BOX";
   
   component INV
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
   
begin
   o <= o_DUMMY;
   XLXI_1 : FD
      port map (C=>i,
                D=>XLXN_3,
                Q=>XLXN_1);
   
   XLXI_2 : INV
      port map (I=>XLXN_1,
                O=>XLXN_3);
   
   XLXI_3 : FD
      port map (C=>XLXN_3,
                D=>XLXN_6,
                Q=>XLXN_4);
   
   XLXI_4 : INV
      port map (I=>XLXN_4,
                O=>XLXN_6);
   
   XLXI_5 : FD
      port map (C=>XLXN_6,
                D=>XLXN_95,
                Q=>XLXN_7);
   
   XLXI_6 : INV
      port map (I=>XLXN_7,
                O=>XLXN_95);
   
   XLXI_39 : FD
      port map (C=>XLXN_95,
                D=>XLXN_61,
                Q=>XLXN_59);
   
   XLXI_40 : INV
      port map (I=>XLXN_59,
                O=>XLXN_61);
   
   XLXI_41 : INV
      port map (I=>XLXN_62,
                O=>XLXN_64);
   
   XLXI_42 : FD
      port map (C=>XLXN_61,
                D=>XLXN_64,
                Q=>XLXN_62);
   
   XLXI_43 : FD
      port map (C=>XLXN_64,
                D=>XLXN_96,
                Q=>XLXN_65);
   
   XLXI_44 : INV
      port map (I=>XLXN_65,
                O=>XLXN_96);
   
   XLXI_45 : FD
      port map (C=>XLXN_96,
                D=>XLXN_70,
                Q=>XLXN_68);
   
   XLXI_46 : INV
      port map (I=>XLXN_68,
                O=>XLXN_70);
   
   XLXI_47 : INV
      port map (I=>XLXN_71,
                O=>XLXN_73);
   
   XLXI_48 : FD
      port map (C=>XLXN_70,
                D=>XLXN_73,
                Q=>XLXN_71);
   
   XLXI_49 : FD
      port map (C=>XLXN_73,
                D=>XLXN_97,
                Q=>XLXN_74);
   
   XLXI_50 : INV
      port map (I=>XLXN_74,
                O=>XLXN_97);
   
   XLXI_51 : FD
      port map (C=>XLXN_97,
                D=>XLXN_79,
                Q=>XLXN_77);
   
   XLXI_52 : INV
      port map (I=>XLXN_77,
                O=>XLXN_79);
   
   XLXI_53 : INV
      port map (I=>XLXN_80,
                O=>XLXN_82);
   
   XLXI_54 : FD
      port map (C=>XLXN_79,
                D=>XLXN_82,
                Q=>XLXN_80);
   
   XLXI_55 : FD
      port map (C=>XLXN_82,
                D=>XLXN_98,
                Q=>XLXN_83);
   
   XLXI_56 : INV
      port map (I=>XLXN_83,
                O=>XLXN_98);
   
   XLXI_57 : FD
      port map (C=>XLXN_98,
                D=>XLXN_88,
                Q=>XLXN_86);
   
   XLXI_58 : INV
      port map (I=>XLXN_86,
                O=>XLXN_88);
   
   XLXI_59 : INV
      port map (I=>XLXN_89,
                O=>XLXN_91);
   
   XLXI_60 : FD
      port map (C=>XLXN_88,
                D=>XLXN_91,
                Q=>XLXN_89);
   
   XLXI_61 : FD
      port map (C=>XLXN_91,
                D=>XLXN_94,
                Q=>o_DUMMY);
   
   XLXI_62 : INV
      port map (I=>o_DUMMY,
                O=>XLXN_94);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity Clocking_MUSER_lab4_seven_segment_display is
   port ( clock      : in    std_logic; 
          pushbutton : in    std_logic; 
          anode      : out   std_logic_vector (3 downto 0));
end Clocking_MUSER_lab4_seven_segment_display;

architecture BEHAVIORAL of Clocking_MUSER_lab4_seven_segment_display is
   attribute BOX_TYPE   : string ;
   signal XLXN_11    : std_logic;
   signal XLXN_12    : std_logic;
   signal XLXN_13    : std_logic;
   signal XLXN_14    : std_logic;
   signal XLXN_17    : std_logic;
   component FreqDiv15_MUSER_lab4_seven_segment_display
      port ( i : in    std_logic; 
             o : out   std_logic);
   end component;
   
   component RingCount_MUSER_lab4_seven_segment_display
      port ( anode : out   std_logic_vector (3 downto 0); 
             clock : in    std_logic);
   end component;
   
   component OR2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR2 : component is "BLACK_BOX";
   
   component AND2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2 : component is "BLACK_BOX";
   
   component INV
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
   
begin
   XLXI_1 : FreqDiv15_MUSER_lab4_seven_segment_display
      port map (i=>clock,
                o=>XLXN_14);
   
   XLXI_2 : RingCount_MUSER_lab4_seven_segment_display
      port map (clock=>XLXN_11,
                anode(3 downto 0)=>anode(3 downto 0));
   
   XLXI_3 : OR2
      port map (I0=>XLXN_13,
                I1=>XLXN_12,
                O=>XLXN_11);
   
   XLXI_4 : AND2
      port map (I0=>XLXN_17,
                I1=>XLXN_14,
                O=>XLXN_12);
   
   XLXI_5 : AND2
      port map (I0=>pushbutton,
                I1=>clock,
                O=>XLXN_13);
   
   XLXI_6 : INV
      port map (I=>pushbutton,
                O=>XLXN_17);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity lab4_seven_segment_display is
   port ( b          : in    std_logic_vector (15 downto 0); 
          clk        : in    std_logic; 
          pushbutton : in    std_logic; 
          anode      : out   std_logic_vector (3 downto 0); 
          cathode    : out   std_logic_vector (6 downto 0));
end lab4_seven_segment_display;

architecture BEHAVIORAL of lab4_seven_segment_display is
   attribute BOX_TYPE   : string ;
   signal XLXN_25    : std_logic;
   signal XLXN_26    : std_logic;
   signal XLXN_27    : std_logic;
   signal XLXN_28    : std_logic;
   signal XLXN_29    : std_logic;
   signal XLXN_30    : std_logic;
   signal XLXN_31    : std_logic;
   signal XLXN_32    : std_logic;
   signal XLXN_33    : std_logic;
   signal XLXN_34    : std_logic;
   signal XLXN_35    : std_logic;
   signal XLXN_36    : std_logic_vector (3 downto 0);
   component Clocking_MUSER_lab4_seven_segment_display
      port ( anode      : out   std_logic_vector (3 downto 0); 
             clock      : in    std_logic; 
             pushbutton : in    std_logic);
   end component;
   
   component MuxBin_MUSER_lab4_seven_segment_display
      port ( anode : in    std_logic_vector (3 downto 0); 
             b     : in    std_logic_vector (15 downto 0); 
             O0    : out   std_logic; 
             O1    : out   std_logic; 
             O2    : out   std_logic; 
             O3    : out   std_logic);
   end component;
   
   component BinTo7Seg_MUSER_lab4_seven_segment_display
      port ( A  : out   std_logic; 
             B  : out   std_logic; 
             b0 : in    std_logic; 
             b1 : in    std_logic; 
             b2 : in    std_logic; 
             b3 : in    std_logic; 
             C  : out   std_logic; 
             D  : out   std_logic; 
             E  : out   std_logic; 
             F  : out   std_logic; 
             G  : out   std_logic);
   end component;
   
   component INV
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
   
   component inv4bus_MUSER_lab4_seven_segment_display
      port ( inp  : in    std_logic_vector (3 downto 0); 
             outp : out   std_logic_vector (3 downto 0));
   end component;
   
begin
   XLXI_1 : Clocking_MUSER_lab4_seven_segment_display
      port map (clock=>clk,
                pushbutton=>pushbutton,
                anode(3 downto 0)=>XLXN_36(3 downto 0));
   
   XLXI_2 : MuxBin_MUSER_lab4_seven_segment_display
      port map (anode(3 downto 0)=>XLXN_36(3 downto 0),
                b(15 downto 0)=>b(15 downto 0),
                O0=>XLXN_32,
                O1=>XLXN_33,
                O2=>XLXN_34,
                O3=>XLXN_35);
   
   XLXI_3 : BinTo7Seg_MUSER_lab4_seven_segment_display
      port map (b0=>XLXN_32,
                b1=>XLXN_33,
                b2=>XLXN_34,
                b3=>XLXN_35,
                A=>XLXN_25,
                B=>XLXN_26,
                C=>XLXN_27,
                D=>XLXN_28,
                E=>XLXN_29,
                F=>XLXN_30,
                G=>XLXN_31);
   
   XLXI_8 : INV
      port map (I=>XLXN_25,
                O=>cathode(0));
   
   XLXI_9 : INV
      port map (I=>XLXN_26,
                O=>cathode(1));
   
   XLXI_10 : INV
      port map (I=>XLXN_27,
                O=>cathode(2));
   
   XLXI_11 : INV
      port map (I=>XLXN_28,
                O=>cathode(3));
   
   XLXI_12 : INV
      port map (I=>XLXN_29,
                O=>cathode(4));
   
   XLXI_13 : INV
      port map (I=>XLXN_30,
                O=>cathode(5));
   
   XLXI_14 : INV
      port map (I=>XLXN_31,
                O=>cathode(6));
   
   XLXI_16 : inv4bus_MUSER_lab4_seven_segment_display
      port map (inp(3 downto 0)=>XLXN_36(3 downto 0),
                outp(3 downto 0)=>anode(3 downto 0));
   
end BEHAVIORAL;


