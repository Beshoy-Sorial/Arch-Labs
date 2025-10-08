library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity partD is
  generic (n : integer := 8);
  port ( 
    A    : in  std_logic_vector(n-1 downto 0);
    Cin, S0, S1 : in  std_logic;
    F    : out std_logic_vector(n-1 downto 0);
    Cout : out std_logic
  );
end partD;

architecture archD of partD is
  signal sel : std_logic_vector(1 downto 0);
begin
  sel <= S1 & S0;
  
  with sel select
    F <= A(n-2 downto 0) & '0'       when "00",  -- Logical shift left
         A(n-2 downto 0) & A(n-1)    when "01",  -- Rotate left
         A(n-2 downto 0) & Cin       when "10",  -- Rotate left with carry
         (others=>'0')               when others;  -- Zero output
  
  with sel select
    Cout <= A(n-1)    when "00" | "01" | "10",
            '0'       when others;
end archD;
