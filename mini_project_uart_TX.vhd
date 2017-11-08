---this file contains the UART transmitter --
--this implemented transmitter will be able to transmit 8 bits of serial data, one start bit, one stop bit and no parity bit
--when transmission will be done out_TX_done will be driven high for one clock cycle.
--
--
-- set generic g_clock_per_bit as: g_clock_per_bit = (frequency of input_clk)/(frequency(baud) of UART)
--
--frequency of input_clk --25MHz (25000000)
--frequency(baud) of UART --9600
--
--g_clock_per_bit = 2604.167                        --117 is an example
--
--IMPLEMENTATION OF RECEIVER

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;

entity uart_TX is
  generic (
    g_clock_per_bit : integer := 117     -- Needs to be set correctly and as needed
    );
  port (
    in_clk       : in  std_logic;           --input clock
    in_TX_DV : in  std_logic;               --data-valid pulse
    in_TX_byte     : in std_logic_vector(7 downto 0); --8 bit vector is input to transmitter
    out_TX_active   : out std_logic;
    out_TX_serial   : out std_logic;
    out_TX_done   : out std_logic    
    );
end uart_TX;

 
 
architecture behav of uart_TX is
 
  type t_SM_main is (s_idle, s_TX_start_bit, s_TX_data_bits,
                     s_TX_stop_bit, s_cleanup);
  signal r_SM_main : t_SM_main := s_idle;
 
  signal r_clk_count : integer range 0 to g_clock_per_bit-1 := 0;
  signal r_bit_index : integer range 0 to 7 := 0;  -- 8 Bits Total
  signal r_TX_data   : std_logic_vector(7 downto 0) := (others => '0');
  signal r_TX_done   : std_logic := '0';
   
begin
   
  process_uart_TX : process (in_clk)
  begin
    if rising_edge(in_clk) then
         
      case r_SM_main is
 
        when s_idle => --idle state initialization and staying here until something happens
          out_TX_active <= '0';
          out_TX_serial <= '1';         --Make High for Idle
          r_TX_done   <= '0';
          r_clk_count <= 0;
          r_bit_index <= 0;
 
          if in_TX_DV = '1' then        --when data-valid pulse is 1
            r_TX_data <= in_TX_byte;         --register the data on the line 
            r_SM_main <= s_TX_start_bit;
          else
            r_SM_main <= s_idle;
          end if;
 
           
        -- Transmit the start bit. The start bit is 0
        when s_TX_start_bit =>
          out_TX_active <= '1';         --active through out the enitre data transmission
          out_TX_serial <= '0';         --actual serial line 
 
          -- Here wait g_clock_per_bit-1 for start bit to finish
          if r_clk_count < g_clock_per_bit-1 then
            r_clk_count <= r_clk_count + 1;
            r_SM_main   <= s_TX_start_bit;
          else
            r_clk_count <= 0;
            r_SM_main   <= s_TX_data_bits;          --send the data bits
          end if;
 
           
        -- Here wait g_clock_per_bit-1 clock cycles for data bits to completely transmit          
        when s_TX_data_bits =>
          out_TX_serial <= r_TX_data(r_bit_index);
           
          if r_clk_count < g_clock_per_bit-1 then
            r_clk_count <= r_clk_count + 1;
            r_SM_main   <= s_TX_data_bits;
          else
            r_clk_count <= 0;
             
            -- Check if we have transmit all bits 
            if r_bit_index < 7 then
              r_bit_index <= r_bit_index + 1;
              r_SM_main   <= s_TX_data_bits;
            else
              r_bit_index <= 0;
              r_SM_main   <= s_TX_stop_bit;
            end if;
          end if;
 
 
        -- Transmit the last Stop bit.  Stop bit = 1
        when s_TX_stop_bit =>
          out_TX_serial <= '1';
 
          -- Wait g_clock_per_bit-1 clock cycles for Stop bit to finish
          if r_clk_count < g_clock_per_bit-1 then
            r_clk_count <= r_clk_count + 1;
            r_SM_main   <= s_TX_stop_bit;
          else
            r_TX_done   <= '1';
            r_clk_count <= 0;
            r_SM_main   <= s_cleanup;
          end if;
 
                   
        -- Stay here for 1 clock cycle
        when s_cleanup =>
          out_TX_active <= '0';
          r_TX_done   <= '1';
          r_SM_main   <= s_idle;
           
             
        when others =>
          r_SM_main <= s_idle;
 
      end case;
    end if;
  end process process_uart_TX;
 
  out_TX_done <= r_TX_done;
   
end behav;