--this is the testbench file

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;
 
entity uart_TB is
end uart_TB;
 
architecture behave of uart_TB is
 
  component uart_TX is
    generic (
      g_clock_per_bit : integer := 117   -- Needs to be set correctly
      );
    port (
      in_clk       : in  std_logic;
      in_TX_DV     : in  std_logic;
      in_TX_byte   : in  std_logic_vector(7 downto 0);
      out_TX_active : out std_logic;
      out_TX_serial : out std_logic;
      out_TX_done   : out std_logic
      );
  end component uart_TX;
 
  component uart_RX is
    generic (
      g_clock_per_bit : integer := 117   -- Needs to be set correctly
      );
    port (
      in_clk       : in  std_logic;
      in_RX_serial : in  std_logic;
      out_RX_DV     : out std_logic;
      out_RX_byte   : out std_logic_vector(7 downto 0)
      );
  end component uart_RX;
 
   
  -- Test Bench uses a 25 MHz Clock
  -- Want to interface to 9600 baud UART
  -- for eg I use 117
  constant c_clock_per_bit : integer := 117;
 
  constant c_bit_period : time := 104166 ns;
   
  signal r_clock     : std_logic                    := '0';
  signal r_TX_DV     : std_logic                    := '0';
  signal r_TX_byte   : std_logic_vector(7 downto 0) := (others => '0');
  signal w_TX_serial : std_logic;
  signal w_TX_done   : std_logic;
  signal w_RX_DV     : std_logic;
  signal w_RX_byte   : std_logic_vector(7 downto 0);
  signal r_RX_serial : std_logic := '1';
 
   
  -- Low-level byte-write
  procedure UART_WRITE_BYTE (
    in_data_in       : in  std_logic_vector(7 downto 0);
    signal out_serial : out std_logic) is
  begin
 
    -- Send Start Bit
    out_serial <= '0';
    wait for c_bit_period;
 
    -- Send Data Byte
    for ii in 0 to 7 loop
      out_serial <= in_data_in(ii);
      wait for c_bit_period;
    end loop;  -- ii
 
    -- Send Stop Bit
    out_serial <= '1';
    wait for c_bit_period;
  end UART_WRITE_BYTE;
 
   
begin
 
  -- Instantiate UART transmitter
  UART_TX_INST : uart_TX
    generic map (
      g_clock_per_bit => c_clock_per_bit
      )
    port map (
      in_clk       => r_clock,
      in_TX_DV     => r_TX_DV,
      in_TX_byte   => r_TX_byte,
      out_TX_active => open,
      out_TX_serial => w_TX_serial,
      out_TX_done   => w_TX_done
      );
 
  -- Instantiate UART Receiver
  UART_RX_INST : uart_RX
    generic map (
      g_clock_per_bit => c_clock_per_bit
      )
    port map (
      in_clk       => r_clock,
      in_RX_serial => r_RX_serial,
      out_RX_DV     => w_RX_DV,
      out_RX_byte   => w_RX_byte
      );
 
  r_clock <= not r_clock after 50 ns;
   
  process is
  begin
 
    -- Tell the UART to send a command.
    wait until rising_edge(r_clock);
    wait until rising_edge(r_clock);
    r_TX_DV   <= '1';
    r_TX_byte <= X"AB";
    wait until rising_edge(r_clock);
    r_TX_DV   <= '0';
    wait until w_TX_done = '1';
 
     
    -- Send a command to the UART
    wait until rising_edge(r_clock);
    UART_WRITE_BYTE(X"3F", r_RX_serial);
    wait until rising_edge(r_clock);
 
    -- Check that the correct command was received
    if w_RX_BYTE = X"3F" then
      report "Test Passed - Correct Byte Received" severity note;
    else
      report "Test Failed - Incorrect Byte Received" severity note;
    end if;
 
    assert false report "Tests Complete" severity failure;
     
  end process;
   
end behave;