ovr244		segment	para public 'OVERLAY' use16
		assume cs:ovr244
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; AudioQueue_Helper2_AB860 (sub_AB860 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants
; et contexte à revérifier ici. — far, aucun appel externe visible (21 lignes).
; ==============================================================================================
AudioQueue_Helper2_C7F50	proc far		; CODE XREF: sub_42F35J

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[si+34h], ax
		mov	byte ptr [si+40h], 0
		mov	word ptr [si+41h], 0
		mov	word ptr [si+49h], 0
		mov	word ptr [si+43h], 0
		pop	si
		pop	bp
		retf
AudioQueue_Helper2_C7F50	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C7F73	proc far		; CODE XREF: sub_42F3FJ

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+34h], 0
		jz	short loc_C7F90
		mov	bx, [si+34h]
		push	word ptr [bx+4]
		call	sub_30BDC
		add	sp, 2
		jmp	short $+2

loc_C7F90:				; CODE XREF: sub_C7F73+Bj
		pop	si
		pop	bp
		retf
sub_C7F73	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C7F93	proc far		; CODE XREF: sub_42F30J sub_C80EC+B1p

var_1C		= dword	ptr -1Ch
var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 1Ch
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	bx, [bp+arg_2]
		mov	ax, [bx+5Dh]
		mov	[bp+var_2], ax
		push	seg stub188
		push	offset Stub_ResourceHandle_Construct_42095
		push	11h
		push	[bp+var_2]
		push	0Ah
		push	0
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		mov	[bp+var_4], ax
		mov	[bp+var_6], 0
		jmp	loc_C8087
; ���������������������������������������������������������������������������

loc_C7FC9:				; CODE XREF: sub_C7F93+FCj
		push	[bp+var_6]
		push	[bp+arg_2]
		call	IndexedRecordReader_AdvanceIndex_3D69C
		add	sp, 4
		mov	bx, [bp+arg_2]
		mov	ax, [bx+6Dh]
		and	ax, 0C0h
		cmp	ax, 0C0h ; '�'
		jnz	short loc_C7FEE
		mov	bx, [bp+arg_2]
		mov	eax, [bx+61h]
		jmp	short loc_C7FF5
; ���������������������������������������������������������������������������

loc_C7FEE:				; CODE XREF: sub_C7F93+50j
		mov	bx, [bp+arg_2]
		mov	eax, [bx+71h]

loc_C7FF5:				; CODE XREF: sub_C7F93+59j
		mov	[bp+var_14], eax
		cmp	[bp+var_14], 0
		jnz	short loc_C8003
		jmp	loc_C8084
; ���������������������������������������������������������������������������

loc_C8003:				; CODE XREF: sub_C7F93+6Bj
		mov	ax, [bp+var_6]
		mov	dx, 0Ah
		imul	dx
		mov	dx, [bp+var_4]
		add	dx, ax
		mov	di, dx
		mov	eax, [bp+var_14]
		mov	[bp+var_18], eax
		push	0
		push	0
		push	3
		push	large [bp+var_18]
		push	661Ah
		call	Memory_TypedFreeWrapper_2B7E1
		add	sp, 0Ch
		mov	word ptr [bp+var_1C+2],	dx
		mov	word ptr [bp+var_1C], ax
		mov	eax, [bp+var_1C]
		mov	[di], eax
		mov	byte ptr [di+4], 3
		mov	byte ptr [di+5], 1
		mov	dword ptr [di+6], 0
		mov	eax, [bp+var_18]
		mov	[di+6],	eax
		cmp	dword ptr [di],	0
		jz	short loc_C8082
		push	0
		mov	al, [di+4]
		push	ax
		push	word ptr [di+2]
		push	word ptr [di]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_6]
		push	[bp+arg_2]
		call	IndexedRecordReader_SeekToIndex_3D4DD
		add	sp, 8
		jmp	short loc_C8084
; ���������������������������������������������������������������������������

loc_C8082:				; CODE XREF: sub_C7F93+C5j
		jmp	short loc_C8092
; ���������������������������������������������������������������������������

loc_C8084:				; CODE XREF: sub_C7F93+6Dj
					; sub_C7F93+EDj
		inc	[bp+var_6]

loc_C8087:				; CODE XREF: sub_C7F93+33j
		mov	ax, [bp+var_6]
		cmp	ax, [bp+var_2]
		jge	short loc_C8092
		jmp	loc_C7FC9
; ���������������������������������������������������������������������������

loc_C8092:				; CODE XREF: sub_C7F93:loc_C8082j
					; sub_C7F93+FAj
		mov	ax, [si+41h]
		inc	word ptr [si+41h]
		shl	ax, 3
		mov	dx, si
		add	dx, ax
		add	dx, 4
		mov	[bp+var_8], dx
		mov	ax, [bp+var_4]
		mov	[bp+var_A], ax
		mov	ax, [si+45h]
		mov	[bp+var_C], ax
		mov	ax, [si+47h]
		mov	[bp+var_E], ax
		mov	ax, [bp+var_2]
		mov	[bp+var_10], ax
		mov	bx, [bp+var_8]
		mov	ax, [bp+var_A]
		mov	[bx], ax
		push	[bp+var_C]
		call	CRT_Strdup
		add	sp, 2
		mov	bx, [bp+var_8]
		mov	[bx+2],	ax
		mov	bx, [bp+var_8]
		mov	ax, [bp+var_E]
		mov	[bx+4],	ax
		mov	bx, [bp+var_8]
		mov	ax, [bp+var_10]
		mov	[bx+6],	ax
		pop	di
		pop	si
		leave
		retf
sub_C7F93	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C80EC	proc far		; CODE XREF: sub_42F44J

var_F8		= word ptr -0F8h
var_80		= word ptr -80h
var_1F		= dword	ptr -1Fh
var_1B		= dword	ptr -1Bh
var_13		= word ptr -13h
var_F		= dword	ptr -0Fh
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0F8h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		cmp	word ptr [si+41h], 6
		jl	short loc_C8104
		jmp	loc_C81C0
; ���������������������������������������������������������������������������

loc_C8104:				; CODE XREF: sub_C80EC+13j
		push	ds
		push	di
		call	sub_6734
		add	sp, 4
		or	al, al
		jnz	short loc_C8115
		jmp	loc_C81C0
; ���������������������������������������������������������������������������

loc_C8115:				; CODE XREF: sub_C80EC+24j
		mov	[si+45h], di
		mov	ax, [bp+arg_4]
		mov	[si+47h], ax
		push	1
		push	di
		lea	ax, [bp+var_80]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_3D2BA
		add	sp, 6
		push	[bp+arg_4]
		lea	ax, [bp+var_80]
		push	ax
		call	IndexedRecordReader_AdvanceIndex_3D69C
		add	sp, 4
		mov	eax, [bp+var_1B]
		mov	[bp+var_4], eax
		mov	ax, [bp+var_13]
		and	ax, 0C0h
		cmp	ax, 0C0h ; '�'
		jnz	short loc_C8155
		mov	eax, [bp+var_1F]
		jmp	short loc_C8159
; ���������������������������������������������������������������������������

loc_C8155:				; CODE XREF: sub_C80EC+61j
		mov	eax, [bp+var_F]

loc_C8159:				; CODE XREF: sub_C80EC+67j
		mov	edx, [bp+var_4]
		add	edx, eax
		mov	[bp+var_8], edx
		mov	eax, [bp+var_4]
		cmp	eax, [bp+var_8]
		jz	short loc_C81B2
		lea	ax, [bp+var_F8]
		push	ax
		call	IndexedRecordReader_ConstructVariantA_3D28A
		add	sp, 2
		push	0
		push	large [bp+var_8]
		push	large [bp+var_4]
		lea	ax, [bp+var_80]
		push	ax
		lea	ax, [bp+var_F8]
		push	ax
		call	StreamReader_ConstructAndBind_3B393
		add	sp, 0Eh
		lea	ax, [bp+var_F8]
		push	ax
		push	si
		push	cs
		call	near ptr sub_C7F93
		add	sp, 4
		push	2
		lea	ax, [bp+var_F8]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4

loc_C81B2:				; CODE XREF: sub_C80EC+80j
		push	2
		lea	ax, [bp+var_80]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4

loc_C81C0:				; CODE XREF: sub_C80EC+15j
					; sub_C80EC+26j
		pop	di
		pop	si
		leave
		retf
sub_C80EC	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C81C4	proc far		; CODE XREF: sub_42F3AJ

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	byte_46896, 0
		jz	short loc_C8222
		cmp	word ptr [si+34h], 0
		jz	short loc_C821D
		mov	bx, [si+34h]
		push	word ptr [bx+4]
		call	sub_30BDC
		add	sp, 2
		xor	di, di
		jmp	short loc_C8218
; ���������������������������������������������������������������������������

loc_C81EB:				; CODE XREF: sub_C81C4+57j
		push	seg stub188
		push	offset Stub_ResourceHandle_Destruct_42090
		push	19h
		push	0
		push	0Ah
		mov	bx, di
		shl	bx, 3
		push	word ptr [bx+si+4]
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		mov	bx, di
		shl	bx, 3
		push	word ptr [bx+si+6]
		call	Heap_FreeAndCoalesce_2C3FC
		add	sp, 2
		inc	di

loc_C8218:				; CODE XREF: sub_C81C4+25j
		cmp	[si+41h], di
		jg	short loc_C81EB

loc_C821D:				; CODE XREF: sub_C81C4+13j
		mov	byte_46896, 0

loc_C8222:				; CODE XREF: sub_C81C4+Dj
		pop	di
		pop	si
		pop	bp
		retf
sub_C81C4	endp

ovr244		ends
