call main
#stop

; esp+4 = arr
; esp+8 = i
; esp+12 = j


swap:
    mov eax, 4
    mov ebx, dword[esp+4]
    mov ecx, dword[esp+8]
    imul ecx
    add eax, ebx
    mov ebx, eax
    mov ecx, dword[ebx]     ;int temp = arr[i]

    mov eax,4
    mov edx, dword[esp+12]
    imul edx
    add eax, dword[esp+4]
    mov edx, dword[eax]     ;arr[j]
    mov dword[ebx], edx      ;arr[i] = arr[j]

    mov dword[eax], ecx      ;arr[j] = temp
    ret

partition:
    ;ebp +8 = arr
    ;ebp + 12 = low
    ;ebp + 16 = high
    push ebp
    mov ebp, esp
    sub esp, 4


    mov eax, 4
    mov ebx, dword[ebp + 16]
    imul ebx
    add eax, dword[ebp + 8]
    mov dword[ebp-4], eax       ;int pivot = arr[high]
    mov ecx, dword[ebp + 12]    ;ecx = low
    dec ecx
    mov dword[ebp - 8], ecx     ;int i = (low - 1)
    inc ecx
    mov dword[ebp-12], ecx      ;int j = low

    for:
       mov ecx, dword[ebp + 16]
       cmp dword[ebp - 12], ecx
       jg end_for
       mov eax, 4
       mov ebx, dword[ebp - 12]
       imul ebx
       add eax, dword[ebp + 8]
       mov ebx, dword[eax]

       cmp ebx, dword[ebp - 4]
       jge end_if

       add dword[ebp - 8], 1

       push dword[ebp - 12]
       push dword[ebp - 8]
       push dword[ebp + 8]
       call swap
       add esp, 12

    end_if:
        add dword[ebp - 12], 1
        jmp for  

    end_for:
        mov eax, dword[ebp - 8]
        add eax, 1
        push dword[ebp + 16]    ;high
        push eax        ;i+1
        push dword[ebp + 8]
        call swap
        add esp, 12
        mov eax, dword[ebp - 8]
        add eax,1

        mov esp, ebp
        pop ebp
        ret

main:
    sub esp, 52
    #set dword [esp] = [56, 1, 12, 87, 65, 65, 73, 91, 75, 29, 33, 100, 55]

    push 12
    push 0
    push esp

    call partition
    add esp, 12

    #show dword [esp][13] signed decimal

    add esp, 52
    ret

