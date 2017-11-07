---this file contains the UART transmitter --
--this implemented transmitter will be able to transmit 8 bits of serial data, one start bit, one stop bit and no parity bit
--when transmission will be done out_TX_done will be driven high for one clock cycle.
--
--
-- set generic g_clock_per_bit as: g_clock_per_bit = (frequency of input_clk)/(frequency(baud) of UART)


--IMPLEMENTATION OF RECEIVER

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;

entity uart_TX is
  generic (
    g_clock_per_bit : integer := 115     -- Needs to be set correctly and as needed
    );
  port (
    in_clk       : in  std_logic;           --input clock
    in_TX_serial : in  std_logic;           --input RX serial communication
    in_TX_byte     : in std_logic_vector(7 downto 0) --8 bit vector is input to transmitter
    out_TX_active   : out std_logic;
    out_TX_serial   : out std_logic;
    out_TX_done   : out std_logic    
    );
end uart_TX;

 
 
architecture behav of uart_TX is
 
  type t_SM_Main is (s_Idle, s_TX_Start_Bit, s_TX_Data_Bits,
                     s_TX_Stop_Bit, s_Cleanup);
  signal r_SM_Main : t_SM_Main := s_Idle;
 
  signal r_Clk_Count : integer range 0 to g_CLKS_PER_BIT-1 := 0;
  signal r_Bit_Index : integer range 0 to 7 := 0;  -- 8 Bits Total
  signal r_TX_Data   : std_logic_vector(7 downto 0) := (others => '0');
  signal r_TX_Done   : std_logic := '0';
   
begin
   
  process_uart_TX : process (i_clk)
  begin
    if rising_edge(i_clk) then
         
      case r_SM_main is
 
        when s_idle =>
          out_TX_active <= '0';
          out_TX_serial <= '1';         --Make High for Idle
          r_TX_done   <= '0';
          r_clk_count <= 0;
          r_bit_index <= 0;
 
          if in_TX_DV = '1' then
            r_TX_data <= i_TX_byte;
            r_SM_main <= s_TX_start_bit;
          else
            r_SM_main <= s_idle;
          end if;
 
           
        -- Transmit the start bit. The start bit is 0
        when s_TX_start_bit =>
          out_TX_active <= '1';
          out_TX_serial <= '0';
 
          -- Here wait g_clock_per_bit-1 for start bit to finish
          if r_clk_count < g_clock_per_bit-1 then
            r_clk_count <= r_clk_count + 1;
            r_SM_main   <= s_TX_start_bit;
          else
            r_clk_count <= 0;
            r_SM_main   <= s_TX_data_bits;
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
        when s_TX_Stop_Bit =>
          o_TX_Serial <= '1';
 
          -- Wait g_clock_per_bit-1 clock cycles for Stop bit to finish
          if r_clk_count < g_clock_per_bit-1 then
            r_clk_count <= r_clk_count + 1;
            r_SM_main   <= s_TX_stop_bit;
          else
            r_TX_done   <= '1';
            r_clk_count <= 0;
            r_SM_main   <= s_cleanup;
          end if;
 
                   
        -- Stay here 1 clock
        when s_cleanup =>
          o_TX_active <= '0';
          r_TX_done   <= '1';
          r_SM_main   <= s_idle;
           
             
        when others =>
          r_SM_main <= s_idle;
 
      end case;
    end if;
  end process process_uart_TX;
 
  out_TX_done <= r_TX_done;
   
end behav;