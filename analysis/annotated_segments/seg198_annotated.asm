seg198		segment	byte public 'CODE' use16
		assume cs:seg198
		;org 0Fh
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 126 lignes, NON DÉTAILLÉE — construit un StreamReader temporaire
; (StreamReader_ConstructVariantA_63A39, seg190), l'ouvre en lecture
; (StreamReader_ReadDispatch_63D0E, seg190), et si succès lit son contenu
; (StreamReader_GetCapacity_64062, Memory_TypedFreeWrapperC_5C6F3). Référencée directement par
; TextRenderer_Main (sub_27477, seg048).
; ==============================================================================================
TextRenderer_LoadResourceFile_661AF	proc far		; CODE XREF: TextRenderer_Main+714P
					; seg198:017Cp	...

var_6A		= word ptr -6Ah
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp

loc_661B2:
		sub	sp, 6Ah
		mov	[bp+var_4], 0
		lea	ax, [bp+var_6A]
		push	ax

loc_661C1:
		call	StreamReader_ConstructVariantA_63A39
		pop	cx

loc_661C7:
		push	1
		push	[bp+arg_0]
		lea	ax, [bp+var_6A]
		push	ax

loc_661D0:
		call	StreamReader_ReadDispatch_63D0E

loc_661D5:
		add	sp, 6

loc_661D8:
		cmp	al, 1
		jnz	short loc_66242
		push	1

loc_661DE:
		push	0
		mov	al, [bp+arg_2]
		push	ax

loc_661E4:
		lea	ax, [bp+var_6A]
		push	ax
		call	StreamReader_GetCapacity_64062
		pop	cx
		push	dx
		push	ax
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3

loc_661F8:
		add	sp, 0Ch

loc_661FB:
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax

loc_66201:
		cmp	[bp+var_4], 0
		jz	short loc_66242
		push	0
		mov	al, [bp+arg_2]
		push	ax
		push	dx
		push	word ptr [bp+var_4]

loc_66212:
		push	5C44h

loc_66215:
		call	Memory_TypedAllocDispatchB_5C832

loc_6621A:
		add	sp, 0Ah
		mov	word ptr [bp+var_C+2], dx

loc_66220:
		mov	word ptr [bp+var_C], ax

loc_66223:
		push	large 0FFFFFFFFh

loc_66226:
		lea	ax, [bp+var_6A]

loc_66229:
		push	ax
		call	StreamReader_GetCapacity_64062

loc_6622F:
		pop	cx
		push	dx
		push	ax

loc_66232:
		push	large [bp+var_C]
		lea	ax, [bp+var_6A]
		push	ax
		call	StreamReader_ReadTyped_63FA1

loc_6623F:
		add	sp, 0Eh

loc_66242:				; CODE XREF: TextRenderer_LoadResourceFile_661AF+2Bj
					; TextRenderer_LoadResourceFile_661AF+57j
		mov	eax, [bp+var_4]
		mov	[bp+var_8], eax
		push	2
		lea	ax, [bp+var_6A]
		push	ax

loc_66250:
		call	StreamReader_Close_63BD5

loc_66255:
		add	sp, 4
		mov	dx, word ptr [bp+var_8+2]
		mov	ax, word ptr [bp+var_8]
		leave
		retf
TextRenderer_LoadResourceFile_661AF	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 6Ah
		mov	byte ptr [bp-2], 1
		lea	ax, [bp-6Ah]
		push	ax
		call	StreamReader_ConstructVariantA_63A39
		pop	cx
		mov	word ptr [bp-6Ah], 2C8h
		mov	dword ptr [bp-9], 100h
		mov	dword ptr [bp-0Dh], 0
		push	0
		push	word ptr [bp+6]
		lea	ax, [bp-6Ah]

loc_66291:
		push	ax

loc_66292:
		mov	bx, [bp-6Ah]
		call	dword ptr [bx+14h]
		add	sp, 6

loc_6629B:
		mov	[bp-2],	al

loc_6629E:
		cmp	byte ptr [bp-2], 1

loc_662A2:
		jnz	short loc_662C9
		push	large 0FFFFFFFFh

loc_662A7:
		push	large dword ptr	[bp+0Ch]

loc_662AB:
		push	large dword ptr	[bp+8]

loc_662AF:
		lea	ax, [bp-6Ah]
		push	ax

loc_662B3:
		call	StreamReader_WriteTyped_6568F
		push	dx
		push	ax
		pop	eax
		add	sp, 0Eh

loc_662BF:
		cmp	eax, [bp+0Ch]
		jz	short loc_662C9
		mov	byte ptr [bp-2], 0

loc_662C9:				; CODE XREF: seg198:loc_662A2j
					; seg198:0123j
		mov	al, [bp-2]
		mov	[bp-4],	al
		push	2

loc_662D1:
		lea	ax, [bp-6Ah]
		push	ax
		call	StreamReader_ReleaseBuffer_65643
		add	sp, 4
		mov	al, [bp-4]
		leave
		retf
; ���������������������������������������������������������������������������
		push	bp

loc_662E3:
		mov	bp, sp

loc_662E5:
		sub	sp, 6
		push	si
		push	0Ah

loc_662EB:
		call	CRT_Malloc16_Retry

loc_662F0:
		pop	cx

loc_662F1:
		mov	si, ax

loc_662F3:
		or	ax, ax
		jz	short loc_66310

loc_662F7:
		mov	dword ptr [si],	0

loc_662FE:
		mov	byte ptr [si+4], 2

loc_66302:
		mov	byte ptr [si+5], 0
		mov	dword ptr [si+6], 0
		jmp	short loc_66312
; ���������������������������������������������������������������������������

loc_66310:				; CODE XREF: seg198:0155j
		mov	ax, si

loc_66312:				; CODE XREF: seg198:016Ej
		mov	si, ax
		mov	al, [bp+8]

loc_66317:
		push	ax
		push	word ptr [bp+6]
		push	cs
		call	near ptr TextRenderer_LoadResourceFile_661AF

loc_6631F:
		add	sp, 4
		mov	[bp-2],	dx
		mov	[bp-4],	ax
		mov	al, [bp+8]
		mov	[bp-5],	al
		mov	eax, [bp-4]
		mov	[si], eax
		mov	al, [bp-5]
		mov	[si+4],	al
		mov	byte ptr [si+5], 1

loc_6633F:
		mov	dword ptr [si+6], 0
		mov	ax, si
		pop	si
		leave
		retf
seg198		ends
