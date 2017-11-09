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
		serial_in  : in std_logic;
		serial_out : out std_logic);
end UART_main;

