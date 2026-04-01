L1:
addi $9, $0, 40
bne $9, $0, L2
addi $9, $9, 10
L2:
addi $8, $0, -3
beq $9, $0, L2
slti $10, $8, -1
sw $10, 12($9)
slti $10, $8, -5
loop:
addi $10, $10, 3
sw $10, -8($9)
addi $9, $9, -4
slti $11, $9, 30
bne $11, $0, out
j loop
out:
sw $9, 20($0)
