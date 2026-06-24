Library IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.std_logic_unsigned.all;

Entity Divfreq_1Hz is
port (clock,reset : in std_logic;
      q : out std_logic);
end Divfreq_1Hz;

architecture arq of Divfreq_1Hz is
begin

	process(clock,reset)
	variable count: std_logic_vector(24 downto 0);
	variable temp : std_logic;
	begin
		if reset = '1' then
		   count := (others => '0');
		   temp := '0';
		elsif clock'event and clock = '1' then
          if count = x"CDFE5F" then --(27M/2)-1 =13.499.999
		       count := (others => '0'); --salvamento x"CDFE5F" 
		       temp := not temp;--000002
		    else 
		       count := count + 1;
		    end if;
		end if;
		q <= temp;
	end process;

end arq;