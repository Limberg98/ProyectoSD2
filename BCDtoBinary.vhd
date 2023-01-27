library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

--this module is for converting a 4 digit BCD number into binary number. 
--the range of the input in decimal is 0 to 9999.
entity BCDtoBinary is
    Port ( Unidad : in  STD_LOGIC_VECTOR (3 downto 0);
           Decena : in  STD_LOGIC_VECTOR (3 downto 0);
           Centena : in  STD_LOGIC_VECTOR (3 downto 0);
           Milesima : in  STD_LOGIC_VECTOR (3 downto 0);
           Binario : out  STD_LOGIC_VECTOR (13 downto 0) := (others => '0'));
end BCDtoBinary;

architecture Solucion of BCDtoBinary is

begin

Binario <= (Unidad * "01")  --multiply by 1
                + (Decena * "1010") --multiply by 10
                + (Centena * "1100100") --multiply by 100
                + (Milesima * "1111101000"); --multiply by 1000
end Solucion;