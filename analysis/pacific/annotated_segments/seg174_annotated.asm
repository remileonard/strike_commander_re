seg174		segment	para public 'CODE' use16
		assume cs:seg174
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0FFh, 83h, 0C4h, 6, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_68C56		proc far

var_17		= byte ptr -17h
var_16		= dword ptr -16h
var_12		= byte ptr -12h
var_11		= byte ptr -11h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= word ptr -8
var_5		= byte ptr -5
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 18h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jnz	short loc_68C79
		push	41h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jnz	short loc_68C79
		jmp	loc_68E13

loc_68C79:
		mov	word ptr [si], 48E2h
		mov	dword ptr [si+2], 0
		mov	byte ptr [si+6], 2
		mov	byte ptr [si+7], 0
		mov	dword ptr [si+8], 0
		mov	dword ptr [si+1Ah], 0
		mov	byte ptr [si+28h], 0
		mov	word ptr [si], 48BAh
		push	0
		mov	al, [di+4]
		push	ax
		push	large [di]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		or	ax, dx
		jnz	short loc_68CC0
		jmp	loc_68D6F

loc_68CC0:
		mov	dx, di
		mov	bx, dx
		mov	eax, [bx]
		mov	[bp+var_4], eax
		mov	al, [bx+4]
		mov	[bp+var_5], al
		mov	eax, [bp+var_4]
		mov	[si+2], eax
		mov	al, [bp+var_5]
		mov	[si+6], al
		mov	byte ptr [si+7], 0
		mov	dword ptr [si+8], 0
		mov	eax, [bx+6]
		mov	[si+8], eax
		mov	[bp+var_8], di
		mov	bx, [bp+var_8]
		mov	byte ptr [bx+5], 0
		mov	byte ptr [si+7], 1
		push	0
		mov	al, [di+4]
		push	ax
		push	large [di]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		add	ax, 4
		mov	[si+2Bh], dx
		mov	[si+29h], ax
		mov	ax, [si+2Bh]
		mov	dx, [si+29h]
		add	dx, 2
		mov	[si+2Fh], ax
		mov	[si+2Dh], dx
		mov	ax, [si+2Fh]
		mov	dx, [si+2Dh]
		add	dx, 6
		mov	[si+33h], ax
		mov	[si+31h], dx
		mov	ax, [si+33h]
		mov	dx, [si+31h]
		add	dx, 200h
		mov	[si+3Bh], ax
		mov	[si+39h], dx
		mov	ax, [si+3Bh]
		mov	dx, [si+39h]
		add	dx, 100h
		mov	[si+37h], ax
		mov	[si+35h], dx
		mov	ax, [si+37h]
		mov	dx, [si+35h]
		add	dx, 100h
		mov	[si+3Fh], ax
		mov	[si+3Dh], dx
		jmp	loc_68E13

loc_68D6F:
		push	1
		push	0
		push	2
		push	large 0
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word ptr [bp+var_C+2], dx
		mov	word ptr [bp+var_C], ax
		mov	eax, [bp+var_C]
		mov	[bp+var_16], eax
		mov	[bp+var_12], 2
		mov	[bp+var_11], 1
		mov	[bp+var_10], 0
		mov	[bp+var_10], 0
		mov	al, [bp+var_12]
		mov	[bp+var_17], al
		mov	eax, [bp+var_16]
		mov	[si+2], eax
		mov	al, [bp+var_17]
		mov	[si+6], al
		mov	byte ptr [si+7], 0
		mov	dword ptr [si+8], 0
		mov	eax, [bp+var_10]
		mov	[si+8], eax
		cmp	[bp+var_11], 0
		jz	short loc_68DF5
		cmp	[bp+var_16], 0
		jz	short loc_68DF5
		push	0
		mov	al, [bp+var_12]
		push	ax
		lea	ax, word ptr [bp+var_16]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_68DF5

loc_68DF5:
		xor	eax, eax
		mov	[si+2Dh], eax
		mov	[si+31h], eax
		mov	[si+29h], eax
		xor	eax, eax
		mov	[si+3Dh], eax
		mov	[si+35h], eax
		mov	[si+39h], eax

loc_68E13:
		mov	ax, si
		pop	di
		pop	si
		leave
		retf
sub_68C56		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Debris_GetSubpartAttrib (sub_381F2 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,14L — accesseur
; d'un champ (+0x13 via référence +0xE) : getter d'un attribut de sous-composant.
; ==============================================================================================
Debris_GetSubpartAttrib_68E19		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	bx, ax
		les	bx, [bx+29h]
		mov	ax, es:[bx]
		pop	bp
		retf
Debris_GetSubpartAttrib_68E19		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_68E29		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	bx, ax
		les	bx, [bx+2Dh]
		mov	ax, es:[bx]
		dec	ax
		pop	bp
		retf
sub_68E29		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_68E3A		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= byte ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	di, [bp+arg_0]
		mov	al, [bp+arg_4]
		push	ax
		push	di
		mov	bx, [di]
		call	dword ptr [bx+1Ch]
		add	sp, 4
		mov	dx, [bp+arg_6]
		add	dx, ax
		mov	[di+16h], dx
		mov	ax, [bp+arg_8]
		mov	[di+18h], ax
		mov	al, [bp+arg_4]
		push	ax
		push	di
		nop
		push	cs
		call	near ptr sub_68ED0
		add	sp, 4
		mov	[di+1Eh], ax
		les	bx, [di+29h]
		mov	ax, es:[bx]
		mov	[di+20h], ax
		mov	al, [bp+arg_4]
		mov	ah, 0
		shl	ax, 1
		les	bx, [di+31h]
		add	bx, ax
		mov	ax, [di+3Fh]
		mov	dx, [di+3Dh]
		add	dx, es:[bx]
		mov	[di+1Ch], ax
		mov	[di+1Ah], dx
		mov	dx, [bp+arg_2]
		cmp	byte ptr [di+28h], 0
		jz	short loc_68EB7
		cmp	dword ptr [di+1Ah], 0
		jz	short loc_68ECC
		push	dx
		mov	ax, di
		add	ax, 16h
		push	ax
		push	word ptr [di+24h]
		push	word ptr [di+26h]
		call	sub_69526
		jmp	short loc_68ECC
		jmp	short loc_68ECC

loc_68EB7:
		cmp	dword ptr [di+1Ah], 0
		jz	short loc_68ECC
		push	dx
		mov	ax, di
		add	ax, 16h
		push	ax
		call	sub_693DE
		jmp	short loc_68ECC

loc_68ECC:
		pop	di
		pop	si
		pop	bp
		retf
sub_68E3A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_68ED0		proc far

arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		mov	al, [bp+arg_2]
		mov	ah, 0
		mov	bx, dx
		les	bx, [bx+39h]
		add	bx, ax
		mov	al, es:[bx]
		mov	ah, 0
		pop	bp
		retf
sub_68ED0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_68EE9		proc far

arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		mov	al, [bp+arg_2]
		mov	ah, 0
		mov	bx, dx
		les	bx, [bx+35h]
		add	bx, ax
		mov	al, es:[bx]
		mov	ah, 0
		pop	bp
		retf
sub_68EE9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_68F02		proc far

var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	al, [bp+arg_2]
		mov	[si+22h], al
		mov	al, [si+22h]
		mov	[bp+var_1], al
		mov	[si+22h], al
		mov	byte ptr [si+28h], 0
		mov	al, [si+22h]
		mov	ah, 0
		pop	si
		leave
		retf
sub_68F02		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_68F27		proc far

var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	al, [bp+arg_2]
		mov	[si+23h], al
		mov	al, [si+23h]
		mov	[bp+var_1], al
		mov	[si+23h], al
		mov	byte ptr [si+28h], 0
		mov	al, [si+23h]
		mov	ah, 0
		pop	si
		leave
		retf
sub_68F27		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_68F4C		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[si+24h], ax
		mov	ax, [si+24h]
		mov	[bp+var_2], ax
		mov	[si+24h], ax
		mov	byte ptr [si+28h], 1
		mov	al, [si+22h]
		mov	ah, 0
		pop	si
		leave
		retf
sub_68F4C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_68F71		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[si+26h], ax
		mov	ax, [si+26h]
		mov	[bp+var_2], ax
		mov	[si+26h], ax
		mov	byte ptr [si+28h], 1
		mov	al, [si+22h]
		mov	ah, 0
		pop	si
		leave
		retf
sub_68F71		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_68F96		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jnz	short loc_68FA8
		jmp	loc_69046

loc_68FA8:
		mov	word ptr [si], 48BAh
		push	0
		mov	al, [si+6]
		push	ax
		push	large [si+2]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		or	ax, dx
		jz	short loc_68FFF
		cmp	byte ptr [si+7], 0
		jz	short loc_68FEB
		cmp	dword ptr [si+2], 0
		jz	short loc_68FEB
		push	0
		mov	al, [si+6]
		push	ax
		mov	ax, si
		add	ax, 2
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_68FEB

loc_68FEB:
		mov	dword ptr [si+2], 0
		mov	byte ptr [si+7], 0
		mov	dword ptr [si+8], 0

loc_68FFF:
		cmp	byte ptr [si+7], 0
		jz	short loc_69025
		cmp	dword ptr [si+2], 0
		jz	short loc_69025
		push	0
		mov	al, [si+6]
		push	ax
		mov	ax, si
		add	ax, 2
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_69025

loc_69025:
		mov	dword ptr [si+2], 0
		mov	byte ptr [si+7], 0
		mov	dword ptr [si+8], 0
		test	di, 1
		jz	short loc_69046
		push	si
		call	sub_3B2
		pop	cx

loc_69046:
		pop	di
		pop	si
		pop	bp
		retf
sub_68F96		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6904A		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_690A4
		mov	word ptr [si], 48E2h
		cmp	byte ptr [si+7], 0
		jz	short loc_69083
		cmp	dword ptr [si+2], 0
		jz	short loc_69083
		push	0
		mov	al, [si+6]
		push	ax
		mov	ax, si
		add	ax, 2
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_69083

loc_69083:
		mov	dword ptr [si+2], 0
		mov	byte ptr [si+7], 0
		mov	dword ptr [si+8], 0
		test	di, 1
		jz	short loc_690A4
		push	si
sub_6904A		endp

; START OF FUNCTION CHUNK FOR sub_6904A
		db 9Ah, 0B2h
; END OF FUNCTION CHUNK FOR sub_6904A
seg174		ends
