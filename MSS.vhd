library ieee;
use ieee.std_logic_1164.all;

entity MSS is
	port(Clk,Resetn,Ingresar,Igual,Limite,Mostrar: in std_logic;
		  En_M,En_C,En_D,En_U,Display1,Display2,Display3,Display4,Display5,Display6,Display7,Display8,Display9,Final,
		  En_Dir,Ld_Dir,En_reps,Ld_reps: out std_logic);
end MSS;

architecture Controlador of MSS is
type estado is (Ta,Tb,Tc,Td,Te,Tf,Tg,Th,Ti,Tj,Tk,Tl,Tm,Tn,Too,Tp,Tq,Tr,Ts,Tt,Tu);
signal y: estado;
begin
	process(Clk, Resetn)
	begin
		if Resetn='0' then y<=Ta;
		elsif (Clk' event and Clk='1') then
			case y is
				when Ta=> if Ingresar='1' then y<=Tb; else y<=Ta; end if;
				when Tb=> if Ingresar='0' then y<=Tc; else y<=Tb; end if;
				when Tc=> y<=Td;
				when Td=> if Ingresar='1' then y<=Te; else y<=Td; end if;
				when Te=> if Ingresar='0' then y<=Tf; else y<=Te; end if;
				when Tf=> y<=Tg;
				when Tg=> if Ingresar='1' then y<=Th; else y<=Tg; end if;
				when Th=> if Ingresar='0' then y<=Ti; else y<=Th; end if;
				when Ti=> y<=Tj;
				when Tj=> if Ingresar='1' then y<=Tk; else y<=Tj; end if;
				when Tk=> if Ingresar='0' then y<=Tl; else y<=Tk; end if;
				when Tl=> y<=Tm;
				when Tm=> if Igual='1' then y<=Tn; else y<=Too; end if;
				when Tn=> y<=Too;
				when Too=> if Limite='1' then y<=Tq; else y<=Tp; end if;
				when Tp=> y<=Tm;
				when Tq=> if Mostrar='1' then y<=Tr; else y<=Tq; end if;
				when Tr=> if Mostrar='0' then y<=Ts; else y<=Tr; end if;
				when Ts=> if Ingresar='1' then y<=Tt; else y<=Ts; end if;
				when Tt=> if Ingresar='0' then y<=Tu; else y<=Tt; end if;
				when Tu=> y<=Ta;
			end case;
		end if;
	end process;
	
	process(y)
	begin
	En_M<='0';En_C<='0';En_D<='0';En_U<='0';Display1<='0';Display2<='0';Display3<='0';Display4<='0';Display5<='0';Display6<='0';
	Display7<='0';Display8<='0';Display9<='0';Final<='0'; En_Dir<='0'; Ld_Dir<='0'; En_reps<='0'; Ld_reps<='0';
		case y is
			when Tc=> En_M<='1';
			when Td=> Display1<='1';
			when Te=> Display1<='1'; 
			when Tf=> En_C<='1'; Display1<='1';
			when Tg=> Display1<='1'; Display2<='1';
			when Th=> Display1<='1'; Display2<='1';
			when Ti=> En_D<='1'; Display1<='1'; Display2<='1';
			when Tj=> Display1<='1'; Display2<='1'; Display3<='1';
			when Tk=> Display1<='1'; Display2<='1'; Display3<='1';
			when Tl=> En_U<='1'; Display1<='1'; Display2<='1'; Display3<='1';
			when Tm=> Display1<='1'; Display2<='1'; Display3<='1'; Display4<='1';
			when Tn=> En_reps<='1'; Display1<='1'; Display2<='1'; Display3<='1'; Display4<='1';
			when Too=> Display1<='1'; Display2<='1'; Display3<='1'; Display4<='1';
			when Tp=> En_Dir<='1'; Display1<='1'; Display2<='1'; Display3<='1'; Display4<='1';
			when Tq=> Final<='1'; Display1<='1'; Display2<='1'; Display3<='1'; Display4<='1';
			when Tr=> Final<='1'; Display1<='1'; Display2<='1'; Display3<='1'; Display4<='1';
			when Ts=> Display1<='1'; Display2<='1'; Display3<='1'; Display4<='1'; Display5<='1'; Display6<='1'; Display7<='1'; Display8<='1'; Display9<='1';
			when Tt=> Display1<='1'; Display2<='1'; Display3<='1'; Display4<='1'; Display5<='1'; Display6<='1'; Display7<='1'; Display8<='1'; Display9<='1';
			when Tu=> En_Dir<='1'; Ld_Dir<='1'; En_reps<='1'; Ld_reps<='1';
			when others=>
		end case;
	end process;
end Controlador;