seg124		segment	para public 'CODE' use16
		assume cs:seg124
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0DDh, 49h, 0Eh, 0E8h, 51h, 0FFh, 83h, 0C4h, 6, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3684B		proc far

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
		jnz	short loc_3686E
		push	41h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jnz	short loc_3686E
		jmp	loc_36A08

loc_3686E:
		mov	word ptr [si], 4A24h
		mov	dword ptr [si+2], 0
		mov	byte ptr [si+6], 2
		mov	byte ptr [si+7], 0
		mov	dword ptr [si+8], 0
		mov	dword ptr [si+1Ah], 0
		mov	byte ptr [si+28h], 0
		mov	word ptr [si], 49FCh
		push	0
		mov	al, [di+4]
		push	ax
		push	large [di]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		or	ax, dx
		jnz	short loc_368B5
		jmp	loc_36964

loc_368B5:
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
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
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
		jmp	loc_36A08

loc_36964:
		push	1
		push	0
		push	2
		push	large 0
		push	6C14h
		call	Memory_TypedFreeWrapper_32871
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
		jz	short loc_369EA
		cmp	[bp+var_16], 0
		jz	short loc_369EA
		push	0
		mov	al, [bp+var_12]
		push	ax
		lea	ax, word ptr [bp+var_16]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_369EA

loc_369EA:
		xor	eax, eax
		mov	[si+2Dh], eax
		mov	[si+31h], eax
		mov	[si+29h], eax
		xor	eax, eax
		mov	[si+3Dh], eax
		mov	[si+35h], eax
		mov	[si+39h], eax

loc_36A08:
		mov	ax, si
		pop	di
		pop	si
		leave
		retf
sub_3684B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Debris_GetSubpartAttrib (sub_381F2 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,14L — accesseur
; d'un champ (+0x13 via référence +0xE) : getter d'un attribut de sous-composant.
; ==============================================================================================
Debris_GetSubpartAttrib_36A0E		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	bx, ax
		les	bx, [bx+29h]
		mov	ax, es:[bx]
		pop	bp
		retf
Debris_GetSubpartAttrib_36A0E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_36A1E		proc far

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
sub_36A1E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_36A2F		proc far

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
		call	near ptr sub_36AC5
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
		jz	short loc_36AAC
		cmp	dword ptr [di+1Ah], 0
		jz	short loc_36AC1
		push	dx
		mov	ax, di
		add	ax, 16h
		push	ax
		push	word ptr [di+24h]
		push	word ptr [di+26h]
		call	sub_37874
		jmp	short loc_36AC1
		jmp	short loc_36AC1

loc_36AAC:
		cmp	dword ptr [di+1Ah], 0
		jz	short loc_36AC1
		push	dx
		mov	ax, di
		add	ax, 16h
		push	ax
		call	sub_3772C
		jmp	short loc_36AC1

loc_36AC1:
		pop	di
		pop	si
		pop	bp
		retf
sub_36A2F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_36AC5		proc far

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
sub_36AC5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_36ADE		proc far

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
sub_36ADE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_36AF7		proc far

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
sub_36AF7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_36B1C		proc far

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
sub_36B1C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_36B41		proc far

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
sub_36B41		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_36B66		proc far

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
sub_36B66		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_36B8B		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jnz	short loc_36B9D
		jmp	loc_36C3B

loc_36B9D:
		mov	word ptr [si], 49FCh
		push	0
		mov	al, [si+6]
		push	ax
		push	large [si+2]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		or	ax, dx
		jz	short loc_36BF4
		cmp	byte ptr [si+7], 0
		jz	short loc_36BE0
		cmp	dword ptr [si+2], 0
		jz	short loc_36BE0
		push	0
		mov	al, [si+6]
		push	ax
		mov	ax, si
		add	ax, 2
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_36BE0

loc_36BE0:
		mov	dword ptr [si+2], 0
		mov	byte ptr [si+7], 0
		mov	dword ptr [si+8], 0

loc_36BF4:
		cmp	byte ptr [si+7], 0
		jz	short loc_36C1A
		cmp	dword ptr [si+2], 0
		jz	short loc_36C1A
		push	0
		mov	al, [si+6]
		push	ax
		mov	ax, si
		add	ax, 2
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_36C1A

loc_36C1A:
		mov	dword ptr [si+2], 0
		mov	byte ptr [si+7], 0
		mov	dword ptr [si+8], 0
		test	di, 1
		jz	short loc_36C3B
		push	si
		call	sub_39C
		pop	cx

loc_36C3B:
		pop	di
		pop	si
		pop	bp
		retf
sub_36B8B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_36C3F		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_36C99
		mov	word ptr [si], 4A24h
		cmp	byte ptr [si+7], 0
		jz	short loc_36C78
		cmp	dword ptr [si+2], 0
		jz	short loc_36C78
		push	0
		mov	al, [si+6]
		push	ax
		mov	ax, si
		add	ax, 2
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_36C78

loc_36C78:
		mov	dword ptr [si+2], 0
		mov	byte ptr [si+7], 0
		mov	dword ptr [si+8], 0
		test	di, 1
sub_36C3F		endp
seg124		ends
