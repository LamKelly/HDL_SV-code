addi $8, $0, 3
addi $9, $0, 20
addi $7, $0, -4
loop:
sltu $10, $0, $8
slt $11, $0, $8
sub $10, $10, $7
sub $11, $11, $7
sw $10, 0($9)
sw $11, 4($9)
addi $8, $8, -3
addi $9, $9, 8
ble $7, $8, loop
sw $8, 16($0)