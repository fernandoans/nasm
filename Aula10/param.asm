global PassarParam

segment .text

PassarParam:
  mov eax, edi   ; 1o. Param
  ; add eax, esi   ; adiciona o 2o. Param
  sub eax, esi
  ret
