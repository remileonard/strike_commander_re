ovr227		segment	para public 'OVERLAY' use16
		assume cs:ovr227
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à TextCycler_ReleaseEntry_C3080 (sub_C3080 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de données
; ou constantes) — à vérifier à TextCycler_ReleaseEntry_A7060 (sub_A7060 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, libère une
; entrée (Memory_TypedFreeWrapperC_5C6F3, seg131).
; ==============================================================================================
TextCycler_ReleaseEntry_BA940		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= byte ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_4]
		imul	[bp+arg_6]
		movsx	eax, ax
		mov	[bp+var_4], eax
		cmp	byte_49DED, 0
		jz	short loc_BA963
		mov	[bp+arg_8], 3

loc_BA963:
		push	1
		push	0
		mov	al, [bp+arg_8]
		push	ax
		push	large [bp+var_4]
		push	6C14h
		call	Memory_TypedFreeWrapper_32871
		add	sp, 0Ch
		mov	[si+2], dx
		mov	[si], ax
		mov	al, [bp+arg_8]
		mov	[si+4], al
		mov	al, byte ptr [bp+arg_4]
		mov	[si+5], al
		mov	eax, [bp+var_4]
		shld	edx, eax, 10h
		pop	si
		leave
		retf
TextCycler_ReleaseEntry_BA940		endp

; START OF FUNCTION CHUNK FOR TextCycler_ReleaseEntry_BA940
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR TextCycler_ReleaseEntry_BA940

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BA99A		proc far

var_8		= dword ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_4]
		push	large 0FFFFFFFFh
		push	large 4
		push	ss
		lea	ax, [bp+var_4]
		push	ax
		push	di
		call	StreamReader_ReadTyped_4148D
		add	sp, 0Eh
		push	2
		push	[bp+var_2]
		push	[bp+var_4]
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr TextCycler_ReleaseEntry_BA940
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 0Ah
		mov	[bp+var_8], eax
		cmp	eax, 0
		jz	short loc_BAA0A
		push	large 0FFFFFFFFh
		push	large [bp+var_8]
		push	0
		mov	al, [si+4]
		push	ax
		push	word ptr [si+2]
		push	word ptr [si]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	di
		call	StreamReader_ReadTyped_4148D
		add	sp, 0Eh

loc_BAA0A:
		cmp	[bp+var_8], 0
		jz	short loc_BAA16
		mov	ax, 1
		jmp	short loc_BAA18

loc_BAA16:
		xor	ax, ax

loc_BAA18:
		pop	di
		pop	si
		leave
		retf
sub_BA99A		endp

; START OF FUNCTION CHUNK FOR sub_BA99A
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_BA99A

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BAA20		proc far

var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= dword ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+arg_0]
		mov	eax, [bp+arg_4]
		mov	[bp+var_4], eax
		push	2
		les	bx, word ptr [bp+var_4]
		push	word ptr es:[bx+2]
		les	bx, word ptr [bp+var_4]
		push	word ptr es:[bx]
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr TextCycler_ReleaseEntry_BA940
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 0Ah
		mov	[bp+var_8], eax
		cmp	eax, 0
		jz	short loc_BAA8C
		push	word ptr [bp+var_8]
		mov	ax, word ptr [bp+arg_4]
		add	ax, 4
		push	word ptr [bp+arg_4+2]
		push	ax
		push	0
		mov	al, [si+4]
		push	ax
		push	word ptr [si+2]
		push	word ptr [si]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		call	sub_3545
		add	sp, 0Ah

loc_BAA8C:
		cmp	[bp+var_8], 0
		jz	short loc_BAA98
		mov	ax, 1
		jmp	short loc_BAA9A

loc_BAA98:
		xor	ax, ax

loc_BAA9A:
		pop	si
		leave
		retf
sub_BAA20		endp

; START OF FUNCTION CHUNK FOR sub_BAA20
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_BAA20

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BAAA0		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	2
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr TextCycler_ReleaseEntry_BA940
		add	sp, 0Ah
		mov	di, ax
		or	di, di
		jz	short loc_BAAED
		push	large 0FFFFFFFFh
		movsx	eax, di
		push	eax
		push	0
		mov	al, [si+4]
		push	ax
		push	word ptr [si+2]
		push	word ptr [si]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+arg_8]
		call	StreamReader_ReadTyped_4148D
		add	sp, 0Eh

loc_BAAED:
		or	di, di
		jz	short loc_BAAF6
		mov	ax, 1
		jmp	short loc_BAAF8

loc_BAAF6:
		xor	ax, ax

loc_BAAF8:
		pop	di
		pop	si
		pop	bp
		retf
sub_BAAA0		endp

; START OF FUNCTION CHUNK FOR sub_BAAA0
		pop	di
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_BAAA0

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BAB00		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_8]
		push	2
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr TextCycler_ReleaseEntry_BA940
		add	sp, 0Ah
		mov	[bp+var_2], ax
		cmp	[bp+var_2], 0
		jz	short loc_BAB4F
		push	0
		mov	al, [si+4]
		push	ax
		push	word ptr [si+2]
		push	word ptr [si]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	large [di+4Dh]
		push	di
		call	sub_43468
		add	sp, 0Ah

loc_BAB4F:
		cmp	[bp+var_2], 0
		jz	short loc_BAB5A
		mov	ax, 1
		jmp	short loc_BAB5C

loc_BAB5A:
		xor	ax, ax

loc_BAB5C:
		pop	di
		pop	si
		leave
		retf
sub_BAB00		endp

; START OF FUNCTION CHUNK FOR sub_BAB00
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_BAB00

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à TextCycler_ReleaseBuffer_C321D (sub_C321D de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de données
; ou constantes) — à vérifier à TextCycler_ReleaseBuffer_A71E5 (sub_A71E5 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, libère un
; tampon typé (Memory_TypedFree_5C7B6).
; ==============================================================================================
TextCycler_ReleaseBuffer_BAB64		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	byte ptr [si+4], 0FFh
		jnz	short loc_BAB76
		mov	ax, 1
		jmp	short loc_BAB78

loc_BAB76:
		xor	ax, ax

loc_BAB78:
		or	al, al
		jz	short loc_BAB89
		mov	dword ptr [si], 0
		mov	byte ptr [si+4], 2
		jmp	short loc_BAB9B

loc_BAB89:
		push	0
		mov	al, [si+4]
		push	ax
		push	si
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8

loc_BAB9B:
		pop	si
		pop	bp
		retf
TextCycler_ReleaseBuffer_BAB64		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BAB9E		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_BABC4
		push	si
		push	cs
		call	near ptr TextCycler_ReleaseBuffer_BAB64
		add	sp, 2
		test	di, 1
		jz	short loc_BABC4
		push	si
		call	sub_39C
		add	sp, 2

loc_BABC4:
		pop	di
		pop	si
		pop	bp
		retf
sub_BAB9E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BABC8		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_4]
		imul	[bp+arg_6]
		mov	[si+0Ch], ax
		mov	ax, [bp+arg_8]
		mov	[si+6], ax
		push	seg stub227
		push	offset sub_483C5
		push	11h
		push	word ptr [si+6]
		push	6
		push	0
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		mov	[si+8], ax
		mov	di, [si+8]
		mov	[bp+var_2], 0
		jmp	short loc_BAC1F

loc_BAC06:
		push	2
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	di
		push	cs
		call	near ptr TextCycler_ReleaseEntry_BA940
		add	sp, 0Ah
		inc	[bp+var_2]
		add	di, 6

loc_BAC1F:
		mov	ax, [si+6]
		cmp	ax, [bp+var_2]
		jg	short loc_BAC06
		mov	ax, [si+6]
		mov	[bp+var_4], ax
		call	CRT_Rand
		movsx	eax, ax
		movsx	edx, [bp+var_4]
		imul	eax, edx
		mov	ebx, 8000h
		cdq
		idiv	ebx
		mov	[si+0Ah], ax
		push	si
		call	sub_2703C
		add	sp, 2
		pop	di
		pop	si
		leave
		retf
sub_BABC8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BAC5A		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	ax, [si+6]
		cmp	ax, [bp+arg_4]
		jle	short loc_BACAC
		mov	ax, [bp+arg_4]
		mov	dx, 6
		imul	dx
		mov	dx, [si+8]
		add	dx, ax
		mov	di, dx
		cmp	dword ptr [di], 0
		jz	short loc_BACAC
		push	large 0FFFFFFFFh
		movsx	eax, word ptr [si+0Ch]
		push	eax
		push	0
		mov	al, [di+4]
		push	ax
		push	word ptr [di+2]
		push	word ptr [di]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+arg_2]
		call	StreamReader_ReadTyped_4148D
		add	sp, 0Eh

loc_BACAC:
		pop	di
		pop	si
		pop	bp
		retf
sub_BAC5A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BACB0		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	ax, [si+6]
		cmp	ax, [bp+arg_4]
		jle	short loc_BACFF
		mov	ax, [bp+arg_4]
		mov	dx, 6
		imul	dx
		mov	dx, [si+8]
		add	dx, ax
		mov	di, dx
		cmp	dword ptr [di], 0
		jz	short loc_BACFF
		push	0
		mov	al, [di+4]
		push	ax
		push	word ptr [di+2]
		push	word ptr [di]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		mov	bx, [bp+arg_2]
		push	large [bx+4Dh]
		push	[bp+arg_2]
		call	sub_43468
		add	sp, 0Ah

loc_BACFF:
		pop	di
		pop	si
		pop	bp
		retf
sub_BACB0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BAD03		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	[bp+arg_2]
		call	CRT_Msg_NullPtrAssign
		add	sp, 2
		push	90FFh
		call	sub_13451
		add	sp, 2
		pop	si
		pop	bp
		retf
sub_BAD03		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BAD23		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_BAD6D
		mov	dword ptr [si], 0
		mov	byte ptr [si+4], 2
		push	seg stub227
		push	offset sub_483E8
		push	19h
		push	0
		push	6
		push	word ptr [si+8]
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	0
		push	si
		push	cs
		call	near ptr sub_BAB9E
		add	sp, 4
		test	di, 1
		jz	short loc_BAD6D
		push	si
		call	sub_39C
		add	sp, 2

loc_BAD6D:
		pop	di
		pop	si
		pop	bp
		retf
sub_BAD23		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BAD71		proc far

arg_0		= word ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		mov	ax, [bp+arg_4]
		mov	es:[bx], ax
		les	bx, [bp+arg_0]
		mov	ax, [bp+arg_6]
		mov	es:[bx+2], ax
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx], 0
		jz	short loc_BADB1
		push	seg stub227
		push	offset sub_483C5
		push	11h
		les	bx, [bp+arg_0]
		push	word ptr es:[bx]
		push	6
		push	0
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		les	bx, [bp+arg_0]
		mov	es:[bx+4], ax

loc_BADB1:
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+2], 0
		jz	short loc_BADDD
		push	seg stub227
		push	offset sub_483C0
		push	11h
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+2]
		push	0Eh
		push	0
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		les	bx, [bp+arg_0]
		mov	es:[bx+6], ax

loc_BADDD:
		pop	bp
		retf
sub_BAD71		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BADDF		proc far

var_B0		= word ptr -0B0h
var_52		= word ptr -52h
var_2		= word ptr -2
arg_0		= word ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= dword ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 0B0h
		push	si
		push	di
		mov	di, [bp+arg_4]
		mov	si, [bp+arg_6]
		les	bx, [bp+arg_0]
		cmp	es:[bx], di
		ja	short loc_BADF9
		jmp	loc_BAE83

loc_BADF9:
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+4]
		push	ax
		mov	ax, di
		mov	dx, 6
		imul	dx
		pop	dx
		add	dx, ax
		mov	[bp+var_2], dx
		cmp	[bp+arg_8], 0
		jnz	short loc_BAE70
		push	ds
		push	offset aTXM
		push	ds
		push	si
		push	ds
		push	offset aTXM_1
		lea	ax, [bp+var_52]
		push	ax
		call	Path_BuildWithFolder_11166
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_52]
		push	ax
		lea	ax, [bp+var_B0]
		push	ax
		call	StreamReader_ConstructVariantC_40F6E
		add	sp, 6
		lea	ax, [bp+var_B0]
		push	ax
		call	StreamReader_ValidateState_412A1
		add	sp, 2
		or	al, al
		jz	short loc_BAE5F
		lea	ax, [bp+var_B0]
		push	ax
		push	si
		push	[bp+var_2]
		push	cs
		call	near ptr sub_BA99A
		add	sp, 6

loc_BAE5F:
		push	2
		lea	ax, [bp+var_B0]
		push	ax
		call	StreamReader_Close_410AA
		add	sp, 4
		jmp	short loc_BAE81

loc_BAE70:
		push	word ptr [bp+arg_8+2]
		push	word ptr [bp+arg_8]
		push	si
		push	[bp+var_2]
		push	cs
		call	near ptr sub_BAA20
		add	sp, 8

loc_BAE81:
		jmp	short loc_BAE8E

loc_BAE83:
		push	902Dh
		call	sub_13451
		add	sp, 2

loc_BAE8E:
		pop	di
		pop	si
		leave
		retf
sub_BADDF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BAE92		proc far
		push	bp
		mov	bp, sp
		push	902Eh
		call	sub_13451
		add	sp, 2
		pop	bp
		retf
sub_BAE92		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BAEA2		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	seg stub227
		push	offset sub_483E8
		push	19h
		push	0
		push	6
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+4]
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg stub227
		push	offset sub_48401
		push	19h
		push	0
		push	0Eh
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+6]
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		les	bx, [bp+arg_0]
		xor	ax, ax
		mov	es:[bx+6], ax
		les	bx, [bp+arg_0]
		mov	es:[bx+4], ax
		les	bx, [bp+arg_0]
		xor	ax, ax
		mov	es:[bx+2], ax
		les	bx, [bp+arg_0]
		mov	es:[bx], ax
		pop	bp
		retf
sub_BAEA2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BAEFC		proc far

arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short loc_BAF2B
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		push	cs
		call	near ptr sub_BAEA2
		add	sp, 4
		test	si, 1
		jz	short loc_BAF2B
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		call	sub_3AA
		add	sp, 4

loc_BAF2B:
		pop	si
		pop	bp
		retf
sub_BAEFC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BAF2E		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_BAF49
		push	6
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_BAF54

loc_BAF49:
		mov	dword ptr [si], 0
		mov	byte ptr [si+4], 2

loc_BAF54:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_BAF2E		endp

; START OF FUNCTION CHUNK FOR sub_BAF2E
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_BAF2E

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BAF5C		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_BAF77
		push	0Eh
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_BAF92

loc_BAF77:
		mov	dword ptr [si], 0
		mov	byte ptr [si+4], 2
		mov	word ptr [si+8], 0
		xor	ax, ax
		mov	[si+0Ch], ax
		mov	[si+0Ah], ax
		mov	[si+6], ax

loc_BAF92:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_BAF5C		endp

; START OF FUNCTION CHUNK FOR sub_BAF5C
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_BAF5C
ovr227		ends
