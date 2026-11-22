ovr223		segment	para public 'OVERLAY' use16
		assume cs:ovr223
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à TextCycler_ReleaseEntry_A7060 (sub_A7060 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; libère une entrée (Memory_TypedFreeWrapperC_5C6F3, seg131).
; ==============================================================================================
TextCycler_ReleaseEntry_C3080	proc far		; CODE XREF: sub_42A9AJ sub_C30DA+3Fp	...

var_4		= dword	ptr -4
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
		cmp	byte_443AF, 0
		jz	short loc_C30A3
		mov	[bp+arg_8], 3

loc_C30A3:				; CODE XREF: TextCycler_ReleaseEntry_C3080+1Dj
		push	1
		push	0
		mov	al, [bp+arg_8]
		push	ax
		push	large [bp+var_4]
		push	661Ah
		call	Memory_TypedFreeWrapper_2B7E1
		add	sp, 0Ch
		mov	[si+2],	dx
		mov	[si], ax
		mov	al, [bp+arg_8]
		mov	[si+4],	al
		mov	al, byte ptr [bp+arg_4]
		mov	[si+5],	al
		mov	eax, [bp+var_4]
		shld	edx, eax, 10h
		pop	si
		leave
		retf
TextCycler_ReleaseEntry_C3080	endp

; ���������������������������������������������������������������������������
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C30DA	proc far		; CODE XREF: sub_42AA4J sub_C3170+3Dp	...

var_8		= dword	ptr -8
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
		mov	ax, 1209h
		mov	bx, 5650h
		xor	cx, cx
		int	15h
		mov	cl, 1
		mov	byte_443B1, cl
		push	large 0FFFFFFFFh
		push	large 4
		push	ss
		lea	ax, [bp+var_4]
		push	ax
		push	di
		call	StreamReader_ReadTyped_3B811
		add	sp, 0Eh
		push	2
		push	[bp+var_2]
		push	[bp+var_4]
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr TextCycler_ReleaseEntry_C3080
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 0Ah
		mov	[bp+var_8], eax
		cmp	eax, 0
		jz	short loc_C315A
		push	large 0FFFFFFFFh
		push	large [bp+var_8]
		push	0
		mov	al, [si+4]
		push	ax
		push	word ptr [si+2]
		push	word ptr [si]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	di
		call	StreamReader_ReadTyped_3B811
		add	sp, 0Eh

loc_C315A:				; CODE XREF: sub_C30DA+56j
		cmp	[bp+var_8], 0
		jz	short loc_C3166
		mov	ax, 1
		jmp	short loc_C3168
; ���������������������������������������������������������������������������

loc_C3166:				; CODE XREF: sub_C30DA+85j
		xor	ax, ax

loc_C3168:				; CODE XREF: sub_C30DA+8Aj
		pop	di
		pop	si
		leave
		retf
sub_C30DA	endp

; ���������������������������������������������������������������������������
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C3170	proc far		; CODE XREF: sub_42AA9J sub_C334F+69p	...

var_B0		= word ptr -0B0h
var_52		= word ptr -52h
var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 0B0h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	ax, 1209h
		mov	bx, 5650h
		xor	cx, cx
		int	15h
		mov	cl, 1
		mov	byte_443B1, cl
		mov	[bp+var_1], 0
		cmp	[bp+arg_4], 0
		jz	short loc_C31B8
		push	[bp+arg_6]
		push	[bp+arg_4]
		call	IndexedRecordReader_AdvanceIndex_3D69C
		add	sp, 4
		push	[bp+arg_4]
		push	di
		push	si
		push	cs
		call	near ptr sub_C30DA
		add	sp, 6
		mov	[bp+var_1], al
		jmp	short loc_C3212
; ���������������������������������������������������������������������������

loc_C31B8:				; CODE XREF: sub_C3170+27j
		push	ds
		push	offset a_txm	; ".TXM"
		push	ds
		push	di
		push	ds
		push	offset unk_46438
		lea	ax, [bp+var_52]
		push	ax
		call	sub_C86D
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_52]
		push	ax
		lea	ax, [bp+var_B0]
		push	ax
		call	StreamReader_ConstructVariantC_3B343
		add	sp, 6
		lea	ax, [bp+var_B0]
		push	ax
		call	StreamReader_ValidateState_3B625
		add	sp, 2
		or	al, al
		jz	short loc_C3203
		lea	ax, [bp+var_B0]
		push	ax
		push	di
		push	si
		push	cs
		call	near ptr sub_C30DA
		add	sp, 6
		mov	[bp+var_1], al

loc_C3203:				; CODE XREF: sub_C3170+80j
		push	2
		lea	ax, [bp+var_B0]
		push	ax
		call	StreamReader_Close_3B445
		add	sp, 4

loc_C3212:				; CODE XREF: sub_C3170+46j
		mov	al, [bp+var_1]
		pop	di
		pop	si
		leave
		retf
sub_C3170	endp

; ���������������������������������������������������������������������������
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à TextCycler_ReleaseBuffer_A71E5 (sub_A71E5 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; libère un tampon typé (Memory_TypedFree_5C7B6).
; ==============================================================================================
TextCycler_ReleaseBuffer_C321D	proc far		; CODE XREF: sub_42A9FJ sub_C3257+11p

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	byte ptr [si+4], 0FFh
		jnz	short loc_C322F
		mov	ax, 1
		jmp	short loc_C3231
; ���������������������������������������������������������������������������

loc_C322F:				; CODE XREF: TextCycler_ReleaseBuffer_C321D+Bj
		xor	ax, ax

loc_C3231:				; CODE XREF: TextCycler_ReleaseBuffer_C321D+10j
		or	al, al
		jz	short loc_C3242
		mov	dword ptr [si],	0
		mov	byte ptr [si+4], 2
		jmp	short loc_C3254
; ���������������������������������������������������������������������������

loc_C3242:				; CODE XREF: TextCycler_ReleaseBuffer_C321D+16j
		push	0
		mov	al, [si+4]
		push	ax
		push	si
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8

loc_C3254:				; CODE XREF: TextCycler_ReleaseBuffer_C321D+23j
		pop	si
		pop	bp
		retf
TextCycler_ReleaseBuffer_C321D	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C3257	proc far		; CODE XREF: sub_42AAEJ sub_C33FB+35p

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_C327D
		push	si
		push	cs
		call	near ptr TextCycler_ReleaseBuffer_C321D
		add	sp, 2
		test	di, 1
		jz	short loc_C327D
		push	si
		call	sub_308
		add	sp, 2

loc_C327D:				; CODE XREF: sub_C3257+Dj
					; sub_C3257+1Bj
		pop	di
		pop	si
		pop	bp
		retf
sub_C3257	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C3281	proc far		; CODE XREF: sub_42AB3J

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	ax, 1209h
		mov	bx, 5650h
		xor	cx, cx
		int	15h
		mov	cl, 1
		mov	byte_443B1, cl
		mov	ax, [bp+arg_6]
		imul	[bp+arg_8]
		movsx	eax, ax
		mov	[bp+var_4], eax
		mov	ax, [bp+arg_A]
		mov	[si+6],	ax
		push	seg stub223
		push	offset sub_42A95
		push	11h
		push	word ptr [si+6]
		push	6
		push	0
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		mov	[si+8],	ax
		mov	di, [si+8]
		mov	[bp+var_6], 0
		jmp	short loc_C3314
; ���������������������������������������������������������������������������

loc_C32D4:				; CODE XREF: sub_C3281+99j
		push	2
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	di
		push	cs
		call	near ptr TextCycler_ReleaseEntry_C3080
		add	sp, 0Ah
		push	large [bp+var_4]
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
		push	[bp+arg_2]
		call	ResourceRecord_ReadFieldGroupA_3C289
		add	sp, 0Ah
		inc	[bp+var_6]
		add	di, 6

loc_C3314:				; CODE XREF: sub_C3281+51j
		mov	ax, [si+6]
		cmp	ax, [bp+var_6]
		jg	short loc_C32D4
		mov	ax, [si+6]
		mov	[bp+var_8], ax
		call	CRT_Rand
		movsx	eax, ax
		movsx	edx, [bp+var_8]
		imul	eax, edx
		mov	ebx, 8000h
		cdq
		idiv	ebx
		mov	[si+0Ah], ax
		push	si
		call	sub_22411
		add	sp, 2
		pop	di
		pop	si
		leave
		retf
sub_C3281	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C334F	proc far		; CODE XREF: sub_42AB8J sub_C34F9+36p

var_14		= word ptr -14h
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 14h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	ax, 1209h
		mov	bx, 5650h
		xor	cx, cx
		int	15h
		mov	cl, 1
		mov	byte_443B1, cl
		mov	ax, [bp+arg_4]
		mov	[si+6],	ax
		push	seg stub223
		push	offset sub_42A95
		push	11h
		push	word ptr [si+6]
		push	6
		push	0
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		mov	[si+8],	ax
		mov	ax, [si+8]
		mov	[bp+var_2], ax
		xor	di, di
		jmp	short loc_C33C3
; ���������������������������������������������������������������������������

loc_C3394:				; CODE XREF: sub_C334F+77j
		push	di
		push	[bp+arg_2]
		push	3426h
		lea	ax, [bp+var_14]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 8
		mov	ax, [bp+arg_8]
		add	ax, di
		push	ax
		push	[bp+arg_6]
		lea	ax, [bp+var_14]
		push	ax
		push	[bp+var_2]
		push	cs
		call	near ptr sub_C3170
		add	sp, 8
		add	[bp+var_2], 6
		inc	di

loc_C33C3:				; CODE XREF: sub_C334F+43j
		cmp	[si+6],	di
		jg	short loc_C3394
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
		call	sub_22411
		add	sp, 2
		pop	di
		pop	si
		leave
		retf
sub_C334F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C33FB	proc far		; CODE XREF: sub_42ABDJ

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_C3445
		mov	dword ptr [si],	0
		mov	byte ptr [si+4], 2
		push	seg stub223
		push	offset sub_42AAE
		push	19h
		push	0
		push	6
		push	word ptr [si+8]
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	0
		push	si
		push	cs
		call	near ptr sub_C3257
		add	sp, 4
		test	di, 1
		jz	short loc_C3445
		push	si
		call	sub_308
		add	sp, 2

loc_C3445:				; CODE XREF: sub_C33FB+Dj
					; sub_C33FB+3Fj
		pop	di
		pop	si
		pop	bp
		retf
sub_C33FB	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C3449	proc far		; CODE XREF: sub_42AC2J

arg_0		= dword	ptr  6
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
		jz	short loc_C3489
		push	seg stub223
		push	offset sub_42A95
		push	11h
		les	bx, [bp+arg_0]
		push	word ptr es:[bx]
		push	6
		push	0
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		les	bx, [bp+arg_0]
		mov	es:[bx+4], ax

loc_C3489:				; CODE XREF: sub_C3449+1Dj
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+2], 0
		jz	short loc_C34B5
		push	seg stub223
		push	offset sub_42A90
		push	11h
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+2]
		push	0Ch
		push	0
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		les	bx, [bp+arg_0]
		mov	es:[bx+6], ax

loc_C34B5:				; CODE XREF: sub_C3449+48j
		pop	bp
		retf
sub_C3449	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C34B7	proc far		; CODE XREF: sub_42AC7J

arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_4]
		les	bx, [bp+arg_0]
		cmp	es:[bx], si
		jbe	short loc_C34EB
		push	[bp+arg_A]
		push	[bp+arg_8]
		push	[bp+arg_6]
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+4]
		push	ax
		mov	ax, si
		mov	dx, 6
		imul	dx
		pop	dx
		add	dx, ax
		push	dx
		push	cs
		call	near ptr sub_C3170
		add	sp, 8
		jmp	short loc_C34F6
; ���������������������������������������������������������������������������

loc_C34EB:				; CODE XREF: sub_C34B7+Dj
		push	902Dh
		call	sub_30D3
		add	sp, 2

loc_C34F6:				; CODE XREF: sub_C34B7+32j
		pop	si
		pop	bp
		retf
sub_C34B7	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C34F9	proc far		; CODE XREF: sub_42ACCJ

arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h
arg_C		= word ptr  12h

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_4]
		les	bx, [bp+arg_0]
		sub	si, es:[bx]
		les	bx, [bp+arg_0]
		cmp	es:[bx+2], si
		jbe	short loc_C3537
		push	[bp+arg_C]
		push	[bp+arg_A]
		push	[bp+arg_8]
		push	[bp+arg_6]
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+6]
		push	ax
		mov	ax, si
		mov	dx, 0Ch
		imul	dx
		pop	dx
		add	dx, ax
		push	dx
		push	cs
		call	near ptr sub_C334F
		add	sp, 0Ah
		jmp	short loc_C3542
; ���������������������������������������������������������������������������

loc_C3537:				; CODE XREF: sub_C34F9+14j
		push	902Eh
		call	sub_30D3
		add	sp, 2

loc_C3542:				; CODE XREF: sub_C34F9+3Cj
		pop	si
		pop	bp
		retf
sub_C34F9	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C3545	proc far		; CODE XREF: sub_42AD1J sub_C359F+15p

arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		push	seg stub223
		push	offset sub_42AAE
		push	19h
		push	0
		push	6
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+4]
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg stub223
		push	offset sub_42ABD
		push	19h
		push	0
		push	0Ch
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
sub_C3545	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C359F	proc far		; CODE XREF: sub_42AD6J

arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short loc_C35CE
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		push	cs
		call	near ptr sub_C3545
		add	sp, 4
		test	si, 1
		jz	short loc_C35CE
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		call	sub_316
		add	sp, 4

loc_C35CE:				; CODE XREF: sub_C359F+Cj
					; sub_C359F+1Fj
		pop	si
		pop	bp
		retf
sub_C359F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C35D1	proc far		; CODE XREF: sub_42A95J

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_C35EC
		push	6
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_C35F7

loc_C35EC:				; CODE XREF: sub_C35D1+9j
		mov	dword ptr [si],	0
		mov	byte ptr [si+4], 2

loc_C35F7:				; CODE XREF: sub_C35D1+19j
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_C35D1	endp

; ���������������������������������������������������������������������������
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C35FF	proc far		; CODE XREF: sub_42A90J

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_C361A
		push	0Ch
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_C3632

loc_C361A:				; CODE XREF: sub_C35FF+9j
		mov	dword ptr [si],	0
		mov	byte ptr [si+4], 2
		mov	word ptr [si+8], 0
		xor	ax, ax
		mov	[si+0Ah], ax
		mov	[si+6],	ax

loc_C3632:				; CODE XREF: sub_C35FF+19j
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_C35FF	endp

; ���������������������������������������������������������������������������
		pop	si
		pop	bp
		retf
ovr223		ends
