library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DecodificadorEstoque is
    port (
        estoque      : in  std_logic_vector(3 downto 0); 
        disp_dezena  : out std_logic_vector(6 downto 0); 
        disp_unidade : out std_logic_vector(6 downto 0)  
    );
end DecodificadorEstoque;

architecture arq of DecodificadorEstoque is
begin
    process(estoque)
    begin
        case estoque is
            
            when "0000" => 
                disp_dezena  <= "1000000"; 
                disp_unidade <= "1000000"; 
            when "0001" => 
                disp_dezena  <= "1000000"; 
                disp_unidade <= "1111001"; 
            when "0010" => 
                disp_dezena  <= "1000000"; 
                disp_unidade <= "0100100"; 
            when "0011" => 
                disp_dezena  <= "1000000"; 
                disp_unidade <= "0110000"; 
            when "0100" => 
                disp_dezena  <= "1000000"; 
                disp_unidade <= "0011001"; 
            when "0101" => 
                disp_dezena  <= "1000000"; 
                disp_unidade <= "0010010"; 
            when "0110" => 
                disp_dezena  <= "1000000"; 
                disp_unidade <= "0000010"; 
            when "0111" => 
                disp_dezena  <= "1000000"; 
                disp_unidade <= "1111000"; 
            when "1000" => 
                disp_dezena  <= "1000000"; 
                disp_unidade <= "0000000"; 
            when "1001" => 
                disp_dezena  <= "1000000"; 
                disp_unidade <= "0010000"; 
                
            when "1010" => 
                disp_dezena  <= "1111001"; 
                disp_unidade <= "1000000"; 
            when "1011" => 
                disp_dezena  <= "1111001"; 
                disp_unidade <= "1111001"; 
            when "1100" => 
                disp_dezena  <= "1111001"; 
                disp_unidade <= "0100100"; 
            when "1101" => 
                disp_dezena  <= "1111001"; 
                disp_unidade <= "0110000"; 
            when "1110" => 
                disp_dezena  <= "1111001"; 
                disp_unidade <= "0011001"; 
            when "1111" => 
                disp_dezena  <= "1111001";
                disp_unidade <= "0010010"; 

            when others => 
                disp_dezena  <= "1111111"; 
                disp_unidade <= "1111111";
        end case;
    end process;
end arq;