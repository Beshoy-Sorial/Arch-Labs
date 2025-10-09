library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALSU is
  generic (n : integer := 8);
  port (
    A_IN : in  std_logic_vector(n-1 downto 0);
    B_IN : in  std_logic_vector(n-1 downto 0);
    Cin  : in  std_logic;
    S    : in  std_logic_vector(3 downto 0);
    F    : out std_logic_vector(n-1 downto 0);
    Cout : out std_logic
  );
end ALSU;

architecture archALSU of ALSU is
  
  component partA is
    generic (n : integer := 8);
    port (
      A, B : in  std_logic_vector(n-1 downto 0);
      Cin  : in  std_logic;
      S0, S1 : in std_logic;
      F    : out std_logic_vector(n-1 downto 0);
      Cout : out std_logic
    );
  end component;
  
  component partB is
    generic (n : integer := 8);
    port (
      A, B : in  std_logic_vector(n-1 downto 0);
      S0, S1: in  std_logic;
      F    : out std_logic_vector(n-1 downto 0)
    );
  end component;
  
  component partC is
    generic (n : integer := 8);
    port ( 
      A    : in  std_logic_vector(n-1 downto 0);
      Cin, S0, S1 : in  std_logic;
      F    : out std_logic_vector(n-1 downto 0);
      Cout : out std_logic
    );
  end component;
  
  component partD is
    generic (n : integer := 8);
    port ( 
      A    : in  std_logic_vector(n-1 downto 0);
      Cin, S0, S1 : in  std_logic;
      F    : out std_logic_vector(n-1 downto 0);
      Cout : out std_logic
    );
  end component;
  
  signal F_A : std_logic_vector(n-1 downto 0);
  signal F_B : std_logic_vector(n-1 downto 0);
  signal F_C : std_logic_vector(n-1 downto 0);
  signal F_D : std_logic_vector(n-1 downto 0);
  signal Cout_A : std_logic;
  signal Cout_C : std_logic;
  signal Cout_D : std_logic;
  signal sel : std_logic_vector(1 downto 0);
  
begin
  
  u_a: partA generic map (n) port map (A_IN, B_IN, Cin, S(0), S(1), F_A, Cout_A);
  u_b: partB generic map (n) port map (A_IN, B_IN, S(0), S(1), F_B);
  u_c: partC generic map (n) port map (A_IN, Cin, S(0), S(1), F_C, Cout_C);
  u_d: partD generic map (n) port map (A_IN, Cin, S(0), S(1), F_D, Cout_D);
  sel <= S(3) & S(2);

  with sel select 
    F <= F_A              when "00",
         F_B              when "01",
         F_C              when "10",
         F_D              when "11",
         (others=>'0')    when others;

  with sel select 
    Cout <= Cout_A        when "00", -- partA
            '0'           when "01", -- part B
            Cout_C        when "10", -- part C
            Cout_D        when "11", -- part D
            '0'           when others;
            
end archALSU;
