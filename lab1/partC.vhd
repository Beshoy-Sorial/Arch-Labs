library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity partC is
  generic (n : integer := 8);
  port ( 
    A    : in  std_logic_vector(n-1 downto 0);
    Cin, S0, S1 : in  std_logic;
    F    : out std_logic_vector(n-1 downto 0);
    Cout : out std_logic
  );
end partC;

architecture archC of partC is
  signal sel : std_logic_vector(1 downto 0);
begin
  sel <= S1 & S0;
  
  with sel select
    F <= '0' & A(n-1 downto 1)       when "00",  -- Logical shift right
         A(0) & A(n-1 downto 1)      when "01",  -- Rotate right
         Cin & A(n-1 downto 1)       when "10",  -- Rotate right with carry
         A(n-1) & A(n-1 downto 1)    when "11",  -- Arithmetic shift right , MSB replicated

         (others=>'0')               when others;
  
  Cout <= A(0);
end archC;

