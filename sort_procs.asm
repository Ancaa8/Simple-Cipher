%include "../include/io.mac"

struc proc
    .pid: resw 1
    .prio: resb 1
    .time: resw 1
endstruc

section .text
    global sort_procs
extern printf

sort_procs:
    ;; DO NOT MODIFY
    enter 0,0
    pusha

    mov edx, [ebp + 8]      ; processes
    mov eax, [ebp + 12]     ; length
    ;; DO NOT MODIFY

    ;; Your code starts here
    xor esi, esi
do:
    mov esi, 1
    
    mov ecx, [ebp+12]
    dec ecx

loop_for:
    xor edi, edi
    mov edi, ecx
    dec edi
    imul edi, 5 ; 5(i-1)
    
    xor ebx, ebx
    mov bl, [edx + edi + proc.prio]
    
    add edi, 5 ; 5i
    xor eax, eax
    mov al, [edx + edi + proc.prio]
    
    cmp ebx, eax
    jl continue_for
    je s_time ;daca sunt egale sorteaza dupa timp
    
    xor esi, esi
    mov [edx + edi + proc.prio], bl
    sub edi, 5
    mov [edx + edi + proc.prio], al
    add edi, 5
    mov bx, [edx + edi + proc.time]
    sub edi, 5
    mov  ax, [edx + edi + proc.time]
    add edi, 5
    mov [edx + edi + proc.time], ax
    sub edi, 5
    mov [edx + edi + proc.time], bx
    add edi, 5
    mov bx, [edx + edi + proc.pid]
    sub edi, 5
    mov  ax, [edx + edi + proc.pid]
    add edi, 5
    mov [edx + edi + proc.pid], ax
    sub edi, 5
    mov [edx + edi + proc.pid], bx
    ;sorteaza dupa prio, muta si timp si pid
    jmp continue_for
s_time:
    xor edi, edi
    mov edi, ecx
    dec edi
    imul edi, 5 ;5(i-1)
    
    xor ebx, ebx
    mov bx, [edx + edi + proc.time]
    
    add edi, 5 ;5i
    xor eax, eax
    mov ax, [edx + edi + proc.time]
    cmp ebx, eax
    jl continue_for
    je s_pid ;daca sunt egale sorteaza dupa pid
    
    xor esi, esi
    mov [edx + edi + proc.time], bx
    sub edi, 5
    mov [edx + edi + proc.time], ax
    add edi, 5
    mov bl, [edx + edi + proc.prio]
    sub edi, 5
    mov  al, [edx + edi + proc.prio]
    add edi, 5
    mov [edx + edi + proc.prio], al
    sub edi, 5
    mov [edx + edi + proc.prio], bl
    add edi, 5
    mov bx, [edx + edi + proc.pid]
    sub edi, 5
    mov  ax, [edx + edi + proc.pid]
    add edi, 5
    mov [edx + edi + proc.pid], ax
    sub edi, 5
    mov [edx + edi + proc.pid], bx
    ;sorteaza dupa time, muta si prio si time
    jmp continue_for
s_pid:
       xor edi, edi
    mov edi, ecx
    dec edi
    imul edi, 5 ;5(i-1)
    
    xor ebx, ebx
    mov bx, [edx + edi + proc.pid]
    
    add edi, 5 ;5i
    xor eax, eax
    mov ax, [edx + edi + proc.pid]
    
    cmp ebx, eax
    jle continue_for
    
    xor esi, esi
    mov [edx + edi + proc.pid], bx
    sub edi, 5
    mov [edx + edi + proc.pid], ax
    add edi, 5
    mov bx, [edx + edi + proc.time]
    sub edi, 5
    mov  ax, [edx + edi + proc.time]
    add edi, 5
    mov [edx + edi + proc.time], ax
    sub edi, 5
    mov [edx + edi + proc.time], bx
    add edi, 5
    mov bl, [edx + edi + proc.prio]
    sub edi, 5
    mov  al, [edx + edi + proc.prio]
    add edi, 5
    mov [edx + edi + proc.prio], al
    sub edi, 5
    mov [edx + edi + proc.prio], bl
    ;sorteaza dupa pid, muta si prio si time

continue_for:
    sub ecx, 1
    jnz loop_for
    cmp esi, 0
    je do
    ;; Your code ends here
    
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY