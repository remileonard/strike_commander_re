ovr253		segment	para public 'OVERLAY' use16
		assume cs:ovr253
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, aucun appel externe visible (24 lignes).
; ==============================================================================================
MissionRecord_Helper_88050	proc far		; CODE XREF: VROOMM_StubThunk_6B360J MissionRecord_ConstructStream_8809B+5Ep

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	byte ptr [si+4], 0
		mov	word ptr [si+11h], 0
		mov	word ptr [si+13h], 0
		mov	word ptr [si+15h], 0
		mov	dword ptr [si+17h], 0
		mov	word ptr [si+1Bh], 0
		mov	word ptr [si+1Dh], 0
		mov	word ptr [si+1Fh], 0
		mov	word ptr [si+21h], 0
		mov	dword ptr [si+23h], 0
		mov	word ptr [si+27h], 0
		mov	word ptr [si+29h], 0
		pop	si
		pop	bp
		retf
MissionRecord_Helper_88050	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, alloue et construit un StreamReader (StreamReader_ConstructVariantA_63A39, seg190).
; ==============================================================================================
MissionRecord_ConstructStream_8809B	proc far		; CODE XREF: VROOMM_StubThunk_6B35BJ

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= byte ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_880B5
		push	0D4h ; '�'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_88115

loc_880B5:				; CODE XREF: MissionRecord_ConstructStream_8809B+9j
		mov	ax, si
		add	ax, 0Dh
		mov	ax, si
		add	ax, 2Ch	; ','
		push	ax

loc_880C0:
		call	StreamReader_ConstructVariantA_63A39
		pop	cx

loc_880C6:
		mov	word ptr [si+2Ch], 2C8h

loc_880CB:
		mov	dword ptr [si+8Dh], 100h
		mov	dword ptr [si+89h], 0
		mov	word ptr [si+2Ch], 2E0h
		mov	word ptr [si+0A8h], 0
		xor	ax, ax
		mov	[si+0A6h], ax
		movsx	eax, ax
		mov	[si+91h], eax
		push	si
		push	cs
		call	near ptr MissionRecord_Helper_88050
		pop	cx
		mov	ax, [bp+arg_2]
		mov	[si+2],	ax
		mov	ax, [bp+arg_4]
		mov	[si], ax
		mov	al, [bp+arg_6]
		push	ax
		push	si
		nop
		push	cs
		call	near ptr MissionRecord_LoadAndDecodeMain_88206
		add	sp, 4

loc_88115:				; CODE XREF: MissionRecord_ConstructStream_8809B+18j
		mov	ax, si
		pop	si
		pop	bp
		retf
MissionRecord_ConstructStream_8809B	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, libère 3 blocs typés (Memory_TypedFree_5C7B6 ×3).
; ==============================================================================================
MissionRecord_ReleaseTriple_8811A	proc far		; CODE XREF: VROOMM_StubThunk_6B37EJ
					; MissionRecord_ReleaseStreamAndDestruct_894F3:loc_89504p

var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	word ptr [si+11h], 0
		jz	short loc_8813C
		push	3
		push	word ptr [si+11h]
		mov	bx, [si+11h]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short $+2

loc_8813C:				; CODE XREF: MissionRecord_ReleaseTriple_8811A+Fj
		mov	word ptr [si+11h], 0
		mov	eax, [si+23h]
		mov	[bp+var_4], eax
		xor	di, di
		jmp	short loc_8817B
; ���������������������������������������������������������������������������

loc_8814D:				; CODE XREF: MissionRecord_ReleaseTriple_8811A+64j
		les	bx, [bp+var_4]
		cmp	dword ptr es:[bx], 0
		jz	short loc_8816B
		push	3
		push	large dword ptr	es:[bx]
		les	bx, es:[bx]
		mov	bx, es:[bx]
		call	dword ptr [bx+0Ch]
		add	sp, 6
		jmp	short $+2

loc_8816B:				; CODE XREF: MissionRecord_ReleaseTriple_8811A+3Bj
		les	bx, [bp+var_4]
		mov	dword ptr es:[bx], 0
		inc	di
		add	word ptr [bp+var_4], 4

loc_8817B:				; CODE XREF: MissionRecord_ReleaseTriple_8811A+31j
		cmp	[si+1Bh], di
		jg	short loc_8814D
		mov	eax, [si+17h]
		mov	[bp+var_8], eax
		xor	di, di
		jmp	short loc_881C3
; ���������������������������������������������������������������������������

loc_8818C:				; CODE XREF: MissionRecord_ReleaseTriple_8811A+ACj
		les	bx, [bp+var_8]
		cmp	dword ptr es:[bx], 0
		jz	short loc_881B3
		mov	eax, es:[bx]
		mov	[bp+var_C], eax
		push	0
		push	2
		lea	ax, [bp+var_C]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_881B3:				; CODE XREF: MissionRecord_ReleaseTriple_8811A+7Aj
		les	bx, [bp+var_8]
		mov	dword ptr es:[bx], 0
		inc	di
		add	word ptr [bp+var_8], 4

loc_881C3:				; CODE XREF: MissionRecord_ReleaseTriple_8811A+70j
		cmp	[si+15h], di
		jg	short loc_8818C
		push	0
		push	2
		mov	ax, si
		add	ax, 23h	; '#'
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		mov	dword ptr [si+23h], 0
		push	0
		push	2
		mov	ax, si
		add	ax, 17h
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		mov	dword ptr [si+17h], 0
		pop	di
		pop	si
		leave
		retf
MissionRecord_ReleaseTriple_8811A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⭐⚠️ far, 697 lignes, NON DÉTAILLÉE — combine Path_ResolveDataFile,
; ResourceRecord_AllocateAndDecode_64C21/SeekAndReadB_647B2 (seg193, répétés) — chargement et
; décodage principal d'un enregistrement de mission. Candidat prioritaire pour session dédiée.
; ==============================================================================================
MissionRecord_LoadAndDecodeMain_88206	proc far		; CODE XREF: VROOMM_StubThunk_6B365J MissionRecord_ConstructStream_8809B+74p

var_60		= word ptr -60h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 60h
		push	si
		mov	si, [bp+arg_0]
		push	seg seg215
		push	offset a_iff	; ".IFF"
		push	ds
		push	offset aHud	; "HUD"
		push	ds
		push	offset aObjects_0 ; "OBJECTS"
		lea	ax, [bp+var_60]
		push	ax
		call	Path_ResolveDataFile
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_60]
		push	ax
		mov	ax, si
		add	ax, 2Ch	; ','
		push	ax
		mov	bx, [si+2Ch]
		call	dword ptr [bx+14h]
		add	sp, 6
		mov	ah, 0
		or	ax, ax
		jnz	short loc_8824E	; REAL
		push	7007h
		call	VROOMM_StubThunk_6B70F
		pop	cx

loc_8824E:				; CODE XREF: MissionRecord_LoadAndDecodeMain_88206+3Dj
		cmp	dword ptr [si+99h], 'LAER' ; REAL
		jnz	short loc_8825E
		mov	ax, 1
		jmp	short loc_88260
; ���������������������������������������������������������������������������

loc_8825E:				; CODE XREF: MissionRecord_LoadAndDecodeMain_88206+51j
		xor	ax, ax

loc_88260:				; CODE XREF: MissionRecord_LoadAndDecodeMain_88206+56j
		or	ax, ax
		jz	short loc_8829C
		mov	ax, si
		add	ax, 2Ch	; ','
		push	ax
		call	ResourceRecord_AllocateAndDecode_64C21
		pop	cx
		push	0
		push	large 'DUHC'    ; CHUD
		mov	ax, si
		add	ax, 2Ch	; ','
		push	ax
		call	ResourceRecord_SeekAndReadB_647B2
		add	sp, 8
		or	ax, ax
		jz	short loc_88297
		mov	ax, si
		add	ax, 2Ch	; ','
		push	ax
		call	ResourceRecord_AllocateAndDecode_64C21
		jmp	short loc_882A4
; ���������������������������������������������������������������������������

loc_88297:				; CODE XREF: MissionRecord_LoadAndDecodeMain_88206+82j
		push	7008h
		jmp	short loc_8829F
; ���������������������������������������������������������������������������

loc_8829C:				; CODE XREF: MissionRecord_LoadAndDecodeMain_88206+5Cj
		push	7009h

loc_8829F:				; CODE XREF: MissionRecord_LoadAndDecodeMain_88206+94j
		call	VROOMM_StubThunk_6B70F

loc_882A4:				; CODE XREF: MissionRecord_LoadAndDecodeMain_88206+8Fj
		pop	cx
		cmp	[bp+arg_2], 0
		jnz	short loc_882B5
		push	0
		push	large 'GRAL'    ; LARG
		jmp	short loc_882BD
; ���������������������������������������������������������������������������

loc_882B5:				; CODE XREF: MissionRecord_LoadAndDecodeMain_88206+A3j
		push	0
		push	large 'LAMS'    ; SMAL

loc_882BD:				; CODE XREF: MissionRecord_LoadAndDecodeMain_88206+ADj
		mov	ax, si
		add	ax, 2Ch	; ','
		push	ax
		call	ResourceRecord_SeekAndReadB_647B2
		add	sp, 8
		push	0
		push	large 'FNIH'    ; HINF

loc_882D3:
		mov	ax, si
		add	ax, 2Ch	; ','
		push	ax
		call	ResourceRecord_SeekAndReadB_647B2
		add	sp, 8
		or	ax, ax
		jz	short loc_882F4
		mov	ax, si
		add	ax, 2Ch	; ','
		push	ax
		push	si
		nop
		push	cs
		call	near ptr MissionRecord_LoadFieldGroupSequence_8939A
		add	sp, 4

loc_882F4:				; CODE XREF: MissionRecord_LoadAndDecodeMain_88206+DDj
		mov	ax, si
		add	ax, 2Ch	; ','
		push	ax
		push	si
		nop
		push	cs
		call	near ptr MissionRecord_LoadSubrecords_88894
		add	sp, 4
		or	ax, dx
		jnz	short loc_8830A
		jmp	loc_8881D
; ���������������������������������������������������������������������������

loc_8830A:				; CODE XREF: MissionRecord_LoadAndDecodeMain_88206+FFj
		mov	eax, [si+23h]
		mov	[bp+var_8], eax
		push	0
		push	large 'DDAL'    ; LADD
		mov	ax, si
		add	ax, 2Ch	; ','
		push	ax
		call	ResourceRecord_SeekAndReadB_647B2
		add	sp, 8
		or	ax, ax
		jnz	short loc_8832F
		jmp	loc_883E9
; ���������������������������������������������������������������������������

loc_8832F:				; CODE XREF: MissionRecord_LoadAndDecodeMain_88206+124j
		mov	[bp+var_C], 0
		mov	[bp+var_10], 0
		push	0
		push	large 'TCEV'    ; TCEV
		mov	ax, si
		add	ax, 2Ch	; ','
		push	ax
		call	ResourceRecord_SeekAndReadB_647B2
		add	sp, 8
		or	ax, ax
		jz	short loc_8838C
		mov	ax, si
		add	ax, 2Ch	; ','
		push	ax
		push	si
		push	large 0
		call	VROOMM_StubThunk_6B3E2
		add	sp, 8
		mov	word ptr [bp+var_C+2], dx
		mov	word ptr [bp+var_C], ax
		les	bx, [bp+var_8]
		mov	eax, [bp+var_C]
		mov	es:[bx], eax
		add	word ptr [bp+var_8], 4
		mov	ax, si
		add	ax, 2Ch	; ','
		push	ax
		call	ResourceRecord_ReleaseAndClear_64D25
		pop	cx

loc_8838C:				; CODE XREF: MissionRecord_LoadAndDecodeMain_88206+151j
		push	0
		push	large 'DDAL'    ; LADD
		mov	ax, si
		add	ax, 2Ch	; ','
		push	ax
		call	ResourceRecord_SeekAndReadB_647B2
		add	sp, 8
		or	ax, ax
		jz	short loc_883DD
		push	large [bp+var_C]
		mov	ax, si
		add	ax, 2Ch	; ','
		push	ax
		push	si
		push	large 0
		call	VROOMM_StubThunk_6B545
		add	sp, 0Ch
		mov	word ptr [bp+var_10+2],	dx
		mov	word ptr [bp+var_10], ax
		mov	ax, si

loc_883C4:
		add	ax, 2Ch	; ','
		push	ax
		call	ResourceRecord_ReleaseAndClear_64D25
		pop	cx
		les	bx, [bp+var_8]
		mov	eax, [bp+var_10]
		mov	es:[bx], eax
		add	word ptr [bp+var_8], 4

loc_883DD:				; CODE XREF: MissionRecord_LoadAndDecodeMain_88206+19Ej
		mov	ax, si
		add	ax, 2Ch	; ','
		push	ax
		call	ResourceRecord_ReleaseAndClear_64D25
		pop	cx

loc_883E9:				; CODE XREF: MissionRecord_LoadAndDecodeMain_88206+126j
		push	0
		push	large 'ITLA'    ; ALTI
		mov	ax, si
		add	ax, 2Ch	; ','
		push	ax
		call	ResourceRecord_SeekAndReadB_647B2
		add	sp, 8
		or	ax, ax
		jz	short loc_88436
		mov	ax, si
		add	ax, 2Ch	; ','
		push	ax
		push	si
		push	large 0
		call	VROOMM_StubThunk_6B3E7
		add	sp, 8
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		mov	ax, si
		add	ax, 2Ch	; ','
		push	ax
		call	ResourceRecord_ReleaseAndClear_64D25
		pop	cx
		les	bx, [bp+var_8]
		mov	eax, [bp+var_4]
		mov	es:[bx], eax
		add	word ptr [bp+var_8], 4

loc_88436:				; CODE XREF: MissionRecord_LoadAndDecodeMain_88206+1FBj
		push	0
		push	large 'DPSA'    ; ASPD
		mov	ax, si
		add	ax, 2Ch	; ','
		push	ax
		call	ResourceRecord_SeekAndReadB_647B2
		add	sp, 8
		or	ax, ax
		jz	short loc_88483
		mov	ax, si
		add	ax, 2Ch	; ','
		push	ax
		push	si
		push	large 0
		call	VROOMM_StubThunk_6B3EC
		add	sp, 8
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		mov	ax, si
		add	ax, 2Ch	; ','
		push	ax
		call	ResourceRecord_ReleaseAndClear_64D25
		pop	cx
		les	bx, [bp+var_8]
		mov	eax, [bp+var_4]
		mov	es:[bx], eax
		add	word ptr [bp+var_8], 4

loc_88483:				; CODE XREF: MissionRecord_LoadAndDecodeMain_88206+248j
		push	0
		push	large 'DAEH'    ; HEAD
		mov	ax, si
		add	ax, 2Ch	; ','
		push	ax
		call	ResourceRecord_SeekAndReadB_647B2
		add	sp, 8
		or	ax, ax
		jz	short loc_884D0
		mov	ax, si
		add	ax, 2Ch	; ','
		push	ax
		push	si
		push	large 0
		call	VROOMM_StubThunk_6B3DD
		add	sp, 8
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		mov	ax, si
		add	ax, 2Ch	; ','
		push	ax
		call	ResourceRecord_ReleaseAndClear_64D25
		pop	cx
		les	bx, [bp+var_8]

loc_884C4:
		mov	eax, [bp+var_4]
		mov	es:[bx], eax
		add	word ptr [bp+var_8], 4

loc_884D0:				; CODE XREF: MissionRecord_LoadAndDecodeMain_88206+295j
		push	0
		push	large 'LLOC'    ; COLL
		mov	ax, si
		add	ax, 2Ch	; ','
		push	ax
		call	ResourceRecord_SeekAndReadB_647B2
		add	sp, 8
		or	ax, ax
		jz	short loc_8851D
		mov	ax, si
		add	ax, 2Ch	; ','
		push	ax
		push	si
		push	large 0
		call	VROOMM_StubThunk_6B3F1
		add	sp, 8
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		mov	ax, si
		add	ax, 2Ch	; ','
		push	ax
		call	ResourceRecord_ReleaseAndClear_64D25
		pop	cx
		les	bx, [bp+var_8]
		mov	eax, [bp+var_4]
		mov	es:[bx], eax
		add	word ptr [bp+var_8], 4

loc_8851D:				; CODE XREF: MissionRecord_LoadAndDecodeMain_88206+2E2j
		push	0
		push	large 'LATS'    ; STAL
		mov	ax, si
		add	ax, 2Ch	; ','
		push	ax
		call	ResourceRecord_SeekAndReadB_647B2
		add	sp, 8
		or	ax, ax
		jz	short loc_8856A
		mov	ax, si
		add	ax, 2Ch	; ','
		push	ax
		push	si
		push	large 0
		call	VROOMM_StubThunk_6B3F6
		add	sp, 8
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		mov	ax, si
		add	ax, 2Ch	; ','
		push	ax
		call	ResourceRecord_ReleaseAndClear_64D25
		pop	cx
		les	bx, [bp+var_8]
		mov	eax, [bp+var_4]
		mov	es:[bx], eax
		add	word ptr [bp+var_8], 4

loc_8856A:				; CODE XREF: MissionRecord_LoadAndDecodeMain_88206+32Fj
		push	0
		push	large 'LEUF'    ; FUEL
		mov	ax, si
		add	ax, 2Ch	; ','
		push	ax
		call	ResourceRecord_SeekAndReadB_647B2
		add	sp, 8
		or	ax, ax
		jz	short loc_885B7
		mov	ax, si
		add	ax, 2Ch	; ','
		push	ax
		push	si
		push	large 0
		call	VROOMM_StubThunk_6B3FB
		add	sp, 8
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		mov	ax, si
		add	ax, 2Ch	; ','
		push	ax
		call	ResourceRecord_ReleaseAndClear_64D25
		pop	cx
		les	bx, [bp+var_8]
		mov	eax, [bp+var_4]
		mov	es:[bx], eax
		add	word ptr [bp+var_8], 4

loc_885B7:				; CODE XREF: MissionRecord_LoadAndDecodeMain_88206+37Cj
		push	0
		push	large 'SOCL'    ; LCOS
		mov	ax, si
		add	ax, 2Ch	; ','
		push	ax
		call	ResourceRecord_SeekAndReadB_647B2
		add	sp, 8
		or	ax, ax
		jz	short loc_88604
		mov	ax, si
		add	ax, 2Ch	; ','
		push	ax
		push	si
		push	large 0
		call	VROOMM_StubThunk_6B47A
		add	sp, 8
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		mov	ax, si
		add	ax, 2Ch	; ','
		push	ax
		call	ResourceRecord_ReleaseAndClear_64D25
		pop	cx
		les	bx, [bp+var_8]
		mov	eax, [bp+var_4]
		mov	es:[bx], eax
		add	word ptr [bp+var_8], 4

loc_88604:				; CODE XREF: MissionRecord_LoadAndDecodeMain_88206+3C9j
		push	0
		push	large 'GRAT'    ; TARG
		mov	ax, si
		add	ax, 2Ch	; ','
		push	ax
		call	ResourceRecord_SeekAndReadB_647B2
		add	sp, 8
		or	ax, ax
		jz	short loc_88651
		mov	ax, si
		add	ax, 2Ch	; ','
		push	ax
		push	si
		push	large 0
		call	far ptr	VROOMM_StubThunk_6B475
		add	sp, 8
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		mov	ax, si
		add	ax, 2Ch	; ','
		push	ax
		call	ResourceRecord_ReleaseAndClear_64D25
		pop	cx
		les	bx, [bp+var_8]
		mov	eax, [bp+var_4]
		mov	es:[bx], eax
		add	word ptr [bp+var_8], 4

loc_88651:				; CODE XREF: MissionRecord_LoadAndDecodeMain_88206+416j
		push	0
		push	large 'DSIM'    ; MISD
		mov	ax, si
		add	ax, 2Ch	; ','
		push	ax
		call	ResourceRecord_SeekAndReadB_647B2
		add	sp, 8
		or	ax, ax
		jz	short loc_8869E
		mov	ax, si
		add	ax, 2Ch	; ','
		push	ax
		push	si
		push	large 0
		call	VROOMM_StubThunk_6B47F
		add	sp, 8
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		mov	ax, si
		add	ax, 2Ch	; ','
		push	ax
		call	ResourceRecord_ReleaseAndClear_64D25
		pop	cx
		les	bx, [bp+var_8]
		mov	eax, [bp+var_4]
		mov	es:[bx], eax
		add	word ptr [bp+var_8], 4

loc_8869E:				; CODE XREF: MissionRecord_LoadAndDecodeMain_88206+463j
		push	0
		push	large 'CRIC'    ; CIRC
		mov	ax, si
		add	ax, 2Ch	; ','
		push	ax
		call	ResourceRecord_SeekAndReadB_647B2
		add	sp, 8
		or	ax, ax
		jz	short loc_886EB
		mov	ax, si
		add	ax, 2Ch	; ','
		push	ax
		push	si
		push	large 0
		call	VROOMM_StubThunk_6B484
		add	sp, 8
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		mov	ax, si
		add	ax, 2Ch	; ','
		push	ax
		call	ResourceRecord_ReleaseAndClear_64D25
		pop	cx
		les	bx, [bp+var_8]
		mov	eax, [bp+var_4]
		mov	es:[bx], eax
		add	word ptr [bp+var_8], 4

loc_886EB:				; CODE XREF: MissionRecord_LoadAndDecodeMain_88206+4B0j
		push	0
		push	large 'SORC'    ; CROS
		mov	ax, si
		add	ax, 2Ch	; ','
		push	ax
		call	ResourceRecord_SeekAndReadB_647B2
		add	sp, 8
		or	ax, ax
		jz	short loc_88738
		mov	ax, si
		add	ax, 2Ch	; ','
		push	ax
		push	si
		push	large 0
		call	VROOMM_StubThunk_6B49D
		add	sp, 8
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		mov	ax, si
		add	ax, 2Ch	; ','
		push	ax
		call	ResourceRecord_ReleaseAndClear_64D25
		pop	cx
		les	bx, [bp+var_8]
		mov	eax, [bp+var_4]
		mov	es:[bx], eax
		add	word ptr [bp+var_8], 4

loc_88738:				; CODE XREF: MissionRecord_LoadAndDecodeMain_88206+4FDj
		push	0
		push	large 'PICC'    ; CCIP
		mov	ax, si
		add	ax, 2Ch	; ','
		push	ax
		call	ResourceRecord_SeekAndReadB_647B2
		add	sp, 8
		or	ax, ax
		jz	short loc_88785
		mov	ax, si
		add	ax, 2Ch	; ','
		push	ax
		push	si
		push	large 0
		call	VROOMM_StubThunk_6B489
		add	sp, 8
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		mov	ax, si
		add	ax, 2Ch	; ','
		push	ax
		call	ResourceRecord_ReleaseAndClear_64D25
		pop	cx
		les	bx, [bp+var_8]
		mov	eax, [bp+var_4]
		mov	es:[bx], eax
		add	word ptr [bp+var_8], 4

loc_88785:				; CODE XREF: MissionRecord_LoadAndDecodeMain_88206+54Aj
		push	0
		push	large 'PRCC'    ; CCRP
		mov	ax, si
		add	ax, 2Ch	; ','
		push	ax
		call	ResourceRecord_SeekAndReadB_647B2
		add	sp, 8
		or	ax, ax
		jz	short loc_887D2
		mov	ax, si
		add	ax, 2Ch	; ','
		push	ax
		push	si
		push	large 0
		call	VROOMM_StubThunk_6B493
		add	sp, 8
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		mov	ax, si
		add	ax, 2Ch	; ','
		push	ax
		call	ResourceRecord_ReleaseAndClear_64D25
		pop	cx
		les	bx, [bp+var_8]
		mov	eax, [bp+var_4]
		mov	es:[bx], eax
		add	word ptr [bp+var_8], 4

loc_887D2:				; CODE XREF: MissionRecord_LoadAndDecodeMain_88206+597j
		push	0
		push	large 'FRTS'    ; STRF
		mov	ax, si
		add	ax, 2Ch	; ','
		push	ax
		call	ResourceRecord_SeekAndReadB_647B2
		add	sp, 8
		or	ax, ax
		jz	short loc_88826
		mov	ax, si
		add	ax, 2Ch	; ','
		push	ax
		push	si
		push	large 0
		call	VROOMM_StubThunk_6B4A2
		add	sp, 8
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		mov	ax, si
		add	ax, 2Ch	; ','
		push	ax
		call	ResourceRecord_ReleaseAndClear_64D25
		pop	cx
		les	bx, [bp+var_8]
		mov	eax, [bp+var_4]
		mov	es:[bx], eax
		jmp	short loc_88826
; ���������������������������������������������������������������������������

loc_8881D:				; CODE XREF: MissionRecord_LoadAndDecodeMain_88206+101j
		push	700Ah
		call	VROOMM_StubThunk_6B70F
		pop	cx

loc_88826:				; CODE XREF: MissionRecord_LoadAndDecodeMain_88206+5E4j
					; MissionRecord_LoadAndDecodeMain_88206+615j
		push	0
		push	large 'GATT'    ; TTAG
		mov	ax, si
		add	ax, 2Ch	; ','
		push	ax
		call	ResourceRecord_SeekAndReadB_647B2
		add	sp, 8
		or	ax, ax
		jz	short loc_88879
		mov	ax, si
		add	ax, 2Ch	; ','
		push	ax
		push	si
		nop
		push	cs
		call	near ptr MissionRecord_LoadFieldSequence_88B02
		add	sp, 4
		or	ax, dx
		jz	short loc_88864
		mov	ax, si
		add	ax, 2Ch	; ','
		push	ax
		push	si
		nop
		push	cs
		call	near ptr MissionRecord_LoadWithStringConstruct_88CAD
		add	sp, 4
		jmp	short loc_8886D
; ���������������������������������������������������������������������������

loc_88864:				; CODE XREF: MissionRecord_LoadAndDecodeMain_88206+64Bj
		push	700Bh
		call	VROOMM_StubThunk_6B70F
		pop	cx

loc_8886D:				; CODE XREF: MissionRecord_LoadAndDecodeMain_88206+65Cj
		mov	ax, si
		add	ax, 2Ch	; ','
		push	ax
		call	ResourceRecord_ReleaseAndClear_64D25
		pop	cx

loc_88879:				; CODE XREF: MissionRecord_LoadAndDecodeMain_88206+638j
		mov	ax, si
		add	ax, 2Ch	; ','
		push	ax
		call	ResourceRecord_ReleaseAndClear_64D25
		pop	cx
		mov	ax, si
		add	ax, 2Ch	; ','
		push	ax
		call	ResourceRecord_Helper_645A5
		pop	cx
		pop	si
		leave
		retf
MissionRecord_LoadAndDecodeMain_88206	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 262 lignes, NON DÉTAILLÉE — combine
; ResourceRecord_SeekAndReadB_647B2/ReleaseAndClear_64D25 répétés — chargement de sous-
; enregistrements de mission.
; ==============================================================================================
MissionRecord_LoadSubrecords_88894	proc far		; CODE XREF: VROOMM_StubThunk_6B36AJ MissionRecord_LoadAndDecodeMain_88206+F7p

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	word ptr [si+1Dh], 0
		mov	word ptr [si+1Fh], 0
		mov	word ptr [si+21h], 0
		push	0
		push	large 'DDAL'    ; LADD
		push	di
		call	ResourceRecord_SeekAndReadB_647B2
		add	sp, 8
		or	ax, ax
		jz	short loc_88908
		push	0
		push	large 'TCEV'    ; TCEV
		push	di
		call	ResourceRecord_SeekAndReadB_647B2
		add	sp, 8
		or	ax, ax
		jz	short loc_888E2
		inc	word ptr [si+1Dh]
		push	di
		call	ResourceRecord_ReleaseAndClear_64D25
		pop	cx

loc_888E2:				; CODE XREF: MissionRecord_LoadSubrecords_88894+42j
		push	0
		push	large 'DDAL'    ; LADD
		push	di
		call	ResourceRecord_SeekAndReadB_647B2
		add	sp, 8
		or	ax, ax
		jz	short loc_88901
		inc	word ptr [si+1Dh]
		push	di
		call	ResourceRecord_ReleaseAndClear_64D25
		pop	cx

loc_88901:				; CODE XREF: MissionRecord_LoadSubrecords_88894+61j
		push	di
		call	ResourceRecord_ReleaseAndClear_64D25
		pop	cx

loc_88908:				; CODE XREF: MissionRecord_LoadSubrecords_88894+2Dj
		push	0
		push	large 'ITLA'    ; ALTI
		push	di
		call	ResourceRecord_SeekAndReadB_647B2
		add	sp, 8
		or	ax, ax
		jz	short loc_88927
		inc	word ptr [si+1Dh]
		push	di
		call	ResourceRecord_ReleaseAndClear_64D25
		pop	cx

loc_88927:				; CODE XREF: MissionRecord_LoadSubrecords_88894+87j
		push	0
		push	large 'DPSA'    ; ASPD
		push	di
		call	ResourceRecord_SeekAndReadB_647B2
		add	sp, 8
		or	ax, ax
		jz	short loc_88946
		inc	word ptr [si+1Dh]
		push	di
		call	ResourceRecord_ReleaseAndClear_64D25
		pop	cx

loc_88946:				; CODE XREF: MissionRecord_LoadSubrecords_88894+A6j
		push	0
		push	large 'DAEH'    ; HEAD
		push	di
		call	ResourceRecord_SeekAndReadB_647B2
		add	sp, 8
		or	ax, ax
		jz	short loc_88965
		inc	word ptr [si+1Dh]
		push	di
		call	ResourceRecord_ReleaseAndClear_64D25
		pop	cx

loc_88965:				; CODE XREF: MissionRecord_LoadSubrecords_88894+C5j
		push	0
		push	large 'LLOC'    ; COLL
		push	di
		call	ResourceRecord_SeekAndReadB_647B2
		add	sp, 8
		or	ax, ax
		jz	short loc_88984
		inc	word ptr [si+1Dh]
		push	di
		call	ResourceRecord_ReleaseAndClear_64D25
		pop	cx

loc_88984:				; CODE XREF: MissionRecord_LoadSubrecords_88894+E4j
		push	0
		push	large 'LATS'    ; STAL
		push	di
		call	ResourceRecord_SeekAndReadB_647B2
		add	sp, 8
		or	ax, ax
		jz	short loc_889A3
		inc	word ptr [si+1Dh]
		push	di
		call	ResourceRecord_ReleaseAndClear_64D25
		pop	cx

loc_889A3:				; CODE XREF: MissionRecord_LoadSubrecords_88894+103j
		push	0
		push	large 'LEUF'    ; FUEL
		push	di
		call	ResourceRecord_SeekAndReadB_647B2
		add	sp, 8
		or	ax, ax
		jz	short loc_889C2
		inc	word ptr [si+1Dh]
		push	di
		call	ResourceRecord_ReleaseAndClear_64D25
		pop	cx

loc_889C2:				; CODE XREF: MissionRecord_LoadSubrecords_88894+122j
		push	0
		push	large 'SOCL'    ; LCOS
		push	di
		call	ResourceRecord_SeekAndReadB_647B2
		add	sp, 8
		or	ax, ax
		jz	short loc_889E1
		inc	word ptr [si+1Fh]
		push	di
		call	ResourceRecord_ReleaseAndClear_64D25
		pop	cx

loc_889E1:				; CODE XREF: MissionRecord_LoadSubrecords_88894+141j
		push	0
		push	large 'GRAT'    ; TARG
		push	di
		call	ResourceRecord_SeekAndReadB_647B2
		add	sp, 8
		or	ax, ax
		jz	short loc_88A00
		inc	word ptr [si+1Fh]
		push	di
		call	ResourceRecord_ReleaseAndClear_64D25
		pop	cx

loc_88A00:				; CODE XREF: MissionRecord_LoadSubrecords_88894+160j
		push	0
		push	large 'DSIM'    ; MISD
		push	di
		call	ResourceRecord_SeekAndReadB_647B2
		add	sp, 8
		or	ax, ax
		jz	short loc_88A1F
		inc	word ptr [si+1Fh]
		push	di
		call	ResourceRecord_ReleaseAndClear_64D25
		pop	cx

loc_88A1F:				; CODE XREF: MissionRecord_LoadSubrecords_88894+17Fj
		push	0
		push	large 'CRIC'    ; CIRC
		push	di
		call	ResourceRecord_SeekAndReadB_647B2
		add	sp, 8
		or	ax, ax
		jz	short loc_88A3E
		inc	word ptr [si+1Fh]
		push	di
		call	ResourceRecord_ReleaseAndClear_64D25
		pop	cx

loc_88A3E:				; CODE XREF: MissionRecord_LoadSubrecords_88894+19Ej
		push	0
		push	large 'SORC'    ; CROS
		push	di
		call	ResourceRecord_SeekAndReadB_647B2
		add	sp, 8
		or	ax, ax
		jz	short loc_88A5D
		inc	word ptr [si+21h]
		push	di
		call	ResourceRecord_ReleaseAndClear_64D25
		pop	cx

loc_88A5D:				; CODE XREF: MissionRecord_LoadSubrecords_88894+1BDj
		push	0
		push	large 'PICC'    ; CCIP
		push	di
		call	ResourceRecord_SeekAndReadB_647B2
		add	sp, 8
		or	ax, ax
		jz	short loc_88A7C
		inc	word ptr [si+21h]
		push	di
		call	ResourceRecord_ReleaseAndClear_64D25
		pop	cx

loc_88A7C:				; CODE XREF: MissionRecord_LoadSubrecords_88894+1DCj
		push	0
		push	large 'PRCC'    ; CCRP
		push	di
		call	ResourceRecord_SeekAndReadB_647B2
		add	sp, 8
		or	ax, ax
		jz	short loc_88A9B
		inc	word ptr [si+21h]
		push	di
		call	ResourceRecord_ReleaseAndClear_64D25
		pop	cx

loc_88A9B:				; CODE XREF: MissionRecord_LoadSubrecords_88894+1FBj
		push	0
		push	large 'FRTS'    ; STRF
		push	di
		call	ResourceRecord_SeekAndReadB_647B2
		add	sp, 8
		or	ax, ax
		jz	short loc_88ABA
		inc	word ptr [si+21h]
		push	di
		call	ResourceRecord_ReleaseAndClear_64D25
		pop	cx

loc_88ABA:				; CODE XREF: MissionRecord_LoadSubrecords_88894+21Aj
		mov	ax, [si+1Dh]
		add	ax, [si+1Fh]
		add	ax, [si+21h]
		mov	[si+1Bh], ax
		mov	ax, [si+1Dh]
		mov	[si+27h], ax
		mov	ax, [si+27h]
		add	ax, [si+1Fh]
		mov	[si+29h], ax
		push	1
		push	0
		push	2
		mov	ax, [si+1Bh]
		shl	ax, 2
		movzx	eax, ax
		push	eax
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	[si+25h], dx
		mov	[si+23h], ax
		mov	dx, [si+25h]
		mov	ax, [si+23h]
		pop	di
		pop	si
		pop	bp
		retf
MissionRecord_LoadSubrecords_88894	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 185 lignes, NON DÉTAILLÉE — combine ResourceRecord_SeekAndRead_64743 répété (5+
; fois).
; ==============================================================================================
MissionRecord_LoadFieldSequence_88B02	proc far		; CODE XREF: VROOMM_StubThunk_6B36FJ MissionRecord_LoadAndDecodeMain_88206+643p

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	word ptr [si+15h], 0
		push	0
		push	large 'RSLC'
		push	di
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_88B2A
		inc	word ptr [si+15h]

loc_88B2A:				; CODE XREF: MissionRecord_LoadFieldSequence_88B02+23j
		push	0
		push	large 'GRAT'
		push	di
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_88B42
		inc	word ptr [si+15h]

loc_88B42:				; CODE XREF: MissionRecord_LoadFieldSequence_88B02+3Bj
		push	0
		push	large 'WMUN'
		push	di
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_88B5A
		inc	word ptr [si+15h]

loc_88B5A:				; CODE XREF: MissionRecord_LoadFieldSequence_88B02+53j
		push	0
		push	large 'MDUH'
		push	di
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_88B72
		inc	word ptr [si+15h]

loc_88B72:				; CODE XREF: MissionRecord_LoadFieldSequence_88B02+6Bj
		push	0
		push	large 'CRFG'
		push	di
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_88B8A
		inc	word ptr [si+15h]

loc_88B8A:				; CODE XREF: MissionRecord_LoadFieldSequence_88B02+83j
		push	0
		push	large 'GXAM'
		push	di
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_88BA2
		inc	word ptr [si+15h]

loc_88BA2:				; CODE XREF: MissionRecord_LoadFieldSequence_88B02+9Bj
		push	0
		push	large 'HCAM'
		push	di
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_88BBA
		inc	word ptr [si+15h]

loc_88BBA:				; CODE XREF: MissionRecord_LoadFieldSequence_88B02+B3j
		push	0
		push	large 'PYAW'
		push	di
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_88BD2
		inc	word ptr [si+15h]

loc_88BD2:				; CODE XREF: MissionRecord_LoadFieldSequence_88B02+CBj
		push	0
		push	large 'GDNL'
		push	di
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_88BEA
		inc	word ptr [si+15h]

loc_88BEA:				; CODE XREF: MissionRecord_LoadFieldSequence_88B02+E3j
		push	0
		push	large 'PALF'
		push	di
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_88C02
		inc	word ptr [si+15h]

loc_88C02:				; CODE XREF: MissionRecord_LoadFieldSequence_88B02+FBj
		push	0
		push	large 'BDPS'
		push	di
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_88C1A
		inc	word ptr [si+15h]

loc_88C1A:				; CODE XREF: MissionRecord_LoadFieldSequence_88B02+113j
		push	0
		push	large 'TLAR'
		push	di
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_88C32
		inc	word ptr [si+15h]

loc_88C32:				; CODE XREF: MissionRecord_LoadFieldSequence_88B02+12Bj
		push	0
		push	large 'ORHT'
		push	di
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_88C4A
		inc	word ptr [si+15h]

loc_88C4A:				; CODE XREF: MissionRecord_LoadFieldSequence_88B02+143j
		push	0
		push	large 'GNRI'
		push	di
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_88C62
		inc	word ptr [si+15h]

loc_88C62:				; CODE XREF: MissionRecord_LoadFieldSequence_88B02+15Bj
		push	0
		push	large 'ALAC'
		push	di
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_88C7A
		inc	word ptr [si+15h]

loc_88C7A:				; CODE XREF: MissionRecord_LoadFieldSequence_88B02+173j
		cmp	word ptr [si+15h], 0
		jle	short loc_88CA3
		push	1
		push	0
		push	2
		mov	ax, [si+15h]
		shl	ax, 2
		movzx	eax, ax
		push	eax
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	[si+19h], dx
		mov	[si+17h], ax

loc_88CA3:				; CODE XREF: MissionRecord_LoadFieldSequence_88B02+17Cj
		mov	dx, [si+19h]
		mov	ax, [si+17h]
		pop	di
		pop	si
		pop	bp
		retf
MissionRecord_LoadFieldSequence_88B02	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⭐⚠️ far, 729 lignes, NON DÉTAILLÉE — combine ResourceRecord_SeekAndRead_64743, allocateurs
; typés, String_ConstructFromCStr — chargement de mission avec construction de chaînes.
; Candidat pour session dédiée.
; ==============================================================================================
MissionRecord_LoadWithStringConstruct_88CAD	proc far		; CODE XREF: VROOMM_StubThunk_6B374J MissionRecord_LoadAndDecodeMain_88206+656p

var_E		= dword	ptr -0Eh
var_A		= word ptr -0Ah
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 0Eh
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	eax, [si+17h]
		mov	[bp+var_4], eax
		push	0
		push	large 'RSLC'
		push	di
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_88D33
		mov	[bp+var_A], di
		push	1
		push	0
		push	2
		push	large 1Bh
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_E+2], dx
		mov	word ptr [bp+var_E], ax
		or	ax, dx
		jz	short loc_88D18
		push	[bp+var_A]
		push	dx
		push	word ptr [bp+var_E]
		call	String_ConstructFromCStr
		add	sp, 6
		les	bx, [bp+var_E]
		mov	word ptr es:[bx], 0A76h
		mov	dx, word ptr [bp+var_E+2]
		mov	ax, word ptr [bp+var_E]
		jmp	short loc_88D1E
; ���������������������������������������������������������������������������

loc_88D18:				; CODE XREF: MissionRecord_LoadWithStringConstruct_88CAD+4Aj
		mov	dx, word ptr [bp+var_E+2]
		mov	ax, word ptr [bp+var_E]

loc_88D1E:				; CODE XREF: MissionRecord_LoadWithStringConstruct_88CAD+69j
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		les	bx, [bp+var_4]
		mov	eax, [bp+var_8]
		mov	es:[bx], eax
		add	word ptr [bp+var_4], 4

loc_88D33:				; CODE XREF: MissionRecord_LoadWithStringConstruct_88CAD+29j
		push	0
		push	large 'GRAT'
		push	di
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_88DA3
		mov	[bp+var_A], di
		push	1
		push	0
		push	2
		push	large 1Bh
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_E+2], dx
		mov	word ptr [bp+var_E], ax
		or	ax, dx
		jz	short loc_88D88
		push	[bp+var_A]
		push	dx
		push	word ptr [bp+var_E]
		call	String_ConstructFromCStr
		add	sp, 6
		les	bx, [bp+var_E]
		mov	word ptr es:[bx], 0A62h
		mov	dx, word ptr [bp+var_E+2]
		mov	ax, word ptr [bp+var_E]
		jmp	short loc_88D8E
; ���������������������������������������������������������������������������

loc_88D88:				; CODE XREF: MissionRecord_LoadWithStringConstruct_88CAD+BAj
		mov	dx, word ptr [bp+var_E+2]
		mov	ax, word ptr [bp+var_E]

loc_88D8E:				; CODE XREF: MissionRecord_LoadWithStringConstruct_88CAD+D9j
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		les	bx, [bp+var_4]
		mov	eax, [bp+var_8]
		mov	es:[bx], eax
		add	word ptr [bp+var_4], 4

loc_88DA3:				; CODE XREF: MissionRecord_LoadWithStringConstruct_88CAD+99j
		push	0
		push	large 'WMUN'
		push	di
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_88E13
		mov	[bp+var_A], di
		push	1
		push	0
		push	2
		push	large 1Bh
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_E+2], dx
		mov	word ptr [bp+var_E], ax
		or	ax, dx
		jz	short loc_88DF8
		push	[bp+var_A]
		push	dx
		push	word ptr [bp+var_E]
		call	String_ConstructFromCStr
		add	sp, 6
		les	bx, [bp+var_E]
		mov	word ptr es:[bx], 0A4Eh
		mov	dx, word ptr [bp+var_E+2]
		mov	ax, word ptr [bp+var_E]
		jmp	short loc_88DFE
; ���������������������������������������������������������������������������

loc_88DF8:				; CODE XREF: MissionRecord_LoadWithStringConstruct_88CAD+12Aj
		mov	dx, word ptr [bp+var_E+2]
		mov	ax, word ptr [bp+var_E]

loc_88DFE:				; CODE XREF: MissionRecord_LoadWithStringConstruct_88CAD+149j
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		les	bx, [bp+var_4]
		mov	eax, [bp+var_8]
		mov	es:[bx], eax
		add	word ptr [bp+var_4], 4

loc_88E13:				; CODE XREF: MissionRecord_LoadWithStringConstruct_88CAD+109j
		push	0
		push	large 'MDUH'
		push	di
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_88E83
		mov	[bp+var_A], di
		push	1
		push	0
		push	2
		push	large 1Bh
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_E+2], dx
		mov	word ptr [bp+var_E], ax
		or	ax, dx
		jz	short loc_88E68
		push	[bp+var_A]
		push	dx
		push	word ptr [bp+var_E]
		call	String_ConstructFromCStr
		add	sp, 6
		les	bx, [bp+var_E]
		mov	word ptr es:[bx], 0A3Ah
		mov	dx, word ptr [bp+var_E+2]
		mov	ax, word ptr [bp+var_E]
		jmp	short loc_88E6E
; ���������������������������������������������������������������������������

loc_88E68:				; CODE XREF: MissionRecord_LoadWithStringConstruct_88CAD+19Aj
		mov	dx, word ptr [bp+var_E+2]
		mov	ax, word ptr [bp+var_E]

loc_88E6E:				; CODE XREF: MissionRecord_LoadWithStringConstruct_88CAD+1B9j
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		les	bx, [bp+var_4]
		mov	eax, [bp+var_8]
		mov	es:[bx], eax
		add	word ptr [bp+var_4], 4

loc_88E83:				; CODE XREF: MissionRecord_LoadWithStringConstruct_88CAD+179j
		push	0
		push	large 'GNRI'
		push	di
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_88EF3
		mov	[bp+var_A], di
		push	1
		push	0
		push	2
		push	large 1Bh
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_E+2], dx
		mov	word ptr [bp+var_E], ax
		or	ax, dx
		jz	short loc_88ED8
		push	[bp+var_A]
		push	dx
		push	word ptr [bp+var_E]
		call	String_ConstructFromCStr
		add	sp, 6
		les	bx, [bp+var_E]
		mov	word ptr es:[bx], 0A26h
		mov	dx, word ptr [bp+var_E+2]
		mov	ax, word ptr [bp+var_E]
		jmp	short loc_88EDE
; ���������������������������������������������������������������������������

loc_88ED8:				; CODE XREF: MissionRecord_LoadWithStringConstruct_88CAD+20Aj
		mov	dx, word ptr [bp+var_E+2]
		mov	ax, word ptr [bp+var_E]

loc_88EDE:				; CODE XREF: MissionRecord_LoadWithStringConstruct_88CAD+229j
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		les	bx, [bp+var_4]
		mov	eax, [bp+var_8]
		mov	es:[bx], eax
		add	word ptr [bp+var_4], 4

loc_88EF3:				; CODE XREF: MissionRecord_LoadWithStringConstruct_88CAD+1E9j
		push	0
		push	large 'CRFG'
		push	di
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_88F63
		mov	[bp+var_A], di
		push	1
		push	0
		push	2
		push	large 1Bh
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_E+2], dx
		mov	word ptr [bp+var_E], ax
		or	ax, dx
		jz	short loc_88F48
		push	[bp+var_A]
		push	dx
		push	word ptr [bp+var_E]
		call	String_ConstructFromCStr
		add	sp, 6
		les	bx, [bp+var_E]
		mov	word ptr es:[bx], 0A12h
		mov	dx, word ptr [bp+var_E+2]
		mov	ax, word ptr [bp+var_E]
		jmp	short loc_88F4E
; ���������������������������������������������������������������������������

loc_88F48:				; CODE XREF: MissionRecord_LoadWithStringConstruct_88CAD+27Aj
		mov	dx, word ptr [bp+var_E+2]
		mov	ax, word ptr [bp+var_E]

loc_88F4E:				; CODE XREF: MissionRecord_LoadWithStringConstruct_88CAD+299j
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		les	bx, [bp+var_4]
		mov	eax, [bp+var_8]
		mov	es:[bx], eax
		add	word ptr [bp+var_4], 4

loc_88F63:				; CODE XREF: MissionRecord_LoadWithStringConstruct_88CAD+259j
		push	0
		push	large 'GXAM'
		push	di
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_88FD8
		mov	[bp+var_A], di
		push	1
		push	0
		push	2
		push	large 1Bh
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_E+2], dx
		mov	word ptr [bp+var_E], ax
		or	ax, dx
		jz	short loc_88FBD
		push	[bp+var_A]
		push	dx
		push	word ptr [bp+var_E]
		call	String_ConstructFromCStr
		add	sp, 6
		les	bx, [bp+var_E]
		mov	word ptr es:[bx], 0A12h
		mov	word ptr es:[bx], 9FEh
		mov	dx, word ptr [bp+var_E+2]
		mov	ax, word ptr [bp+var_E]
		jmp	short loc_88FC3
; ���������������������������������������������������������������������������

loc_88FBD:				; CODE XREF: MissionRecord_LoadWithStringConstruct_88CAD+2EAj
		mov	dx, word ptr [bp+var_E+2]
		mov	ax, word ptr [bp+var_E]

loc_88FC3:				; CODE XREF: MissionRecord_LoadWithStringConstruct_88CAD+30Ej
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		les	bx, [bp+var_4]
		mov	eax, [bp+var_8]
		mov	es:[bx], eax
		add	word ptr [bp+var_4], 4

loc_88FD8:				; CODE XREF: MissionRecord_LoadWithStringConstruct_88CAD+2C9j
		push	0
		push	large 'HCAM'
		push	di
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_89048
		mov	[bp+var_A], di
		push	1
		push	0
		push	2
		push	large 1Bh
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3

loc_89001:
		add	sp, 0Ch

loc_89004:
		mov	word ptr [bp+var_E+2], dx
		mov	word ptr [bp+var_E], ax
		or	ax, dx

loc_8900C:
		jz	short loc_8902D

loc_8900E:
		push	[bp+var_A]
		push	dx

loc_89012:
		push	word ptr [bp+var_E]

loc_89015:
		call	String_ConstructFromCStr
		add	sp, 6
		les	bx, [bp+var_E]
		mov	word ptr es:[bx], 9EAh
		mov	dx, word ptr [bp+var_E+2]
		mov	ax, word ptr [bp+var_E]
		jmp	short loc_89033
; ���������������������������������������������������������������������������

loc_8902D:				; CODE XREF: MissionRecord_LoadWithStringConstruct_88CAD:loc_8900Cj
		mov	dx, word ptr [bp+var_E+2]
		mov	ax, word ptr [bp+var_E]

loc_89033:				; CODE XREF: MissionRecord_LoadWithStringConstruct_88CAD+37Ej
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		les	bx, [bp+var_4]
		mov	eax, [bp+var_8]
		mov	es:[bx], eax
		add	word ptr [bp+var_4], 4

loc_89048:				; CODE XREF: MissionRecord_LoadWithStringConstruct_88CAD+33Ej
		push	0
		push	large 'PYAW'
		push	di
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_890B8
		mov	[bp+var_A], di
		push	1
		push	0
		push	2
		push	large 1Bh
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_E+2], dx
		mov	word ptr [bp+var_E], ax
		or	ax, dx
		jz	short loc_8909D
		push	[bp+var_A]
		push	dx
		push	word ptr [bp+var_E]
		call	String_ConstructFromCStr
		add	sp, 6
		les	bx, [bp+var_E]
		mov	word ptr es:[bx], 9D6h
		mov	dx, word ptr [bp+var_E+2]
		mov	ax, word ptr [bp+var_E]
		jmp	short loc_890A3
; ���������������������������������������������������������������������������

loc_8909D:				; CODE XREF: MissionRecord_LoadWithStringConstruct_88CAD+3CFj
		mov	dx, word ptr [bp+var_E+2]
		mov	ax, word ptr [bp+var_E]

loc_890A3:				; CODE XREF: MissionRecord_LoadWithStringConstruct_88CAD+3EEj
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		les	bx, [bp+var_4]
		mov	eax, [bp+var_8]
		mov	es:[bx], eax
		add	word ptr [bp+var_4], 4

loc_890B8:				; CODE XREF: MissionRecord_LoadWithStringConstruct_88CAD+3AEj
		push	0
		push	large 'GDNL'
		push	di
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_8913E
		mov	[bp+var_A], di
		push	1
		push	0
		push	2
		push	large 1Bh
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_E+2], dx
		mov	word ptr [bp+var_E], ax
		or	ax, dx
		jz	short loc_89123
		push	[bp+var_A]
		push	dx
		push	word ptr [bp+var_E]
		call	String_ConstructFromCStr
		add	sp, 6
		les	bx, [bp+var_E]
		mov	word ptr es:[bx], 9C2h
		push	ds

loc_89106:				; "GEAR"
		push	offset aGear
		mov	ax, word ptr [bp+var_E]
		add	ax, 6

loc_8910F:
		push	word ptr [bp+var_E+2]
		push	ax
		call	CRT_MemFamily_Extra5
		add	sp, 8
		mov	dx, word ptr [bp+var_E+2]
		mov	ax, word ptr [bp+var_E]
		jmp	short loc_89129
; ���������������������������������������������������������������������������

loc_89123:				; CODE XREF: MissionRecord_LoadWithStringConstruct_88CAD+43Fj
		mov	dx, word ptr [bp+var_E+2]
		mov	ax, word ptr [bp+var_E]

loc_89129:				; CODE XREF: MissionRecord_LoadWithStringConstruct_88CAD+474j
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		les	bx, [bp+var_4]
		mov	eax, [bp+var_8]
		mov	es:[bx], eax
		add	word ptr [bp+var_4], 4

loc_8913E:				; CODE XREF: MissionRecord_LoadWithStringConstruct_88CAD+41Ej
		push	0
		push	large 'PALF'
		push	di
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_891C4
		mov	[bp+var_A], di
		push	1
		push	0
		push	2
		push	large 1Bh
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_E+2], dx
		mov	word ptr [bp+var_E], ax
		or	ax, dx
		jz	short loc_891A9
		push	[bp+var_A]
		push	dx
		push	word ptr [bp+var_E]
		call	String_ConstructFromCStr
		add	sp, 6
		les	bx, [bp+var_E]
		mov	word ptr es:[bx], 9AEh
		push	ds
		push	offset aFlaps_0	; "FLAPS"
		mov	ax, word ptr [bp+var_E]
		add	ax, 6
		push	word ptr [bp+var_E+2]
		push	ax
		call	CRT_MemFamily_Extra5
		add	sp, 8
		mov	dx, word ptr [bp+var_E+2]
		mov	ax, word ptr [bp+var_E]
		jmp	short loc_891AF
; ���������������������������������������������������������������������������

loc_891A9:				; CODE XREF: MissionRecord_LoadWithStringConstruct_88CAD+4C5j
		mov	dx, word ptr [bp+var_E+2]
		mov	ax, word ptr [bp+var_E]

loc_891AF:				; CODE XREF: MissionRecord_LoadWithStringConstruct_88CAD+4FAj
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		les	bx, [bp+var_4]
		mov	eax, [bp+var_8]
		mov	es:[bx], eax
		add	word ptr [bp+var_4], 4

loc_891C4:				; CODE XREF: MissionRecord_LoadWithStringConstruct_88CAD+4A4j
		push	0
		push	large 'BDPS'
		push	di
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_8924A
		mov	[bp+var_A], di
		push	1
		push	0
		push	2
		push	large 1Bh
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_E+2], dx
		mov	word ptr [bp+var_E], ax
		or	ax, dx
		jz	short loc_8922F
		push	[bp+var_A]
		push	dx
		push	word ptr [bp+var_E]

loc_89201:
		call	String_ConstructFromCStr
		add	sp, 6
		les	bx, [bp+var_E]

loc_8920C:
		mov	word ptr es:[bx], 99Ah
		push	ds
		push	offset aBrake	; "BRAKE"
		mov	ax, word ptr [bp+var_E]
		add	ax, 6
		push	word ptr [bp+var_E+2]
		push	ax
		call	CRT_MemFamily_Extra5
		add	sp, 8
		mov	dx, word ptr [bp+var_E+2]
		mov	ax, word ptr [bp+var_E]
		jmp	short loc_89235
; ���������������������������������������������������������������������������

loc_8922F:				; CODE XREF: MissionRecord_LoadWithStringConstruct_88CAD+54Bj
		mov	dx, word ptr [bp+var_E+2]
		mov	ax, word ptr [bp+var_E]

loc_89235:				; CODE XREF: MissionRecord_LoadWithStringConstruct_88CAD+580j
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		les	bx, [bp+var_4]
		mov	eax, [bp+var_8]
		mov	es:[bx], eax
		add	word ptr [bp+var_4], 4

loc_8924A:				; CODE XREF: MissionRecord_LoadWithStringConstruct_88CAD+52Aj
		push	0
		push	large 'TLAR'
		push	di
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_892BA
		mov	[bp+var_A], di
		push	1
		push	0
		push	2
		push	large 1Bh
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_E+2], dx
		mov	word ptr [bp+var_E], ax
		or	ax, dx
		jz	short loc_8929F
		push	[bp+var_A]
		push	dx
		push	word ptr [bp+var_E]
		call	String_ConstructFromCStr
		add	sp, 6
		les	bx, [bp+var_E]
		mov	word ptr es:[bx], 986h
		mov	dx, word ptr [bp+var_E+2]
		mov	ax, word ptr [bp+var_E]
		jmp	short loc_892A5
; ���������������������������������������������������������������������������

loc_8929F:				; CODE XREF: MissionRecord_LoadWithStringConstruct_88CAD+5D1j
		mov	dx, word ptr [bp+var_E+2]
		mov	ax, word ptr [bp+var_E]

loc_892A5:				; CODE XREF: MissionRecord_LoadWithStringConstruct_88CAD+5F0j
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		les	bx, [bp+var_4]
		mov	eax, [bp+var_8]
		mov	es:[bx], eax
		add	word ptr [bp+var_4], 4

loc_892BA:				; CODE XREF: MissionRecord_LoadWithStringConstruct_88CAD+5B0j
		push	0
		push	large 'ORHT'
		push	di
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_8932A
		mov	[bp+var_A], di
		push	1
		push	0
		push	2
		push	large 1Bh
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_E+2], dx
		mov	word ptr [bp+var_E], ax
		or	ax, dx
		jz	short loc_8930F
		push	[bp+var_A]
		push	dx
		push	word ptr [bp+var_E]
		call	String_ConstructFromCStr
		add	sp, 6
		les	bx, [bp+var_E]
		mov	word ptr es:[bx], 972h
		mov	dx, word ptr [bp+var_E+2]

loc_8930A:
		mov	ax, word ptr [bp+var_E]
		jmp	short loc_89315
; ���������������������������������������������������������������������������

loc_8930F:				; CODE XREF: MissionRecord_LoadWithStringConstruct_88CAD+641j
		mov	dx, word ptr [bp+var_E+2]
		mov	ax, word ptr [bp+var_E]

loc_89315:				; CODE XREF: MissionRecord_LoadWithStringConstruct_88CAD+660j
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		les	bx, [bp+var_4]
		mov	eax, [bp+var_8]
		mov	es:[bx], eax
		add	word ptr [bp+var_4], 4

loc_8932A:				; CODE XREF: MissionRecord_LoadWithStringConstruct_88CAD+620j
		push	0
		push	large 'ALAC'
		push	di
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_89396
		mov	[bp+var_A], di
		push	1
		push	0
		push	2
		push	large 1Bh
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_E+2], dx
		mov	word ptr [bp+var_E], ax
		or	ax, dx
		jz	short loc_8937F
		push	[bp+var_A]
		push	dx
		push	word ptr [bp+var_E]
		call	String_ConstructFromCStr
		add	sp, 6
		les	bx, [bp+var_E]
		mov	word ptr es:[bx], 95Eh
		mov	dx, word ptr [bp+var_E+2]
		mov	ax, word ptr [bp+var_E]
		jmp	short loc_89385
; ���������������������������������������������������������������������������

loc_8937F:				; CODE XREF: MissionRecord_LoadWithStringConstruct_88CAD+6B1j
		mov	dx, word ptr [bp+var_E+2]
		mov	ax, word ptr [bp+var_E]

loc_89385:				; CODE XREF: MissionRecord_LoadWithStringConstruct_88CAD+6D0j
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		les	bx, [bp+var_4]
		mov	eax, [bp+var_8]
		mov	es:[bx], eax

loc_89396:				; CODE XREF: MissionRecord_LoadWithStringConstruct_88CAD+690j
		pop	di
		pop	si
		leave
		retf
MissionRecord_LoadWithStringConstruct_88CAD	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 156 lignes, NON DÉTAILLÉE — combine ReadFieldGroupB_64A54 répété (4+ fois).
; ==============================================================================================
MissionRecord_LoadFieldGroupSequence_8939A	proc far		; CODE XREF: VROOMM_StubThunk_6B379J MissionRecord_LoadAndDecodeMain_88206+E8p

var_6A		= word ptr -6Ah
var_1A		= dword	ptr -1Ah
var_16		= byte ptr -16h
var_15		= byte ptr -15h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 6Ah
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	0
		push	large 4F464E49h
		push	di
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jnz	short loc_893C0
		jmp	loc_894EF
; ���������������������������������������������������������������������������

loc_893C0:				; CODE XREF: MissionRecord_LoadFieldGroupSequence_8939A+21j
		push	di
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[si+2Bh], al
		push	di
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[si+0Dh], ax
		push	di
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[si+0Fh], ax
		push	di
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[si+5],	ax
		push	di
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[si+7],	ax
		push	di
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[si+9],	ax
		push	di
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx

loc_89403:
		mov	[si+0Bh], ax

loc_89406:
		mov	[bp+var_C], di

loc_89409:
		push	[bp+var_C]
		lea	ax, [bp+var_A]
		push	ax

loc_89410:
		call	String_ConstructFromPtrLen

loc_89415:
		add	sp, 4
		push	ds
		push	offset a_shp_1	; ".SHP"
		push	ds
		lea	ax, [bp+var_A]
		push	ax
		push	ds
		push	offset aFonts_1	; "FONTS"
		lea	ax, [bp+var_6A]
		push	ax
		call	Path_ResolveDataFile
		add	sp, 0Eh
		push	2
		lea	ax, [bp+var_6A]
		push	ax
		call	TextRenderer_LoadResourceFile_661AF
		add	sp, 4
		mov	word ptr [bp+var_10+2],	dx
		mov	word ptr [bp+var_10], ax
		mov	eax, [bp+var_10]
		mov	[bp+var_1A], eax
		mov	[bp+var_16], 2
		mov	[bp+var_15], 1
		mov	[bp+var_14], 0
		lea	ax, [bp+var_1A]
		push	ax
		push	0
		call	GlyphObject_ConstructWithBuffer_60507
		add	sp, 4
		mov	[si+11h], ax
		cmp	[bp+var_15], 0
		jz	short loc_89492
		cmp	[bp+var_1A], 0
		jz	short loc_89492
		push	0
		mov	al, [bp+var_16]
		push	ax
		lea	ax, [bp+var_1A]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_89492:				; CODE XREF: MissionRecord_LoadFieldGroupSequence_8939A+D8j
					; MissionRecord_LoadFieldGroupSequence_8939A+DFj
		mov	[bp+var_1A], 0
		mov	[bp+var_15], 0
		mov	[bp+var_14], 0
		mov	bx, [si+11h]
		mov	word ptr [bx+10h], 1
		mov	word ptr [bx+12h], 0
		push	2Dh ; '-'
		push	bx
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 4
		mov	bx, [si+11h]
		mov	[bx+14h], ax
		push	bx
		mov	ax, [si+2]
		add	ax, 2
		push	ax
		push	0
		call	Widget_ApplyStyleAndAllocate_607E1
		add	sp, 6
		mov	[si+13h], ax
		mov	al, [si+2Bh]
		push	ax
		push	word ptr [si+13h]
		call	Widget_Method_Dispatch8_6083F
		add	sp, 4
		push	di
		call	ResourceRecord_ReleaseAndClear_64D25
		pop	cx

loc_894EF:				; CODE XREF: MissionRecord_LoadFieldGroupSequence_8939A+23j
		pop	di
		pop	si
		leave
		retf
MissionRecord_LoadFieldGroupSequence_8939A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine ResourceRecord_Helper_645A5/StreamReader_ReleaseBuffer_65643 (seg193/195),
; CRT_FreeNear_Wrap.
; ==============================================================================================
MissionRecord_ReleaseStreamAndDestruct_894F3	proc far		; CODE XREF: VROOMM_StubThunk_6B383J

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp

loc_894F6:
		push	si
		push	di
		mov	si, [bp+arg_0]

loc_894FB:
		mov	di, [bp+arg_2]
		or	si, si

loc_89500:
		jz	short loc_89536

loc_89502:
		push	si
		push	cs

loc_89504:
		call	near ptr MissionRecord_ReleaseTriple_8811A

loc_89507:
		pop	cx
		mov	word ptr [si+2Ch], 2E0h
		mov	ax, si
		add	ax, 2Ch	; ','
		push	ax
		call	ResourceRecord_Helper_645A5
		pop	cx
		push	0
		mov	ax, si
		add	ax, 2Ch	; ','
		push	ax
		call	StreamReader_ReleaseBuffer_65643
		add	sp, 4
		test	di, 1
		jz	short loc_89536
		push	si
		call	CRT_FreeNear_Wrap
		pop	cx

loc_89536:				; CODE XREF: MissionRecord_ReleaseStreamAndDestruct_894F3:loc_89500j
					; MissionRecord_ReleaseStreamAndDestruct_894F3+3Aj
		pop	di
		pop	si
		pop	bp
		retf
MissionRecord_ReleaseStreamAndDestruct_894F3	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, libère un bloc typé (Memory_TypedFree_5C7B6) — premier d'une famille de ~14 fonctions
; quasi identiques de libération d'un champ unique.
; ==============================================================================================
MissionRecordField_ReleaseSingle_8953A	proc far		; CODE XREF: VROOMM_StubThunk_6B356J

var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		mov	ax, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short locret_8956C
		test	ax, 1
		jz	short locret_8956C
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	0
		push	2
		lea	ax, [bp+var_4]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

locret_8956C:				; CODE XREF: MissionRecordField_ReleaseSingle_8953A+Ej
					; MissionRecordField_ReleaseSingle_8953A+13j
		leave
		retf
MissionRecordField_ReleaseSingle_8953A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, duplicat probable de MissionRecordField_ReleaseSingle_8953A (même motif).
; ==============================================================================================
MissionRecordField_ReleaseSingle_8956E	proc far		; CODE XREF: VROOMM_StubThunk_6B351J

var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		mov	ax, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short locret_895A0
		test	ax, 1
		jz	short locret_895A0
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	0
		push	2
		lea	ax, [bp+var_4]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

locret_895A0:				; CODE XREF: MissionRecordField_ReleaseSingle_8956E+Ej
					; MissionRecordField_ReleaseSingle_8956E+13j
		leave
		retf
MissionRecordField_ReleaseSingle_8956E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, duplicat probable de MissionRecordField_ReleaseSingle_8953A.
; ==============================================================================================
MissionRecordField_ReleaseSingle_895A2	proc far		; CODE XREF: VROOMM_StubThunk_6B34CJ

var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		mov	ax, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short locret_895D4
		test	ax, 1
		jz	short locret_895D4
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	0
		push	2
		lea	ax, [bp+var_4]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

locret_895D4:				; CODE XREF: MissionRecordField_ReleaseSingle_895A2+Ej
					; MissionRecordField_ReleaseSingle_895A2+13j
		leave
		retf
MissionRecordField_ReleaseSingle_895A2	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, duplicat probable de MissionRecordField_ReleaseSingle_8953A.
; ==============================================================================================
MissionRecordField_ReleaseSingle_895D6	proc far		; CODE XREF: VROOMM_StubThunk_6B347J

var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		mov	ax, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short locret_89608
		test	ax, 1
		jz	short locret_89608
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	0
		push	2

loc_895F7:
		lea	ax, [bp+var_4]
		push	ax
		push	5C44h

loc_895FE:
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

locret_89608:				; CODE XREF: MissionRecordField_ReleaseSingle_895D6+Ej
					; MissionRecordField_ReleaseSingle_895D6+13j
		leave
		retf
MissionRecordField_ReleaseSingle_895D6	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, duplicat probable de MissionRecordField_ReleaseSingle_8953A.
; ==============================================================================================
MissionRecordField_ReleaseSingle_8960A	proc far		; CODE XREF: VROOMM_StubThunk_6B342J

var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		mov	ax, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short locret_8963C
		test	ax, 1
		jz	short locret_8963C
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	0
		push	2
		lea	ax, [bp+var_4]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

locret_8963C:				; CODE XREF: MissionRecordField_ReleaseSingle_8960A+Ej
					; MissionRecordField_ReleaseSingle_8960A+13j
		leave
		retf
MissionRecordField_ReleaseSingle_8960A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, duplicat probable de MissionRecordField_ReleaseSingle_8953A.
; ==============================================================================================
MissionRecordField_ReleaseSingle_8963E	proc far		; CODE XREF: VROOMM_StubThunk_6B33DJ

var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		mov	ax, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short locret_89670
		test	ax, 1
		jz	short locret_89670
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	0
		push	2
		lea	ax, [bp+var_4]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

locret_89670:				; CODE XREF: MissionRecordField_ReleaseSingle_8963E+Ej
					; MissionRecordField_ReleaseSingle_8963E+13j
		leave
		retf
MissionRecordField_ReleaseSingle_8963E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, duplicat probable de MissionRecordField_ReleaseSingle_8953A.
; ==============================================================================================
MissionRecordField_ReleaseSingle_89672	proc far		; CODE XREF: VROOMM_StubThunk_6B338J

var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		mov	ax, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short locret_896A4
		test	ax, 1
		jz	short locret_896A4
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	0
		push	2
		lea	ax, [bp+var_4]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

locret_896A4:				; CODE XREF: MissionRecordField_ReleaseSingle_89672+Ej
					; MissionRecordField_ReleaseSingle_89672+13j
		leave
		retf
MissionRecordField_ReleaseSingle_89672	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, duplicat probable de MissionRecordField_ReleaseSingle_8953A.
; ==============================================================================================
MissionRecordField_ReleaseSingle_896A6	proc far		; CODE XREF: VROOMM_StubThunk_6B333J

var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		mov	ax, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short locret_896D8
		test	ax, 1
		jz	short locret_896D8
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	0
		push	2
		lea	ax, [bp+var_4]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

locret_896D8:				; CODE XREF: MissionRecordField_ReleaseSingle_896A6+Ej
					; MissionRecordField_ReleaseSingle_896A6+13j
		leave
		retf
MissionRecordField_ReleaseSingle_896A6	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, duplicat probable de MissionRecordField_ReleaseSingle_8953A.
; ==============================================================================================
MissionRecordField_ReleaseSingle_896DA	proc far		; CODE XREF: VROOMM_StubThunk_6B32EJ

var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		mov	ax, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short locret_8970C
		test	ax, 1
		jz	short locret_8970C
		mov	eax, [bp+arg_0]

loc_896F3:
		mov	[bp+var_4], eax
		push	0
		push	2

loc_896FB:
		lea	ax, [bp+var_4]
		push	ax
		push	5C44h

loc_89702:
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

locret_8970C:				; CODE XREF: MissionRecordField_ReleaseSingle_896DA+Ej
					; MissionRecordField_ReleaseSingle_896DA+13j
		leave
		retf
MissionRecordField_ReleaseSingle_896DA	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, duplicat probable de MissionRecordField_ReleaseSingle_8953A.
; ==============================================================================================
MissionRecordField_ReleaseSingle_8970E	proc far		; CODE XREF: VROOMM_StubThunk_6B329J

var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4

loc_89714:
		mov	ax, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short locret_89740
		test	ax, 1
		jz	short locret_89740
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	0
		push	2
		lea	ax, [bp+var_4]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

locret_89740:				; CODE XREF: MissionRecordField_ReleaseSingle_8970E+Ej
					; MissionRecordField_ReleaseSingle_8970E+13j
		leave
		retf
MissionRecordField_ReleaseSingle_8970E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, duplicat probable de MissionRecordField_ReleaseSingle_8953A.
; ==============================================================================================
MissionRecordField_ReleaseSingle_89742	proc far		; CODE XREF: VROOMM_StubThunk_6B324J

var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		mov	ax, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short locret_89774
		test	ax, 1
		jz	short locret_89774
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	0
		push	2
		lea	ax, [bp+var_4]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

locret_89774:				; CODE XREF: MissionRecordField_ReleaseSingle_89742+Ej
					; MissionRecordField_ReleaseSingle_89742+13j
		leave
		retf
MissionRecordField_ReleaseSingle_89742	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, duplicat probable de MissionRecordField_ReleaseSingle_8953A.
; ==============================================================================================
MissionRecordField_ReleaseSingle_89776	proc far		; CODE XREF: VROOMM_StubThunk_6B31FJ

var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		mov	ax, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short locret_897A8
		test	ax, 1
		jz	short locret_897A8
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	0
		push	2
		lea	ax, [bp+var_4]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

locret_897A8:				; CODE XREF: MissionRecordField_ReleaseSingle_89776+Ej
					; MissionRecordField_ReleaseSingle_89776+13j
		leave
		retf
MissionRecordField_ReleaseSingle_89776	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, duplicat probable de MissionRecordField_ReleaseSingle_8953A.
; ==============================================================================================
MissionRecordField_ReleaseSingle_897AA	proc far		; CODE XREF: VROOMM_StubThunk_6B31AJ

var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		mov	ax, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short locret_897DC
		test	ax, 1
		jz	short locret_897DC
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	0
		push	2
		lea	ax, [bp+var_4]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

locret_897DC:				; CODE XREF: MissionRecordField_ReleaseSingle_897AA+Ej
					; MissionRecordField_ReleaseSingle_897AA+13j
		leave
		retf
MissionRecordField_ReleaseSingle_897AA	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, duplicat probable de MissionRecordField_ReleaseSingle_8953A.
; ==============================================================================================
MissionRecordField_ReleaseSingle_897DE	proc far		; CODE XREF: VROOMM_StubThunk_6B315J

var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		mov	ax, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short locret_89810
		test	ax, 1
		jz	short locret_89810
		mov	eax, [bp+arg_0]

loc_897F7:
		mov	[bp+var_4], eax
		push	0
		push	2
		lea	ax, [bp+var_4]
		push	ax

loc_89803:
		push	5C44h

loc_89806:
		call	Memory_TypedFree_5C7B6

loc_8980B:
		add	sp, 8
		jmp	short $+2

locret_89810:				; CODE XREF: MissionRecordField_ReleaseSingle_897DE+Ej
					; MissionRecordField_ReleaseSingle_897DE+13j
		leave
		retf
MissionRecordField_ReleaseSingle_897DE	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, duplicat probable de MissionRecordField_ReleaseSingle_8953A (dernier de la série).
; ==============================================================================================
MissionRecordField_ReleaseSingle_89812	proc far		; CODE XREF: VROOMM_StubThunk_6B310J

var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		mov	ax, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short locret_89844
		test	ax, 1
		jz	short locret_89844
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	0
		push	2
		lea	ax, [bp+var_4]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

locret_89844:				; CODE XREF: MissionRecordField_ReleaseSingle_89812+Ej
					; MissionRecordField_ReleaseSingle_89812+13j
		leave
		retf
MissionRecordField_ReleaseSingle_89812	endp

ovr253		ends
