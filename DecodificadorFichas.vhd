library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DecodificadorFichas is
    port (
        fichas      : in  std_logic_vector(2 downto 0); 
        disp_fichas : out std_logic_vector(6 downto 0)  
    );
end DecodificadorFichas;

architecture arq of DecodificadorFichas is
begin
    process(fichas)
    begin
        case fichas is
            
            when "000" => disp_fichas <= "1000000"; 
            when "001" => disp_fichas <= "1111001"; 
            when "010" => disp_fichas <= "0100100"; 
            when "011" => disp_fichas <= "0110000"; 
            when "100" => disp_fichas <= "0011001"; 
            when "101" => disp_fichas <= "0010010"; 
            
            when others => disp_fichas <= "1111111"; 
        end case;
    end process;
end arq;