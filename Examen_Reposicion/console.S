.global print_str
.global print_number
.global print_char

.data

.text

print_str:
    li $v0, 4
    syscall
    jr $ra

print_number:
    li $v0, 1
    syscall
    jr $ra
    
print_char:
    li $v0, 11
    syscall
    jr $ra
