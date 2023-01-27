library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity Valores is
	port(Placa: in std_logic_vector(13 downto 0);
		  Veces: in std_logic_vector(4 downto 0);
		  Pago: out std_logic_vector(15 downto 0));
end Valores;

architecture Resultado of Valores is
signal N_Veces: std_logic_vector(7 downto 0);
signal N_placa: std_logic_vector(15 downto 0);
begin
	N_Veces<="000"&Veces;
	N_placa<="00"&Placa;
	process(N_placa)
	begin
		case N_placa is
			when X"0490"=> Pago<=N_Veces*X"28";
			when X"116E"=> Pago<=N_Veces*X"28";
			when X"0960"=> Pago<=N_Veces*X"28";
			when X"1B76"=> Pago<=N_Veces*X"28";
			when X"0F1B"=> Pago<=N_Veces*X"28";
			when X"153C"=> Pago<=N_Veces*X"14";
			when X"19E3"=> Pago<=N_Veces*X"14";
			when X"0BEE"=> Pago<=N_Veces*X"14";
			when X"22D9"=> Pago<=N_Veces*X"14";
			when X"1C69"=> Pago<=N_Veces*X"14";
			when others=> Pago<=X"0000";
		end case;
	end process;
end Resultado;