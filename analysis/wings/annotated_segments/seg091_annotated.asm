seg091		segment	para public 'CODE' use16
		assume cs:seg091
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3DA70		proc far

var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	[bp+arg_4]
		push	di
		call	IndexedRecordReader_AdvanceIndex_54C22
		add	sp, 4
		mov	ax, [di+6Dh]
		and	ax, 0C0h
		cmp	ax, 0C0h
		jnz	short loc_3DA9B
		mov	eax, [di+61h]
		jmp	short loc_3DA9F

loc_3DA9B:
		mov	eax, [di+71h]

loc_3DA9F:
		mov	[bp+var_4], eax
		cmp	[bp+var_4], 0
		jnz	short loc_3DAAD
		jmp	loc_3DB59

loc_3DAAD:
		cmp	byte ptr [si+3Bh], 0
		jz	short loc_3DAD3
		cmp	dword ptr [si+36h], 0
		jz	short loc_3DAD3
		push	0
		mov	al, [si+3Ah]
		push	ax
		mov	ax, si
		add	ax, 36h
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_3DAD3

loc_3DAD3:
		mov	dword ptr [si+36h], 0
		mov	byte ptr [si+3Bh], 0
		mov	dword ptr [si+3Ch], 0
		mov	eax, [bp+var_4]
		mov	[bp+var_8], eax
		push	1
		push	0
		push	3
		push	eax
		push	67B0h
		call	Memory_TypedFreeWrapper_447E1
		add	sp, 0Ch
		mov	word ptr [bp+var_C+2], dx
		mov	word ptr [bp+var_C], ax
		mov	eax, [bp+var_C]
		mov	[si+36h], eax
		mov	byte ptr [si+3Ah], 3
		mov	byte ptr [si+3Bh], 1
		mov	dword ptr [si+3Ch], 0
		mov	eax, [bp+var_8]
		mov	[si+3Ch], eax
		cmp	byte ptr [si+3Ah], 3
		jnz	short loc_3DB45
		push	0
		mov	al, [si+3Ah]
		push	ax
		push	large [si+36h]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_3DB4B

loc_3DB45:
		mov	dx, [si+38h]
		mov	ax, [si+36h]

loc_3DB4B:
		push	dx
		push	ax
		push	[bp+arg_4]
		push	di
		call	sub_54A85
		add	sp, 8

loc_3DB59:
		pop	di
		pop	si
		leave
		retf
sub_3DA70		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3DB5D		proc far

var_FC		= word ptr -0FCh
var_84		= word ptr -84h
var_23		= dword ptr -23h
var_1F		= dword ptr -1Fh
var_17		= word ptr -17h
var_13		= dword ptr -13h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= word ptr -4
var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= byte ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 0FCh
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_1], 0
		xor	di, di
		cmp	word ptr [si+34h], 0
		jnz	short loc_3DB78
		jmp	loc_3DD27

loc_3DB78:
		push	1
		push	si
		nop
		push	cs
		call	near ptr AudioQueue_OpcodeHelper_3DD2E
		add	sp, 4
		mov	ah, 0
		or	ax, ax
		jz	short loc_3DB94
		mov	al, [si+40h]
		cmp	al, [bp+arg_8]
		jb	short loc_3DB94
		jmp	loc_3DD27

loc_3DB94:
		mov	[bp+var_4], 0
		jmp	short loc_3DBE2

loc_3DB9B:
		mov	ax, [bp+var_4]
		shl	ax, 3
		mov	dx, si
		add	dx, ax
		add	dx, 4
		mov	word ptr [bp+var_8+2], dx
		push	[bp+arg_2]
		mov	bx, word ptr [bp+var_8+2]
		push	word ptr [bx+2]
		call	CRT_Stricmp
		add	sp, 4
		or	ax, ax
		jnz	short loc_3DBDF
		mov	bx, word ptr [bp+var_8+2]
		mov	ax, [bx+4]
		cmp	ax, [bp+arg_4]
		jnz	short loc_3DBDF
		mov	ax, [bx+6]
		cmp	ax, [bp+arg_6]
		jle	short loc_3DBDF
		mov	ax, [bp+arg_6]
		imul	ax, ax, 0Ah
		mov	di, [bx]
		add	di, ax
		jmp	short loc_3DBEA

loc_3DBDF:
		inc	[bp+var_4]

loc_3DBE2:
		mov	ax, [si+41h]
		cmp	ax, [bp+var_4]
		jg	short loc_3DB9B

loc_3DBEA:
		or	di, di
		jz	short loc_3DBF1
		jmp	loc_3DCBF

loc_3DBF1:
		push	ds
		push	[bp+arg_2]
		call	Config_LoadOrCreate
		add	sp, 4
		or	al, al
		jnz	short loc_3DC04
		jmp	loc_3DCBF

loc_3DC04:
		lea	ax, [bp+var_84]
		push	ax
		call	IndexedRecordReader_ConstructVariantA_54888
		pop	cx
		push	1
		push	[bp+arg_2]
		lea	ax, [bp+var_84]
		push	ax
		mov	bx, [bp+var_84]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	[bp+arg_4]
		lea	ax, [bp+var_84]
		push	ax
		call	IndexedRecordReader_AdvanceIndex_54C22
		add	sp, 4
		mov	eax, [bp+var_1F]
		mov	[bp+var_8], eax
		mov	ax, [bp+var_17]
		and	ax, 0C0h
		cmp	ax, 0C0h
		jnz	short loc_3DC4C
		mov	eax, [bp+var_23]
		jmp	short loc_3DC50

loc_3DC4C:
		mov	eax, [bp+var_13]

loc_3DC50:
		mov	edx, [bp+var_8]
		add	edx, eax
		mov	[bp+var_C], edx
		mov	eax, [bp+var_8]
		cmp	eax, [bp+var_C]
		jz	short loc_3DCAB
		lea	ax, [bp+var_FC]
		push	ax
		call	IndexedRecordReader_ConstructVariantA_54888
		pop	cx
		push	0
		push	large [bp+var_C]
		push	large [bp+var_8]
		lea	ax, [bp+var_84]
		push	ax
		lea	ax, [bp+var_FC]
		push	ax
		call	sub_5252A
		add	sp, 0Eh
		push	[bp+arg_6]
		lea	ax, [bp+var_FC]
		push	ax
		push	si
		push	cs
		call	near ptr sub_3DA70
		add	sp, 6
		push	2
		lea	ax, [bp+var_FC]
		push	ax
		call	IndexedRecordReader_Destruct_5483E
		add	sp, 4

loc_3DCAB:
		mov	di, si
		add	di, 36h
		push	2
		lea	ax, [bp+var_84]
		push	ax
		call	IndexedRecordReader_Destruct_5483E
		add	sp, 4

loc_3DCBF:
		or	di, di
		jz	short loc_3DD27
		cmp	dword ptr [di], 0
		jz	short loc_3DD27
		cmp	byte ptr [di+4], 3
		jnz	short loc_3DCE5
		push	0
		mov	al, [di+4]
		push	ax
		push	large [di]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_3DCEA

loc_3DCE5:
		mov	dx, [di+2]
		mov	ax, [di]

loc_3DCEA:
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		cmp	[bp+var_8], 0
		jz	short loc_3DD27
		mov	[si+43h], di
		mov	bx, [si+34h]
		mov	di, [bx+4]
		push	0FFFFh
		push	dx
		push	ax
		push	di
		call	sub_9C3F
		add	sp, 8
		push	0
		push	di
		call	sub_9C51
		add	sp, 4
		mov	[bp+var_1], 1
		mov	al, [bp+arg_8]
		mov	[si+40h], al
		mov	word ptr [si+49h], 0

loc_3DD27:
		mov	al, [bp+var_1]
		pop	di
		pop	si
		leave
		retf
sub_3DB5D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à AudioQueue_OpcodeHelper_5E9BC (sub_5E9BC de
; PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
; Reprise de STRIKE.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à AudioQueue_OpcodeHelper_ABDAF (sub_ABDAF de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; appelle AIL_VOC_playback_status_6035A (seg161).
; ==============================================================================================
AudioQueue_OpcodeHelper_3DD2E		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	dl, 0
		cmp	word ptr [si+34h], 0
		jz	short loc_3DD66
		mov	bx, [si+34h]
		push	word ptr [bx+4]
		call	sub_9C4B
		pop	cx
		mov	[bp+var_2], ax
		cmp	[bp+var_2], 2
		jnz	short loc_3DD62
		mov	al, [si+40h]
		cmp	al, [bp+arg_2]
		jb	short loc_3DD62
		mov	ax, 1
		jmp	short loc_3DD64

loc_3DD62:
		xor	ax, ax

loc_3DD64:
		mov	dl, al

loc_3DD66:
		mov	al, dl
		pop	si
		leave
		retf
AudioQueue_OpcodeHelper_3DD2E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3DD6B		proc far

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	word ptr [si+34h], 0
		jnz	short loc_3DD7F
		jmp	loc_3DE2C

loc_3DD7F:
		mov	bx, [si+34h]
		push	word ptr [bx+4]
		call	sub_9C4B
		pop	cx
		mov	[bp+var_2], ax
		cmp	[bp+var_2], 2
		jnz	short loc_3DD97
		jmp	loc_3DE2C

loc_3DD97:
		cmp	word ptr [si+49h], 0
		jz	short loc_3DDE9
		mov	bx, [si+34h]
		mov	di, [bx+4]
		push	0FFFFh
		mov	bx, [si+43h]
		cmp	byte ptr [bx+4], 3
		jnz	short loc_3DDC6
		push	0
		mov	al, [bx+4]
		push	ax
		push	word ptr [bx+2]
		push	word ptr [bx]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_3DDCE

loc_3DDC6:
		mov	bx, [si+43h]
		mov	dx, [bx+2]
		mov	ax, [bx]

loc_3DDCE:
		push	dx
		push	ax
		push	di
		call	sub_9C3F
		add	sp, 8
		push	0
		push	di
		call	sub_9C51
		add	sp, 4
		dec	word ptr [si+49h]
		jmp	short loc_3DE2C

loc_3DDE9:
		mov	word ptr [si+43h], 0
		cmp	byte ptr [si+3Bh], 0
		jz	short loc_3DE14
		cmp	dword ptr [si+36h], 0
		jz	short loc_3DE14
		push	0
		mov	al, [si+3Ah]
		push	ax
		mov	ax, si
		add	ax, 36h
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_3DE14

loc_3DE14:
		mov	dword ptr [si+36h], 0
		mov	byte ptr [si+3Bh], 0
		mov	dword ptr [si+3Ch], 0
		mov	byte ptr [si+40h], 0

loc_3DE2C:
		pop	di
		pop	si
		leave
		retf
sub_3DD6B		endp
seg091		ends
