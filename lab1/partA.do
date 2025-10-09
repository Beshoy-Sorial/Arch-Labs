vsim -gui work.partA

add wave -position insertpoint  \
sim:/parta/A \
sim:/parta/B \
sim:/parta/Cin \
sim:/parta/S0 \
sim:/parta/S1 \
sim:/parta/F \
sim:/parta/Cout 



force -freeze sim:/parta/A 00001111 0
force -freeze sim:/parta/B 00000001 0
force -freeze sim:/parta/Cin 0 0
force -freeze sim:/parta/S0 0 0
force -freeze sim:/parta/S1 0 0
run


force -freeze sim:/parta/S0 1 0
run


force -freeze sim:/parta/A 11111111 0
run


force -freeze sim:/parta/S1 1 0
force -freeze sim:/parta/S0 0 0
run


force -freeze sim:/parta/S0 1 0
run


force -freeze sim:/parta/A 00001110 0
force -freeze sim:/parta/S0 0 0
force -freeze sim:/parta/S1 0 0
force -freeze sim:/parta/Cin 1 0
run


force -freeze sim:/parta/S0 1 0
force -freeze sim:/parta/A 11111111 0
run


force -freeze sim:/parta/S1 1 0
force -freeze sim:/parta/S0 0 0
force -freeze sim:/parta/A 00001111 0
run


force -freeze sim:/parta/S0 1 0
force -freeze sim:/parta/A 11110000 0
run