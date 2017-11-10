library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;


entity UART_main is
	port (
		clk        : in std_logic;
		data       : in std_logic_vector(7 downto 0);
		receive    : in std_logic;
		transmit   : in std_logic;
		execute    : in std_logic);
end UART_main;


architecture behav of UART_main is

signal data_transmit : std_logic_vector(7 downto 0);
signal data_receive  : std_logic_vector(7 downto 0);

begin

receiver : entity work.uart_RX 
	generic map (
		g_clock_per_bit => 117)
	port map (
		in_clk => clk,
		in_RX_serial => receive,
		out_RX_DV => execute,
		out_RX_byte => data_receive);

transmitter : entity work.uart_TX
	generic map (
		g_clock_per_bit => 117)
	port map (
		in_clk => clk,
		in_TX_DV => execute,
		in_TX_byte => data_transmit,
		out_TX_active => open,
		out_TX_serial => transmit,
		out_TX_done => open);

end behav;
