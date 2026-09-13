seg104		segment	byte public 'CODE' use16
		assume cs:seg104
		;org 8
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,14L — initialise deux champs par défaut (+0x37=0x14, +0x39=0) : valeurs par défaut du
; chunk INFO IFF (probable rayon de collision par défaut).
; ==============================================================================================
IFF_InfoChunkDefaults	proc far		; CODE XREF: IFF_LoadInfoChunk+Cp

arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp

loc_4B8FB:				; DATA XREF: seg216:0406o
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx+37h], 14h
		mov	byte ptr es:[bx+39h], 0
		pop	bp
		retf
IFF_InfoChunkDefaults	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,52L — recherche le chunk IFF 'INFO' (0x4F464E49, magic little-endian) et résout ses
; champs (rayon +0x37, flags +0x39/+0x3A) : chargeur du chunk IFF INFO (métadonnées de modèle
; : rayon de collision, flags), appelé depuis le chargeur IFF principal.
; ==============================================================================================
IFF_LoadInfoChunk	proc far		; CODE XREF: IFF_LoadModelMain+D97P

arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_4]
		push	large [bp+arg_0]
		push	cs
		call	near ptr IFF_InfoChunkDefaults
		add	sp, 4
		push	0
		push	large 4F464E49h

loc_4B925:
		push	si
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_4B963
		push	si

loc_4B933:
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		les	bx, [bp+arg_0]
		mov	es:[bx+37h], ax
		push	si
		call	ResourceRecord_ReadFinalField_64B51
		pop	cx
		les	bx, [bp+arg_0]
		mov	es:[bx+39h], al
		cmp	byte ptr es:[bx+39h], 0
		jz	short loc_4B963
		push	si
		call	ResourceRecord_ReadFinalField_64B51
		pop	cx
		les	bx, [bp+arg_0]
		mov	es:[bx+3Ah], al

loc_4B963:				; CODE XREF: IFF_LoadInfoChunk+25j
					; IFF_LoadInfoChunk+48j
		push	si
		push	large [bp+arg_0]
		call	VROOMM_StubThunk_6C1C0
		add	sp, 6
		pop	si
		pop	bp
		retf
IFF_LoadInfoChunk	endp

; ���������������������������������������������������������������������������

loc_4B973:				; DATA XREF: seg339:off_6F480o
		push	bp
		mov	bp, sp
		sub	sp, 0Eh
		push	si
		mov	eax, [bp+6]
		mov	[bp-4],	eax
		push	33h ; '3'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_4B9FB
		mov	word ptr [si], 10E4h
		mov	dword ptr [si+6], 0
		mov	word ptr [si+2], 0
		mov	byte ptr [si+4], 0
		mov	byte ptr [si+5], 0
		mov	word ptr [si], 1ADCh
		push	ax
		call	Debris_BodyReset

loc_4B9B3:
		pop	cx
		mov	word ptr [si+2Ch], 0
		mov	word ptr [si], 1BDEh
		push	large dword ptr	[bp-4]
		push	si
		call	Camera_AttachSubcomponent
		add	sp, 6
		mov	word ptr [si], 2F9Eh
		mov	dword ptr [bp-8], 0
		mov	eax, [bp-8]
		mov	[si+2Eh], eax
		les	bx, [si+0Eh]
		push	word ptr es:[bx+37h]
		mov	ax, si
		add	ax, 2Eh	; '.'
		push	ax
		call	Timer_SetRelativeFrames_4F9BB
		add	sp, 4
		or	byte ptr [si+4], 1
		mov	ax, si
		jmp	short loc_4B9FD
; ���������������������������������������������������������������������������

loc_4B9FB:				; CODE XREF: seg104:009Ej
		mov	ax, si

loc_4B9FD:				; CODE XREF: seg104:0109j
		mov	si, ax
		or	si, si
		jnz	short loc_4BA0C
		push	0B003h
		call	VROOMM_StubThunk_6B70F
		pop	cx

loc_4BA0C:				; CODE XREF: seg104:0111j
		mov	ax, [bp+8]
		mov	dx, [bp+6]
		add	dx, 2Bh	; '+'
		mov	[bp-0Ah], ax
		mov	[bp-0Ch], dx
		mov	eax, [bp-0Ch]
		mov	[si+6],	eax
		push	si

loc_4BA24:
		les	bx, [bp+6]
		push	word ptr es:[bx+35h]
		mov	bx, es:[bx+35h]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 4
		mov	[bp-0Eh], ax
		mov	[si+2Ch], ax
		mov	ax, si
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_4BA42:				; DATA XREF: seg339:23D4o
		push	bp
		mov	bp, sp
		mov	al, 0Bh
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_4BA49:				; DATA XREF: seg339:off_6F47Co
		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+0Ah]
		cmp	dword ptr [bp+6], 0
		jz	short loc_4BA91
		les	bx, [bp+6]
		mov	word ptr es:[bx], 23CCh
		push	0
		push	word ptr [bp+8]
		push	bx
		call	Camera_DestructSimple
		add	sp, 6
		test	si, 1
		jz	short loc_4BA91
		mov	eax, [bp+6]
		mov	[bp-4],	eax
		push	0
		push	2
		lea	ax, [bp-4]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8

loc_4BA91:				; CODE XREF: seg104:0168j seg104:0184j
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_4BA94:				; DATA XREF: seg339:off_7005Eo
		push	bp
		mov	bp, sp
		sub	sp, 78h
		push	si
		push	di
		mov	si, [bp+6]
		mov	ax, si
		add	ax, 2Eh	; '.'
		push	ax
		call	Timer_Tick_4F9E6
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_4BAC3
		les	bx, [si+0Ah]
		mov	al, es:[bx+8]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_4BAC3
		mov	al, 0
		jmp	loc_4BC98
; ���������������������������������������������������������������������������

loc_4BAC3:				; CODE XREF: seg104:01BFj seg104:01CCj
		push	si
		call	Camera_NotifyFollowTarget
		pop	cx
		or	al, al
		jnz	short loc_4BAD1
		jmp	loc_4BC96
; ���������������������������������������������������������������������������

loc_4BAD1:				; CODE XREF: seg104:01DCj
		les	bx, [si+0Ah]
		cmp	byte ptr es:[bx+8], 0
		jnz	short loc_4BADE
		jmp	loc_4BC92
; ���������������������������������������������������������������������������

loc_4BADE:				; CODE XREF: seg104:01E9j
		les	bx, [si+0Eh]
		cmp	byte ptr es:[bx+39h], 0
		jnz	short loc_4BAEB
		jmp	loc_4BC92
; ���������������������������������������������������������������������������

loc_4BAEB:				; CODE XREF: seg104:01F6j
		cmp	word_70483, 0
		jnz	short loc_4BAF5
		jmp	loc_4BC92
; ���������������������������������������������������������������������������

loc_4BAF5:				; CODE XREF: seg104:0200j
		cmp	word ptr [si+2Ch], 0
		jz	short loc_4BB76
		mov	di, [si+2Ch]
		add	di, 8
		mov	eax, [di]
		mov	edx, dword_7045E
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-4],	eax
		mov	eax, [bp-4]
		mov	[bp-8],	eax
		mov	eax, [di+4]

loc_4BB21:
		mov	edx, dword_7045E
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-0Ch], eax
		mov	eax, [bp-0Ch]
		mov	[bp-10h], eax
		mov	eax, [di+8]
		mov	edx, dword_7045E
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-14h], eax
		mov	eax, [bp-14h]
		mov	[bp-18h], eax
		mov	eax, [bp-8]
		mov	[bp-24h], eax
		mov	eax, [bp-10h]
		mov	[bp-20h], eax
		mov	eax, [bp-18h]
		mov	[bp-1Ch], eax
		mov	dx, ss
		lea	ax, [bp-24h]
		jmp	short loc_4BB93
; ���������������������������������������������������������������������������

loc_4BB76:				; CODE XREF: seg104:0209j
		mov	eax, dword_707F8
		mov	[bp-24h], eax
		mov	eax, dword_707FC
		mov	[bp-20h], eax
		mov	eax, dword_70800
		mov	[bp-1Ch], eax
		mov	dx, ss
		lea	ax, [bp-24h]

loc_4BB93:				; CODE XREF: seg104:0284j
		mov	eax, [bp-24h]
		mov	[bp-30h], eax
		mov	eax, [bp-20h]

loc_4BB9F:
		mov	[bp-2Ch], eax

loc_4BBA3:
		mov	eax, [bp-1Ch]

loc_4BBA7:
		mov	[bp-28h], eax
		mov	ax, si

loc_4BBAD:
		add	ax, 20h	; ' '
		push	ax
		lea	ax, [bp-30h]

loc_4BBB4:
		push	ax
		call	UI_ApplyLineOfSightCheck_55A9E
		add	sp, 4
		mov	di, si
		add	di, 12h
		mov	eax, [di]
		sub	eax, [bp-30h]
		mov	[bp-54h], eax
		mov	eax, [di+4]
		sub	eax, [bp-2Ch]
		mov	[bp-50h], eax
		mov	eax, [di+8]
		sub	eax, [bp-28h]
		mov	[bp-4Ch], eax
		mov	eax, [bp-54h]
		mov	[bp-60h], eax
		mov	eax, [bp-50h]
		mov	[bp-5Ch], eax
		mov	eax, [bp-4Ch]
		mov	[bp-58h], eax
		mov	eax, [bp-60h]
		mov	[bp-48h], eax
		mov	eax, [bp-5Ch]
		mov	[bp-44h], eax
		mov	eax, [bp-58h]
		mov	[bp-40h], eax
		mov	eax, [bp-48h]
		add	eax, [bp-24h]
		mov	[bp-6Ch], eax
		mov	eax, [bp-44h]
		add	eax, [bp-20h]
		mov	[bp-68h], eax
		mov	eax, [bp-40h]
		add	eax, [bp-1Ch]
		mov	[bp-64h], eax
		mov	eax, [bp-6Ch]
		mov	[bp-78h], eax
		mov	eax, [bp-68h]
		mov	[bp-74h], eax
		mov	eax, [bp-64h]
		mov	[bp-70h], eax
		mov	eax, [bp-78h]
		mov	[bp-3Ch], eax
		mov	eax, [bp-74h]
		mov	[bp-38h], eax
		mov	eax, [bp-70h]
		mov	[bp-34h], eax
		sub	sp, 4
		mov	eax, dword_70458
		mov	[bp-80h], eax
		lea	ax, [bp-48h]
		push	ax
		lea	ax, [bp-3Ch]
		push	ax
		les	bx, [si+0Eh]
		mov	al, es:[bx+3Ah]
		mov	ah, 0
		push	ax
		push	word_70483
		call	Elements_SpawnAlongSegment_4D1C9
		add	sp, 0Ch

loc_4BC92:				; CODE XREF: seg104:01EBj seg104:01F8j ...
		mov	al, 1
		jmp	short loc_4BC98
; ���������������������������������������������������������������������������

loc_4BC96:				; CODE XREF: seg104:01DEj
		mov	al, 0

loc_4BC98:				; CODE XREF: seg104:01D0j seg104:03A4j
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_4BC9C:				; DATA XREF: seg339:off_70082o
		push	bp
		mov	bp, sp

loc_4BC9F:
		mov	ax, [bp+6]
		mov	al, 0Bh
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_4BCA6:				; DATA XREF: seg339:off_70066o
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		or	si, si
		jz	short loc_4BCD1
		mov	word ptr [si], 2F9Eh
		push	0
		push	si
		call	Camera_DestructFollow
		add	sp, 4
		test	di, 1
		jz	short loc_4BCD1
		push	si
		call	CRT_FreeNear_Wrap

loc_4BCD0:
		pop	cx

loc_4BCD1:				; CODE XREF: seg104:03C3j seg104:03D8j
		pop	di
		pop	si
		pop	bp
		retf
seg104		ends
