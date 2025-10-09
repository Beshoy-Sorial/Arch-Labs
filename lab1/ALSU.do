vsim -gui work.ALSU

add wave -position insertpoint  \
sim:/alsu/A_IN \
sim:/alsu/B_IN \
sim:/alsu/Cin \
sim:/alsu/S \
sim:/alsu/F \
sim:/alsu/Cout 

# Part A - Arithmetic Operations (S3=0, S2=0)

# Operation: F = A
# A_IN=0F, B_IN=-, Cin=0 -> F=0F, Cout=0
force -freeze sim:/alsu/A_IN 16#0F 0
force -freeze sim:/alsu/B_IN 16#00 0
force -freeze sim:/alsu/Cin 0 0
force -freeze sim:/alsu/S 0000 0
run

# Operation: F = A + B
# A_IN=0F, B_IN=01, Cin=0 -> F=10, Cout=0
force -freeze sim:/alsu/A_IN 16#0F 0
force -freeze sim:/alsu/B_IN 16#01 0
force -freeze sim:/alsu/Cin 0 0
force -freeze sim:/alsu/S 0001 0
run

# Operation: F = A + B
# A_IN=FF, B_IN=01, Cin=0 -> F=00, Cout=1
force -freeze sim:/alsu/A_IN 16#FF 0
force -freeze sim:/alsu/B_IN 16#01 0
force -freeze sim:/alsu/Cin 0 0
force -freeze sim:/alsu/S 0001 0
run

# Operation: F = A - B - 1
# A_IN=FF, B_IN=01, Cin=0 -> F=FD, Cout=1
force -freeze sim:/alsu/A_IN 16#FF 0
force -freeze sim:/alsu/B_IN 16#01 0
force -freeze sim:/alsu/Cin 0 0
force -freeze sim:/alsu/S 0010 0
run

# Operation: F = A - 1
# A_IN=FF, B_IN=-, Cin=0 -> F=FE, Cout=1
force -freeze sim:/alsu/A_IN 16#FF 0
force -freeze sim:/alsu/B_IN 16#00 0
force -freeze sim:/alsu/Cin 0 0
force -freeze sim:/alsu/S 0011 0
run

# Operation: F = A + 1
# A_IN=0E, B_IN=-, Cin=1 -> F=0F, Cout=0
force -freeze sim:/alsu/A_IN 16#0E 0
force -freeze sim:/alsu/B_IN 16#00 0
force -freeze sim:/alsu/Cin 1 0
force -freeze sim:/alsu/S 0000 0
run

# Operation: F = A + B + 1
# A_IN=FF, B_IN=01, Cin=1 -> F=01, Cout=1
force -freeze sim:/alsu/A_IN 16#FF 0
force -freeze sim:/alsu/B_IN 16#01 0
force -freeze sim:/alsu/Cin 1 0
force -freeze sim:/alsu/S 0001 0
run

# Operation: F = A - B
# A_IN=0F, B_IN=01, Cin=1 -> F=0E, Cout=1
force -freeze sim:/alsu/A_IN 16#0F 0
force -freeze sim:/alsu/B_IN 16#01 0
force -freeze sim:/alsu/Cin 1 0
force -freeze sim:/alsu/S 0010 0
run

# Operation: F = 0
# A_IN=F0, B_IN=-, Cin=1 -> F=00, Cout=0
force -freeze sim:/alsu/A_IN 16#F0 0
force -freeze sim:/alsu/B_IN 16#00 0
force -freeze sim:/alsu/Cin 1 0
force -freeze sim:/alsu/S 0011 0
run

# Part B - Logic Operations (S3=0, S2=1)

# Operation: F = A AND B
# A_IN=F5, B_IN=AA, Cin=- -> F=A0
force -freeze sim:/alsu/A_IN 16#F5 0
force -freeze sim:/alsu/B_IN 16#AA 0
force -freeze sim:/alsu/Cin 0 0
force -freeze sim:/alsu/S 0100 0
run

# Operation: F = A OR B
# A_IN=F5, B_IN=AA, Cin=- -> F=FF
force -freeze sim:/alsu/A_IN 16#F5 0
force -freeze sim:/alsu/B_IN 16#AA 0
force -freeze sim:/alsu/Cin 0 0
force -freeze sim:/alsu/S 0101 0
run

# Operation: F = A NOR B
# A_IN=F5, B_IN=AA, Cin=- -> F=00
force -freeze sim:/alsu/A_IN 16#F5 0
force -freeze sim:/alsu/B_IN 16#AA 0
force -freeze sim:/alsu/Cin 0 0
force -freeze sim:/alsu/S 0110 0
run

# Operation: F = NOT A
# A_IN=F5, B_IN=-, Cin=- -> F=0A
force -freeze sim:/alsu/A_IN 16#F5 0
force -freeze sim:/alsu/B_IN 16#00 0
force -freeze sim:/alsu/Cin 0 0
force -freeze sim:/alsu/S 0111 0
run

# Part C - Right Shift/Rotate Operations (S3=1, S2=0)

# Operation: F = Logic shift right A
# A_IN=F5, B_IN=-, Cin=- -> F=7A, Cout=1
force -freeze sim:/alsu/A_IN 16#F5 0
force -freeze sim:/alsu/B_IN 16#00 0
force -freeze sim:/alsu/Cin 0 0
force -freeze sim:/alsu/S 1000 0
run

# Operation: F = Rotate right A
# A_IN=F5, B_IN=-, Cin=- -> F=FA, Cout=1
force -freeze sim:/alsu/A_IN 16#F5 0
force -freeze sim:/alsu/B_IN 16#00 0
force -freeze sim:/alsu/Cin 0 0
force -freeze sim:/alsu/S 1001 0
run

# Operation: F = Rotate right A with Carry
# A_IN=F5, B_IN=-, Cin=0 -> F=7A, Cout=1
force -freeze sim:/alsu/A_IN 16#F5 0
force -freeze sim:/alsu/B_IN 16#00 0
force -freeze sim:/alsu/Cin 0 0
force -freeze sim:/alsu/S 1010 0
run

# Operation: F = Rotate right A with Carry
# A_IN=F5, B_IN=-, Cin=1 -> F=FA, Cout=1
force -freeze sim:/alsu/A_IN 16#F5 0
force -freeze sim:/alsu/B_IN 16#00 0
force -freeze sim:/alsu/Cin 1 0
force -freeze sim:/alsu/S 1010 0
run

# Operation: F = Arithmetic shift right A
# A_IN=F5, B_IN=-, Cin=- -> F=FA, Cout=1
force -freeze sim:/alsu/A_IN 16#F5 0
force -freeze sim:/alsu/B_IN 16#00 0
force -freeze sim:/alsu/Cin 0 0
force -freeze sim:/alsu/S 1011 0
run

# Part D - Left Shift/Rotate Operations (S3=1, S2=1)

# Operation: F = Logic shift left A
# A_IN=F5, B_IN=-, Cin=- -> F=EA, Cout=1
force -freeze sim:/alsu/A_IN 16#F5 0
force -freeze sim:/alsu/B_IN 16#00 0
force -freeze sim:/alsu/Cin 0 0
force -freeze sim:/alsu/S 1100 0
run

# Operation: F = Rotate left A
# A_IN=F5, B_IN=-, Cin=- -> F=EB, Cout=1
force -freeze sim:/alsu/A_IN 16#F5 0
force -freeze sim:/alsu/B_IN 16#00 0
force -freeze sim:/alsu/Cin 0 0
force -freeze sim:/alsu/S 1101 0
run

# Operation: F = Rotate left A with Carry
# A_IN=F5, B_IN=-, Cin=0 -> F=EA, Cout=1
force -freeze sim:/alsu/A_IN 16#F5 0
force -freeze sim:/alsu/B_IN 16#00 0
force -freeze sim:/alsu/Cin 0 0
force -freeze sim:/alsu/S 1110 0
run

# Operation: F = Rotate left A with Carry
# A_IN=F5, B_IN=-, Cin=1 -> F=EB, Cout=1
force -freeze sim:/alsu/A_IN 16#F5 0
force -freeze sim:/alsu/B_IN 16#00 0
force -freeze sim:/alsu/Cin 1 0
force -freeze sim:/alsu/S 1110 0
run

# Operation: F = 0000
# A_IN=F5, B_IN=-, Cin=- -> F=00, Cout=0
force -freeze sim:/alsu/A_IN 16#F5 0
force -freeze sim:/alsu/B_IN 16#00 0
force -freeze sim:/alsu/Cin 0 0
force -freeze sim:/alsu/S 1111 0
run

# Operation: F = Rotate right A
# A_IN=7A, B_IN=-, Cin=- -> F=3D, Cout=0
force -freeze sim:/alsu/A_IN 16#7A 0
force -freeze sim:/alsu/B_IN 16#00 0
force -freeze sim:/alsu/Cin 0 0
force -freeze sim:/alsu/S 1001 0
run