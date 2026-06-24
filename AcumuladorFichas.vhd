library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity AcumuladorFichas is
    port (
        clock         : in  std_logic;
        reset         : in  std_logic;
        I_ticket      : in  std_logic;                      
        estoque_atual : in  std_logic_vector(3 downto 0);   
        O_Value       : out std_logic_vector(2 downto 0);  --soma das fichas
        O_Release     : out std_logic;                     --sinal que libera a latinha
        venda_ok      : out std_logic                       
    );
end AcumuladorFichas;

architecture arq of AcumuladorFichas is
begin
    process(clock, reset)
        variable fichas_internas : std_logic_vector(2 downto 0);
    begin
        if reset = '1' then
            fichas_internas := "000";
            O_Release <= '0';
            venda_ok <= '0';
            
        elsif clock'event and clock = '1' then
            O_Release <= '0';
            venda_ok <= '0';

            if I_ticket = '1' then
                
                if fichas_internas < "101" then
                    fichas_internas := fichas_internas + 1;
                    
                    if fichas_internas = "101" then
                        
                        if estoque_atual > "0000" then
                            O_Release <= '1';
                            venda_ok <= '1';
                        end if;
                    end if;
                end if;

            else
                fichas_internas := "000";
            end if;
        end if;
        
        O_Value <= fichas_internas;
        
    end process;
end arq;