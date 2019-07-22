   global _main
    extern  _GetStdHandle@4
    extern  _WriteFile@20
    extern  _ExitProcess@4

    section .text
_main:
    ; oliy!
    mov     ebp, esp
    sub     esp, 4

    push    -11
    call    _GetStdHandle@4
    mov     ebx, eax    

    push    0
    lea     eax, [ebp-4]
    push    eax
    push    (oliy_end - oliy_start)
    push    oliy_start
    push    ebx
    call    _WriteFile@20

    push    0
    call    _ExitProcess@4

    hlt
oliy_start:
    db      'oliy!', 10
oliy_end: