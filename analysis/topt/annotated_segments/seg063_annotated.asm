seg063		segment	para public 'CODE' use16
		assume cs:seg063
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0Bh, 0FFh, 75h, 0DFh, 0B0h, 0, 5Fh, 5Eh, 0C9h, 0CBh, 5Fh, 5Eh, 0C9h, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à Debris_BodyReset
; (sub_21083 de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier
; ici. — Reprise de STRIKE.EXE : code identique instruction par instruction à Debris_BodyReset
; (sub_37C4C de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far,23L — remet à zéro les champs d'accumulation (forces, position, cible, sous-
; composants) : constructeur/reset d'un corps physique de débris.
; ==============================================================================================
Debris_BodyReset		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	dword ptr [si+0Ah], 0
		mov	dword ptr [si+0Eh], 0
		xor	eax, eax
		mov	[si+1Ah], eax
		mov	[si+16h], eax
		mov	[si+12h], eax
		mov	word ptr [si+2Ah], 0
		mov	word ptr [si+24h], 0
		mov	word ptr [si+26h], 0
		mov	word ptr [si+1Eh], 0
		pop	si
		pop	bp
		retf
Debris_BodyReset		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_25CEB		proc far

var_C		= dword ptr -0Ch
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= dword ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		mov	si, [bp+arg_0]
		push	si
		push	cs
		call	near ptr Debris_BodyReset
		add	sp, 2
		mov	eax, [bp+arg_2]
		mov	[bp+var_4], eax
		mov	eax, [bp+var_4]
		mov	[si+0Eh], eax
		les	bx, [si+0Eh]
		mov	ax, es:[bx+0Ah]
		mov	dx, es:[bx+8]
		add	dx, 10h
		mov	[bp+var_6], ax
		mov	[bp+var_8], dx
		les	bx, [bp+var_8]
		mov	eax, es:[bx]
		mov	[bp+var_C], eax
		mov	eax, [bp+var_C]
		mov	[si+20h], eax
		les	bx, [si+0Eh]
		les	bx, es:[bx+8]
		cmp	byte ptr es:[bx+16h], 0
		jz	short loc_25D48
		or	byte ptr [si+4], 2
		jmp	short loc_25D4C

loc_25D48:
		and	byte ptr [si+4], 0FDh

loc_25D4C:
		les	bx, [si+0Eh]
		mov	al, es:[bx+12h]
		mov	[si+28h], al
		les	bx, [si+0Eh]
		mov	al, es:[bx+14h]
		mov	[si+29h], al
		pop	si
		leave
		retf
sub_25CEB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_25D63		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	cx, [bp+arg_0]
		mov	bx, cx
		mov	dx, [bx+10h]
		mov	ax, [bx+0Eh]
		pop	bp
		retf
sub_25D63		endp

; START OF FUNCTION CHUNK FOR sub_25D63
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_25D63

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_25D75		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	dx, [bp+arg_0]
		mov	si, [bp+arg_2]
		mov	ax, dx
		add	ax, 12h
		mov	di, ax
		mov	eax, [di]
		mov	[si], eax
		mov	eax, [di+4]
		mov	[si+4], eax
		mov	eax, [di+8]
		mov	[si+8], eax
		pop	di
		pop	si
		pop	bp
		retf
sub_25D75		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_25DA1		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+26h], 0
		jz	short loc_25DB5
		mov	bx, [si+26h]
		and	byte ptr [bx+30h], 0FEh

loc_25DB5:
		cmp	word ptr [si+1Eh], 0
		jz	short loc_25DC6
		push	word ptr [si+1Eh]
		call	sub_25A93
		add	sp, 2

loc_25DC6:
		pop	si
		pop	bp
		retf
sub_25DA1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_25DC9		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	eax, [di]
		add	[si+12h], eax
		mov	ax, [bp+arg_4]
		mov	[bp+var_2], ax
		mov	bx, [bp+var_2]
		mov	eax, [bx]
		add	[si+16h], eax
		mov	ax, [bp+arg_6]
		mov	[bp+var_4], ax
		mov	bx, [bp+var_4]
		mov	eax, [bx]
		add	[si+1Ah], eax
		cmp	word ptr [si+24h], 0
		jz	short loc_25E0F
		push	word ptr [si+24h]
		nop
		push	cs
		call	near ptr sub_25EE5
		add	sp, 2

loc_25E0F:
		push	si
		mov	bx, [si]
		call	dword ptr [bx+8]
		add	sp, 2
		pop	di
		pop	si
		leave
		retf
sub_25DC9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_25E1C		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	dword ptr [si+0Ah], 0
		jz	short loc_25E3C
		push	word ptr [si+0Ch]
		push	word ptr [si+0Ah]
		les	bx, [si+0Ah]
		mov	bx, es:[bx]
		call	dword ptr [bx+20h]
		add	sp, 4

loc_25E3C:
		cmp	word ptr [si+26h], 0
		jz	short loc_25E49
		mov	bx, [si+26h]
		and	byte ptr [bx+30h], 0FDh

loc_25E49:
		cmp	word ptr [si+1Eh], 0
		jz	short loc_25E5A
		push	word ptr [si+1Eh]
		call	sub_259DD
		add	sp, 2

loc_25E5A:
		pop	si
		pop	bp
		retf
sub_25E1C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_25E5D		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	dword ptr [si+0Ah], 0
		jz	short loc_25E7D
		push	word ptr [si+0Ch]
		push	word ptr [si+0Ah]
		les	bx, [si+0Ah]
		mov	bx, es:[bx]
		call	dword ptr [bx+20h]
		add	sp, 4

loc_25E7D:
		cmp	word ptr [si+26h], 0
		jz	short loc_25E91
		mov	bx, [si+26h]
		and	byte ptr [bx+30h], 0FEh
		mov	bx, [si+26h]
		and	byte ptr [bx+30h], 0FDh

loc_25E91:
		cmp	word ptr [si+1Eh], 0
		jz	short loc_25EA2
		push	word ptr [si+1Eh]
		call	sub_259DD
		add	sp, 2

loc_25EA2:
		pop	si
		pop	bp
		retf
sub_25E5D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_25EA5		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+28h]
		add	sp, 2
		pop	si
		pop	bp
		retf
sub_25EA5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_25EB8		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+28h]
		add	sp, 2
		pop	si
		pop	bp
		retf
sub_25EB8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_25ECB		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		mov	ax, [bp+arg_2]
		pop	bp
		retf
sub_25ECB		endp

; START OF FUNCTION CHUNK FOR sub_25ECB
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_25ECB

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_25ED8		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		mov	ax, [bp+arg_2]
		pop	bp
		retf
sub_25ED8		endp

; START OF FUNCTION CHUNK FOR sub_25ED8
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_25ED8

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_25EE5		proc far

var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+1Eh], 0
		jz	short loc_25F30
		les	bx, [si+0Eh]
		mov	ax, es:[bx+0Ah]
		mov	dx, es:[bx+8]
		add	dx, 10h
		mov	[bp+var_2], ax
		mov	[bp+var_4], dx
		les	bx, [bp+var_4]
		mov	eax, es:[bx]
		mov	[bp+var_8], eax
		lea	ax, word ptr [bp+var_8]
		push	ax
		push	word ptr [si+1Eh]
		push	ss
		lea	ax, word ptr [bp+var_C]
		push	ax
		call	sub_25A1C
		add	sp, 8
		mov	eax, [bp+var_C]
		mov	[si+20h], eax

loc_25F30:
		cmp	word ptr [si+24h], 0
		jz	short loc_25F40
		push	word ptr [si+24h]
		push	cs
		call	near ptr sub_25EE5
		add	sp, 2

loc_25F40:
		pop	si
		leave
		retf
sub_25EE5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_25F43		proc far

var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 10h
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	large [si+1Ah]
		push	large [si+16h]
		push	large [si+12h]
		call	sub_2B9E3
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 0Ch
		mov	[bp+var_8], eax
		mov	eax, [bp+var_8]
		mov	[bp+var_C], eax
		mov	ax, si
		add	ax, 20h
		mov	di, ax
		mov	eax, [bp+var_C]
		add	eax, [di]
		mov	[bp+var_10], eax
		mov	bx, word ptr [bp+var_4]
		mov	eax, [bp+var_10]
		mov	[bx], eax
		les	bx, word ptr [bp+var_4]
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
sub_25F43		endp

; START OF FUNCTION CHUNK FOR sub_25F43
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_25F43

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_25FAC		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+26h], 0
		jz	short loc_25FCD
		push	si
		nop
		push	cs
		call	near ptr sub_25FD8
		add	sp, 2
		mov	ax, [si+26h]
		add	ax, 24h
		pop	si
		pop	bp
		retf
		jmp	short loc_25FD5

loc_25FCD:
		mov	ax, si
		add	ax, 12h
		pop	si
		pop	bp
		retf
sub_25FAC		endp

; START OF FUNCTION CHUNK FOR sub_25FAC

loc_25FD5:
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_25FAC

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_25FD8		proc far

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	word ptr [si+26h], 0
		jnz	short loc_25FEC
		jmp	loc_26080

loc_25FEC:
		mov	bx, [si+26h]
		mov	al, [bx+30h]
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jz	short loc_25FFE
		jmp	loc_26080

loc_25FFE:
		mov	ax, si
		add	ax, 12h
		mov	di, ax
		mov	eax, [di]
		mov	bx, [si+26h]
		mov	[bx+24h], eax
		mov	eax, [di+4]
		mov	bx, [si+26h]
		mov	[bx+28h], eax
		mov	eax, [di+8]
		mov	bx, [si+26h]
		mov	[bx+2Ch], eax
		push	word ptr [si+24h]
		mov	bx, [si+24h]
		mov	bx, [bx]
		call	dword ptr [bx+78h]
		add	sp, 2
		push	ax
		mov	ax, [si+26h]
		add	ax, 24h
		push	ax
		call	sub_2BF97
		add	sp, 4
		push	word ptr [si+24h]
		push	cs
		call	near ptr sub_25FAC
		add	sp, 2
		mov	[bp+var_2], ax
		mov	bx, [bp+var_2]
		mov	eax, [bx]
		mov	bx, [si+26h]
		add	[bx+24h], eax
		mov	bx, [bp+var_2]
		mov	eax, [bx+4]
		mov	bx, [si+26h]
		add	[bx+28h], eax
		mov	bx, [bp+var_2]
		mov	eax, [bx+8]
		mov	bx, [si+26h]
		add	[bx+2Ch], eax
		mov	bx, [si+26h]
		or	byte ptr [bx+30h], 1

loc_26080:
		pop	di
		pop	si
		leave
		retf
sub_25FD8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_26084		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_26084		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2608C		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		cmp	dword ptr [si+0Ah], 0
		jz	short loc_260FA
		push	di
		push	word ptr [si+0Ch]
		push	word ptr [si+0Ah]
		les	bx, [si+0Ah]
		mov	bx, es:[bx]
		call	dword ptr [bx]
		add	sp, 6
		cmp	word ptr [si+1Eh], 0
		jz	short loc_260FA
		push	word ptr [si+0Ch]
		push	word ptr [si+0Ah]
		les	bx, [si+0Ah]
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		add	sp, 4
		or	al, al
		jz	short loc_260FA
		les	bx, [si+0Ah]
		cmp	byte ptr es:[bx+8], 0
		jz	short loc_260FA
		push	word ptr [si+0Ch]
		push	word ptr [si+0Ah]
		les	bx, [si+0Ah]
		mov	bx, es:[bx]
		call	dword ptr [bx+0Ch]
		add	sp, 4
		mov	ah, 0
		or	ax, ax
		jnz	short loc_260FA
		push	di
		push	word ptr [si+1Eh]
		call	sub_25AD2
		add	sp, 4

loc_260FA:
		pop	di
		pop	si
		pop	bp
		retf
sub_2608C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_260FE		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	dword ptr [si+0Ah], 0
		jz	short loc_26129
		push	word ptr [si+0Ch]
		push	word ptr [si+0Ah]
		les	bx, [si+0Ah]
		mov	bx, es:[bx]
		call	dword ptr [bx+18h]
		add	sp, 4
		mov	ah, 0
		or	ax, ax
		jnz	short loc_26129
		mov	al, 0
		pop	si
		pop	bp
		retf

loc_26129:
		cmp	word ptr [si+1Eh], 0
		jz	short loc_2613A
		push	word ptr [si+1Eh]
		call	sub_24E2B
		add	sp, 2

loc_2613A:
		mov	al, 1
		pop	si
		pop	bp
		retf
sub_260FE		endp

; START OF FUNCTION CHUNK FOR sub_260FE
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_260FE

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_26142		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_26142		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2614A		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_2614A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_26152		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_26152		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2615A		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		mov	ax, dx
		pop	bp
		retf
sub_2615A		endp

; START OF FUNCTION CHUNK FOR sub_2615A
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_2615A

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_26166		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+3Ch]
		add	sp, 2
		push	ax
		push	[bp+arg_2]
		call	sub_2A606
		add	sp, 4
		pop	si
		pop	bp
		retf
sub_26166		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_26185		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		mov	ax, 6AA0h
		pop	bp
		retf
sub_26185		endp

; START OF FUNCTION CHUNK FOR sub_26185
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_26185

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_26192		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		mov	ax, 6AA0h
		pop	bp
		retf
sub_26192		endp

; START OF FUNCTION CHUNK FOR sub_26192
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_26192

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2619F		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	di, [bp+arg_0]
		or	di, di
		jz	short loc_261B2
		mov	ax, di
		jmp	short loc_261BE

loc_261B2:
		push	0Ch
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	di, ax

loc_261BE:
		or	ax, ax
		jz	short loc_261DD
		mov	eax, dword_4C8A6
		mov	[di], eax
		mov	eax, dword_4C8AA
		mov	[di+4], eax
		mov	eax, dword_4C8AE
		mov	[di+8], eax
		mov	ax, di
		jmp	short loc_261DF

loc_261DD:
		mov	ax, di

loc_261DF:
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	di
		pop	si
		pop	bp
		retf
sub_2619F		endp

; START OF FUNCTION CHUNK FOR sub_2619F
		pop	di
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_2619F

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_261ED		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	di, [bp+arg_0]
		or	di, di
		jz	short loc_26200
		mov	ax, di
		jmp	short loc_2620C

loc_26200:
		push	0Ch
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	di, ax

loc_2620C:
		or	ax, ax
		jz	short loc_2622B
		mov	eax, dword_4C8A6
		mov	[di], eax
		mov	eax, dword_4C8AA
		mov	[di+4], eax
		mov	eax, dword_4C8AE
		mov	[di+8], eax
		mov	ax, di
		jmp	short loc_2622D

loc_2622B:
		mov	ax, di

loc_2622D:
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	di
		pop	si
		pop	bp
		retf
sub_261ED		endp

; START OF FUNCTION CHUNK FOR sub_261ED
		pop	di
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_261ED

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2623B		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	di, [bp+arg_0]
		or	di, di
		jz	short loc_2624E
		mov	ax, di
		jmp	short loc_2625A

loc_2624E:
		push	0Ch
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	di, ax

loc_2625A:
		or	ax, ax
		jz	short loc_26279
		mov	eax, dword_4C8A6
		mov	[di], eax
		mov	eax, dword_4C8AA
		mov	[di+4], eax
		mov	eax, dword_4C8AE
		mov	[di+8], eax
		mov	ax, di
		jmp	short loc_2627B

loc_26279:
		mov	ax, di

loc_2627B:
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	di
		pop	si
		pop	bp
		retf
sub_2623B		endp

; START OF FUNCTION CHUNK FOR sub_2623B
		pop	di
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_2623B

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_26289		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	di, [bp+arg_0]
		or	di, di
		jz	short loc_2629C
		mov	ax, di
		jmp	short loc_262A8

loc_2629C:
		push	0Ch
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	di, ax

loc_262A8:
		or	ax, ax
		jz	short loc_262C7
		mov	eax, dword_4C8A6
		mov	[di], eax
		mov	eax, dword_4C8AA
		mov	[di+4], eax
		mov	eax, dword_4C8AE
		mov	[di+8], eax
		mov	ax, di
		jmp	short loc_262C9

loc_262C7:
		mov	ax, di

loc_262C9:
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	di
		pop	si
		pop	bp
		retf
sub_26289		endp

; START OF FUNCTION CHUNK FOR sub_26289
		pop	di
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_26289

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_262D7		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_262D7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_262DF		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_262DF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_262E7		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_262E7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_262EF		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_262EF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_262F7		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_262F7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_262FF		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		mov	al, 0
		pop	bp
		retf
sub_262FF		endp

; START OF FUNCTION CHUNK FOR sub_262FF
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_262FF

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2630B		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	al, [si+28h]
		pop	si
		pop	bp
		retf
sub_2630B		endp

; START OF FUNCTION CHUNK FOR sub_2630B
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_2630B

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Debris_GetSubpartAttrib (sub_381F2 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,14L — accesseur
; d'un champ (+0x13 via référence +0xE) : getter d'un attribut de sous-composant.
; ==============================================================================================
Debris_GetSubpartAttrib_2631B		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		mov	bx, dx
		les	bx, [bx+0Eh]
		mov	al, es:[bx+13h]
		pop	bp
		retf
Debris_GetSubpartAttrib_2631B		endp

; START OF FUNCTION CHUNK FOR Debris_GetSubpartAttrib_2631B
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR Debris_GetSubpartAttrib_2631B

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à Debris_GetStateFlag
; (sub_38203 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far,14L — accesseur trivial d'un champ (+0x29) : getter d'un flag d'état de débris.
; ==============================================================================================
Debris_GetStateFlag		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	al, [si+29h]
		pop	si
		pop	bp
		retf
Debris_GetStateFlag		endp

; START OF FUNCTION CHUNK FOR Debris_GetStateFlag
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR Debris_GetStateFlag

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2633E		proc far

var_4E		= dword ptr -4Eh
var_4A		= dword ptr -4Ah
var_46		= dword ptr -46h
var_42		= dword ptr -42h
var_3E		= dword ptr -3Eh
var_3A		= dword ptr -3Ah
var_36		= dword ptr -36h
var_32		= dword ptr -32h
var_2E		= dword ptr -2Eh
var_2A		= dword ptr -2Ah
var_26		= word ptr -26h
var_24		= dword ptr -24h
var_20		= word ptr -20h
var_1E		= dword ptr -1Eh
var_1A		= dword ptr -1Ah
var_16		= dword ptr -16h
var_12		= dword ptr -12h
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4Eh
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		add	sp, 2
		or	ax, dx
		jz	short loc_26370
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		add	sp, 2
		mov	[bp+var_4], dx
		mov	[bp+var_6], ax
		les	bx, [bp+var_6]
		mov	ax, es:[bx+6]
		mov	[bp+var_2], ax

loc_26370:
		push	si
		push	ss
		lea	ax, word ptr [bp+var_42]
		push	ax
		mov	bx, [si]
		call	dword ptr [bx+4Ch]
		add	sp, 6
		push	di
		push	ss
		lea	ax, word ptr [bp+var_4E]
		push	ax
		mov	bx, [di]
		call	dword ptr [bx+4Ch]
		add	sp, 6
		mov	eax, [bp+var_42]
		add	eax, [bp+var_4E]
		mov	[bp+var_36], eax
		mov	eax, [bp+var_3E]
		add	eax, [bp+var_4A]
		mov	[bp+var_32], eax
		mov	eax, [bp+var_3A]
		add	eax, [bp+var_46]
		mov	[bp+var_2E], eax
		push	large [bp+var_2E]
		push	large [bp+var_32]
		push	large [bp+var_36]
		call	sub_2B9E3
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 0Ch
		mov	[bp+var_E], eax
		mov	eax, [bp+var_E]
		mov	[bp+var_A], eax
		mov	eax, [bp+var_A]
		mov	edx, [bp+var_A]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_A], eax
		mov	eax, [bp+var_A]
		mov	edx, eax
		mov	[bp+var_12], 0C800h
		mov	ecx, [bp+var_12]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_A], eax
		mov	eax, [bp+var_A]
		mov	[bp+var_16], eax
		mov	[bp+var_1A], 0A00h
		mov	eax, [bp+var_1A]
		mov	[bp+var_1E], eax
		mov	eax, [bp+var_16]
		cmp	eax, [bp+var_1E]
		jge	short loc_26436
		mov	ax, 1
		jmp	short loc_26438

loc_26436:
		xor	ax, ax

loc_26438:
		or	al, al
		jz	short loc_26441
		lea	ax, word ptr [bp+var_16]
		jmp	short loc_26444

loc_26441:
		lea	ax, word ptr [bp+var_1E]

loc_26444:
		mov	[bp+var_20], ax
		mov	bx, [bp+var_20]
		mov	eax, [bx]
		mov	[bp+var_24], eax
		mov	eax, [bp+var_24]
		mov	[bp+var_A], eax
		mov	eax, [bp+var_A]
		mov	ax, [bp+var_2]
		mov	[bp+var_26], ax
		movsx	eax, [bp+var_26]
		shl	eax, 8
		mov	[bp+var_2A], eax
		mov	edx, [bp+var_2A]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_A], eax
		mov	ax, word ptr [bp+var_A+1]
		pop	di
		pop	si
		leave
		retf
sub_2633E		endp

; START OF FUNCTION CHUNK FOR sub_2633E
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_2633E

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2648B		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		xor	ax, ax
		pop	bp
		retf
sub_2648B		endp

; START OF FUNCTION CHUNK FOR sub_2648B
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_2648B

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_26497		proc far
		push	bp
		mov	bp, sp
		mov	word_4F30E, 1E4h
		xor	ax, ax
		mov	word_4F312, ax
		mov	word_4F310, ax
		mov	word_4F30E, 37ECh
		pop	bp
		retf
sub_26497		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_264B0		proc far
		push	bp
		mov	bp, sp
		push	2
		push	692Eh
		call	sub_265A5
		add	sp, 4
sub_264B0		endp
seg063		ends
