library ieee;
use ieee.std_logic_1164.all;

entity Sostenimiento is
port (Data: in std_logic_vector(3 downto 0);
		En, Clock, Resetn: in std_logic;
		Q: out std_logic_vector(3 downto 0));
end Sostenimiento;

architecture Desarrollo of Sostenimiento is
begin
	process(Resetn,Clock)
		begin
		if Resetn='0' then Q<="0000";
		elsif (clock'event and clock='1') then
			if En='1' then Q<=Data;
			end if;
		end  if;
	end process;
end Desarrollo;