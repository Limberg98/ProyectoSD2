library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity BinarytoBCD_6bits is
port(B: in std_logic_vector(5 downto 0);
	  Decena: out std_logic_vector(3 downto 0);
	  Unidad: out std_logic_vector(3 downto 0));
end BinarytoBCD_6bits;

architecture solucion of BinarytoBCD_6bits is
begin
	bcd1: process(B)
		variable z: std_logic_vector(12 downto 0);
		begin
			for i in 0 to 12 loop
				z(i) := '0';
			end loop;
			z(8 downto 3) :=B;
			
			for i in 0 to 2 loop
				if z(9 downto 6) > 4 then
					z(9 downto 6) := z(9 downto 6) + 3;
				end if;
				z(12 downto 1) := z(11 downto 0);
			end loop;
		
		Decena<='0' & z(12 downto 10);
		Unidad<=z(9 downto 6);
	end process bcd1;
end solucion;