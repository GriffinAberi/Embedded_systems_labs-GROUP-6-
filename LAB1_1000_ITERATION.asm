; Task: Increment R0 and halt after 1000 iterations
; Since 1000 > 255 (8-bit limit), we use nested loops.
; 4 (Outer) * 250 (Inner) = 1000 iterations.

ORG 0000H

MOV R0, #00H        ; Initialize R0 to 0
MOV R1, #4          ; Outer loop counter (4 times)

OUTER_LOOP:
    MOV R2, #250    ; Inner loop counter (250 times)

INNER_LOOP:
    INC R0          ; The main task: Increment R0
    DJNZ R2, INNER_LOOP ; Decrement R2, repeat inner loop if not 0

    DJNZ R1, OUTER_LOOP ; Decrement R1, repeat outer loop if not 0

HALT:
    SJMP HALT       ; Infinite loop to stop execution (Halt)

END
