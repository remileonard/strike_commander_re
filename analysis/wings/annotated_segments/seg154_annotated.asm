seg154		segment	para public 'CODE' use16
		assume cs:seg154
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0FFh, 0FFh, 0F9h

loc_51BD3:
		db 5Fh, 5Eh, 5Dh, 0CAh, 4, 0, 0

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far pascal (mode, chemin far) : mov ah, 3Dh / int 21h, avec reprise par le gestionnaire
; d'erreur critique ; rend le descripteur ou 0FFFFh.
; ==============================================================================================
Dos_Open_51BDA		proc far

arg_0		= byte ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		mov	word_5E5FA, 0

loc_51BE3:
		push	ds
		lds	dx, [bp+arg_2]
		mov	ah, 3Dh
		mov	al, [bp+arg_0]
		int	21h
		pop	ds
		jnb	short loc_51C04
		mov	word_5E5FA, ax
		call	dword ptr dword_5E5FC
		test	word_5E5FA, 0FFFFh
		jz	short loc_51BE3
		mov	ax, 0FFFFh
		stc

loc_51C04:
		pop	bp
		retf	6
Dos_Open_51BDA		endp

; ----------------------------------------------------------------------

sub_51C08		proc far
		retf
sub_51C08		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_51C09		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	bx, [bp+arg_0]
		mov	ah, 3Eh
		int	21h
		jnb	short loc_51C24
		mov	word_5E5FA, ax
		call	dword ptr dword_5E5FC
sub_51C09		endp

; START OF FUNCTION CHUNK FOR sub_51C09
		db 0F7h, 6, 0DAh
		dec	ax
; END OF FUNCTION CHUNK FOR sub_51C09
seg154		ends
