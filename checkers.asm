
section .data

section .text
	global checkers

checkers:
    ;; DO NOT MODIFY
    push ebp
    mov ebp, esp
    pusha

    mov eax, [ebp + 8]	; x
    mov ebx, [ebp + 12]	; y
    mov ecx, [ebp + 16] ; table

    ;; DO NOT MODIFY
    ;; FREESTYLE STARTS HERE
    mov edx, eax         
    imul edx, 8            
    add edx, ebx    ;(x,y)

 up:
    cmp eax, 7 ;nu se poate duce in sus daca e 7
    je down
    mov edi, edx
    mov esi,ebx


upright:
    cmp esi,7 ;nu se poate duce in dreapta daca e 7
    je upleft
    add edi, 9 ;adauga 9 sa se duca pe linia de sus 8+1 pt dreapta
    inc byte [ecx + edi]
upleft:
    cmp esi,0 ;nu se poate duce in stanga daca e 0
    je down
    mov edi, edx
    add edi, 7 ;adauga 7 sa se duca pe linia de sus 8-1 pt stanga
    inc byte [ecx + edi]   
down:
    cmp eax, 0 ;nu se poate duce in jos daca e 0
    je end
    mov edi, edx
    mov esi,ebx

downleft:
    cmp esi,0 ;nu se poate duce in stanga daca e 0
    je downright
    sub edi, 9 ;scade 9 sa se duca pe linia de jos 8+1 pentru stanga
    inc byte [ecx + edi]

downright:
    cmp esi,7 ; nu se poate duce in dreapta daca e 7
    je end
    mov edi, edx
    sub edi, 7 ;scade 7 sa se duca pe linia de jos 8-1 pentru dreapta
    inc byte [ecx + edi]

end:     

    ;; FREESTYLE ENDS HERE
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY