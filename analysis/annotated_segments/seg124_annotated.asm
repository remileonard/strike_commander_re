seg124		segment	byte public 'CODE' use16
		assume cs:seg124
		;org 3
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 493 lignes, NON DÉTAILLÉE — référencée deux fois par TextRenderer_Main (sub_27477,
; seg048). Combine des appels au sous-système séquenceur/minuteur
; (Sequencer_AdvanceActiveSlot_59F1D, Sequencer_ProcessQueue_59FF5,
; Sequencer_ReleaseSlot_59F87) et au sous-système d'allocation (sub_5Cxxx). Probable
; gestionnaire de champ de saisie/édition de texte dynamique. Candidat prioritaire pour
; session dédiée.
; ==============================================================================================
TextRenderer_InputFieldHandler_5A0F3	proc far		; CODE XREF: TextRenderer_Main+4B9P
					; TextRenderer_Main+644P

var_174		= word ptr -174h
var_172		= word ptr -172h
var_170		= dword	ptr -170h
var_16C		= byte ptr -16Ch
var_16B		= byte ptr -16Bh
var_16A		= dword	ptr -16Ah
var_166		= word ptr -166h
var_116		= word ptr -116h
var_C6		= word ptr -0C6h
var_B8		= word ptr -0B8h
var_57		= dword	ptr -57h
var_4B		= word ptr -4Bh
var_47		= dword	ptr -47h
var_40		= dword	ptr -40h
var_3C		= dword	ptr -3Ch
var_38		= dword	ptr -38h
var_34		= byte ptr -34h
var_33		= byte ptr -33h
var_32		= dword	ptr -32h
var_2E		= dword	ptr -2Eh
var_2A		= word ptr -2Ah
var_24		= word ptr -24h
var_1A		= dword	ptr -1Ah
var_16		= dword	ptr -16h
var_12		= word ptr -12h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h

		push	bp
		mov	bp, sp
		sub	sp, 174h
		push	si
		push	di

loc_5A0FC:				; DATA XREF: seg216:04A6o
		mov	si, [bp+arg_0]

loc_5A0FF:
		mov	di, [bp+arg_4]

loc_5A102:
		lea	ax, [bp+var_B8]
		push	ax

loc_5A107:
		call	IndexedRecordReader_ConstructVariantA_65A1A
		pop	cx

loc_5A10D:
		push	[bp+arg_2]
		lea	ax, [bp+var_C6]

loc_5A114:
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		push	3894h
		lea	ax, [bp+var_C6]

loc_5A124:
		push	ax
		call	CRT_Strcat
		add	sp, 4
		push	large 0
		push	ss
		lea	ax, [bp+var_C6]
		push	ax
		push	ds
		push	offset aSound	; "SOUND"
		lea	ax, [bp+var_116]
		push	ax
		call	Path_ResolveDataFile
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_116]
		push	ax
		lea	ax, [bp+var_B8]
		push	ax
		mov	bx, [bp+var_B8]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		lea	ax, [bp+var_B8]
		push	ax
		call	IndexedRecordReader_AdvanceIndex_65E2C
		add	sp, 4
		mov	ax, [bp+var_4B]
		and	ax, 0C0h
		cmp	ax, 0C0h ; '�'
		jnz	short loc_5A17D
		mov	eax, [bp+var_57]
		jmp	short loc_5A181
; ���������������������������������������������������������������������������

loc_5A17D:				; CODE XREF: TextRenderer_InputFieldHandler_5A0F3+82j
		mov	eax, [bp+var_47]

loc_5A181:				; CODE XREF: TextRenderer_InputFieldHandler_5A0F3+88j
		add	eax, 10h
		mov	[bp+var_4], eax
		mov	[bp+var_8], eax
		push	3899h
		push	1
		push	2
		push	2
		push	eax
		push	5C44h
		call	Memory_TypedFreeWrapperB_5C774
		add	sp, 0Eh
		mov	word ptr [bp+var_C+2], dx
		mov	word ptr [bp+var_C], ax
		mov	eax, [bp+var_C]
		mov	[si+0Ah], eax
		mov	byte ptr [si+0Eh], 2
		mov	byte ptr [si+0Fh], 1
		mov	dword ptr [si+10h], 0
		mov	eax, [bp+var_8]
		mov	[si+10h], eax
		push	0
		mov	al, [si+0Eh]
		push	ax
		push	large dword ptr	[si+0Ah]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		mov	bx, dx
		cmp	bx, 9FFFh
		mov	ax, bx
		inc	ax
		mov	word ptr [bp+var_10+2],	ax
		mov	word ptr [bp+var_10], 0
		push	ax
		push	word ptr [bp+var_10]
		push	0
		lea	ax, [bp+var_B8]
		push	ax
		call	IndexedRecordReader_SeekToIndex_65C6D

loc_5A1FF:
		add	sp, 8
		push	large [bp+var_10]
		call	ModuleRegistry_QueryOrDispatch_6015A
		add	sp, 4
		mov	[si+4],	ax
		cmp	word ptr [si+4], 0FFFFh
		push	word ptr [si+4]
		call	ModuleRegistry_QueryModuleField_60228
		pop	cx
		mov	[si+8],	dx
		mov	[si+6],	ax
		cmp	di, 0FFFFh
		jnz	short loc_5A230
		les	bx, [si+6]
		mov	di, es:[bx+0Ch]

loc_5A230:				; CODE XREF: TextRenderer_InputFieldHandler_5A0F3+134j
		cmp	[bp+arg_6], 0FFFFh
		jnz	short loc_5A240
		les	bx, [si+6]
		mov	ax, es:[bx+0Eh]
		mov	[bp+arg_6], ax

loc_5A240:				; CODE XREF: TextRenderer_InputFieldHandler_5A0F3+141j
		cmp	[bp+arg_8], 0FFFFh
		jnz	short loc_5A250
		les	bx, [si+6]
		mov	ax, es:[bx+10h]
		mov	[bp+arg_8], ax

loc_5A250:				; CODE XREF: TextRenderer_InputFieldHandler_5A0F3+151j
		cmp	[bp+arg_A], 0FFFFh
		jnz	short loc_5A260
		les	bx, [si+6]
		mov	ax, es:[bx+12h]
		mov	[bp+arg_A], ax

loc_5A260:				; CODE XREF: TextRenderer_InputFieldHandler_5A0F3+161j
		push	[bp+arg_A]
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	di
		push	word ptr [si+4]
		call	ModuleRegistry_Opcode_65_6024E
		add	sp, 0Ah
		or	ax, ax
		jnz	short loc_5A28F
		call	PagedResourceC_RefreshAllInstances_5F4E0
		push	3808h
		call	CRT_Msg_NullPtrAssign
		pop	cx
		push	1
		call	CRT_Exit
		pop	cx

loc_5A28F:				; CODE XREF: TextRenderer_InputFieldHandler_5A0F3+184j
		mov	al, 1
		mov	byte_709A1, al
		mov	ah, 0
		mov	[bp+var_12], ax
		push	ax
		push	[bp+arg_A]
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	di
		push	word ptr [si+4]
		call	ModuleRegistry_ConfigureModuleExtended_60254
		add	sp, 0Ch
		mov	byte ptr [si+83h], 1
		les	bx, [si+6]
		cmp	word ptr es:[bx+2], 3
		jz	short loc_5A2C1
		jmp	loc_5A564
; ���������������������������������������������������������������������������

loc_5A2C1:				; CODE XREF: TextRenderer_InputFieldHandler_5A0F3+1C9j
		push	word ptr [si+4]
		call	ModuleRegistry_Opcode_99_603A2
		pop	cx
		mov	di, ax
		or	di, di
		jz	short loc_5A337
		movzx	eax, di
		mov	[bp+var_16], eax
		push	38B6h
		push	1
		push	0
		push	2
		push	eax
		push	5C44h
		call	Memory_TypedFreeWrapperB_5C774
		add	sp, 0Eh
		mov	word ptr [bp+var_1A+2],	dx
		mov	word ptr [bp+var_1A], ax
		mov	eax, [bp+var_1A]
		mov	[si+14h], eax
		mov	byte ptr [si+18h], 2

loc_5A300:
		mov	byte ptr [si+19h], 1
		mov	dword ptr [si+1Ah], 0
		mov	eax, [bp+var_16]

loc_5A310:
		mov	[si+1Ah], eax

loc_5A314:
		push	di
		push	0
		mov	al, [si+18h]
		push	ax
		push	large dword ptr	[si+14h]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	word ptr [si+4]
		call	ModuleRegistry_Opcode_9A_603A8
		add	sp, 8

loc_5A337:				; CODE XREF: TextRenderer_InputFieldHandler_5A0F3+1DBj
		push	38D3h
		lea	ax, [bp+var_24]
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		mov	byte ptr [bp+var_2A], 2Eh ; '.'
		mov	byte ptr [bp+var_2A+1],	0
		mov	ax, [si+6]
		add	ax, 4
		push	word ptr [si+8]
		push	ax
		push	ss
		lea	ax, [bp+var_2A]
		push	ax
		call	CRT_MemFamily_Extra2
		add	sp, 8
		push	ss
		lea	ax, [bp+var_2A]
		push	ax
		push	ss
		lea	ax, [bp+var_24]
		push	ax
		push	ds
		push	offset aSound	; "SOUND"
		lea	ax, [bp+var_166]
		push	ax
		call	Path_ResolveDataFile
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_166]
		push	ax
		mov	ax, si
		add	ax, 1Eh
		push	ax
		mov	bx, [si+1Eh]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	1
		lea	ax, [bp+var_B8]
		push	ax
		call	IndexedRecordReader_AdvanceIndex_65E2C
		add	sp, 4
		mov	ax, [bp+var_4B]
		and	ax, 0C0h
		cmp	ax, 0C0h ; '�'
		jnz	short loc_5A3B6
		mov	eax, [bp+var_57]
		jmp	short loc_5A3BA
; ���������������������������������������������������������������������������

loc_5A3B6:				; CODE XREF: TextRenderer_InputFieldHandler_5A0F3+2BBj
		mov	eax, [bp+var_47]

loc_5A3BA:				; CODE XREF: TextRenderer_InputFieldHandler_5A0F3+2C1j
		mov	[bp+var_2E], eax
		cmp	[bp+var_2E], 0
		jnz	short loc_5A3C8
		jmp	loc_5A564
; ���������������������������������������������������������������������������

loc_5A3C8:				; CODE XREF: TextRenderer_InputFieldHandler_5A0F3+2D0j
		cmp	byte_709A1, 0
		jnz	short loc_5A3D2
		jmp	loc_5A564
; ���������������������������������������������������������������������������

loc_5A3D2:				; CODE XREF: TextRenderer_InputFieldHandler_5A0F3+2DAj
		mov	[bp+var_38], 0
		mov	[bp+var_34], 2
		mov	[bp+var_33], 0
		mov	[bp+var_32], 0
		mov	[bp+var_3C], eax
		push	1
		push	0
		push	2
		push	eax
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_40+2],	dx

loc_5A404:
		mov	word ptr [bp+var_40], ax

loc_5A407:
		mov	eax, [bp+var_40]

loc_5A40B:
		mov	[bp+var_38], eax
		mov	[bp+var_34], 2

loc_5A413:
		mov	[bp+var_33], 1
		mov	[bp+var_32], 0
		mov	eax, [bp+var_3C]
		mov	[bp+var_32], eax
		push	0
		mov	al, [bp+var_34]
		push	ax
		push	large [bp+var_38]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	1
		lea	ax, [bp+var_B8]
		push	ax
		call	IndexedRecordReader_SeekToIndex_65C6D
		add	sp, 8
		mov	[bp+var_170], 0
		mov	[bp+var_16C], 2
		mov	[bp+var_16B], 0
		mov	[bp+var_16A], 0
		mov	[bp+var_174], 0
		mov	[bp+var_172], 0FFFFh
		push	si
		lea	ax, [bp+var_174]
		push	ax
		call	Sequencer_ReleaseSlot_59F87
		add	sp, 4
		push	0
		lea	ax, [bp+var_38]
		push	ax
		lea	ax, [bp+var_174]
		push	ax
		call	Sequencer_ProcessQueue_59FF5
		add	sp, 6
		cmp	[bp+var_174], 0
		jz	short loc_5A4B2
		push	[bp+var_172]
		mov	bx, [bp+var_174]
		push	word ptr [bx+4]
		call	ModuleRegistry_Opcode_AA_603CC
		add	sp, 4
		jmp	short $+2

loc_5A4B2:				; CODE XREF: TextRenderer_InputFieldHandler_5A0F3+3A8j
					; TextRenderer_InputFieldHandler_5A0F3+3EDj
		cmp	[bp+var_174], 0
		jz	short loc_5A4DA
		push	[bp+var_172]
		mov	bx, [bp+var_174]
		push	word ptr [bx+4]
		call	ModuleRegistry_Opcode_AE_603DE
		add	sp, 4
		cmp	ax, 2
		jnz	short loc_5A4D6
		mov	ax, 1
		jmp	short loc_5A4D8
; ���������������������������������������������������������������������������

loc_5A4D6:				; CODE XREF: TextRenderer_InputFieldHandler_5A0F3+3DCj
		xor	ax, ax

loc_5A4D8:				; CODE XREF: TextRenderer_InputFieldHandler_5A0F3+3E1j
		jmp	short loc_5A4DC
; ���������������������������������������������������������������������������

loc_5A4DA:				; CODE XREF: TextRenderer_InputFieldHandler_5A0F3+3C4j
		mov	al, 1

loc_5A4DC:				; CODE XREF: TextRenderer_InputFieldHandler_5A0F3:loc_5A4D8j
		mov	ah, 0
		or	ax, ax
		jz	short loc_5A4B2
		lea	ax, [bp+var_174]
		push	ax
		call	Sequencer_AdvanceActiveSlot_59F1D
		pop	cx
		cmp	[bp+var_16B], 0
		jz	short loc_5A515
		cmp	[bp+var_170], 0
		jz	short loc_5A515
		push	0
		mov	al, [bp+var_16C]
		push	ax
		lea	ax, [bp+var_170]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_5A515:				; CODE XREF: TextRenderer_InputFieldHandler_5A0F3+3FFj
					; TextRenderer_InputFieldHandler_5A0F3+407j
		mov	[bp+var_170], 0
		mov	[bp+var_16B], 0
		mov	[bp+var_16A], 0
		cmp	[bp+var_33], 0
		jz	short loc_5A550
		cmp	[bp+var_38], 0
		jz	short loc_5A550
		push	0
		mov	al, [bp+var_34]
		push	ax
		lea	ax, [bp+var_38]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_5A550:				; CODE XREF: TextRenderer_InputFieldHandler_5A0F3+43Dj
					; TextRenderer_InputFieldHandler_5A0F3+444j
		mov	[bp+var_38], 0
		mov	[bp+var_33], 0
		mov	[bp+var_32], 0

loc_5A564:				; CODE XREF: TextRenderer_InputFieldHandler_5A0F3+1CBj
					; TextRenderer_InputFieldHandler_5A0F3+2D2j ...
		push	2
		lea	ax, [bp+var_B8]
		push	ax
		call	IndexedRecordReader_Destruct_659D0
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
TextRenderer_InputFieldHandler_5A0F3	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle sub_63F46/sub_63FA1/sub_63511/sub_5C6F3 — probable allocation/placement d'un
; objet texte à une coordonnée donnée. Appelée par Sequencer_ValidatePlacement_5A62A.
; ==============================================================================================
TextObject_Allocate_5A577	proc far		; CODE XREF: Sequencer_ValidatePlacement_5A62A+28p

var_A		= dword	ptr -0Ah
var_6		= word ptr -6
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= byte ptr  8
arg_3		= byte ptr  9

		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		push	si
		mov	si, [bp+arg_0]
		mov	ax, si
		add	ax, 1Eh
		push	ax
		call	StreamReader_PrepareForRead_63F46
		pop	cx

loc_5A58D:				; CODE XREF: TextObject_Allocate_5A577+41j
					; TextObject_Allocate_5A577+49j
		push	large 0FFFFFFFFh
		push	large 6
		push	ss
		lea	ax, [bp+var_6]
		push	ax
		mov	ax, si
		add	ax, 1Eh
		push	ax
		call	StreamReader_ReadTyped_63FA1
		add	sp, 0Eh
		cmp	byte ptr [bp+var_6+1], 0FFh
		jnz	short loc_5A5B2
		xor	dx, dx
		xor	ax, ax
		jmp	short loc_5A627
; ���������������������������������������������������������������������������

loc_5A5B2:				; CODE XREF: TextObject_Allocate_5A577+33j
		mov	al, byte ptr [bp+var_6+1]
		cmp	al, [bp+arg_3]
		jnz	short loc_5A58D
		mov	al, byte ptr [bp+var_6]
		cmp	al, [bp+arg_2]
		jnz	short loc_5A58D
		push	large [bp+var_4]
		mov	ax, si
		add	ax, 1Eh
		push	ax
		call	Handle_ReadWordField_63511
		add	sp, 6
		mov	word_72CB4, ax
		push	1
		push	0
		push	2
		movzx	eax, word_72CB4
		push	eax
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_A+2], dx
		mov	word ptr [bp+var_A], ax
		les	bx, [bp+var_A]
		mov	ax, word_72CB4
		mov	es:[bx], ax
		push	large 0FFFFFFFFh
		sub	ax, 2
		movzx	eax, ax
		push	eax
		mov	ax, word ptr [bp+var_A]
		add	ax, 2
		push	dx
		push	ax

loc_5A613:
		mov	ax, si
		add	ax, 1Eh
		push	ax
		call	StreamReader_ReadTyped_63FA1
		add	sp, 0Eh
		mov	dx, word ptr [bp+var_A+2]
		mov	ax, word ptr [bp+var_A]

loc_5A627:				; CODE XREF: TextObject_Allocate_5A577+39j
		pop	si
		leave
		retf
TextObject_Allocate_5A577	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, vérifie si une coordonnée (x,y) est libre (sub_603C6), sinon tente d'y placer un objet
; (TextObject_Allocate_5A577) ; en cas d'échec, affiche un message d'erreur (sub_6B70F,
; ressource 0xD003) si un buffer de texte est actif, ou pose byte_7084A=4. Référencée par
; Sequencer_ProcessQueue_59FF5 (seg123) et en interne du segment.
; ==============================================================================================
Sequencer_ValidatePlacement_5A62A	proc far		; CODE XREF: Sequencer_ProcessQueue_59FF5+F0P
					; seg124:06FDp

var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	al, byte ptr [bp+arg_2]
		cbw
		push	ax
		mov	al, byte ptr [bp+arg_2+1]
		cbw
		push	ax
		push	word ptr [si+4]
		call	ModuleRegistry_Opcode_9F_603C6
		add	sp, 6
		or	ax, ax
		jnz	short loc_5A6B2
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr TextObject_Allocate_5A577
		add	sp, 4
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		cmp	[bp+var_4], 0
		jz	short loc_5A698
		push	dx
		push	ax
		mov	al, byte ptr [bp+arg_2]
		cbw
		push	ax
		mov	al, byte ptr [bp+arg_2+1]
		cbw
		push	ax
		push	word ptr [si+4]
		call	ModuleRegistry_Opcode_9C_603B4
		add	sp, 0Ah
		cmp	[bp+var_4], 0
		jz	short loc_5A6B2
		push	0
		push	2
		lea	ax, [bp+var_4]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short loc_5A6B2
; ���������������������������������������������������������������������������

loc_5A698:				; CODE XREF: Sequencer_ValidatePlacement_5A62A+39j
		les	bx, dword_709CC
		cmp	byte ptr es:[bx], 0
		jz	short loc_5A6AD
		push	0D003h
		call	VROOMM_StubThunk_6B70F
		pop	cx
		jmp	short loc_5A6B2
; ���������������������������������������������������������������������������

loc_5A6AD:				; CODE XREF: Sequencer_ValidatePlacement_5A62A+76j
		mov	byte_7084A, 4

loc_5A6B2:				; CODE XREF: Sequencer_ValidatePlacement_5A62A+21j
					; Sequencer_ValidatePlacement_5A62A+57j ...
		pop	si
		leave
		retf
Sequencer_ValidatePlacement_5A62A	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 0ACh
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, 1
		lea	ax, [bp-0ACh]
		push	ax
		call	StreamReader_ConstructVariantA_63A39
		pop	cx
		mov	word ptr [bp-0ACh], 2C8h
		mov	dword ptr [bp-4Bh], 100h
		mov	dword ptr [bp-4Fh], 0
		mov	word ptr [bp-0ACh], 2E0h
		mov	word ptr [bp-30h], 0
		xor	ax, ax
		mov	[bp-32h], ax
		movsx	eax, ax
		mov	[bp-47h], eax
		push	1
		push	word ptr [bp+8]

loc_5A702:
		lea	ax, [bp-0ACh]
		push	ax
		mov	bx, [bp-0ACh]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		push	large 52494458h
		lea	ax, [bp-0ACh]
		push	ax
		call	ResourceRecord_SeekAndReadB_647B2
		add	sp, 8
		or	ax, ax
		jz	short loc_5A75B
		push	0
		push	large 4F464E49h
		lea	ax, [bp-0ACh]
		push	ax
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_5A750
		lea	ax, [bp-0ACh]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	di, ax

loc_5A750:				; CODE XREF: seg124:0651j
		lea	ax, [bp-0ACh]
		push	ax
		call	ResourceRecord_ReleaseAndClear_64D25
		pop	cx

loc_5A75B:				; CODE XREF: seg124:0638j
		push	large 44494D58h
		lea	ax, [bp-0ACh]
		push	ax
		call	ResourceRecord_SeekAndReadC_6482B
		add	sp, 6
		or	ax, ax
		jnz	short loc_5A775
		jmp	loc_5A832
; ���������������������������������������������������������������������������

loc_5A775:				; CODE XREF: seg124:0680j
		jmp	loc_5A820
; ���������������������������������������������������������������������������

loc_5A778:				; CODE XREF: seg124:0734j
		lea	ax, [bp-0ACh]
		push	ax
		call	ResourceRecord_ComputeRecordBounds_646DB
		pop	cx
		or	ax, ax
		jnz	short loc_5A78A
		jmp	loc_5A809
; ���������������������������������������������������������������������������

loc_5A78A:				; CODE XREF: seg124:0695j
		cmp	dword ptr [bp-3Fh], 44494D58h
		jnz	short loc_5A799
		mov	ax, 1
		jmp	short loc_5A79B
; ���������������������������������������������������������������������������

loc_5A799:				; CODE XREF: seg124:06A2j
		xor	ax, ax

loc_5A79B:				; CODE XREF: seg124:06A7j
		or	ax, ax
		jz	short loc_5A809
		lea	ax, [bp-0ACh]
		push	ax
		call	ResourceRecord_AllocateAndDecode_64C21
		pop	cx
		push	0
		push	large 424D4954h
		lea	ax, [bp-0ACh]
		push	ax
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_5A7FD
		lea	ax, [bp-0ACh]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[bp-4],	ax
		jmp	short loc_5A7F3
; ���������������������������������������������������������������������������

loc_5A7D3:				; CODE XREF: seg124:070Bj
		push	large 2
		push	ss
		lea	ax, [bp-2]
		push	ax
		lea	ax, [bp-0ACh]
		push	ax
		call	ResourceRecord_ReadFieldGroupA_64A19
		add	sp, 0Ah
		push	word ptr [bp-2]
		push	si
		push	cs
		call	near ptr Sequencer_ValidatePlacement_5A62A
		add	sp, 4

loc_5A7F3:				; CODE XREF: seg124:06E1j
		mov	ax, [bp-4]
		dec	word ptr [bp-4]
		or	ax, ax
		jnz	short loc_5A7D3

loc_5A7FD:				; CODE XREF: seg124:06D1j
		lea	ax, [bp-0ACh]
		push	ax

loc_5A802:
		call	ResourceRecord_ReleaseAndClear_64D25
		pop	cx
		dec	di

loc_5A809:				; CODE XREF: seg124:0697j seg124:06ADj
		mov	eax, [bp-36h]
		mov	[bp-47h], eax
		lea	ax, [bp-0ACh]
		push	ax
		call	ResourceRecord_ReadPayload_64DB3
		pop	cx
		or	ax, ax
		jnz	short loc_5A827

loc_5A820:				; CODE XREF: seg124:loc_5A775j
		or	di, di
		jz	short loc_5A827
		jmp	loc_5A778
; ���������������������������������������������������������������������������

loc_5A827:				; CODE XREF: seg124:072Ej seg124:0732j
		lea	ax, [bp-0ACh]
		push	ax
		call	ResourceRecord_ResetIfSet_64D58
		pop	cx

loc_5A832:				; CODE XREF: seg124:0682j
		mov	word ptr [bp-0ACh], 2E0h
		lea	ax, [bp-0ACh]
		push	ax
		call	ResourceRecord_Helper_645A5
		pop	cx
		push	0
		lea	ax, [bp-0ACh]
		push	ax
		call	StreamReader_ReleaseBuffer_65643
		add	sp, 4
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, ferme un objet texte (+0x83 flag) : émet un tag de debug ("SCSCSCFY!") via sub_60303,
; appelle sub_60200 (fermeture), réinitialise le handle. Référencée par TextRenderer_Main
; (seg048) et sub_5ABD1.
; ==============================================================================================
TextObject_CloseAndLog_5A856	proc far		; CODE XREF: seg048:1324P
					; TextObjectCluster_DestructAll_5ABD1+A3P ...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	byte ptr [si+83h], 0
		jz	short loc_5A88C
		mov	al, byte_709A1
		mov	ah, 0
		push	ax
		push	ds
		push	offset aScscscfy ; "SCSCSCFY!"
		push	word ptr [si+4]
		call	ModuleRegistry_CleanupModuleReference_60303
		add	sp, 8
		push	word ptr [si+4]

loc_5A87C:
		call	ModuleRegistry_ReleaseSlotIfSet_60200
		pop	cx
		mov	word ptr [si+4], 0FFFFh
		mov	byte ptr [si+83h], 0

loc_5A88C:				; CODE XREF: TextObject_CloseAndLog_5A856+Cj
		pop	si
		pop	bp
		retf
TextObject_CloseAndLog_5A856	endp

seg124		ends
