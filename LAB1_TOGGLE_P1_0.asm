; Task: Toggle P1.0 at approximately 1 Hz
; Frequency = 1Hz -> Period = 1s (0.5s ON, 0.5s OFF)

ORG 0000H           ; Start address

MAIN:
    CPL P1.0        ; Complement (Toggle) Port 1 Bit 0
    ACALL DELAY     ; Call the delay subroutine (~0.5s)
    SJMP MAIN       ; Jump back to MAIN (Infinite Loop)

; Delay Subroutine
DELAY:
    MOV R3, #5      ; Outer loop for scaling
LOOP1:
    MOV R2, #200    ; Middle loop
LOOP2:
    MOV R1, #250    ; Inner loop
LOOP3:
    DJNZ R1, LOOP3  ; Decrement R1, jump if not zero
    DJNZ R2, LOOP2  ; Decrement R2, jump if not zero
    DJNZ R3, LOOP1  ; Decrement R3, jump if not zero
    RET             ; Return from subroutine

END
