%include "../include/io.mac"

section .text
    global simple
    extern printf

simple:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    pusha

    mov     ecx, [ebp + 8]  ; len
    mov     esi, [ebp + 12] ; plain
    mov     edi, [ebp + 16] ; enc_string
    mov     edx, [ebp + 20] ; step

    ;; DO NOT MODIFY
   
    ;; Your code starts here
initializ:
        xor ebx, ebx
        xor eax, eax
cript:
        cmp ebx, ecx           
        jge end 
        movzx eax, byte[esi + ebx]              
        add eax, edx ; adăugare step 
        cmp eax, 'Z' ;verifica daca depaseste
        jle next
        sub eax, 26   
         
next:            
        mov byte[edi + ebx], al 
        inc ebx                  
        jmp cript ;următorul caracter

end:



    ;; Your code ends here
    
    ;; DO NOT MODIFY

    popa
    leave
    ret
    
    ;; DO NOT MODIFY
