%include "../include/io.mac"

struc avg
        .quo: resw 1
        .remain resw 1
endstruc

struc proc
    .pid: resw 1
    .prio: resb 1
    .time: resw 1
endstruc

    ;; Hint: you can use these global arrays
section .data
    prio_result dd 0, 0, 0, 0, 0
    time_result dd 0, 0, 0, 0, 0

section .text
    global run_procs

run_procs:
    ;; DO NOT MODIFY

    push ebp
    mov ebp, esp
    pusha

    xor ecx, ecx

clean_results:
    mov dword [time_result + 4 * ecx], dword 0
    mov dword [prio_result + 4 * ecx],  0

    inc ecx
    cmp ecx, 5
    jne clean_results

    mov ecx, [ebp + 8]      ; processes
    mov ebx, [ebp + 12]     ; length
    mov eax, [ebp + 16]     ; proc_avg
    ;; DO NOT MODIFY
   
    ;; Your code starts here
       

initializ:
        xor ebx, ebx ;contor prioritate
        xor eax, eax ; cate procese au acea prioritate
        xor edx, edx ; suma timp
        add ebx, 1 ; incep cu prioritatea 1
        mov ecx, [ebp + 8] ;retin incep vect de procese
        mov esi, [ebp + 16] ;retin incep vectorului avg
start:
    cmp ebx, 5 ;prioritatile sunt pana la 5
    jg end

    cmp bl, byte[ecx + proc.prio]
    jne calcul ;trece la calc mediei
    movzx edi, word[ecx + proc.time]
    add eax, edi ;adaug timpul la suma
    add edx, 1 ;adaug 1 la nr de procese cu acea prioritate
    add ecx, 5 ;merg la urm proces
    jmp start
calcul:
    add ebx, 1 
    mov edi,edx
    xor edx, edx
    cmp edi, 0
    je reset
    idiv edi;calculeaza in eax catul si in edx restul
    mov word[esi + avg.quo], ax ;pun catul in quo
    mov word[esi + avg.remain], dx ;pun restul in remain
reset:
    xor eax, eax ;setez nr de elem cu aceeasi prioritate pe 0
    xor edx, edx ;setez suma pe 0
    add esi, 4 ;urm element din avg
    jmp start
end:







    ;; Your code ends here
    
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY