library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MaquinaRefrigerante is
    port (
        clk         : in  std_logic;
        rst         : in  std_logic;
        I_Mode      : in  std_logic;
        I_CanNumber : in  std_logic_vector(3 downto 0);
        I_ticket    : in  std_logic;

        O_Number    : out std_logic_vector(3 downto 0);
        O_Value     : out std_logic_vector(2 downto 0);
        O_Release   : out std_logic;
		  
		  testeLED1    : out std_logic;

        HEX_Num_Dez : out std_logic_vector(6 downto 0); -- Estoque (Dezena)
        HEX_Num_Uni : out std_logic_vector(6 downto 0); -- Estoque (Unidade)
        HEX_Val_Uni : out std_logic_vector(6 downto 0)  -- Fichas (Unidade)
    );
end MaquinaRefrigerante;

architecture Estrutural of MaquinaRefrigerante is

    component Divfreq_1Hz is
        port (clock, reset : in std_logic; q : out std_logic);
    end component;

    component EstoqueLatinhas is
        port (
            clock, reset, I_Mode, venda_ok : in std_logic;
            I_CanNumber : in std_logic_vector(3 downto 0);
            O_Number    : out std_logic_vector(3 downto 0)
        );
    end component;

    component AcumuladorFichas is
        port (
            clock, reset, I_ticket : in std_logic;
            estoque_atual : in std_logic_vector(3 downto 0);
            O_Value       : out std_logic_vector(2 downto 0);
            O_Release, venda_ok : out std_logic
        );
    end component;

    component DecodificadorEstoque is
        port (
            estoque      : in std_logic_vector(3 downto 0);
            disp_dezena  : out std_logic_vector(6 downto 0);
            disp_unidade : out std_logic_vector(6 downto 0)
        );
    end component;

    component DecodificadorFichas is
        port (
            fichas      : in std_logic_vector(2 downto 0);
            disp_fichas : out std_logic_vector(6 downto 0)
        );
    end component;

    signal fio_clk_1Hz    : std_logic;
    signal fio_venda_ok   : std_logic;
    signal fio_estoque    : std_logic_vector(3 downto 0);
    signal fio_fichas     : std_logic_vector(2 downto 0);

begin


    Inst_Clock: Divfreq_1Hz port map (
		  clock => clk,
        reset => rst,
        q     => fio_clk_1Hz
    );

    Inst_Estoque: EstoqueLatinhas port map (
        clock       => fio_clk_1Hz,        
        reset       => rst,
        I_Mode      => I_Mode,
        I_CanNumber => I_CanNumber,
        venda_ok    => fio_venda_ok,       
        O_Number    => fio_estoque         
    );

    Inst_Fichas: AcumuladorFichas port map (
        clock         => fio_clk_1Hz,      
        reset         => rst,
        I_ticket      => I_ticket,
        estoque_atual => fio_estoque,      
        O_Value       => fio_fichas,       
        O_Release     => O_Release,        
        venda_ok      => fio_venda_ok      
    );

    Inst_Decod_Estoque: DecodificadorEstoque port map (
        estoque      => fio_estoque,       
        disp_dezena  => HEX_Num_Dez,       
        disp_unidade => HEX_Num_Uni        
    );

    Inst_Decod_Fichas: DecodificadorFichas port map (
        fichas      => fio_fichas,         
        disp_fichas => HEX_Val_Uni         
    );

    O_Number <= fio_estoque;
    O_Value  <= fio_fichas;
	 testeLed1 <= fio_clk_1Hz;

end Estrutural;