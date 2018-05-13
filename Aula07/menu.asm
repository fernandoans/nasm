section .data
  tit       db   10,'+-------------+',10,'| Calculadora |',10,'+-------------+',0
  ltit      equ  $ - tit
  obVal1    db   10,'Valor 1:',0
  lobVal1   equ  $ - obVal1
  obVal2    db   'Valor 2:',0
  lobVal2   equ  $ - obVal2
  opc1      db   10,'1. Adicionar',0
  lopc1     equ  $ - opc1
  opc2      db   10,'2. Subtrair',0
  lopc2     equ  $ - opc2
  opc3      db   10,'3. Multiplicar',0
  lopc3     equ  $ - opc3
  opc4      db   10,'4. Dividir',0
  lopc4     equ  $ - opc4
  msgOpc    db   10,'Deseja Realizar?',0
  lmsgOpc   equ  $ - msgOpc
  msgErro   db   10,'Valor da Opção Inválido',0
  lmsgErro  equ  $ - msgErro
  salLinha  db   10,0
  lsalLinha db   $ - salLinha

section .bss
  opc      resb  2
  num1     resb  10
  num2     resb  10
  result   resb  10

section .text
  global _start

_start:
  mov ecx, tit
  mov edx, ltit
  call mst_saida

  mov ecx, obVal1
  mov edx, lobVal1
  call mst_saida
  mov eax, 3
  mov ebx, 0
  mov ecx, num1
  mov edx, 10
  int 80h

  mov ecx, obVal2
  mov edx, lobVal2
  call mst_saida
  mov eax, 3
  mov ebx, 0
  mov ecx, num2
  mov edx, 10
  int 80h

  mov ecx, opc1
  mov edx, lopc1
  call mst_saida
  mov ecx, opc2
  mov edx, lopc2
  call mst_saida
  mov ecx, opc3
  mov edx, lopc3
  call mst_saida
  mov ecx, opc4
  mov edx, lopc4
  call mst_saida

  mov ecx, msgOpc
  mov edx, lmsgOpc
  call mst_saida
  mov eax, 3
  mov ebx, 0
  mov ecx, opc
  mov edx, 2
  int 80h

  mov ah, [opc]
  sub ah, '0'

  cmp ah, 1
  je adicionar
  cmp ah, 2
  je subtrair
  cmp ah, 3
  je multiplicar
  cmp ah, 4
  je dividir

  mov ecx, msgErro
  mov edx, lmsgErro
  call mst_saida
  jmp exit

adicionar:
  ; add eax, ebx
  jmp exit

subtrair:
  ; sub eax, ebx
  jmp exit

multiplicar:
  ; AX e BX
  ; mul bx
  jmp exit

dividir:
  ; AX e BX
  ; div bx
  jmp exit

exit:
  mov ecx, salLinha
  mov edx, lsalLinha
  call mst_saida
  mov eax, 1
  mov ebx, 0
  int 80h

mst_saida:
  mov eax, 4
  mov ebx, 1
  int 80h
  ret
