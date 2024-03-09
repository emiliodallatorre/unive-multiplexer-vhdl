LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY MUX_4_1_TB IS
END ENTITY MUX_4_1_TB;

ARCHITECTURE Behavioral OF MUX_4_1_TB IS
    COMPONENT MUX_4_1
        PORT (
            A, B, C, D : IN STD_LOGIC;
            S0, S1 : IN STD_LOGIC;
            Y : OUT STD_LOGIC
        );
    END COMPONENT;
    SIGNAL A_TB, B_TB, C_TB, D_TB, S0_TB, S1_TB : STD_LOGIC := '0';
BEGIN
    uut : MUX_4_1 PORT MAP(A => A_TB, B => B_TB, C => C_TB, D => D_TB, S0 => S0_TB, S1 => S1_TB);
    -- Stimulus Process
    stimulus : PROCESS
    BEGIN
        -- Test 1: Select input A
        A_TB <= '1';
        B_TB <= '0';
        C_TB <= '0';
        D_TB <= '0';
        S0_TB <= '0';
        S1_TB <= '0';
        WAIT FOR 10 ns;
        -- Test 2: Select input B
        A_TB <= '0';
        B_TB <= '1';
        C_TB <= '0';
        D_TB <= '0';
        S0_TB <= '1';
        S1_TB <= '0';
        WAIT FOR 10 ns;
        -- Test 3: Select input C
        A_TB <= '0';
        B_TB <= '0';
        C_TB <= '1';
        D_TB <= '0';
        S0_TB <= '0';
        S1_TB <= '1';
        WAIT FOR 10 ns;
        -- Test 4: Select input D
        A_TB <= '0';
        B_TB <= '0';
        C_TB <= '0';
        D_TB <= '1';
        S0_TB <= '1';
        S1_TB <= '1';
        WAIT FOR 10 ns;
        WAIT;
    END PROCESS stimulus;
END ARCHITECTURE Behavioral;