; Task: Blink two LEDs sequentially using subroutines
; We will use P1.0 (LED 1) and P1.1 (LED 2)

ORG 0000H

MAIN:
    ACALL BLINK_LEDS ; Call the subroutine
    SJMP MAIN        ; Repeat forever

; Subroutine Section
BLINK_LEDS:
    ; Turn LED 1 ON (Assume Active Low: 0=ON, 1=OFF)
    CLR P1.0
    SETB P1.1
    ACALL DELAY

    ; Turn LED 2 ON, LED 1 OFF
    SETB P1.0
    CLR P1.1
    ACALL DELAY
    RET             ; Return to Main

; Simple Delay
DELAY:
    MOV R3, #255
DL1:
    MOV R4, #255
DL2:
    DJNZ R4, DL2
    DJNZ R3, DL1
    RET

END
