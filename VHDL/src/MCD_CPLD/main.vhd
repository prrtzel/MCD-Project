library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity glue_logic is
    Port ( SRESET : in  std_logic;
           BRESET : in  std_logic;
           DUART_DTACK : in  std_logic;
           ABUS : in  std_logic_vector (0 downto 4);
           
           AS : in  std_logic;
           CLK : in  std_logic;
           UDS : in  std_logic;
           LDS : in  std_logic;

           HALT : inout  std_logic;
           BERR : out  std_logic;

           LED : out  std_logic_vector (0 downto 5);
           ROMLOE : out  std_logic;
           ROMLCE : out  std_logic;
           ROMHOE : out  std_logic;
           ROMHCE : out  std_logic;
           RAMLCE : out  std_logic_vector (0 downto 1);
           RAMLOE : out  std_logic;
           RAMHCE : out  std_logic_vector (0 downto 1);
           RAMHOE : out  std_logic;
           RESET : out  std_logic;
           CPU_DTACK : out  std_logic;
           DUARTCS : out  std_logic);
end glue_logic;

architecture Behavioral of glue_logic is
    signal reset_output : std_logic := '0';
    
    
begin

    reset_output <= BRESET and SRESET;
    RESET <= reset_output;

end Behavioral;

