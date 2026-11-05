ovr291		segment	para public 'OVERLAY' use16
		assume cs:ovr291
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à TerrainTile_Allocate_9A8F0 (sub_9A8F0 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, alloue
; (CRT_Malloc16_Retry, 38 lignes).
; ==============================================================================================
TerrainTile_Allocate_A8F50		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_A8F69
		push	0Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_A8F80

loc_A8F69:
		mov	word ptr [si], 145Ch
		mov	word ptr [si], 1504h
		mov	word ptr [si+6], 0
		mov	word ptr [si+0Ah], 0
		mov	word ptr [si+4], 0

loc_A8F80:
		mov	ax, si
		pop	si
		pop	bp
		retf
TerrainTile_Allocate_A8F50		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à TerrainTile_ReleaseSimple_9A925 (sub_9A925 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; appelle TerrainTile_DestructSimple.
; ==============================================================================================
TerrainTile_ReleaseSimple_A8F85		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_A8FB6
		mov	word ptr [si], 1504h
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		pop	cx
		push	0
		push	si
		call	sub_320B9
		add	sp, 4
		test	di, 1
		jz	short loc_A8FB6
		push	si
		call	sub_3B2
		pop	cx

loc_A8FB6:
		pop	di
		pop	si
		pop	bp
		retf
TerrainTile_ReleaseSimple_A8F85		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A8FBA		proc far

var_76		= dword ptr -76h
var_72		= dword ptr -72h
var_6E		= dword ptr -6Eh
var_66		= word ptr -66h
var_59		= word ptr -59h
var_50		= dword ptr -50h
var_4C		= dword ptr -4Ch
var_48		= dword ptr -48h
var_44		= dword ptr -44h
var_40		= dword ptr -40h
var_3C		= dword ptr -3Ch
var_38		= dword ptr -38h
var_34		= dword ptr -34h
var_30		= dword ptr -30h
var_2C		= dword ptr -2Ch
var_28		= dword ptr -28h
var_24		= dword ptr -24h
var_20		= word ptr -20h
var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_1A		= dword ptr -1Ah
var_16		= dword ptr -16h
var_12		= dword ptr -12h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 66h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	word ptr [si+6], 0
		mov	word ptr [si+0Ah], 0
		mov	word ptr [si+4], 0
		mov	ax, [bp+arg_6]
		mov	[si+2], ax
		mov	ax, [bp+arg_4]
		mov	[si+8], ax
		push	ax
		push	di
		call	sub_7844
		add	sp, 4
		mov	ax, [di+6Dh]
		and	ax, 0C0h
		cmp	ax, 0C0h
		jnz	short loc_A8FFE
		mov	eax, [di+61h]
		jmp	short loc_A9002

loc_A8FFE:
		mov	eax, [di+71h]

loc_A9002:
		cmp	eax, 0
		jg	short loc_A900B
		jmp	loc_A9260

loc_A900B:
		push	[bp+arg_4]
		push	1514h
		lea	ax, [bp+var_A]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 6
		push	0Fh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	[bp+var_C], ax
		or	ax, ax
		jz	short loc_A905D
		push	ax
		call	String_ConstructEmpty
		pop	cx
		push	8
		lea	ax, [bp+var_A]
		push	ax
		push	[bp+var_C]
		call	CRT_Strncpy_Pad
		add	sp, 6
		mov	bx, [bp+var_C]
		mov	byte ptr [bx+8], 0
		mov	word ptr [bx+9], 0
		xor	ax, ax
		mov	[bx+0Dh], ax
		mov	[bx+0Bh], ax
		mov	ax, [bp+var_C]
		jmp	short loc_A9060

loc_A905D:
		mov	ax, [bp+var_C]

loc_A9060:
		mov	[si+6], ax
		push	di
		call	StreamReader_GetCapacity_6C5C7
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_12], eax
		push	large [di+65h]
		push	di
		call	StreamReader_SeekVariant_6C348
		add	sp, 6
		push	large 0FFFFFFFFh
		push	large 2
		push	ds
		mov	ax, si
		add	ax, 4
		push	ax
		push	di
		call	StreamReader_ReadTyped_6C4F3
		add	sp, 0Eh
		mov	ax, [si+4]
		shl	ax, 1
		push	ax
		call	CRT_Malloc16_Retry
		pop	cx
		mov	[si+0Ah], ax
		cmp	word ptr [si+0Ah], 0
		jnz	short loc_A90B3
		push	0E001h
		call	sub_1DDFE
		pop	cx

loc_A90B3:
		mov	ax, [bp+arg_4]
		shl	ax, 2
		les	bx, word ptr dword_77C30
		add	bx, ax
		mov	eax, es:[bx]
		mov	[bp+var_16], eax
		mov	[bp+var_1A], 1
		mov	ax, [si+0Ah]
		mov	[bp+var_1C], ax
		mov	[bp+var_1E], 0
		jmp	loc_A9238

loc_A90DD:
		push	large 0FFFFFFFFh
		push	large 46h
		push	ss
		lea	ax, [bp+var_66]
		push	ax
		push	di
		call	StreamReader_ReadTyped_6C4F3
		add	sp, 0Eh
		mov	eax, [bp+var_1A]
		test	[bp+var_16], eax
		jz	short loc_A9114
		push	1
		push	1
		push	ss
		lea	ax, [bp+var_59]
		push	ax
		push	65D0h
		call	sub_379D2
		add	sp, 0Ah
		mov	[bp+var_E], ax
		jmp	short loc_A912B

loc_A9114:
		push	1
		push	1
		push	ss
		lea	ax, [bp+var_66]
		push	ax
		push	65D0h
		call	sub_379D2
		add	sp, 0Ah
		mov	[bp+var_E], ax

loc_A912B:
		cmp	[bp+var_E], 0
		jnz	short loc_A9134
		jmp	loc_A921E

loc_A9134:
		sub	sp, 4
		mov	eax, [bp+var_48]
		mov	[bp+var_6E], eax
		sub	sp, 4
		mov	eax, [bp+var_4C]
		mov	[bp+var_72], eax
		sub	sp, 4
		mov	eax, [bp+var_50]
		mov	[bp+var_76], eax
		mov	ax, [bp+var_E]
		add	ax, 12h
		push	ax
		call	Utility_Helper_57C2E
		add	sp, 0Eh
		sub	sp, 4
		mov	eax, [bp+var_3C]
		mov	[bp+var_6E], eax
		sub	sp, 4
		mov	eax, [bp+var_40]
		mov	[bp+var_72], eax
		sub	sp, 4
		mov	eax, [bp+var_44]
		mov	[bp+var_76], eax
		push	[bp+var_E]
		mov	bx, [bp+var_E]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		call	Utility_Helper_57C2E
		add	sp, 0Eh
		sub	sp, 4
		mov	eax, [bp+var_30]
		mov	[bp+var_6E], eax
		sub	sp, 4
		mov	eax, [bp+var_34]
		mov	[bp+var_72], eax
		sub	sp, 4
		mov	eax, [bp+var_38]
		mov	[bp+var_76], eax
		push	[bp+var_E]
		mov	bx, [bp+var_E]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		push	ax
		call	Utility_Helper_57C2E
		add	sp, 0Eh
		sub	sp, 4
		mov	eax, [bp+var_24]
		mov	[bp+var_6E], eax
		sub	sp, 4
		mov	eax, [bp+var_28]
		mov	[bp+var_72], eax
		sub	sp, 4
		mov	eax, [bp+var_2C]
		mov	[bp+var_76], eax
		push	[bp+var_E]
		mov	bx, [bp+var_E]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 18h
		push	ax
		call	Utility_Helper_57C2E
		add	sp, 0Eh
		mov	ax, [bp+var_E]
		mov	[bp+var_20], ax
		push	ax
		push	word ptr [si+6]
		call	sub_1EFF9
		add	sp, 4

loc_A921E:
		mov	bx, [bp+var_1C]
		mov	ax, [bp+var_E]
		mov	[bx], ax
		mov	eax, [bp+var_1A]
		shl	eax, 1
		mov	[bp+var_1A], eax
		inc	[bp+var_1E]
		add	[bp+var_1C], 2

loc_A9238:
		mov	ax, [si+4]
		cmp	ax, [bp+var_1E]
		jle	short loc_A9243
		jmp	loc_A90DD

loc_A9243:
		push	large [bp+var_12]
		push	di
		call	StreamReader_SeekVariant_6C348
		add	sp, 6
		push	word ptr [si+6]
		push	67ADh
		call	Container_Append
		add	sp, 4
		jmp	short loc_A926A

loc_A9260:
		mov	word ptr [si+4], 0
		mov	word ptr [si+6], 0

loc_A926A:
		pop	di
		pop	si
		leave
		retf
sub_A8FBA		endp
ovr291		ends
