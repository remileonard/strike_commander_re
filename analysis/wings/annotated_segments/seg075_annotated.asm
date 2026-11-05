seg075		segment	para public 'CODE' use16
		assume cs:seg075
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_34910		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		mov	ax, dx
		add	ax, 2
		push	ax
		push	ds
		push	offset unk_601D9
		call	sub_594DF
		add	sp, 6
		push	5822h
		call	sub_597D
		pop	cx
		pop	bp
		retf
sub_34910		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à Camera_CopyState
; (sub_2C852 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à
; revérifier ici. — Reprise de STRIKE.EXE : code identique instruction par instruction à
; Camera_CopyState (sub_2DE6D de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et
; contexte à revérifier ici. — far,74L — copie intégralement une structure caméra/objet 3D
; (position 20 octets, orientation normalisée 12+12 octets via sub_56E29, 8 octets
; additionnels via memcpy sub_3FD) : copie complète d'un état de caméra
; (position+orientation).
; ==============================================================================================
Camera_CopyState		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	eax, [di]
		mov	[si], eax
		mov	eax, [di+4]
		mov	[si+4], eax
		mov	eax, [di+8]
		mov	[si+8], eax
		mov	eax, [di+0Ch]
		mov	[si+0Ch], eax
		mov	eax, [di+10h]
		mov	[si+10h], eax
		mov	dx, di
		add	dx, 14h
		mov	bx, dx
		mov	eax, [bx]
		mov	[si+14h], eax
		mov	eax, [bx+4]
		mov	[si+18h], eax
		mov	eax, [bx+8]
		mov	[si+1Ch], eax
		mov	ax, di
		add	ax, 20h
		push	ax
		mov	ax, si
		add	ax, 20h
		push	ax
		call	AI_ComputeGeometryHelper_3B608
		add	sp, 4
		mov	eax, [di+44h]
		mov	[si+44h], eax
		mov	ax, si
		add	ax, 48h
		push	ds
		push	ax
		mov	ax, di
		add	ax, 48h
		push	ds
		push	ax
		mov	cx, 8
		call	CRT_Fmemcpy
		pop	di
		pop	si
		pop	bp
		retf
Camera_CopyState		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_349B8		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	ax
		nop
		push	cs
		call	near ptr sub_34B2E
		pop	cx
		mov	al, 1
		pop	bp
		retf
sub_349B8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_349C9		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	al, 0
		pop	bp
		retf
sub_349C9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_349D3		proc far

arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		push	si
		pushaw
		mov	esi, dword_5B464
		mov	edx, [bp+arg_0]
		mov	cx, 1
		mov	bx, 7370h
		mov	ax, 1209h
		int	15h
		popaw
		pop	si
		pop	bp
		retf
sub_349D3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_349F0		proc far

var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		push	si
		mov	si, [bp+arg_0]
		call	PIT_ReadHighPrecision
		push	dx
		push	ax
		pop	eax
		mov	dword_60294, eax
		cmp	word ptr [si+5Ch], 0
		jnz	short loc_34A10
		jmp	loc_34B1C

loc_34A10:
		push	si
		push	6236h
		push	cs
		call	near ptr Camera_CopyState
		add	sp, 4
		mov	ax, [si+5Ch]
		add	ax, 2
		mov	[bp+var_6], ax
		push	ax
		lea	ax, [bp+var_4]
		push	ax
		call	sub_469A5
		add	sp, 4
		cmp	byte_5FF54, 0
		jz	short loc_34A4C
		push	si
		nop
		push	cs
		call	near ptr Camera_UpdateViewportClip
		pop	cx
		call	PIT_ReadHighPrecision
		push	dx
		push	ax
		pop	eax
		mov	dword_60298, eax

loc_34A4C:
		push	si
		push	649Bh
		call	sub_365A6
		add	sp, 4
		call	PIT_ReadHighPrecision
		push	dx
		push	ax
		pop	eax
		mov	dword_6029C, eax
		call	PIT_ReadHighPrecision
		push	dx
		push	ax
		pop	eax
		mov	dword_602A0, eax
		mov	bx, word_5DD42
		mov	bx, [bx+2]
		mov	ax, [bx]
		mov	bx, word_5DD42
		mov	dx, [bx]
		mov	[bp+var_8], dx
		mov	[bp+var_A], ax
		push	2
		push	dx
		push	ax
		call	sub_42A76
		push	dx
		push	ax
		pop	eax
		add	sp, 6
		mov	dword_600DC, eax
		mov	bx, word_5DD42
		movsx	eax, word ptr [bx+4]
		mov	dword_600EC, eax
		movsx	eax, word ptr [bx+8]
		mov	dword_600F8, eax
		movsx	eax, word ptr [bx+6]
		mov	dword_600F0, eax
		movsx	eax, word ptr [bx+0Ah]
		mov	dword_600F4, eax
		push	637Ah
		call	sub_33E13
		pop	cx
		call	PIT_ReadHighPrecision
		push	dx
		push	ax
		pop	eax
		mov	dword_602A4, eax
		push	si
		call	sub_59380
		pop	cx
		push	si
		mov	bx, [si+50h]
		call	dword ptr [bx+20h]
		pop	cx
		push	si
		mov	bx, [si+50h]
		call	dword ptr [bx+14h]
		pop	cx
		push	word ptr [si+5Ch]
		mov	bx, [si+5Ch]
		mov	bx, [bx]
		call	dword ptr [bx+4]
		pop	cx
		call	PIT_ReadHighPrecision
		push	dx
		push	ax
		pop	eax
		mov	dword_602A8, eax
		push	637Ah
		call	sub_33DF6
		pop	cx
		lea	ax, [bp+var_4]
		push	ax
		call	sub_469CB
		pop	cx

loc_34B1C:
		pop	si
		leave
		retf
sub_349F0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; StreamReader_DestructWrapper_2CA33 (sub_2CA33 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE
; ; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : code identique
; instruction par instruction à StreamReader_DestructWrapper_3D231 (sub_3D231 de OPTEST.EXE).
; Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de
; STRIKE.EXE : code identique instruction par instruction à StreamReader_DestructWrapper_659C1
; (sub_659C1 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far, référencée via vtable (DATA XREF seg339) — enveloppe appelant
; StreamReader_Destruct_638FF. Référencée directement par TextRenderer_Main (sub_27477,
; seg048).
; ==============================================================================================
StreamReader_DestructWrapper_34B1F		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	ax
		call	sub_591E0
		pop	cx
		pop	bp
		retf
StreamReader_DestructWrapper_34B1F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_34B2E		proc far

var_8C		= dword ptr -8Ch
var_88		= dword ptr -88h
var_84		= dword ptr -84h
var_80		= dword ptr -80h
var_7C		= dword ptr -7Ch
var_78		= dword ptr -78h
var_74		= dword ptr -74h
var_70		= dword ptr -70h
var_6C		= dword ptr -6Ch
var_68		= dword ptr -68h
var_64		= word ptr -64h
var_62		= dword ptr -62h
var_5E		= dword ptr -5Eh
var_5A		= dword ptr -5Ah
var_56		= dword ptr -56h
var_52		= word ptr -52h
var_50		= dword ptr -50h
var_4C		= dword ptr -4Ch
var_48		= dword ptr -48h
var_44		= dword ptr -44h
var_40		= word ptr -40h
var_3E		= dword ptr -3Eh
var_3A		= dword ptr -3Ah
var_36		= dword ptr -36h
var_32		= dword ptr -32h
var_2E		= word ptr -2Eh
var_2C		= dword ptr -2Ch
var_28		= dword ptr -28h
var_24		= dword ptr -24h
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 8Ch
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_14], 0E6h
		mov	eax, [si+34h]
		cmp	eax, [bp+var_14]
		jle	short loc_34B51
		mov	ax, 1
		jmp	short loc_34B53

loc_34B51:
		xor	ax, ax

loc_34B53:
		or	al, al
		jnz	short loc_34B74
		mov	[bp+var_18], 0FFFFFF1Ah
		mov	eax, [si+34h]
		cmp	eax, [bp+var_18]
		jge	short loc_34B6E
		mov	ax, 1
		jmp	short loc_34B70

loc_34B6E:
		xor	ax, ax

loc_34B70:
		or	al, al
		jz	short loc_34BCC

loc_34B74:
		cmp	dword ptr [si+34h], 0
		jle	short loc_34B80
		mov	ax, 1
		jmp	short loc_34B82

loc_34B80:
		xor	ax, ax

loc_34B82:
		or	al, al
		jz	short loc_34BA9
		mov	[bp+var_4], 0FFFFFF9Ch
		mov	[bp+var_8], 12Ch
		mov	[bp+var_C], 190h
		mov	[bp+var_10], 12Ch
		jmp	loc_34E5B

loc_34BA9:
		mov	[bp+var_4], 0FFFFFF9Ch
		mov	[bp+var_8], 0FFFFFF9Ch
		mov	[bp+var_C], 190h
		mov	[bp+var_10], 0FFFFFF9Ch
		jmp	loc_34E5B

loc_34BCC:
		mov	eax, [si+2Ch]
		mov	[bp+var_80], eax
		mov	eax, [si+30h]
		mov	[bp+var_7C], eax
		mov	[bp+var_1C], 0
		mov	eax, [bp+var_1C]
		mov	[bp+var_78], eax
		lea	ax, word ptr [bp+var_80]
		push	ax
		call	Vector_NormalizeInPlace_3A0DC
		pop	cx
		mov	eax, [bp+var_7C]
		mov	[bp+var_8C], eax
		mov	eax, [bp+var_80]
		neg	eax
		mov	[bp+var_20], eax
		mov	[bp+var_24], eax
		mov	[bp+var_88], eax
		mov	eax, [bp+var_78]
		mov	[bp+var_84], eax
		mov	eax, [bp+var_80]
		mov	edx, dword_5C603
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_80], eax
		mov	eax, [bp+var_7C]
		mov	edx, dword_5C603
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_7C], eax
		mov	eax, [bp+var_78]
		mov	edx, dword_5C603
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_78], eax
		mov	eax, dword_5C603
		sar	eax, 1
		mov	[bp+var_28], eax
		mov	[bp+var_2C], eax
		mov	eax, [bp+var_8C]
		mov	edx, [bp+var_2C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_8C], eax
		mov	eax, [bp+var_88]
		mov	edx, [bp+var_2C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_88], eax
		mov	eax, [bp+var_84]
		mov	edx, [bp+var_2C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_84], eax
		mov	eax, [bp+var_8C]
		sub	[bp+var_80], eax
		mov	eax, [bp+var_88]
		sub	[bp+var_7C], eax
		mov	eax, [bp+var_84]
		sub	[bp+var_78], eax
		mov	eax, [bp+var_80]
		add	[bp+var_8C], eax
		mov	eax, [bp+var_7C]
		add	[bp+var_88], eax
		mov	eax, [bp+var_78]
		add	[bp+var_84], eax
		mov	eax, dword_5C607
		mov	[bp+var_78], eax
		mov	[bp+var_84], eax
		mov	di, si
		add	di, 1Ch
		mov	eax, [di]
		sub	[bp+var_78], eax
		mov	ax, si
		add	ax, 20h
		push	ax
		lea	ax, word ptr [bp+var_80]
		push	ax
		call	Matrix_WorldToLocal_3CF4B
		add	sp, 4
		mov	di, si
		add	di, 1Ch
		mov	eax, [di]
		sub	[bp+var_84], eax
		mov	ax, si
		add	ax, 20h
		push	ax
		lea	ax, word ptr [bp+var_8C]
		push	ax
		call	Matrix_WorldToLocal_3CF4B
		add	sp, 4
		mov	ax, [si+8]
		mov	[bp+var_2E], ax
		mov	di, si
		add	di, 0Ch
		push	large [bp+var_7C]
		push	large [di]
		push	large [bp+var_80]
		call	Math_FixedMulDiv_3C82C
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_32], eax
		mov	[bp+var_36], eax
		movsx	eax, [bp+var_2E]
		shl	eax, 8
		mov	edx, [bp+var_36]
		add	edx, eax
		mov	[bp+var_3A], edx
		mov	eax, [bp+var_3A]
		mov	[bp+var_3E], eax
		sar	eax, 8
		mov	[bp+var_4], eax
		mov	ax, [si+0Ah]
		mov	[bp+var_40], ax
		mov	di, si
		add	di, 10h
		push	large [bp+var_7C]
		push	large [di]
		push	large [bp+var_78]
		call	Math_FixedMulDiv_3C82C
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_44], eax
		mov	[bp+var_48], eax
		movsx	eax, [bp+var_40]
		shl	eax, 8
		sub	eax, [bp+var_48]
		mov	[bp+var_4C], eax
		mov	[bp+var_50], eax
		sar	eax, 8
		mov	[bp+var_8], eax
		mov	ax, [si+8]
		mov	[bp+var_52], ax
		mov	di, si
		add	di, 0Ch
		push	large [bp+var_88]
		push	large [di]
		push	large [bp+var_8C]
		call	Math_FixedMulDiv_3C82C
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_56], eax
		mov	[bp+var_5A], eax
		movsx	eax, [bp+var_52]
		shl	eax, 8
		mov	edx, [bp+var_5A]
		add	edx, eax
		mov	[bp+var_5E], edx
		mov	eax, [bp+var_5E]
		mov	[bp+var_62], eax
		sar	eax, 8
		mov	[bp+var_C], eax
		mov	ax, [si+0Ah]
		mov	[bp+var_64], ax
		mov	di, si
		add	di, 10h
		push	large [bp+var_88]
		push	large [di]
		push	large [bp+var_84]
		call	Math_FixedMulDiv_3C82C
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_68], eax
		mov	[bp+var_6C], eax
		movsx	eax, [bp+var_64]
		shl	eax, 8
		sub	eax, [bp+var_6C]
		mov	[bp+var_70], eax
		mov	[bp+var_74], eax
		sar	eax, 8
		mov	[bp+var_10], eax

loc_34E5B:
		cmp	[bp+var_4], 1FFFh
		jle	short loc_34E6F
		mov	[bp+var_4], 1FFFh
		jmp	short loc_34E81

loc_34E6F:
		cmp	[bp+var_4], 0FFFFE001h
		jge	short loc_34E81
		mov	[bp+var_4], 0FFFFE001h

loc_34E81:
		cmp	[bp+var_8], 1FFFh
		jle	short loc_34E95
		mov	[bp+var_8], 1FFFh
		jmp	short loc_34EA7

loc_34E95:
		cmp	[bp+var_8], 0FFFFE001h
		jge	short loc_34EA7
		mov	[bp+var_8], 0FFFFE001h

loc_34EA7:
		cmp	[bp+var_C], 1FFFh
		jle	short loc_34EBB
		mov	[bp+var_C], 1FFFh
		jmp	short loc_34ECD

loc_34EBB:
		cmp	[bp+var_C], 0FFFFE001h
		jge	short loc_34ECD
		mov	[bp+var_C], 0FFFFE001h

loc_34ECD:
		cmp	[bp+var_10], 1FFFh
		jle	short loc_34EE1
		mov	[bp+var_10], 1FFFh
		jmp	short loc_34EF3

loc_34EE1:
		cmp	[bp+var_10], 0FFFFE001h
		jge	short loc_34EF3
		mov	[bp+var_10], 0FFFFE001h

loc_34EF3:
		mov	ax, word ptr [bp+var_4]
		mov	[si+76h], ax
		mov	ax, word ptr [bp+var_8]
		mov	[si+78h], ax
		mov	ax, word ptr [bp+var_C]
		mov	[si+7Ah], ax
		mov	ax, word ptr [bp+var_10]
		mov	[si+7Ch], ax
		pop	di
		pop	si
		leave
		retf
sub_34B2E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 8 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Camera_UpdateViewportClip (sub_2DCAB de PACIFIC.EXE).
; Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de
; OPTEST.EXE : même suite d'instructions, 8 opérande(s) différent(s) (adresses de données ou
; constantes) — à vérifier à Camera_UpdateViewportClip (sub_1EA87 de OPTEST.EXE). Résumé
; repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE :
; même suite d'instructions, 8 opérande(s) différent(s) (adresses de données ou constantes) —
; à vérifier à Camera_UpdateViewportClip (sub_2E6CB de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far,36L — compare le rectangle de
; viewport courant (+0x78-0x7E) au précédent, met à jour la zone de clipping si changé
; (sub_58B97) : mise à jour du rectangle de clipping du viewport caméra (cache si inchangé).
; ==============================================================================================
Camera_UpdateViewportClip		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+76h]
		cmp	ax, [si+7Ah]
		jnz	short loc_34F26
		mov	ax, [si+78h]
		cmp	ax, [si+7Ch]
		jz	short loc_34F3E

loc_34F26:
		push	word ptr [si+7Ch]
		push	word ptr [si+7Ah]
		push	word ptr [si+78h]
		push	word ptr [si+76h]
		push	word_5DD42
		call	sub_59210
		add	sp, 0Ah

loc_34F3E:
		pop	si
		pop	bp
		retf
Camera_UpdateViewportClip		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_34F41		proc far

var_8		= dword ptr -8
var_4		= dword ptr -4

		push	bp
		mov	bp, sp
		sub	sp, 8
		mov	[bp+var_4], 100h
		mov	eax, [bp+var_4]
		mov	dword_5C382, eax
		mov	word_6009A, 0
		mov	[bp+var_8], 0D5h
		mov	eax, [bp+var_8]
		mov	dword_5C386, eax
		mov	dword_600BA, 0
		mov	byte_600BE, 2
		mov	byte_600BF, 0
		mov	dword_600C0, 0
		leave
		retf
sub_34F41		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_34F8B		proc far
		push	bp
		mov	bp, sp
		cmp	byte_600BF, 0
		jz	short loc_34FB3
		cmp	dword_600BA, 0
		jz	short loc_34FB3
		push	0
		mov	al, byte_600BE
		push	ax
		push	639Ah
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_34FB3

loc_34FB3:
		mov	dword_600BA, 0
		mov	byte_600BF, 0
		mov	dword_600C0, 0
		push	637Ah
sub_34F8B		endp

; START OF FUNCTION CHUNK FOR sub_34F8B
		db 9Ah, 0FBh, 0
; END OF FUNCTION CHUNK FOR sub_34F8B
seg075		ends
