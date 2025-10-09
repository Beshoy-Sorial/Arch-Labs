library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity partA is
  generic (n : integer := 8);
  port (
    A, B : in  std_logic_vector(n-1 downto 0);
    Cin  : in  std_logic;
    S0, S1 : in std_logic;
    F    : out std_logic_vector(n-1 downto 0);
    Cout : out std_logic
  );
end partA;

architecture archA of partA is
  component my_adder is
    port (
      a, b, cin : in  std_logic;
      s, cout : out std_logic
    );
  end component;
  
  signal sel : std_logic_vector(2 downto 0); -- s1 s0 cin 
  signal new_b : std_logic_vector(n-1 downto 0);
  signal temp : std_logic_vector(n downto 0);
  
begin
  
  sel <= S1 & S0 & Cin;
  with sel select
    new_b <=    (others => '0')  when "000",  -- F = A
                (others => '0')  when "001",  -- F = A + 1
                B                when "010",  -- F = A + B
                B                when "011",  -- F = A + B + 1
                NOT B            when "100",  -- F = A - B - 1
                NOT B            when "101",  -- F = A - B
                (others => '1')  when "110",  -- F = A - 1
                NOT A            when "111",  -- F = 0
                (others => '0')  when others;
  
  temp(0) <= Cin;

  loop1: for i in 0 to n-1 generate
    u: my_adder port map (A(i),new_b(i),temp(i),F(i),temp(i+1));
  end generate;
  
  with sel select
    Cout <= '0' when "111",
            temp(n) when others;

end archA;
