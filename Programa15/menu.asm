%include 'bibliotecaE.inc'

section .data
  tit db LF,'+-------------+',LF,'| Calculadora |',LF,'+-------------+',LF,NULL
  obVal1 db LF,'Valor 1:',NULL
  obVal2 db LF,'Valor 2:',NULL
  opc1 db LF,'1. Adicionar',NULL
  opc2 db LF,'2. Subtrair',NULL
  opc3 db LF,'3. Multiplicar',NULL
  opc4 db LF,'4. Dividir',NULL
  msgOpc db LF,'Deseja realizar?',NULL  
  msgErro db LF,'Valor de Opção Inválido',NULL    
  p1 db LF,'Processo de Adicionar',NULL    
  p2 db LF,'Processo de Subtrair',NULL      
  p3 db LF,'Processo de Multiplicar',NULL      
  p4 db LF,'Processo de Dividir',NULL        
  msgFim db LF,'Terminei',LF,NULL        

section .bss
  opc resb 1
  num1 resb 1
  num2 resb 1

section .text
  
global _start 

_start:
  mov ECX, tit
  call mst_saida 

; mostrar opções
  mov ECX, opc1
  call mst_saida 
  mov ECX, opc2
  call mst_saida 
  mov ECX, opc3
  call mst_saida 
  mov ECX, opc4
  call mst_saida 

; obter opção  
  mov ECX, msgOpc
  call mst_saida 
  mov EAX, SYS_READ
  mov EBX, STD_IN
  mov ECX, opc
  mov EDX, 0x2
  int SYS_CALL  

; converter e ir para o ponto correto
  mov ah, [opc]
  sub ah, '0' 

; verifica se é correto
  cmp ah, 4   
  jg msterro
  cmp ah, 1
  jl msterro

; obter valores
  mov ECX, obVal1
  call mst_saida 
  mov EAX, SYS_READ
  mov EBX, STD_IN
  mov ECX, num1
  mov EDX, 0x3
  int SYS_CALL

  mov ECX, obVal2
  call mst_saida 
  mov EAX, SYS_READ
  mov EBX, STD_IN
  mov ECX, num2
  mov EDX, 0x3
  int SYS_CALL  

; selecionar o ponto
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

saida:
  mov ECX, msgFim
  call mst_saida

  mov EAX, SYS_EXIT
  mov EBX, RET_EXIT
  int SYS_CALL  

; Funções a serem realizadas

adicionar:
  mov ECX, p1
  call mst_saida
  jmp saida

subtrair:
  mov ECX, p2
  call mst_saida
  jmp saida

multiplicar:
  mov ECX, p3
  call mst_saida
  jmp saida

dividir:
  mov ECX, p4
  call mst_saida
  jmp saida

msterro:
  mov ECX, msgErro
  call mst_saida
  jmp saida