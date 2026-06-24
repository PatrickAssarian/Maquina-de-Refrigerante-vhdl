library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity EstoqueLatinhas is
    port (
        clock       : in  std_logic;
        reset       : in  std_logic;
        I_Mode      : in  std_logic;                      
        I_CanNumber : in  std_logic_vector(3 downto 0);   
        venda_ok    : in  std_logic;                      
        O_Number    : out std_logic_vector(3 downto 0)    
		  );
end EstoqueLatinhas;
architecture arq of EstoqueLatinhas is
begin
    process(clock, reset)
        variable soma_temp : std_logic_vector(4 downto 0);
        variable estoque_interno : std_logic_vector(3 downto 0);
    begin
        if reset = '1' then
            estoque_interno := "0000";
            
        elsif clock'event and clock = '1' then
            if I_Mode = '1' then
                soma_temp := ('0' & estoque_interno) + ('0' & I_CanNumber);
                
                if soma_temp > "01111" then
                    estoque_interno := "1111";
                else
                    estoque_interno := soma_temp(3 downto 0);
                end if;
                
            elsif venda_ok = '1' then
                if estoque_interno > "0000" then
                    estoque_interno := estoque_interno - 1;
                end if;
            end if;
        end if;
        
        O_Number <= estoque_interno;
        
    end process;
end arq;