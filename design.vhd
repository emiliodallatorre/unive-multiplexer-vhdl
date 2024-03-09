
-- AND gate
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY AND_GATE_TB IS
    PORT (
        A : IN STD_LOGIC;
        B : IN STD_LOGIC;
        Y : OUT STD_LOGIC
    );
END AND_GATE_TB;

ARCHITECTURE Behavioral OF AND_GATE_TB IS
BEGIN
    Y <= A AND B;
END Behavioral;
-- NAND gate
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY NAND_GATE_TB IS
    PORT (
        A : IN STD_LOGIC;
        B : IN STD_LOGIC;
        Y : OUT STD_LOGIC
    );
END NAND_GATE_TB;

ARCHITECTURE Behavioral OF NAND_GATE_TB IS
BEGIN
    Y <= NOT (A AND B);
END Behavioral;
-- NOR gate
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY NOR_GATE_TB IS
    PORT (
        A : IN STD_LOGIC;
        B : IN STD_LOGIC;
        Y : OUT STD_LOGIC
    );
END NOR_GATE_TB;

ARCHITECTURE Behavioral OF NOR_GATE_TB IS
BEGIN
    Y <= NOT (A OR B);
END Behavioral;
-- NOT gate
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY NOT_GATE_TB IS
    PORT (
        A : IN STD_LOGIC;
        Y : OUT STD_LOGIC
    );
END NOT_GATE_TB;

ARCHITECTURE Behavioral OF NOT_GATE_TB IS
BEGIN
    Y <= NOT A;
END Behavioral;

-- MUX 4 by 1
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY MUX_4_1 IS
    PORT (
        A, B, C, D : IN STD_LOGIC;
        S0, S1 : IN STD_LOGIC;
        Y : OUT STD_LOGIC
    );
END ENTITY MUX_4_1;

ARCHITECTURE Behavioral OF MUX_4_1 IS
    COMPONENT NAND_GATE_TB
        PORT (
            A, B : IN STD_LOGIC;
            Y : OUT STD_LOGIC
        );
    END COMPONENT;
    COMPONENT NOR_GATE_TB
        PORT (
            A, B : IN STD_LOGIC;
            Y : OUT STD_LOGIC
        );
    END COMPONENT;
    SIGNAL NOT_S0, NOT_S1 : STD_LOGIC;
    SIGNAL Y0, Y1, Y2, Y3 : STD_LOGIC;
BEGIN
    -- Invert select signals
    U1 : NAND_GATE_TB PORT MAP(A => S0, B => S0, Y => NOT_S0);
    U2 : NAND_GATE_TB PORT MAP(A => S1, B => S1, Y => NOT_S1);

    -- Generate NAND outputs
    U3 : NAND_GATE_TB PORT MAP(A => A, B => NOT_S0, Y => Y0);
    U4 : NAND_GATE_TB PORT MAP(A => B, B => S0, Y => Y1);
    U5 : NAND_GATE_TB PORT MAP(A => C, B => NOT_S1, Y => Y2);
    U6 : NAND_GATE_TB PORT MAP(A => D, B => S1, Y => Y3);

    -- Combine outputs with NOR gate
    U7 : NOR_GATE_TB PORT MAP(A => Y0, B => Y1, Y => Y);
    U8 : NOR_GATE_TB PORT MAP(A => Y2, B => Y3, Y => Y);
END ARCHITECTURE Behavioral;