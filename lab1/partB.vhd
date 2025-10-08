library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity partB is
  generic (n : integer := 8);
  port (
    A, B : in  std_logic_vector(n-1 downto 0);
    S0, S1: in  std_logic;
    F    : out std_logic_vector(n-1 downto 0)
  );
end partB;

architecture archB of partB is
  signal sel : std_logic_vector(1 downto 0);
begin
  sel <= S1 & S0;
  
  with sel select
    F <= (A AND B)        when "00",
         (A OR B)         when "01",
         (NOT (A OR B))   when "10",  
         (NOT A)          when "11",
         (others=>'0')    when others;
end archB;
