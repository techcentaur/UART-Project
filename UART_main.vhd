library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;


entity UART_main is
	port (
		clk        : in std_logic;
		data       : in std_logic_vector(7 downto 0);
		receive    : in std_logic;
		transmit   : in std_logic;
		execute    : in std_logic;
		anode      : out   std_logic_vector (3 downto 0);
        cathode    : out   std_logic_vector (6 downto 0);
		serial_comm: inout std_logic);
		
end UART_main;


architecture behav of UART_main is

signal data_transmit : std_logic_vector(7 downto 0);
signal data_receive  : std_logic_vector(7 downto 0);
signal serial_receive : std_logic;
signal serial_transmit: std_logic;
signal data_ssd      : std_logic_vector(15 downto 0);

begin

data_ssd <= "00000000" & data_receive;

assign: process(clk)
begin
    if receive='1' then
        serial_receive <= serial_comm;
    elsif transmit='1' then
        data_transmit <= data;
        serial_transmit <= serial_comm;
    end if;
end process;

ssd : entity work.lab4_seven_segment_display
    port map (
        b => data_ssd,
        clk => clk,
        pushbutton => '0',
        anode => anode,
        cathode => cathode);

receiver : entity work.uart_RX 
	generic map (
		g_clock_per_bit => 10416)
	port map (
		in_clk => clk,
		in_RX_serial => serial_receive,
		out_RX_DV => open,
		out_RX_byte => data_receive);

transmitter : entity work.uart_TX
	generic map (
		g_clock_per_bit => 10416)
	port map (
		in_clk => clk,
		in_TX_DV => execute,
		in_TX_byte => data_transmit,
		out_TX_active => open,
		out_TX_serial => serial_transmit,
		out_TX_done => open);

end behav;
