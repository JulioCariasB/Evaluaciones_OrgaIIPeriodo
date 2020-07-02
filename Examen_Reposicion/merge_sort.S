.global main

arr: .word 56, 1, 12, 87, 65, 65, 73, 91, 75, 29, 33, 100, 55


merge:
    
    
mergeSort:
    bge $a1, $a2, end_if
    sub $t0, $a2, $a1
    srl $t0, $t0, 1
    add $t0, $a1, $t0
    addi $sp, $sp, -16
    sw $t0, 0($sp)
    sw $a0, 4($sp)
    sw $a1, 8($sp)
    sw $a2, 12($sp)
    add $a2, $t0, $zero
    jal mergeSort
    lw $t0, 0($sp)
    lw $a0, 4($sp)
    lw $a1, 8($sp)
    lw $a2, 12($sp)
    addi $sp, $sp, 16
    addi $t1, $t0, 1
    addi $sp, $sp, -16
    sw $t0, 0($sp)
    sw $a0, 4($sp)
    sw $a1, 8($sp)
    sw $a2, 12($sp)
    add $a1, $t1, $zero
    jal mergeSort
    lw $t0, 0($sp)
    lw $a0, 4($sp)
    lw $a1, 8($sp)
    lw $a2, 12($sp)
    addi $sp, $sp, 16
    add $t3, $zero, $a2
    add $t2, $zero, $t0
    addi $sp, $sp, -16
    sw $t0, 0($sp)
    sw $a0, 4($sp)
    sw $a1, 8($sp)
    sw $a2, 12($sp)
    add $a3, $t3, $zero
    add $a2, $t2, $zero
    jal merge
    lw $t0, 0($sp)
    lw $a0, 4($sp)
    lw $a1, 8($sp)
    lw $a2, 12($sp)
    addi $sp, $sp, 16

    end_if:
        jr $ra
    
printArray:
    addi $t0, $zero, 1

    for_print:
        bge $t0, $a1, end_for
        sll $t1, $t0, 2
        add $t1, $t1, $a0
        addi $sp, $sp, -12
        sw $t0, 0($sp)
        sw $a0, 4($sp)
        sw $a1, 8($sp)
        add $a0, $t1, $zero
        jal print_number
        addi $a0, $zero, 32
        jal print_char
        lw $t0, 0($sp)
        lw $a0, 4($sp)
        lw $a1, 8($sp)
        addi $sp, $sp, 12
        addi $t0, $t0, 1
        j for_print

    end_for:
        addi $a0, $zero, 10
        jr $ra

    
main:
    la $t2, arr
    add $a0, $t2, $zero
    jal sizeof
    add $t5, $v0, $zero
    la $t2, arr
    lw $a0, 0($t2)
    jal sizeof
    div $t5, $v0
    mfhi $t0

    addi $sp, $sp, -8
    sw $t0, 0($sp)
    sw $t2, 4($sp)
    add $a0, $t2, $zero
    add $a1, $t0, $zero
    jal printArray
    lw $t0, 0($sp)
    lw $t2, 4($sp)
    addi $sp, $sp, 8
    add $a0, $t2, $zero
    add $a1, $zero, 0
    add $a2, $t0, -1
    addi $sp, $sp, -8
    sw $t0, 0($sp)
    sw $t2, 4($sp)
    jal mergeSort
    lw $t0, 0($sp)
    lw $t2, 4($sp)
    addi $sp, $sp, 8

    addi $sp, $sp, -8
    sw $t0, 0($sp)
    sw $t2, 4($sp)
    add $a0, $t2, $zero
    add $a1, $t0, $zero
    jal printArray
    lw $t0, 0($sp)
    lw $t2, 4($sp)
    addi $sp, $sp, 8
    jr $ra