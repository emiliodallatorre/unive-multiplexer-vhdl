
-- AND gate
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY AND_GATE IS
    PORT (
        A : IN STD_LOGIC;
        B : IN STD_LOGIC;
        Y : OUT STD_LOGIC
    );
END AND_GATE;

ARCHITECTURE Behavioral OF AND_GATE IS
BEGIN
    Y <= A AND B;
END Behavioral;
-- NAND gate
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY NAND_GATE IS
    PORT (
        A : IN STD_LOGIC;
        B : IN STD_LOGIC;
        Y : OUT STD_LOGIC
    );
END NAND_GATE;

ARCHITECTURE Behavioral OF NAND_GATE IS
BEGIN
    Y <= NOT (A AND B);
END Behavioral;
-- NOR gate
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY NOR_GATE IS
    PORT (
        A : IN STD_LOGIC;
        B : IN STD_LOGIC;
        Y : OUT STD_LOGIC
    );
END NOR_GATE;

ARCHITECTURE Behavioral OF NOR_GATE IS
BEGIN
    Y <= NOT (A OR B);
END Behavioral;
-- NOT gate
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY NOT_GATE IS
    PORT (
        A : IN STD_LOGIC;
        Y : OUT STD_LOGIC
    );
END NOT_GATE;

ARCHITECTURE Behavioral OF NOT_GATE IS
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
    COMPONENT NAND_GATE
        PORT (
            A, B : IN STD_LOGIC;
            Y : OUT STD_LOGIC
        );
    END COMPONENT;
    COMPONENT NOR_GATE
        PORT (
            A, B : IN STD_LOGIC;
            Y : OUT STD_LOGIC
        );
    END COMPONENT;
    SIGNAL NOT_S0, NOT_S1, A_AND_S0, B_AND_S0, C_AND_S1, D_AND_S1, Y1, Y2 : STD_LOGIC;
BEGIN
    U1 : NAND_GATE PORT MAP(A => S0, B => S0, Y => NOT_S0);
    U2 : NAND_GATE PORT MAP(A => S1, B => S1, Y => NOT_S1);
    U3 : NAND_GATE PORT MAP(A => A, B => NOT_S0, Y => A_AND_S0);
    U4 : NAND_GATE PORT MAP(A => B, B => S0, Y => B_AND_S0);
    U5 : NAND_GATE PORT MAP(A => C, B => NOT_S1, Y => C_AND_S1);
    U6 : NAND_GATE PORT MAP(A => D, B => S1, Y => D_AND_S1);
    U7 : NOR_GATE PORT MAP(A => A_AND_S0, B => B_AND_S0, Y => Y1);
    U8 : NOR_GATE PORT MAP(A => C_AND_S1, B => D_AND_S1, Y => Y2);
    U9 : NOR_GATE PORT MAP(A => Y1, B => Y2, Y => Y);
END ARCHITECTURE Behavioral;