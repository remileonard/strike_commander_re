seg153		segment	para public 'CODE' use16
		assume cs:seg153
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 9Ch, 48h, 0D1h, 26h, 0BFh, 48h, 0FFh, 6, 0BFh, 48h

loc_51BAA:
		db 0E9h, 50h, 0FFh, 0

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far pascal (chemin far) : mov ah, 3Ch / int 21h (création), même reprise d'erreur.
; ==============================================================================================
Dos_Create_51BAE		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di

loc_51BB3:
		push	ds
		lds	dx, [bp+arg_0]
		xor	cx, cx
		mov	ah, 3Ch
		int	21h
		pop	ds
		jnb	short loc_51BD3
		mov	word_5E5FA, ax
		call	dword ptr dword_5E5FC
		test	word_5E5FA, 0FFFFh
		jz	short loc_51BB3
Dos_Create_51BAE		endp

; START OF FUNCTION CHUNK FOR Dos_Create_51BAE
		db 0B8h
; END OF FUNCTION CHUNK FOR Dos_Create_51BAE
seg153		ends
