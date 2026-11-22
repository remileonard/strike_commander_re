ovr221		segment	para public 'OVERLAY' use16
		assume cs:ovr221
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 30 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à AircraftComponent_ReleaseMultiple_96750 (sub_96750 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️ far,
; 183 lignes, NON DÉTAILLÉE — libère plusieurs blocs typés (Memory_TypedFree_5C7B6 répété).
; ==============================================================================================
AircraftComponent_ReleaseMultiple_775A0		proc far

var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 18h
		push	si
		push	di
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jnz	short loc_775B5
		jmp	loc_77763

loc_775B5:
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 2618h
		xor	di, di
		jmp	short loc_7760F

loc_775C1:
		les	bx, word ptr [bp+arg_0]
		add	bx, di
		cmp	byte ptr es:[bx+60h], 0
		jz	short loc_775F8
		push	0
		push	2
		mov	ax, di
		shl	ax, 2
		mov	bx, word ptr [bp+arg_0]
		add	bx, ax
		mov	ax, es:[bx+32h]
		mov	dx, es:[bx+30h]
		mov	[bp+var_2], ax
		mov	[bp+var_4], dx
		lea	ax, [bp+var_4]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8

loc_775F8:
		mov	ax, di
		shl	ax, 2
		les	bx, word ptr [bp+arg_0]
		add	bx, ax
		mov	word ptr es:[bx+32h], 0
		mov	word ptr es:[bx+30h], 0
		inc	di

loc_7760F:
		cmp	di, 8
		jl	short loc_775C1
		push	0
		push	2
		les	bx, word ptr [bp+arg_0]
		mov	eax, es:[bx+28h]
		mov	[bp+var_8], eax
		lea	ax, word ptr [bp+var_8]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		les	bx, word ptr [bp+arg_0]
		mov	dword ptr es:[bx+28h], 0
		push	2
		mov	ax, word ptr [bp+arg_0]
		add	ax, 8Ah
		push	word ptr [bp+arg_0+2]
		push	ax
		call	sub_59129
		add	sp, 6
		les	bx, word ptr [bp+arg_0]
		cmp	byte ptr es:[bx+21h], 0
		jz	short loc_77686
		cmp	dword ptr es:[bx+1Ch], 0
		jz	short loc_77686
		push	0
		mov	al, es:[bx+20h]
		push	ax
		mov	eax, es:[bx+1Ch]
		mov	[bp+var_C], eax
		lea	ax, word ptr [bp+var_C]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_77686

loc_77686:
		les	bx, word ptr [bp+arg_0]
		mov	dword ptr es:[bx+1Ch], 0
		mov	byte ptr es:[bx+21h], 0
		mov	dword ptr es:[bx+22h], 0
		cmp	byte ptr es:[bx+17h], 0
		jz	short loc_776D0
		cmp	dword ptr es:[bx+12h], 0
		jz	short loc_776D0
		push	0
		mov	al, es:[bx+16h]
		push	ax
		mov	eax, es:[bx+12h]
		mov	[bp+var_10], eax
		lea	ax, word ptr [bp+var_10]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_776D0

loc_776D0:
		les	bx, word ptr [bp+arg_0]
		mov	dword ptr es:[bx+12h], 0
		mov	byte ptr es:[bx+17h], 0
		mov	dword ptr es:[bx+18h], 0
		cmp	byte ptr es:[bx+0Dh], 0
		jz	short loc_7771A
		cmp	dword ptr es:[bx+8], 0
		jz	short loc_7771A
		push	0
		mov	al, es:[bx+0Ch]
		push	ax
		mov	eax, es:[bx+8]
		mov	[bp+var_14], eax
		lea	ax, word ptr [bp+var_14]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_7771A

loc_7771A:
		les	bx, word ptr [bp+arg_0]
		mov	dword ptr es:[bx+8], 0
		mov	byte ptr es:[bx+0Dh], 0
		mov	dword ptr es:[bx+0Eh], 0
		push	0
		push	word ptr [bp+arg_0+2]
		push	bx
		call	sub_2F2EE
		add	sp, 6
		test	si, 1
		jz	short loc_77763
		mov	eax, [bp+arg_0]
		mov	[bp+var_18], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_18]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8

loc_77763:
		pop	di
		pop	si
		leave
		retf
AircraftComponent_ReleaseMultiple_775A0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_77767		proc far

var_A		= dword ptr -0Ah
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= dword ptr  0Ah
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		cmp	[bp+arg_0], 0
		jnz	short loc_77798
		push	1
		push	0
		push	2
		push	large 9Eh
		push	67B0h
		call	Memory_TypedFreeWrapper_447E1
		add	sp, 0Ch
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx
		jnz	short loc_77798
		jmp	loc_77889

loc_77798:
		mov	eax, [bp+arg_4]
		mov	[bp+var_4], eax
		mov	ax, [bp+arg_8]
		mov	[bp+var_6], ax
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 25E0h
		push	ax
		push	large [bp+var_4]
		push	word ptr [bp+arg_0+2]
		push	bx
		call	sub_2F64A
		add	sp, 0Ah
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 2FC6h
		mov	dword ptr es:[bx+0Bh], 0
		mov	byte ptr es:[bx+0Fh], 2
		mov	byte ptr es:[bx+10h], 0
		mov	dword ptr es:[bx+11h], 0
		mov	dword ptr es:[bx+17h], 0
		mov	byte ptr es:[bx+1Bh], 2
		mov	byte ptr es:[bx+1Ch], 0
		mov	dword ptr es:[bx+1Dh], 0
		mov	word ptr es:[bx+21h], 658h
		mov	word ptr es:[bx+21h], 2FC2h
		mov	ax, word ptr [bp+arg_0]
		add	ax, 2Fh
		push	word ptr [bp+arg_0+2]
		push	ax
		call	Calibration_ComputeHelper_3B4C4
		add	sp, 4
		mov	ax, word ptr [bp+arg_0]
		add	ax, 5Fh
		push	word ptr [bp+arg_0+2]
		push	ax
		call	Calibration_ComputeHelper_3B4C4
		add	sp, 4
		les	bx, word ptr [bp+arg_0]
		xor	ax, ax
		mov	es:[bx+91h], ax
		mov	es:[bx+8Fh], ax
		xor	eax, eax
		mov	es:[bx+97h], eax
		mov	es:[bx+93h], eax
		or	byte ptr es:[bx+9Dh], 1
		mov	word ptr es:[bx+9Bh], 0
		mov	byte ptr es:[bx+29h], 0
		push	word ptr [bp+arg_0+2]
		push	bx
		call	sub_2F7DB
		add	sp, 4
		mov	eax, [bp+arg_4]
		mov	[bp+var_A], eax
		les	bx, word ptr [bp+var_A]
		cmp	dword ptr es:[bx+0A2h], 0
		jnz	short loc_77889
		mov	eax, [bp+arg_0]
		mov	es:[bx+0A2h], eax

loc_77889:
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		leave
		retf
sub_77767		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 17 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à AircraftComponent_ReleaseAndDestructGeneric_9707A
; (sub_9707A de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — ⚠️ far, 114 lignes, NON DÉTAILLÉE — combine Memory_TypedFree_5C7B6 répété et
; Object_DestructGeneric_29115.
; ==============================================================================================
AircraftComponent_ReleaseAndDestructGeneric_77891		proc far

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
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jnz	short loc_778A5
		jmp	loc_779A9

loc_778A5:
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 2FC6h
		mov	eax, es:[bx+2]
		mov	[bp+var_4], eax
		les	bx, word ptr [bp+var_4]
		mov	eax, es:[bx+0A2h]
		cmp	eax, [bp+arg_0]
		jnz	short loc_778CF
		mov	dword ptr es:[bx+0A2h], 0

loc_778CF:
		push	2
		mov	ax, word ptr [bp+arg_0]
		add	ax, 8Fh
		push	word ptr [bp+arg_0+2]
		push	ax
		call	sub_59129
		add	sp, 6
		les	bx, word ptr [bp+arg_0]
		cmp	byte ptr es:[bx+1Ch], 0
		jz	short loc_77916
		cmp	dword ptr es:[bx+17h], 0
		jz	short loc_77916
		push	0
		mov	al, es:[bx+1Bh]
		push	ax
		mov	eax, es:[bx+17h]
		mov	[bp+var_8], eax
		lea	ax, word ptr [bp+var_8]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_77916

loc_77916:
		les	bx, word ptr [bp+arg_0]
		mov	dword ptr es:[bx+17h], 0
		mov	byte ptr es:[bx+1Ch], 0
		mov	dword ptr es:[bx+1Dh], 0
		cmp	byte ptr es:[bx+10h], 0
		jz	short loc_77960
		cmp	dword ptr es:[bx+0Bh], 0
		jz	short loc_77960
		push	0
		mov	al, es:[bx+0Fh]
		push	ax
		mov	eax, es:[bx+0Bh]
		mov	[bp+var_C], eax
		lea	ax, word ptr [bp+var_C]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_77960

loc_77960:
		les	bx, word ptr [bp+arg_0]
		mov	dword ptr es:[bx+0Bh], 0
		mov	byte ptr es:[bx+10h], 0
		mov	dword ptr es:[bx+11h], 0
		push	0
		push	word ptr [bp+arg_0+2]
		push	bx
		call	sub_2F5F4
		add	sp, 6
		test	si, 1
		jz	short loc_779A9
		mov	eax, [bp+arg_0]
		mov	[bp+var_10], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_10]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8

loc_779A9:
		pop	si
		leave
		retf
AircraftComponent_ReleaseAndDestructGeneric_77891		endp
ovr221		ends
