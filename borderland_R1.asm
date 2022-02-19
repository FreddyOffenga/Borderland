; Borderland
; F#READY, 2022-02-04

; v4
; - antic mode 4
; - char.changes
; - small vs wide screen switch
; - doom drone beat :P
; v3 - 57 bytes
; - font change, color change, full screen!
; v2 - 56 bytes (without font change)
; - text mode 0, increase course DMA not needed! nice :)
; v1 - 76 bytes 
; - first try with smooth scroll and text mode 2

; Based on Antric v2
; Endless DL for ANTIC, but end it with the CPU

	org $bc20-(dlist-main)

main
    ;asl $2f4        ; happens to be a nice pattern at $f0 

;    inc 559   
loop
    eor 20
    lsr
    lsr
    sta $d201
    iny
	lda #$70
	sta 756
;    sta 710
	eor dl_end
	cmp $d40b
	bne loop
	sta dl_end

    lda 20
    eor #$ff
    sta $d404

    and #1
    inx
    sta $400,x

    txa
    sta $7008,y

    lda 19
    and #2
    eor #%00100001
    sta 559

	bvc loop

dlist
	dta $54
scrol = *
	dta a($0460)
    dta $34

    dta 0
    dta $74
scrol2 = *
    dta a($0482)
    dta $34

dl_end
	dta $71
	dta a(dlist)