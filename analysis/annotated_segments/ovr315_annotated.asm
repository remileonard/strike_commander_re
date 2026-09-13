ovr315		segment	para public 'OVERLAY' use16
		assume cs:ovr315
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 242 lignes, NON DÉTAILLÉE — combine Debris_SpawnOrchestrator,
; Math_RandomChance_54E4F (seg115), allocateurs typés — variante/orchestration finale du spawn
; de débris.
; ==============================================================================================
Debris_SpawnOrchestratorVariant_9D770	proc far		; CODE XREF: VROOMM_StubThunk_6C2C0J

var_6		= dword	ptr -6
var_1		= byte ptr -1
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		push	di
		mov	di, [bp+arg_4]
		mov	si, di
		push	word ptr [si+51h]
		mov	bx, [si+51h]
		mov	bx, [bx]

loc_9D785:
		call	dword ptr [bx+48h]
		pop	cx
		mov	bx, ax
		mov	al, [bx+75h]
		shr	ax, 5

loc_9D791:
		and	ax, 1

loc_9D794:
		mov	[bp+var_1], al
		mov	eax, [si+55h]

loc_9D79B:
		mov	[bp+var_6], eax

loc_9D79F:
		cmp	word_722E6, di

loc_9D7A3:
		jnz	short loc_9D7C7

loc_9D7A5:
		mov	byte_6E4B4, 1
		cmp	byte_6E4B6, 0

loc_9D7AF:
		jnz	short loc_9D7B4

loc_9D7B1:
		jmp	loc_9D895
; ���������������������������������������������������������������������������

loc_9D7B4:				; CODE XREF: Debris_SpawnOrchestratorVariant_9D770:loc_9D7AFj
					; Debris_SpawnOrchestratorVariant_9D770+145j ...
		push	[bp+arg_6]
		push	di

loc_9D7B8:
		push	large [bp+arg_0]
		call	Debris_SpawnOrchestrator
		add	sp, 8
		jmp	loc_9D90B
; ���������������������������������������������������������������������������

loc_9D7C7:				; CODE XREF: Debris_SpawnOrchestratorVariant_9D770:loc_9D7A3j
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx+63h], 0
		jnz	short loc_9D7D4
		jmp	loc_9D878
; ���������������������������������������������������������������������������

loc_9D7D4:				; CODE XREF: Debris_SpawnOrchestratorVariant_9D770+5Fj
		mov	al, [bp+var_1]
		mov	ah, 0
		or	ax, ax
		jz	short loc_9D7E0
		jmp	loc_9D878
; ���������������������������������������������������������������������������

loc_9D7E0:				; CODE XREF: Debris_SpawnOrchestratorVariant_9D770+6Bj
		les	bx, [bp+var_6]
		cmp	byte ptr es:[bx+0B9h], 1
		jz	short loc_9D81D
		mov	ax, 1Eh
		call	Math_RandomChance_54E4F
		or	al, al
		jz	short loc_9D869
		push	0
		push	2
		push	5C44h
		call	Memory_TypedAllocDispatchC_5C86D
		push	dx
		push	ax
		pop	eax
		add	sp, 6
		cmp	eax, 0C800h
		jle	short loc_9D869
		les	bx, [bp+var_6]
		cmp	byte ptr es:[bx+0B9h], 2
		jz	short loc_9D869

loc_9D81D:				; CODE XREF: Debris_SpawnOrchestratorVariant_9D770+79j
		push	0
		push	2
		push	5C44h
		call	Memory_TypedAllocDispatchC_5C86D
		push	dx
		push	ax
		pop	eax
		add	sp, 6
		cmp	eax, 0FFFFh
		jge	short loc_9D83E
		push	ds
		push	offset aLoweject ; "LOWEJECT"
		jmp	short loc_9D848
; ���������������������������������������������������������������������������

loc_9D83E:				; CODE XREF: Debris_SpawnOrchestratorVariant_9D770+C6j
		mov	ax, word ptr [bp+arg_0]
		add	ax, 5Ah	; 'Z'
		push	word ptr [bp+arg_0+2]
		push	ax

loc_9D848:				; CODE XREF: Debris_SpawnOrchestratorVariant_9D770+CCj
		push	si
		call	VROOMM_StubThunk_6CCFF
		add	sp, 6
		push	word ptr [si+51h]
		mov	bx, [si+51h]
		mov	bx, [bx]
		call	dword ptr [bx+48h]
		pop	cx
		mov	bx, ax

loc_9D85F:
		and	byte ptr [bx+75h], 0DFh

loc_9D863:				; CODE XREF: Debris_SpawnOrchestratorVariant_9D770+104j
		push	0
		push	9
		jmp	short loc_9D885
; ���������������������������������������������������������������������������

loc_9D869:				; CODE XREF: Debris_SpawnOrchestratorVariant_9D770+85j
					; Debris_SpawnOrchestratorVariant_9D770+A0j ...
		les	bx, [bp+var_6]
		cmp	byte ptr es:[bx+0B9h], 1
		jnz	short loc_9D881
		jmp	short loc_9D863
; ���������������������������������������������������������������������������
		jmp	short loc_9D881
; ���������������������������������������������������������������������������

loc_9D878:				; CODE XREF: Debris_SpawnOrchestratorVariant_9D770+61j
					; Debris_SpawnOrchestratorVariant_9D770+6Dj
		mov	al, [bp+var_1]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_9D895

loc_9D881:				; CODE XREF: Debris_SpawnOrchestratorVariant_9D770+102j
					; Debris_SpawnOrchestratorVariant_9D770+106j
		push	0

loc_9D883:
		push	0Ah

loc_9D885:				; CODE XREF: Debris_SpawnOrchestratorVariant_9D770+F7j
		push	word_722E6
		push	large [bp+var_6]
		call	Radio_PlayMessage
		add	sp, 0Ah

loc_9D895:				; CODE XREF: Debris_SpawnOrchestratorVariant_9D770:loc_9D7B1j
					; Debris_SpawnOrchestratorVariant_9D770+10Fj
		mov	al, [si+73h]
		and	ax, 1
		or	al, al
		jnz	short loc_9D8AF

loc_9D89F:
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+64h]

loc_9D8A6:
		call	Math_RandomChance_54E4F

loc_9D8AB:
		or	al, al
		jz	short loc_9D8C3

loc_9D8AF:				; CODE XREF: Debris_SpawnOrchestratorVariant_9D770+12Dj
		cmp	word_722E6, di
		jz	short loc_9D8B8
		jmp	loc_9D7B4
; ���������������������������������������������������������������������������

loc_9D8B8:				; CODE XREF: Debris_SpawnOrchestratorVariant_9D770+143j
		mov	byte_6E4B5, 1
		jmp	loc_9D7B4
; ���������������������������������������������������������������������������
		jmp	loc_9D7B4
; ���������������������������������������������������������������������������

loc_9D8C3:				; CODE XREF: Debris_SpawnOrchestratorVariant_9D770+13Dj
		mov	al, [bp+var_1]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_9D8F5
		push	[bp+arg_6]
		push	di
		call	Combat_TeamOpposedCheckAndDispatch_53A94
		add	sp, 4
		les	bx, [bp+arg_0]
		mov	al, es:[bx+58h]
		mov	[si+54h], al
		push	di
		call	Camera_EnableFollowIfActive
		pop	cx
		push	word ptr [di+51h]
		mov	bx, [di+51h]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		pop	cx

loc_9D8F5:				; CODE XREF: Debris_SpawnOrchestratorVariant_9D770+15Aj
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+1Dh]
		push	di
		push	word ptr [bp+arg_0+2]
		push	bx
		call	Debris_SpawnAtAttachPoint
		add	sp, 8
		mov	al, 0

loc_9D90B:				; CODE XREF: Debris_SpawnOrchestratorVariant_9D770+54j
		pop	di
		pop	si
		leave
		retf
Debris_SpawnOrchestratorVariant_9D770	endp

ovr315		ends
