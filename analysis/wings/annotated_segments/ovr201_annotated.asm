ovr201		segment	para public 'OVERLAY' use16
		assume cs:ovr201
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_71CB0		proc far

var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jnz	short loc_71CC4
		jmp	loc_71D77

loc_71CC4:
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 2799h
		push	word ptr es:[bx+0Dh]
		call	sub_33B
		pop	cx
		les	bx, word ptr [bp+arg_0]
		cmp	dword ptr es:[bx+8], 0
		jz	short loc_71D0F
		push	large es:[bx+8]
		call	Particle_ListFreeAll
		add	sp, 4
		les	bx, word ptr [bp+arg_0]
		mov	eax, es:[bx+8]
		mov	[bp+var_4], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_71D0F

loc_71D0F:
		les	bx, word ptr [bp+arg_0]
		cmp	dword ptr es:[bx+26h], 0
		jz	short loc_71D36
		push	0
		push	2
		mov	eax, es:[bx+26h]
		mov	[bp+var_8], eax
		lea	ax, word ptr [bp+var_8]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8

loc_71D36:
		les	bx, word ptr [bp+arg_0]
		cmp	dword ptr es:[bx+19h], 0
		jz	short loc_71D56
		push	3
		push	large es:[bx+19h]
		les	bx, es:[bx+19h]
		mov	bx, es:[bx]
		call	dword ptr [bx]
		add	sp, 6
		jmp	short loc_71D56

loc_71D56:
		test	si, 1
		jz	short loc_71D77
		mov	eax, [bp+arg_0]
		mov	[bp+var_C], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_C]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8

loc_71D77:
		pop	si
		leave
		retf
sub_71CB0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_71D7A		proc far

var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_A		= word ptr -0Ah
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 1Ah
		push	si
		push	di
		mov	di, [bp+arg_4]
		or	di, di
		jnz	short loc_71D8C
		jmp	loc_71EBF

loc_71D8C:
		mov	ax, [bp+arg_2]
		mov	dx, [bp+arg_0]
		add	dx, 1Dh
		mov	word ptr [bp+var_4+2], ax
		mov	word ptr [bp+var_4], dx
		mov	eax, [bp+var_4]
		mov	[di+6], eax
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+0Fh], 0
		jg	short loc_71DB0
		jmp	loc_71EBF

loc_71DB0:
		push	0Fh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_71DD6
		push	ax
		call	String_ConstructEmpty
		pop	cx
		mov	word ptr [si+9], 0
		xor	ax, ax
		mov	[si+0Dh], ax
		mov	[si+0Bh], ax
		mov	ax, si
		jmp	short loc_71DD8

loc_71DD6:
		mov	ax, si

loc_71DD8:
		mov	[di+1Eh], ax
		mov	ax, [bp+arg_2]
		mov	dx, [bp+arg_0]
		add	dx, 1Dh
		mov	[bp+var_10], ax
		mov	[bp+var_12], dx
		xor	si, si
		jmp	short loc_71E0B

loc_71DEE:
		les	bx, [bp+var_12]
		add	bx, si
		cmp	byte ptr es:[bx], 0
		jz	short loc_71E06
		mov	bx, [bp+var_12]
		add	bx, si
		mov	al, es:[bx]
		mov	byte ptr [bp+si+var_E], al
		jmp	short loc_71E0A

loc_71E06:
		mov	byte ptr [bp+si+var_E], 20h

loc_71E0A:
		inc	si

loc_71E0B:
		cmp	si, 4
		jl	short loc_71DEE
		push	di
		push	2792h
		lea	ax, [bp+var_A]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 6
		push	8
		lea	ax, [bp+var_E]
		push	ax
		push	word ptr [di+1Eh]
		call	CRT_Strncpy_Pad
		add	sp, 6
		mov	bx, [di+1Eh]
		mov	byte ptr [bx+8], 0
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+0Dh]
		mov	[bp+var_14], ax
		mov	[bp+var_16], 0
		jmp	short loc_71EB3

loc_71E49:
		mov	ax, [bp+var_14]
		mov	[bp+var_18], ds
		mov	[bp+var_1A], ax
		push	1
		push	1
		push	[bp+var_18]
		push	ax
		push	6482h
		call	sub_37E34
		add	sp, 0Ah
		mov	si, ax
		mov	dx, [bp+var_14]
		add	dx, 9
		mov	bx, dx
		mov	eax, [bx]
		mov	[si+12h], eax
		mov	eax, [bx+4]
		mov	[si+16h], eax
		mov	eax, [bx+8]
		mov	[si+1Ah], eax
		mov	ax, si
		add	ax, 12h
		push	si
		mov	bx, [si]
		call	dword ptr [bx+8]
		pop	cx
		mov	ax, [bp+var_14]
		add	ax, 15h
		push	ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+44h]
		add	sp, 4
		push	si
		push	di
		call	sub_58F7F
		add	sp, 4
		inc	[bp+var_16]
		add	[bp+var_14], 39h

loc_71EB3:
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+0Fh]
		cmp	ax, [bp+var_16]
		jg	short loc_71E49

loc_71EBF:
		pop	di
		pop	si
		leave
		retf
sub_71D7A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_71EC3		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx+0Fh], 0
		mov	word ptr es:[bx+0Dh], 0
		mov	byte ptr es:[bx+2], 1
		mov	byte ptr es:[bx+3], 0
		mov	word ptr es:[bx+4], 0
		mov	word ptr es:[bx+6], 0
		mov	dword ptr es:[bx+19h], 0
		mov	dword ptr es:[bx+8], 0
		mov	byte ptr es:[bx+0Ch], 0
		mov	dword ptr es:[bx+26h], 0
		pop	bp
		retf
sub_71EC3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_71F0D		proc far

var_2A		= word ptr -2Ah
var_22		= dword ptr -22h
var_1E		= dword ptr -1Eh
var_1A		= dword ptr -1Ah
var_16		= word ptr -16h
var_12		= word ptr -12h
var_E		= word ptr -0Eh
var_A		= word ptr -0Ah
var_8		= dword ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 2Ah
		push	si
		push	di
		mov	di, [bp+arg_4]
		mov	byte_5C58D, 0
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_71EC3
		add	sp, 4
		push	1
		push	0
		push	2
		push	large 17h
		push	67B0h
		call	Memory_TypedFreeWrapper_447E1
		add	sp, 0Ch
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		or	ax, dx
		jz	short loc_71F83
		mov	[bp+var_8], 5DC00h
		mov	eax, [bp+var_8]
		les	bx, [bp+var_4]
		mov	es:[bx+10h], eax
		xor	eax, eax
		mov	es:[bx+4], eax
		mov	es:[bx], eax
		xor	eax, eax
		mov	es:[bx+0Ch], eax
		mov	es:[bx+8], eax
		mov	word ptr es:[bx+14h], 0
		mov	byte ptr es:[bx+16h], 0
		mov	ax, [bp+var_4]
		jmp	short loc_71F89

loc_71F83:
		mov	dx, [bp+var_2]
		mov	ax, [bp+var_4]

loc_71F89:
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+0Ah], dx
		mov	es:[bx+8], ax
		push	0
		push	large 474D4144h
		push	di
		call	ResourceRecord_SeekAndRead_53CC2
		add	sp, 8
		or	ax, ax
		jz	short loc_71FC5
		push	di
		call	ResourceRecord_ReadFieldGroupB_53FD3
		pop	cx
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+6], ax
		cmp	word ptr es:[bx+6], 0FFFFh
		jnz	short loc_71FCE
		mov	byte ptr es:[bx+3], 1
		jmp	short loc_71FCE

loc_71FC5:
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx+6], 0Ah

loc_71FCE:
		push	0
		push	large 454D4E48h
		push	di
		call	ResourceRecord_SeekAndRead_53CC2
		add	sp, 8
		or	ax, ax
		jz	short loc_7202C
		mov	si, [di+72h]
		push	1
		push	0
		push	2
		mov	ax, si
		inc	ax
		movsx	eax, ax
		push	eax
		push	67B0h
		call	Memory_TypedFreeWrapper_447E1
		add	sp, 0Ch
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+28h], dx
		mov	es:[bx+26h], ax
		movsx	eax, si
		push	eax
		push	large es:[bx+26h]
		push	di
		call	ResourceRecord_ReadFieldGroupA_53F98
		add	sp, 0Ah
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+26h]
		add	bx, si
		mov	byte ptr es:[bx], 0

loc_7202C:
		push	0
		push	large 444C4843h
		push	di
		call	ResourceRecord_SeekAndRead_53CC2
		add	sp, 8
		or	ax, ax
		jnz	short loc_72044
		jmp	loc_720EE

loc_72044:
		mov	eax, [di+72h]
		mov	ebx, 20h
		cdq
		idiv	ebx
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+0Fh], ax
		push	seg stub201
		push	offset sub_59005
		push	1
		push	word ptr es:[bx+0Fh]
		push	large 390000h
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+0Dh], ax
		mov	si, es:[bx+0Dh]
		mov	[bp+var_A], 0
		jmp	short loc_720E2

loc_72086:
		push	large 20h
		push	ss
		lea	ax, [bp+var_2A]
		push	ax
		push	di
		call	ResourceRecord_ReadFieldGroupA_53F98
		add	sp, 0Ah
		push	8
		lea	ax, [bp+var_2A]
		push	ax
		push	si
		call	CRT_Strncpy_Pad
		add	sp, 6
		mov	byte ptr [si+8], 0
		mov	eax, [bp+var_22]
		mov	[si+9], eax
		mov	eax, [bp+var_1E]
		mov	[si+0Dh], eax
		mov	eax, [bp+var_1A]
		mov	[si+11h], eax
		lea	ax, [bp+var_E]
		push	ax
		lea	ax, [bp+var_12]
		push	ax
		lea	ax, [bp+var_16]
		push	ax
		mov	ax, si
		add	ax, 15h
		push	ax
		call	Matrix_BuildFullOrientation_3BD91
		add	sp, 8
		add	si, 39h
		inc	[bp+var_A]

loc_720E2:
		les	bx, word ptr [bp+arg_0]
		mov	ax, es:[bx+0Fh]
		cmp	ax, [bp+var_A]
		jg	short loc_72086

loc_720EE:
		pop	di
		pop	si
		leave
		retf
sub_71F0D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_720F2		proc far

var_6		= dword ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		push	di
		mov	si, [bp+arg_4]
		push	0
		push	large 45545845h
		push	si
		call	ResourceRecord_SeekAndRead_53CC2
		add	sp, 8
		or	ax, ax
		jnz	short loc_72115
		jmp	loc_721C2

loc_72115:
		push	si
		call	ResourceRecord_ReadFieldGroupC_53FFD
		push	dx
		push	ax
		pop	eax
		pop	cx
		les	bx, [bp+arg_0]
		les	bx, es:[bx+8]
		mov	es:[bx+10h], eax
		push	si
		call	ResourceRecord_ReadFieldGroupB_53FD3
		pop	cx
		mov	[bp+var_2], ax
		push	si
		call	ResourceRecord_ReadFinalField_540D0
		pop	cx
		les	bx, [bp+arg_0]
		les	bx, es:[bx+8]
		mov	es:[bx+16h], al
		mov	word ptr es:[bx+14h], 0
		xor	di, di
		jmp	short loc_721BD

loc_72152:
		push	si
		call	sub_58E35
		pop	cx
		mov	word ptr [bp+var_6+2], dx
		mov	word ptr [bp+var_6], ax
		cmp	[bp+var_6], 0
		jz	short loc_721BC
		les	bx, [bp+arg_0]
		les	bx, es:[bx+8]
		inc	word ptr es:[bx+14h]
		mov	ax, es:[bx+4]
		or	ax, es:[bx+6]
		jnz	short loc_72192
		mov	ax, word ptr [bp+var_6+2]
		mov	dx, word ptr [bp+var_6]
		mov	es:[bx+6], ax
		mov	es:[bx+4], dx
		mov	es:[bx+2], ax
		mov	es:[bx], dx
		jmp	short loc_721BC

loc_72192:
		les	bx, [bp+arg_0]
		les	bx, es:[bx+8]
		les	bx, es:[bx+4]
		mov	ax, word ptr [bp+var_6+2]
		mov	dx, word ptr [bp+var_6]
		mov	es:[bx+4], ax
		mov	es:[bx+2], dx
		les	bx, [bp+arg_0]
		les	bx, es:[bx+8]
		mov	es:[bx+6], ax
		mov	es:[bx+4], dx
		jmp	short loc_721BC

loc_721BC:
		inc	di

loc_721BD:
		cmp	di, [bp+var_2]
		jl	short loc_72152

loc_721C2:
		pop	di
		pop	si
		leave
		retf
sub_720F2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Debris_ListFindAndDispatch_9BECD (sub_9BECD de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; combine LinkedListB_FindAndDispatch_5F5A4/Helper_5F6A9 (seg159).
; ==============================================================================================
Debris_ListFindAndDispatch_721C6		proc far

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		jmp	short loc_721FD

loc_721D2:
		mov	bx, [bp+var_2]
		cmp	dword ptr [bx+4], 0
		jz	short loc_721EF
		push	3
		push	large [bx+4]
		les	bx, [bx+4]
		mov	bx, es:[bx]
		call	dword ptr [bx]
		add	sp, 6
		jmp	short loc_721EF

loc_721EF:
		push	0
		push	[bp+var_2]
		push	si
		call	LinkedListB_FindAndDispatch_48648
		add	sp, 6

loc_721FD:
		mov	[bp+var_2], 0
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_4874D
		add	sp, 4
		or	ax, ax
		jnz	short loc_721D2
		pop	si
		leave
		retf
Debris_ListFindAndDispatch_721C6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_72216		proc far

arg_0		= word ptr  6
arg_2		= dword ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	8
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_72243
		mov	word ptr [di], 0A2Dh
		mov	word ptr [di+2], 0
		mov	word ptr [di], 2795h
		mov	dword ptr [di+4], 0
		jmp	short loc_72245

loc_72243:
		mov	ax, di

loc_72245:
		mov	di, ax
		mov	eax, [bp+arg_2]
		mov	[di+4], eax
		push	di
		push	si
		call	LinkedListB_InsertAtTail_48623
		add	sp, 4
		pop	di
		pop	si
		pop	bp
		retf
sub_72216		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_7225D		proc far
		push	bp
		mov	bp, sp
		push	si
		mov	si, 0Ah
		jmp	short loc_72278

loc_72266:
		push	si
		call	PC_SoundOn
		pop	cx
		push	5
		call	PIT_DelayLoop
		pop	cx
		add	si, 1Eh

loc_72278:
		cmp	si, 1388h
		jl	short loc_72266
		call	sub_224B
		pop	si
		pop	bp
		retf
sub_7225D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_72286		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	0
		push	large 4D524F46h
		push	si
		call	ResourceRecord_SeekAndRead_53CC2
		add	sp, 8
		or	ax, ax
		jz	short loc_722B4
		push	si
		call	ResourceRecord_ReadDwordAdvance_5411A
		pop	cx
		push	si
		call	sub_541A0
		pop	cx
		mov	al, 1
		jmp	short loc_722B6

loc_722B4:
		mov	al, 0

loc_722B6:
		pop	si
		pop	bp
		retf
sub_72286		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Debris_ConstructEmptyWithFormation_9BF6A (sub_9BF6A de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, combine String_ConstructEmpty et
; Formation_ComputeGeometryHelper_56D43.
; ==============================================================================================
Debris_ConstructEmptyWithFormation_722B9		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		call	String_ConstructEmpty
		pop	cx
		mov	ax, si
		add	ax, 9
		mov	ax, si
		add	ax, 15h
		push	ax
		call	Formation_ComputeGeometryHelper_3B522
		pop	cx
		mov	ax, si
		pop	si
		pop	bp
		retf
Debris_ConstructEmptyWithFormation_722B9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_722DD		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	dx, [bp+arg_2]
		or	ax, ax
		jz	short loc_722F9
		test	dx, 1
		jz	short loc_722F9
		push	ax
		call	sub_33B
		pop	cx
		jmp	short loc_722F9

loc_722F9:
		pop	bp
		retf
sub_722DD		endp
ovr201		ends
