library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity glue_logic is
    Port ( SRESET : in  std_logic;
           BRESET : in  std_logic;
           DUART_DTACK : in  std_logic;
           ABUS : in  std_logic_vector (4 downto 0);
           AS : in  std_logic;
           CLK : in  std_logic;
           UDS : in  std_logic;
           LDS : in  std_logic;
           HALT : inout  std_logic;
           BERR : out  std_logic;
           LED : out  std_logic_vector (5 downto 0);
           ROMLOE : out  std_logic;
           ROMLCE : out  std_logic;
           ROMHOE : out  std_logic;
           ROMHCE : out  std_logic;
           RAMLCE : out  std_logic_vector (1 downto 0);
           RAMLOE : out  std_logic;
           RAMHCE : out  std_logic_vector (1 downto 0);
           RAMHOE : out  std_logic;
           RESET : out  std_logic;
           CPU_DTACK : out  std_logic;
           DUARTCS : out  std_logic);
end glue_logic;

architecture Behavioral of glue_logic is
    signal reset_output : std_logic := '0';

    -- as, lds, uds, abus
    signal decode_bus : std_logic_vector (7 downto 0);
    
begin

-------------------------------------------
-- reset logic
    reset_output <= BRESET or SRESET;
    RESET <= reset_output;
    HALT <= reset_output;

-------------------------------------------
-- address decoding
    process (CLK, decode_bus)
    begin   
        if rising_edge(CLK) then  
            decode_bus <= AS & LDS & UDS & ABUS;

            case decode_bus is
                when "00100000" =>
                    ROMLOE <= '0';
                    ROMLCE <= '0';                
                when "01000000" =>
                    ROMHOE <= '0';
                    ROMHCE <= '0';
                when "00100010" =>
                    RAMLOE <= '0';
                    RAMLCE <= "0Z";
                when "01000010" =>
                    RAMHOE <= '0';
                    RAMHCE <= "0Z";
                when "00100100" =>
                    DUARTCS <= '0';
                when others =>
                    ROMLOE <= 'Z';
                    ROMLCE <= 'Z';
                    ROMHOE <= 'Z';
                    ROMHCE <= 'Z';
                    RAMHOE <= 'Z';
                    RAMHCE <= "Z0";
                    RAMLOE <= 'Z';
                    RAMLCE <= "Z0";
                    DUARTCS <= '0';
            end case;
        end if;
    end process;

-------------------------------------------
-- led's
    LED <= "Z0Z0Z0";
-------------------------------------------
-- other
    BERR <= 'Z';
    CPU_DTACK <= DUART_DTACK;

end Behavioral;

