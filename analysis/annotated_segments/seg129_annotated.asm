seg129		segment	byte public 'CODE' use16
		assume cs:seg129
		;org 0Fh
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, méthode virtuelle appelant sub_5D90E avec argument nul. Classe apparentée au cluster
; PagedMemory (seg127-128), mais avec un jeu de fonctions différent (sub_5Dxxx) — probable
; type de ressource distinct (audio/image ?).
; ==============================================================================================
PagedResourceB_Method_ReadDefault_5C2BF	proc far		; CODE XREF: PagedResourceB_Construct_5C34F+6Dp
		push	bp
		mov	bp, sp
		push	large 0
		call	PagedResourceB_Read_5D90E
		add	sp, 4
		pop	bp
		retf
PagedResourceB_Method_ReadDefault_5C2BF	endp

; ���������������������������������������������������������������������������

; ==============================================================================================
; far, méthode virtuelle appelant sub_5D555 (écriture, tag 1).
; ==============================================================================================
PagedResourceB_Method_Write_5C2CF:				; DATA XREF: seg339:off_70AFAo
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		push	large 1
		push	large dword ptr	[bp+8]
		call	PagedResourceB_Write_5D555
		add	sp, 8
		pop	bp
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, méthode virtuelle : si le champ source est non nul, appelle sub_5D62F (libération) puis
; le remet à zéro.
; ==============================================================================================
PagedResourceB_Method_ReleaseIfSet_5C2E6:				; DATA XREF: seg339:off_70AFEo
		push	bp
		mov	bp, sp
		push	si
		mov	ax, [bp+6]
		mov	si, [bp+8]
		cmp	dword ptr [si],	0
		jz	short loc_5C306
		push	word ptr [si+2]
		call	PagedResourceB_Release_5D62F
		pop	cx
		mov	dword ptr [si],	0

loc_5C306:				; CODE XREF: seg129:0044j
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, méthode virtuelle transmettant 3 arguments à sub_2D24.
; ==============================================================================================
PagedResourceB_Method_Call3Args_5C309:				; DATA XREF: seg339:off_70B02o
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		push	word ptr [bp+10h]
		push	large dword ptr	[bp+0Ch]
		push	large dword ptr	[bp+8]
		call	CRT_MemFamily_Extra1
		add	sp, 0Ah
		pop	bp
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, méthode virtuelle « init » appelant sub_5D95A.
; ==============================================================================================
PagedResourceB_Method_Init_5C324:				; DATA XREF: seg339:off_70B0Ao
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		call	PagedResourceB_Init_5D95A
		pop	bp
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, stub retournant AX=2 (tag de type).
; ==============================================================================================
PagedResourceB_Method_ReturnType2_5C331:				; DATA XREF: seg339:off_70B12o
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		mov	ax, 2
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		mov	al, byte_70ACC
		pop	bp
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, méthode virtuelle vide (no-op).
; ==============================================================================================
PagedResourceB_Method_NoOp_5C347:				; DATA XREF: seg339:off_70AF6o
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, constructeur : alloue (sub_658), appelle sub_5F460 puis
; PagedResourceB_Method_ReadDefault_5C2BF. Référencée par sub_5C9D3.
; ==============================================================================================
PagedResourceB_Construct_5C34F	proc far		; CODE XREF: Memory_AllocatorTableConstructor_5C9D3+68P

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si

loc_5C353:
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_5C368
		push	0Eh

loc_5C35C:
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_5C3C4

loc_5C368:				; CODE XREF: PagedResourceB_Construct_5C34F+9j
		mov	word ptr [si], 129Eh
		mov	ax, word_70EA8
		mov	[si+2],	ax
		mov	word_70EA8, si
		mov	word ptr [si+4], 39E3h
		mov	word ptr [si+0Ah], 0
		mov	word ptr [si+0Ch], 0
		mov	word ptr [si+8], seg seg160
		mov	word ptr [si+6], 0
		mov	word ptr [si], 39EBh
		mov	word ptr [si+4], 3A13h
		mov	word ptr [si], 3A46h
		mov	word ptr [si+4], 3A6Eh
		cmp	byte_70ACC, 0
		jz	short loc_5C3BB
		push	3A1Dh
		mov	ax, si
		add	ax, 4
		push	ax
		call	DisplayContext_CommitFrame_5F460
		add	sp, 4
		jmp	short loc_5C3BF
; ���������������������������������������������������������������������������

loc_5C3BB:				; CODE XREF: PagedResourceB_Construct_5C34F+57j
		push	cs
		call	near ptr PagedResourceB_Method_ReadDefault_5C2BF

loc_5C3BF:				; CODE XREF: PagedResourceB_Construct_5C34F+6Aj
		mov	byte_70ACC, 1

loc_5C3C4:				; CODE XREF: PagedResourceB_Construct_5C34F+17j
		mov	ax, si
		pop	si
		pop	bp
		retf
PagedResourceB_Construct_5C34F	endp

; ���������������������������������������������������������������������������

; ==============================================================================================
; far, référencée via vtable et en interne (loc_5C420) — pose deux tags vtable (3A46h/3A6Eh),
; construit un sous-objet (sub_5EA03), libère si demandé (sub_338). Même motif que
; PagedTextObject_Construct_5C1C9 (seg128).
; ==============================================================================================
PagedResourceB_ConstructThunk_5C3C9:				; CODE XREF: seg129:0179j
					; DATA XREF: seg339:off_70B1Ao
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		or	si, si
		jz	short loc_5C3FA
		mov	word ptr [si], 3A46h
		mov	word ptr [si+4], 3A6Eh
		mov	ax, si
		add	ax, 0Ah
		push	ax
		call	Member_ClearAndFree_5EA03
		pop	cx
		test	di, 1
		jz	short loc_5C3FA
		push	si
		call	CRT_FreeNear_Wrap
		pop	cx

loc_5C3FA:				; CODE XREF: seg129:0126j seg129:0141j
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, méthode virtuelle transmettant simplement son argument dword en retour.
; ==============================================================================================
PagedResourceB_Method_PassThrough_5C3FE:				; DATA XREF: seg339:off_70B06o
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		mov	dx, [bp+0Ah]
		mov	ax, [bp+8]
		pop	bp
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, stub retournant AX=0.
; ==============================================================================================
PagedResourceB_Method_ReturnZero_5C40C:				; DATA XREF: seg339:off_70B0Eo
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		xor	ax, ax
		pop	bp
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, stub retournant AL=2 (variante byte du tag de type).
; ==============================================================================================
PagedResourceB_Method_ReturnType2B_5C416:				; DATA XREF: seg339:off_70B16o
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		mov	al, 2
		pop	bp
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, thunk d'ajustement de pile redirigeant vers PagedResourceB_ConstructThunk_5C3C9 (motif
; d'héritage multiple C++ Borland, identique à seg128).
; ==============================================================================================
PagedResourceB_ConstructThunkAdjustor_5C420:				; DATA XREF: seg339:off_70B22o
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFFCh
		nop
		nop
		jmp	PagedResourceB_ConstructThunk_5C3C9
seg129		ends
