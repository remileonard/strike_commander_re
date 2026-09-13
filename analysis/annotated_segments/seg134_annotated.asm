seg134		segment	byte public 'CODE' use16
		assume cs:seg134
		;org 0Bh
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ==============================================================================================
; far, méthode virtuelle allouant via sub_658. Classe apparentée (tag 129Eh) au cluster de
; mémoire paginée (seg127-129), chaînée dans une liste globale d'instances (word_70EA8).
; ==============================================================================================
PagedResourceC_Method_Allocate_5CCBB:				; DATA XREF: seg339:off_70CF9o
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		push	word ptr [bp+8]
		call	CRT_Malloc16_Retry
		pop	cx
		mov	dx, ds
		pop	bp
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, méthode virtuelle : libère (sub_346) et remet à zéro un champ dword si non nul.
; ==============================================================================================
PagedResourceC_Method_ReleaseIfSet_5CCCE:				; DATA XREF: seg339:3C4Do
		push	bp
		mov	bp, sp
		push	si
		mov	ax, [bp+6]
		mov	si, [bp+8]
		cmp	dword ptr [si],	0
		jz	short loc_5CCF0
		push	large dword ptr	[si]
		call	CRT_Free_NearOrFar
		add	sp, 4
		mov	dword ptr [si],	0

loc_5CCF0:				; CODE XREF: seg134:002Cj
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, méthode virtuelle transmettant 2 arguments à sub_229C.
; ==============================================================================================
PagedResourceC_Method_Call2Args_5CCF3:				; DATA XREF: seg339:off_70D01o
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		push	word ptr [bp+10h]

loc_5CCFC:
		push	word ptr [bp+0Ch]
		push	word ptr [bp+8]
		call	CRT_Memmove
		add	sp, 6
		pop	bp
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, méthode virtuelle appelant sub_5D469, étend le résultat sur 32 bits.
; ==============================================================================================
PagedResourceC_Method_GetValue_5CD0C:				; DATA XREF: seg339:3C59o
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		call	DisplayCache_GetHeadValue_5D469
		movzx	eax, ax
		shld	edx, eax, 10h
		pop	bp
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, méthode virtuelle « init » appelant sub_1BF4.
; ==============================================================================================
PagedResourceC_Method_Init_5CD22:				; DATA XREF: seg339:off_70D11o
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]

loc_5CD28:
		call	Heap_Validate
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		mov	al, byte_70CCA
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, constructeur multi-héritage (Borland) : alloue si besoin (sub_658, 0x0E octets), chaîne
; l'instance dans une liste globale (word_70EA8), pose successivement les tags vtable des
; classes de base héritées (129Eh, 39E3h, 39EBh/3A13h — la classe PagedTextObject de seg128 —,
; puis 3C45h/3C6Dh pour cette classe finale). Lors de la toute première construction
; (byte_70CCA==0), enregistre un gestionnaire global (sub_5F460, tag 3C1Bh). Référencée par
; Memory_AllocatorTableConstructor_5C9D3 (seg131).
; ==============================================================================================
PagedResourceC_Construct_5CD3A	proc far		; CODE XREF: Memory_AllocatorTableConstructor_5C9D3:loc_5CA29P

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_5CD53
		push	0Eh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_5CDA9

loc_5CD53:				; CODE XREF: PagedResourceC_Construct_5CD3A+9j
		mov	word ptr [si], 129Eh
		mov	ax, word_70EA8
		mov	[si+2],	ax

loc_5CD5D:
		mov	word_70EA8, si

loc_5CD61:
		mov	word ptr [si+4], 39E3h

loc_5CD66:
		mov	word ptr [si+0Ah], 0
		mov	word ptr [si+0Ch], 0
		mov	word ptr [si+8], seg seg160
		mov	word ptr [si+6], 0
		mov	word ptr [si], 39EBh
		mov	word ptr [si+4], 3A13h
		mov	word ptr [si], 3C45h
		mov	word ptr [si+4], 3C6Dh
		cmp	byte_70CCA, 0
		jz	short loc_5CDA4
		push	3C1Bh
		mov	ax, si
		add	ax, 4
		push	ax
		call	DisplayContext_CommitFrame_5F460
		add	sp, 4

loc_5CDA4:				; CODE XREF: PagedResourceC_Construct_5CD3A+57j
		mov	byte_70CCA, 1

loc_5CDA9:				; CODE XREF: PagedResourceC_Construct_5CD3A+17j
		mov	ax, si
		pop	si
		pop	bp
		retf
PagedResourceC_Construct_5CD3A	endp

; ���������������������������������������������������������������������������

; ==============================================================================================
; far, méthode virtuelle transmettant simplement son argument dword en retour.
; ==============================================================================================
PagedResourceC_Method_PassThrough_5CDAE:				; DATA XREF: seg339:off_70D05o
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
PagedResourceC_Method_ReturnZero_5CDBC:				; DATA XREF: seg339:3C5Do
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		xor	ax, ax
		pop	bp
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, stub retournant AL=1.
; ==============================================================================================
PagedResourceC_Method_ReturnTrue_5CDC6:				; DATA XREF: seg339:off_70D15o
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		mov	al, 1
		pop	bp
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, référencée via vtable et en interne (loc_5CDFE) — construit un sous-objet (sub_5EA03),
; libère si demandé (sub_338). Même motif que les autres classes du cluster mémoire paginée.
; ==============================================================================================
PagedResourceC_ConstructThunk_5CDD0:				; CODE XREF: seg134:0157j
					; DATA XREF: seg339:off_70D19o
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		or	si, si
		jz	short loc_5CDFA
		mov	ax, si
		add	ax, 0Ah
		push	ax
		call	Member_ClearAndFree_5EA03
		pop	cx
		test	di, 1
		jz	short loc_5CDFA
		push	si
		call	CRT_FreeNear_Wrap
		pop	cx
		jmp	short $+2

loc_5CDFA:				; CODE XREF: seg134:012Dj seg134:013Fj
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, thunk d'ajustement de pile redirigeant vers PagedResourceC_ConstructThunk_5CDD0 (motif
; d'héritage multiple C++ Borland).
; ==============================================================================================
PagedResourceC_ConstructThunkAdjustor_5CDFE:				; DATA XREF: seg339:off_70D21o
		mov	bx, sp

loc_5CE00:
		add	word ptr ss:[bx+4], 0FFFCh
		nop
		nop
		jmp	PagedResourceC_ConstructThunk_5CDD0
seg134		ends
