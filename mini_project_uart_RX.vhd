--this file contains the UART receiver --
--this implemented receiver will be able to receive 8 bits of serial data, one start bit, one stop bit and no parity bit
--when receiver will be completed out_RX_DV will be driven high for one clock cycle.
--
--
-- set generic g_clock_per_bit as: g_clock_per_bit = (frequency of input_clk)/(frequency(baud) of UART)
--
--frequency of input_clk --25MHz (25000000)
--frequency(baud) of UART --9600
--
--g_clock_per_bit = 2604.167   --117 is an example
--
--IMPLEMENTATION OF RECEIVER

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;

entity uart_RX is
  generic (
    g_clock_per_bit : integer := 10416     -- Needs to be set correctly and as needed //constants
    );
  port (
    in_clk       : in  std_logic;           --input clock
    in_RX_serial : in  std_logic;           --input RX serial communication, It is the serial data stream
    out_RX_DV     : out std_logic;          -- Data-valid pulse (one clock cycle wide) 
    --out RX_DV tells us when out_RX_byte has some valid data in it
    out_RX_byte   : out std_logic_vector(7 downto 0)   --output RX is the byte vector serial data
    );
end uart_RX;

 
architecture behav of uart_RX is
 
 --state machine enumerated type
  type t_SM_main is (s_idle, s_RX_start_bit, s_RX_data_bits,
                     s_RX_stop_bit, s_cleanup);
  
  
  signal r_SM_main : t_SM_main := s_idle; --set it to idle, thus it is gonna start in an idle state
 
  signal r_RX_data_r : std_logic := '0';
  signal r_RX_data   : std_logic := '0';
   
  signal r_clk_count : integer range 0 to g_clock_per_bit-1 := 0;
  signal r_bit_index : integer range 0 to 7 := 0;  -- 8 Bits Total
  signal r_RX_byte   : std_logic_vector(7 downto 0) := (others => '0');
  signal r_RX_DV     : std_logic := '0';
   
begin
 
 
 --Process is SENSITIVE to input clock
 --PURPOSE: Controlling State Machine RX
 process_example : process (in_clk) 
 
 begin
 --Double register it to 2 variables namely r_RX_data_r and r_RX_data.
   if rising_edge(in_clk) then
     r_RX_data_r <= in_RX_serial;
     r_RX_data   <= r_RX_data_r;
   end if;
 end process process_example;
  

 -- this method controls the RX state machine (receiver of UART)
 process_uart_RX : process (in_clk)
 begin
   if rising_edge(in_clk) then
   
     case r_SM_main is
     --Starting off at an idle state
       when s_idle =>
         r_RX_DV     <= '0';
         r_clk_count <= 0;
         r_bit_index <= 0;

        -- Start bit detected here (If)
         if r_RX_data = '0' then --it is high before that at Idle state
           r_SM_main <= s_RX_start_bit; --recieving the start bit state
         else
           r_SM_main <= s_idle;
         end if;

          
       -- Confirm that the start bit is still low by checking the middle of the start bit // Basically to avoid glitching 
       when s_RX_start_bit =>
         if r_clk_count = (g_clock_per_bit-1)/2 then
           if r_RX_data = '0' then
             r_clk_count <= 0;  -- reset the counter, 'cause we found the middle
             r_SM_main   <= s_RX_data_bits; --Here we are ready to get serial bit stream 
           else
             r_SM_main   <= s_idle; --Sadly :( it was a glitch to trick the State machine but we knew it already :D
           end if;
         else
           r_clk_count <= r_clk_count + 1;
           r_SM_main   <= s_RX_start_bit;
         end if;

          
       -- Here wait g_clock_per_bit-1 clock cycles to sample serial data 
       when s_RX_data_bits =>
         if r_clk_count < g_clock_per_bit-1 then
           r_clk_count <= r_clk_count + 1;
           r_SM_main   <= s_RX_data_bits;
         else
           r_clk_count            <= 0;
           r_RX_byte(r_bit_index) <= r_RX_data; --r_RX_data / r_RX_data_r / i_RX_serial are the same thing (since we double registered them)
           --r_bit_index will go from 0-7 and set data at respective index positions at r_RX_byte
           
           -- Here we check if have received all bits of the cycle
           if r_bit_index < 7 then
             r_bit_index <= r_bit_index + 1;
             r_SM_main   <= s_RX_data_bits;
           else
             r_bit_index <= 0;
             r_SM_main   <= s_RX_stop_bit;
           end if;
         end if;


       -- Here we detect and receive the stop bit : Stop bit = 1
       --Stop bit: it will tell us that the significant character bytes are finished (Parity bit not used)
       when s_RX_stop_bit =>
         -- Here also wait g_clock_per_bit-1 clock cycles for Stop bit to finish)
         if r_clk_count < g_clock_per_bit-1 then
           r_clk_count <= r_clk_count + 1;
           r_SM_main   <= s_RX_stop_bit;
         else
           r_RX_DV     <= '1';          --make data valid pulse 1
           r_clk_count <= 0;            --setting the count = 0
           r_SM_main   <= s_cleanup;    --clean up
         end if;

                  
       -- Stay here if 1 clock
       when s_cleanup => 
         r_SM_main <= s_idle;
         r_RX_DV   <= '0';

            
       when others =>
         r_SM_main <= s_idle;
     end case;
   end if;
 end process process_uart_RX;

 out_RX_DV   <= r_RX_DV;        --put the data valid pulse in the output
 out_RX_byte <= r_RX_byte;      --put the vector of all the bits and put it in an out vector
  
end behav;