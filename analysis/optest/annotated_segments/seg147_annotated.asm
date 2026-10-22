seg147		segment	byte public 'CODE' use16
		assume cs:seg147
		;org 0Bh
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

loc_3BD7B:				; DATA XREF: dseg:056Eo dseg:0586o ...
		push	bp
		mov	bp, sp
		sub	sp, 80h
		push	si
		mov	si, [bp+6]
		xor	dx, dx
		cmp	word ptr [si+7Ch], 0
		jz	short loc_3BD94
		mov	dx, [si+7Ch]
		add	dx, 6

loc_3BD94:				; CODE XREF: seg147:001Cj
		mov	ax, si
		add	ax, 6Dh	; 'm'
		push	ax
		push	dx
		push	si
		call	StreamReader_ComputeHeaderOffset_3B8F8
		pop	cx
		push	ax
		push	4954h
		lea	ax, [bp-80h]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 0Ah
		lea	ax, [bp-80h]
		push	ax
		mov	ax, si
		add	ax, 6
		push	ax
		call	CachedObject_DestructSubobjects_2F1CF
		add	sp, 4
		push	si
		call	StreamReader_Destruct_3B16F
		pop	cx
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_3BDCE:				; DATA XREF: dseg:0576o dseg:058Eo ...
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		xor	ax, ax
		mov	[si+7Ah], ax
		movsx	eax, ax
		mov	[si+65h], eax
		xor	eax, eax
		mov	[si+76h], eax
		mov	[si+72h], eax
		mov	[si+69h], eax
		mov	al, 0
		mov	[si+71h], al
		mov	[si+6Dh], al
		mov	word ptr [si+7Ch], 0
		mov	dword ptr [si+8Ch], 0FFFFFFFFh
		mov	dword ptr [si+90h], 0
		mov	al, 1
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; ResourceRecord_Helper_645A5 (sub_645A5 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, dispatch vtable [bx+0x14] et sub_64C21.
; Appelée par sub_645CD.
; ==============================================================================================
ResourceRecord_Helper_3BE15	proc far		; CODE XREF: Gameflow_PlayScene_3B0B+1C8P
					; seg002:0D5EP	...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		jmp	short loc_3BE25
; ���������������������������������������������������������������������������

loc_3BE1E:				; CODE XREF: ResourceRecord_Helper_3BE15+14j
		push	si
		nop
		push	cs
		call	near ptr ResourceRecord_ReleaseAndClear_3C595
		pop	cx

loc_3BE25:				; CODE XREF: ResourceRecord_Helper_3BE15+7j
		cmp	word ptr [si+7Ah], 0
		jg	short loc_3BE1E
		mov	dword ptr [si+65h], 0
		push	si
		call	StreamReader_CloseHook_3B5DE
		pop	cx
		pop	si
		pop	bp
		retf
ResourceRecord_Helper_3BE15	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; ResourceRecord_InitAndValidate_645CD (sub_645CD de STRIKE.EXE). Résumé repris de STRIKE.EXE
; ; appelants et contexte à revérifier ici. — far, combine sub_64C21 et
; ResourceRecord_Helper_645A5.
; ==============================================================================================
ResourceRecord_InitAndValidate_3BE3D	proc far		; CODE XREF: sub_C3640+6DP
					; sub_C7675+70P

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= dword	ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	1
		push	[bp+arg_2]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+14h]
		add	sp, 6
		or	al, al
		jz	short loc_3BE72
		mov	eax, [si+6Dh]
		cmp	eax, [bp+arg_4]
		jnz	short loc_3BE6C
		push	si
		nop
		push	cs
		call	near ptr sub_3C491
		pop	cx
		mov	ax, 1
		jmp	short loc_3BE74
; ���������������������������������������������������������������������������

loc_3BE6C:				; CODE XREF: ResourceRecord_InitAndValidate_3BE3D+21j
		push	si
		push	cs
		call	near ptr ResourceRecord_Helper_3BE15
		pop	cx

loc_3BE72:				; CODE XREF: ResourceRecord_InitAndValidate_3BE3D+17j
		xor	ax, ax

loc_3BE74:				; CODE XREF: ResourceRecord_InitAndValidate_3BE3D+2Dj
		pop	si
		pop	bp
		retf
ResourceRecord_InitAndValidate_3BE3D	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		push	word ptr [si+59h]
		mov	bx, [si+59h]
		mov	bx, [bx]
		call	dword ptr [bx+1Ch]
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[si+65h], eax
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		jmp	short loc_3BEA5
; ���������������������������������������������������������������������������

loc_3BE9E:				; CODE XREF: seg147:0160j
		push	si
		nop
		push	cs
		call	near ptr ResourceRecord_ReleaseAndClear_3C595
		pop	cx

loc_3BEA5:				; CODE XREF: seg147:012Cj
		cmp	word ptr [si+7Ah], 0
		jle	short loc_3BED2
		cmp	word ptr [si+7Ch], 0
		jnz	short loc_3BEBA
		push	si
		nop
		push	cs
		call	near ptr ResourceRecord_ReadPayload_3C623
		pop	cx
		jmp	short loc_3BECE
; ���������������������������������������������������������������������������

loc_3BEBA:				; CODE XREF: seg147:013Fj
		mov	eax, [si+65h]
		mov	bx, [si+7Ch]
		cmp	eax, [bx+0Fh]
		jl	short loc_3BECC
		mov	ax, 1
		jmp	short loc_3BECE
; ���������������������������������������������������������������������������

loc_3BECC:				; CODE XREF: seg147:0155j
		xor	ax, ax

loc_3BECE:				; CODE XREF: seg147:0148j seg147:015Aj
		or	ax, ax
		jnz	short loc_3BE9E

loc_3BED2:				; CODE XREF: seg147:0139j
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		cmp	word ptr [si+7Ch], 0
		jz	short loc_3BEFD
		jmp	short loc_3BEEB
; ���������������������������������������������������������������������������

loc_3BEE4:				; CODE XREF: seg147:0181j
		push	si
		nop
		push	cs
		call	near ptr ResourceRecord_ReleaseAndClear_3C595
		pop	cx

loc_3BEEB:				; CODE XREF: seg147:0172j
		mov	bx, [si+7Ch]
		cmp	word ptr [bx], 0
		jnz	short loc_3BEE4
		mov	dword ptr [si+65h], 0Ch
		jmp	short loc_3BF05
; ���������������������������������������������������������������������������

loc_3BEFD:				; CODE XREF: seg147:0170j
		mov	dword ptr [si+65h], 0

loc_3BF05:				; CODE XREF: seg147:018Bj
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; ResourceRecord_ReadHeaderFields_64698 (sub_64698 de STRIKE.EXE). Résumé repris de STRIKE.EXE
; ; appelants et contexte à revérifier ici. — far, lit des champs d'en-tête via
; StreamReader_ReadTyped_63FA1. Appelée par sub_64BC1.
; ==============================================================================================
ResourceRecord_ReadHeaderFields_3BF08	proc far		; CODE XREF: ResourceRecord_ComputeAlignedBounds_3C431+17p

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	ax, si
		add	ax, 72h	; 'r'
		mov	[bp+var_2], ax
		push	large dword ptr	[si+65h]
		push	large 4
		push	ds
		push	ax
		push	si
		call	StreamReader_ReadTyped_3B811
		add	sp, 0Eh
		add	dword ptr [si+65h], 4
		mov	bx, [bp+var_2]
		mov	ax, [bx]
		xchg	ah, al
		xchg	ax, [bx+2]
		xchg	ah, al
		mov	[bx], ax
		mov	eax, [si+72h]
		shld	edx, eax, 10h
		pop	si
		leave
		retf
ResourceRecord_ReadHeaderFields_3BF08	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; ResourceRecord_ComputeRecordBounds_646DB (sub_646DB de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, combine sub_64BC1 et sub_64B9B —
; calcule les bornes d'un enregistrement (début/fin). Appelée par loc_649F0 et sub_647B2.
; ==============================================================================================
ResourceRecord_ComputeRecordBounds_3BF4B	proc far		; CODE XREF: sub_5803+E7P seg009:06F6P ...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		nop
		push	cs
		call	near ptr ResourceRecord_ComputeAlignedBounds_3C431
		pop	cx
		cmp	dword ptr [si+6Dh], 4D524F46h
		jnz	short loc_3BF68
		mov	ax, 1
		jmp	short loc_3BF6A
; ���������������������������������������������������������������������������

loc_3BF68:				; CODE XREF: ResourceRecord_ComputeRecordBounds_3BF4B+16j
		xor	ax, ax

loc_3BF6A:				; CODE XREF: ResourceRecord_ComputeRecordBounds_3BF4B+1Bj
		or	ax, ax
		jz	short loc_3BF7A
		push	si
		nop
		push	cs
		call	near ptr ResourceRecord_ReadDwordAdvance_3C40B
		pop	cx
		mov	ax, 1
		jmp	short loc_3BF7C
; ���������������������������������������������������������������������������

loc_3BF7A:				; CODE XREF: ResourceRecord_ComputeRecordBounds_3BF4B+21j
		xor	ax, ax

loc_3BF7C:				; CODE XREF: ResourceRecord_ComputeRecordBounds_3BF4B+2Dj
		pop	si
		pop	bp
		retf
ResourceRecord_ComputeRecordBounds_3BF4B	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; ResourceRecord_ComputeRecordBoundsB_6470F (sub_6470F de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, variante de
; ResourceRecord_ComputeRecordBounds_646DB (mêmes appels sub_64BC1/sub_64B9B). Appelée par
; sub_6482B.
; ==============================================================================================
ResourceRecord_ComputeRecordBoundsB_3BF7F	proc far		; CODE XREF: ResourceRecord_SeekAndReadC_3C09B+15p

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		nop
		push	cs
		call	near ptr ResourceRecord_ComputeAlignedBounds_3C431
		pop	cx
		cmp	dword ptr [si+6Dh], 20544143h
		jnz	short loc_3BF9C
		mov	ax, 1
		jmp	short loc_3BF9E
; ���������������������������������������������������������������������������

loc_3BF9C:				; CODE XREF: ResourceRecord_ComputeRecordBoundsB_3BF7F+16j
		xor	ax, ax

loc_3BF9E:				; CODE XREF: ResourceRecord_ComputeRecordBoundsB_3BF7F+1Bj
		or	ax, ax
		jz	short loc_3BFAE
		push	si
		nop
		push	cs
		call	near ptr ResourceRecord_ReadDwordAdvance_3C40B
		pop	cx
		mov	ax, 1
		jmp	short loc_3BFB0
; ���������������������������������������������������������������������������

loc_3BFAE:				; CODE XREF: ResourceRecord_ComputeRecordBoundsB_3BF7F+21j
		xor	ax, ax

loc_3BFB0:				; CODE XREF: ResourceRecord_ComputeRecordBoundsB_3BF7F+2Dj
		pop	si
		pop	bp
		retf
ResourceRecord_ComputeRecordBoundsB_3BF7F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; ResourceRecord_SeekAndRead_64743 (sub_64743 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, LUE 2026-10-12. CHERCHE UN CHUNK par son tag
; dans le niveau courant (FORM courant) : arg_6 == 0 → ResourceRecord_SeekToStart_64BF8
; (repart du DÉBUT du FORM courant, +0x0C après son en-tête) ; sinon continue depuis la
; position courante. Parcourt les chunks (ResourceRecord_ComputeAlignedBounds_64BC1) jusqu'à
; trouver [rr+0x6D] == tag ou la fin du FORM. Renvoie 1 si trouvé (positionné au début des
; données). Tous les lecteurs de chunks passent 0 : l'ordre des chunks dans un FORM est donc
; LIBRE, et un tag présent deux fois n'est lu qu'une fois (la première occurrence).
; ==============================================================================================
ResourceRecord_SeekAndRead_3BFB3	proc far		; CODE XREF: sub_5803+ACP
					; sub_5803+112P ...

arg_0		= word ptr  6
arg_2		= dword	ptr  8
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	[bp+arg_6], 0
		jnz	short loc_3BFC8
		push	si
		nop
		push	cs
		call	near ptr ResourceRecord_SeekToStart_3C468
		pop	cx

loc_3BFC8:				; CODE XREF: ResourceRecord_SeekAndRead_3BFB3+Cj
		xor	di, di
		jmp	short loc_3BFF5
; ���������������������������������������������������������������������������

loc_3BFCC:				; CODE XREF: ResourceRecord_SeekAndRead_3BFB3+67j
		push	si
		nop
		push	cs
		call	near ptr ResourceRecord_ComputeAlignedBounds_3C431
		pop	cx
		mov	eax, [si+6Dh]
		cmp	eax, [bp+arg_2]
		jnz	short loc_3BFE2
		mov	ax, 1
		jmp	short loc_3BFE4
; ���������������������������������������������������������������������������

loc_3BFE2:				; CODE XREF: ResourceRecord_SeekAndRead_3BFB3+28j
		xor	ax, ax

loc_3BFE4:				; CODE XREF: ResourceRecord_SeekAndRead_3BFB3+2Dj
		or	ax, ax
		jz	short loc_3BFED
		mov	di, 1
		jmp	short loc_3C01C
; ���������������������������������������������������������������������������

loc_3BFED:				; CODE XREF: ResourceRecord_SeekAndRead_3BFB3+33j
		mov	eax, [si+76h]
		mov	[si+65h], eax

loc_3BFF5:				; CODE XREF: ResourceRecord_SeekAndRead_3BFB3+17j
		cmp	word ptr [si+7Ch], 0
		jnz	short loc_3C004
		push	si
		nop
		push	cs
		call	near ptr ResourceRecord_ReadPayload_3C623
		pop	cx
		jmp	short loc_3C018
; ���������������������������������������������������������������������������

loc_3C004:				; CODE XREF: ResourceRecord_SeekAndRead_3BFB3+46j
		mov	eax, [si+65h]
		mov	bx, [si+7Ch]
		cmp	eax, [bx+0Fh]
		jl	short loc_3C016
		mov	ax, 1
		jmp	short loc_3C018
; ���������������������������������������������������������������������������

loc_3C016:				; CODE XREF: ResourceRecord_SeekAndRead_3BFB3+5Cj
		xor	ax, ax

loc_3C018:				; CODE XREF: ResourceRecord_SeekAndRead_3BFB3+4Fj
					; ResourceRecord_SeekAndRead_3BFB3+61j
		or	ax, ax
		jz	short loc_3BFCC

loc_3C01C:				; CODE XREF: ResourceRecord_SeekAndRead_3BFB3+38j
		mov	ax, di
		pop	di
		pop	si
		pop	bp
		retf
ResourceRecord_SeekAndRead_3BFB3	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; ResourceRecord_SeekAndReadB_647B2 (sub_647B2 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, LUE 2026-10-12. ENTRE DANS UN FORM de type
; donné : comme ResourceRecord_SeekAndRead_64743 (arg_6 == 0 → recherche depuis le début du
; FORM courant), mais ne retient que les chunks 'FORM'
; (ResourceRecord_ComputeRecordBounds_646DB teste 4D524F46h) dont le type vaut le tag ; trouvé
; → ResourceRecord_AllocateAndDecode_64C21 empile le niveau (on lit ensuite à l'intérieur ;
; sortie par ResourceRecord_ReleaseAndClear_64D25). Renvoie 1 si trouvé.
; ==============================================================================================
ResourceRecord_SeekAndReadB_3C022	proc far		; CODE XREF: sub_5803+1A0P
					; sub_5803+31DP ...

arg_0		= word ptr  6
arg_2		= dword	ptr  8
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	[bp+arg_6], 0
		jnz	short loc_3C037
		push	si
		nop
		push	cs
		call	near ptr ResourceRecord_SeekToStart_3C468
		pop	cx

loc_3C037:				; CODE XREF: ResourceRecord_SeekAndReadB_3C022+Cj
		xor	di, di
		jmp	short loc_3C06E
; ���������������������������������������������������������������������������

loc_3C03B:				; CODE XREF: ResourceRecord_SeekAndReadB_3C022+71j
		push	si
		push	cs
		call	near ptr ResourceRecord_ComputeRecordBounds_3BF4B
		pop	cx
		or	ax, ax
		jz	short loc_3C066
		mov	eax, [si+6Dh]
		cmp	eax, [bp+arg_2]
		jnz	short loc_3C054
		mov	ax, 1
		jmp	short loc_3C056
; ���������������������������������������������������������������������������

loc_3C054:				; CODE XREF: ResourceRecord_SeekAndReadB_3C022+2Bj
		xor	ax, ax

loc_3C056:				; CODE XREF: ResourceRecord_SeekAndReadB_3C022+30j
		or	ax, ax
		jz	short loc_3C066
		mov	di, 1
		push	si
		nop
		push	cs
		call	near ptr sub_3C491
		pop	cx
		jmp	short loc_3C095
; ���������������������������������������������������������������������������

loc_3C066:				; CODE XREF: ResourceRecord_SeekAndReadB_3C022+21j
					; ResourceRecord_SeekAndReadB_3C022+36j
		mov	eax, [si+76h]
		mov	[si+65h], eax

loc_3C06E:				; CODE XREF: ResourceRecord_SeekAndReadB_3C022+17j
		cmp	word ptr [si+7Ch], 0
		jnz	short loc_3C07D
		push	si
		nop
		push	cs
		call	near ptr ResourceRecord_ReadPayload_3C623
		pop	cx
		jmp	short loc_3C091
; ���������������������������������������������������������������������������

loc_3C07D:				; CODE XREF: ResourceRecord_SeekAndReadB_3C022+50j
		mov	eax, [si+65h]
		mov	bx, [si+7Ch]
		cmp	eax, [bx+0Fh]
		jl	short loc_3C08F
		mov	ax, 1
		jmp	short loc_3C091
; ���������������������������������������������������������������������������

loc_3C08F:				; CODE XREF: ResourceRecord_SeekAndReadB_3C022+66j
		xor	ax, ax

loc_3C091:				; CODE XREF: ResourceRecord_SeekAndReadB_3C022+59j
					; ResourceRecord_SeekAndReadB_3C022+6Bj
		or	ax, ax
		jz	short loc_3C03B

loc_3C095:				; CODE XREF: ResourceRecord_SeekAndReadB_3C022+42j
		mov	ax, di
		pop	di
		pop	si
		pop	bp
		retf
ResourceRecord_SeekAndReadB_3C022	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; ResourceRecord_SeekAndReadC_6482B (sub_6482B de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — ⚠️ far, 92 lignes, NON DÉTAILLÉE — combine
; sub_64BF8, ResourceRecord_ComputeRecordBoundsB_6470F, sub_64CA3, sub_64DB3.
; ==============================================================================================
ResourceRecord_SeekAndReadC_3C09B	proc far		; CODE XREF: seg009:06DFP

arg_0		= word ptr  6
arg_2		= dword	ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	si
		nop
		push	cs
		call	near ptr ResourceRecord_SeekToStart_3C468
		pop	cx
		xor	di, di
		jmp	short loc_3C0E1
; ���������������������������������������������������������������������������

loc_3C0AE:				; CODE XREF: ResourceRecord_SeekAndReadC_3C09B+6Bj
		push	si
		push	cs
		call	near ptr ResourceRecord_ComputeRecordBoundsB_3BF7F
		pop	cx
		or	ax, ax
		jz	short loc_3C0D9
		mov	eax, [si+6Dh]
		cmp	eax, [bp+arg_2]
		jnz	short loc_3C0C7
		mov	ax, 1
		jmp	short loc_3C0C9
; ���������������������������������������������������������������������������

loc_3C0C7:				; CODE XREF: ResourceRecord_SeekAndReadC_3C09B+25j
		xor	ax, ax

loc_3C0C9:				; CODE XREF: ResourceRecord_SeekAndReadC_3C09B+2Aj
		or	ax, ax
		jz	short loc_3C0D9
		mov	di, 1
		push	si
		nop
		push	cs
		call	near ptr sub_3C513
		pop	cx
		jmp	short loc_3C108
; ���������������������������������������������������������������������������

loc_3C0D9:				; CODE XREF: ResourceRecord_SeekAndReadC_3C09B+1Bj
					; ResourceRecord_SeekAndReadC_3C09B+30j
		mov	eax, [si+76h]
		mov	[si+65h], eax

loc_3C0E1:				; CODE XREF: ResourceRecord_SeekAndReadC_3C09B+11j
		cmp	word ptr [si+7Ch], 0
		jnz	short loc_3C0F0
		push	si
		nop
		push	cs
		call	near ptr ResourceRecord_ReadPayload_3C623
		pop	cx
		jmp	short loc_3C104
; ���������������������������������������������������������������������������

loc_3C0F0:				; CODE XREF: ResourceRecord_SeekAndReadC_3C09B+4Aj
		mov	eax, [si+65h]
		mov	bx, [si+7Ch]
		cmp	eax, [bx+0Fh]
		jl	short loc_3C102
		mov	ax, 1
		jmp	short loc_3C104
; ���������������������������������������������������������������������������

loc_3C102:				; CODE XREF: ResourceRecord_SeekAndReadC_3C09B+60j
		xor	ax, ax

loc_3C104:				; CODE XREF: ResourceRecord_SeekAndReadC_3C09B+53j
					; ResourceRecord_SeekAndReadC_3C09B+65j
		or	ax, ax
		jz	short loc_3C0AE

loc_3C108:				; CODE XREF: ResourceRecord_SeekAndReadC_3C09B+3Cj
		mov	ax, di
		pop	di
		pop	si
		pop	bp
		retf
ResourceRecord_SeekAndReadC_3C09B	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; ResourceRecord_Helper_6489E (sub_6489E de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, rôle exact non détaillé (voisin du cluster de
; lecture d'enregistrement).
; ==============================================================================================
ResourceRecord_Helper_3C10E	proc far		; CODE XREF: seg147:03DCp

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	eax, [si+65h]
		mov	[si+8Ch], eax
		mov	eax, [si+72h]
		mov	ebx, 4
		cdq
		idiv	ebx
		mov	[si+90h], eax
		pop	si
		pop	bp
		retf
ResourceRecord_Helper_3C10E	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		mov	ax, [bp+8]
		mov	[si+94h], ax
		mov	ax, [bp+0Ah]
		mov	[si+96h], ax
		push	si
		push	cs
		call	near ptr ResourceRecord_Helper_3C10E
		pop	cx
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; ResourceRecord_ReadStructured_648E3 (sub_648E3 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — ⚠️ far, 89 lignes, NON DÉTAILLÉE — probable
; lecture d'une structure complète depuis le flux.
; ==============================================================================================
ResourceRecord_ReadStructured_3C153	proc far		; CODE XREF: seg147:04B8p

var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= dword	ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+arg_0]
		mov	dword ptr [si+0A0h], 0
		mov	eax, [si+65h]
		mov	[bp+var_4], eax
		mov	[bp+var_8], 0FFFFFFFFh
		mov	eax, [si+90h]
		cmp	eax, [bp+arg_2]
		jle	short loc_3C1A4
		mov	eax, [bp+arg_2]
		shl	eax, 2
		mov	edx, [si+8Ch]
		add	edx, eax
		mov	[si+65h], edx
		push	si
		nop
		push	cs
		call	near ptr ResourceRecord_ReadFieldGroupC_3C2EE
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_8], eax

loc_3C1A4:				; CODE XREF: ResourceRecord_ReadStructured_3C153+2Cj
		cmp	[bp+var_8], 0FFFFFFFFh
		jz	short loc_3C1E0
		mov	eax, [bp+var_8]
		mov	[si+65h], eax
		mov	eax, [si+65h]
		mov	[si+9Ch], eax
		push	si
		nop
		push	cs
		call	near ptr ResourceRecord_ReadFieldGroupC_3C2EE
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[si+0A0h], eax
		mov	eax, [si+9Ch]
		add	eax, [si+0A0h]
		mov	[si+0A4h], eax
		mov	ax, 1
		jmp	short loc_3C1EA
; ���������������������������������������������������������������������������

loc_3C1E0:				; CODE XREF: ResourceRecord_ReadStructured_3C153+56j
		mov	eax, [bp+var_4]
		mov	[si+65h], eax
		xor	ax, ax

loc_3C1EA:				; CODE XREF: ResourceRecord_ReadStructured_3C153+8Bj
		pop	si
		leave
		retf
ResourceRecord_ReadStructured_3C153	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		mov	cx, [bp+8]
		mov	dx, [bp+0Ah]
		mov	dword ptr [si+0A0h], 0
		cmp	[si+94h], cx
		jl	short loc_3C20F
		cmp	[si+96h], dx
		jge	short loc_3C213

loc_3C20F:				; CODE XREF: seg147:0497j
		xor	ax, ax
		jmp	short loc_3C22E
; ���������������������������������������������������������������������������

loc_3C213:				; CODE XREF: seg147:049Dj
		mov	ax, dx
		imul	word ptr [si+94h]
		movsx	eax, ax
		movsx	edx, cx
		add	eax, edx
		push	eax
		push	si
		push	cs
		call	near ptr ResourceRecord_ReadStructured_3C153
		add	sp, 6

loc_3C22E:				; CODE XREF: seg147:04A1j
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; ResourceRecord_AdvanceByArrayCount_649C1 (sub_649C1 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, calcule une nouvelle position en
; avançant de (compte × 4 octets) — saut par-dessus un tableau de références.
; ==============================================================================================
ResourceRecord_AdvanceByArrayCount_3C231	proc far		; CODE XREF: seg148:0651P

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	eax, [si+65h]
		mov	[si+8Ch], eax
		mov	[si+98h], eax
		movsx	eax, [bp+arg_2]
		mov	[si+90h], eax
		mov	eax, [si+90h]
		shl	eax, 2
		add	[si+65h], eax
		pop	si
		pop	bp
		retf
ResourceRecord_AdvanceByArrayCount_3C231	endp

; ���������������������������������������������������������������������������

loc_3C260:				; DATA XREF: dseg:057Ao dseg:0592o ...
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		cmp	byte ptr [si+4Ch], 0
		jz	short loc_3C286
		mov	word ptr [si+86h], 1
		push	si
		push	cs
		call	near ptr ResourceRecord_ComputeRecordBounds_3BF4B
		pop	cx
		or	ax, ax
		jz	short loc_3C286
		mov	eax, [si+76h]
		mov	[si+88h], eax

loc_3C286:				; CODE XREF: seg147:04FBj seg147:050Bj
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; ResourceRecord_ReadFieldGroupA_64A19 (sub_64A19 de STRIKE.EXE). Résumé repris de STRIKE.EXE
; ; appelants et contexte à revérifier ici. — far, lit un groupe de champs via
; StreamReader_ReadTyped_63FA1 (×3).
; ==============================================================================================
ResourceRecord_ReadFieldGroupA_3C289	proc far		; CODE XREF: sub_5803+4E5P
					; seg009:075FP	...

var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= dword	ptr  8
arg_6		= dword	ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		push	large dword ptr	[si+65h]
		push	large [bp+arg_6]
		push	large [bp+arg_2]
		push	si
		call	StreamReader_ReadTyped_3B811
		push	dx
		push	ax
		pop	eax
		add	sp, 0Eh
		mov	[bp+var_4], eax
		mov	eax, [bp+arg_6]
		add	[si+65h], eax
		mov	eax, [bp+var_4]
		shld	edx, eax, 10h
		pop	si
		leave
		retf
ResourceRecord_ReadFieldGroupA_3C289	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; ResourceRecord_ReadFieldGroupB_64A54 (sub_64A54 de STRIKE.EXE). Résumé repris de STRIKE.EXE
; ; appelants et contexte à revérifier ici. — far, lit un groupe de champs via
; StreamReader_ReadTyped_63FA1. | PRÉCISÉ 2026-10-12 : lit 2 octets
; (StreamReader_ReadTyped_63FA1 taille 2) à la position courante et avance de 2 =
; uint16/int16.
; ==============================================================================================
ResourceRecord_ReadFieldGroupB_3C2C4	proc far		; CODE XREF: sub_5803+1BAP
					; sub_5803+219P ...

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		push	large dword ptr	[si+65h]
		push	large 2
		push	ss
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	StreamReader_ReadTyped_3B811
		add	sp, 0Eh
		add	dword ptr [si+65h], 2
		mov	ax, [bp+var_2]
		pop	si
		leave
		retf
ResourceRecord_ReadFieldGroupB_3C2C4	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; ResourceRecord_ReadFieldGroupC_64A7E (sub_64A7E de STRIKE.EXE). Résumé repris de STRIKE.EXE
; ; appelants et contexte à revérifier ici. — far, lit un groupe de champs via
; StreamReader_ReadTyped_63FA1. Référencée par sub_8DF49. | PRÉCISÉ 2026-10-12 : lit 4 octets
; (taille 4) et avance de 4 = uint32/int32 (24.8 selon l'usage).
; ==============================================================================================
ResourceRecord_ReadFieldGroupC_3C2EE	proc far		; CODE XREF: ResourceRecord_ReadStructured_3C153+45p
					; ResourceRecord_ReadStructured_3C153+6Cp ...

var_4		= dword	ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		push	large dword ptr	[si+65h]
		push	large 4
		push	ss
		lea	ax, [bp+var_4]
		push	ax
		push	si
		call	StreamReader_ReadTyped_3B811
		add	sp, 0Eh
		add	dword ptr [si+65h], 4
		mov	eax, [bp+var_4]
		shld	edx, eax, 10h
		pop	si
		leave
		retf
ResourceRecord_ReadFieldGroupC_3C2EE	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+6]
		push	large dword ptr	[si+65h]
		push	large 4
		push	ss
		lea	ax, [bp-4]
		push	ax
		push	si
		call	StreamReader_ReadTyped_3B811
		add	sp, 0Eh
		mov	eax, [bp-4]
		shld	edx, eax, 10h
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; ResourceRecord_ReadViaHelper_64AD9 (sub_64AD9 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, appelle ResourceRecord_ReadFinalField_64B51.
; Référencée par sub_8DF49.
; ==============================================================================================
ResourceRecord_ReadViaHelper_3C349	proc far		; CODE XREF: Gameflow_ShowMap_542AC+19DP
					; sub_BDE10+A0EP

arg_0		= word ptr  6
arg_2		= dword	ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		xor	di, di

loc_3C353:				; CODE XREF: ResourceRecord_ReadViaHelper_3C349+1Ej
		push	si
		nop
		push	cs
		call	near ptr ResourceRecord_ReadFinalField_3C3C1
		pop	cx
		mov	dx, di
		inc	di
		les	bx, [bp+arg_2]
		add	bx, dx
		mov	es:[bx], al
		or	al, al
		jnz	short loc_3C353
		mov	ax, di
		pop	di
		pop	si
		pop	bp
		retf
ResourceRecord_ReadViaHelper_3C349	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; ResourceRecord_ReadDwordFieldB_64AFF (sub_64AFF de STRIKE.EXE). Résumé repris de STRIKE.EXE
; ; appelants et contexte à revérifier ici. — far, lit un champ 32 bits via
; StreamReader_ReadTyped_63FA1. Référencée par sub_7E1B4.
; ==============================================================================================
ResourceRecord_ReadDwordFieldB_3C36F	proc far		; CODE XREF: sub_9B09+118P
					; sub_1220C+13DP ...

var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= dword	ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+72h]
		and	ax, 1
		movsx	eax, ax
		mov	edx, [si+76h]
		sub	edx, eax
		sub	edx, [si+65h]
		mov	[bp+var_4], edx
		push	large dword ptr	[si+65h]
		push	edx
		push	large [bp+arg_2]
		push	si
		call	StreamReader_ReadTyped_3B811
		push	dx
		push	ax
		pop	eax
		add	sp, 0Eh
		mov	[bp+var_8], eax
		mov	eax, [si+76h]
		mov	[si+65h], eax
		mov	eax, [bp+var_8]
		shld	edx, eax, 10h
		pop	si
		leave
		retf
ResourceRecord_ReadDwordFieldB_3C36F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; ResourceRecord_ReadFinalField_64B51 (sub_64B51 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, lit un champ final via
; StreamReader_ReadTyped_63FA1. Référencée par sub_3C942. | PRÉCISÉ 2026-10-12 : lit 1 octet
; (taille 1) et avance de 1 = uint8.
; ==============================================================================================
ResourceRecord_ReadFinalField_3C3C1	proc far		; CODE XREF: sub_5803+B5P
					; sub_5803+11FP ...

var_1		= byte ptr -1
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	eax, [si+65h]
		inc	dword ptr [si+65h]
		push	eax
		push	large 1
		push	ss
		lea	ax, [bp-1]
		push	ax
		push	si
		call	StreamReader_ReadTyped_3B811
		add	sp, 0Eh
		mov	al, [bp+var_1]
		mov	ah, 0
		pop	si
		leave
		retf
ResourceRecord_ReadFinalField_3C3C1	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		push	large dword ptr	[bp+0Ch]
		push	large dword ptr	[bp+10h]
		push	large dword ptr	[bp+8]
		push	ax
		call	StreamReader_ReadTyped_3B811
		add	sp, 0Eh
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; ResourceRecord_ReadDwordAdvance_64B9B (sub_64B9B de STRIKE.EXE). Résumé repris de STRIKE.EXE
; ; appelants et contexte à revérifier ici. — far, lit un champ 32 bits depuis la position
; courante (+0x65) via StreamReader_ReadTyped_63FA1 et avance la position de 4 octets.
; Fonction fondamentale du cluster (lecture séquentielle typée).
; ==============================================================================================
ResourceRecord_ReadDwordAdvance_3C40B	proc far		; CODE XREF: ResourceRecord_ComputeRecordBounds_3BF4B+26p
					; ResourceRecord_ComputeRecordBoundsB_3BF7F+26p ...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	large dword ptr	[si+65h]
		push	large 4
		push	ds
		mov	ax, si
		add	ax, 6Dh	; 'm'
		push	ax
		push	si
		call	StreamReader_ReadTyped_3B811
		add	sp, 0Eh
		add	dword ptr [si+65h], 4
		pop	si
		pop	bp
		retf
ResourceRecord_ReadDwordAdvance_3C40B	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; ResourceRecord_ComputeAlignedBounds_64BC1 (sub_64BC1 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, sauvegarde la position (+0x69),
; lit un champ (ResourceRecord_ReadDwordAdvance_64B9B), lit l'en-tête
; (ResourceRecord_ReadHeaderFields_64698), calcule une fin alignée (+0x76) avec correction de
; parité (+0x72).
; ==============================================================================================
ResourceRecord_ComputeAlignedBounds_3C431	proc far		; CODE XREF: sub_9B09+9EP ResourceRecord_ComputeRecordBounds_3BF4B+Ap ...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	eax, [si+65h]
		mov	[si+69h], eax
		push	si
		push	cs
		call	near ptr ResourceRecord_ReadDwordAdvance_3C40B
		pop	cx
		push	si
		push	cs
		call	near ptr ResourceRecord_ReadHeaderFields_3BF08
		pop	cx
		mov	ax, [si+72h]
		and	ax, 1
		movsx	eax, ax
		mov	edx, [si+65h]
		add	edx, [si+72h]
		add	edx, eax
		mov	[si+76h], edx
		pop	si
		pop	bp
		retf
ResourceRecord_ComputeAlignedBounds_3C431	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; ResourceRecord_SeekToStart_64BF8 (sub_64BF8 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, positionne (+0x65) au début de
; l'enregistrement courant (+0x7C) avec un décalage fixe (+0xC), ou à 0 si aucun
; enregistrement courant.
; ==============================================================================================
ResourceRecord_SeekToStart_3C468	proc far		; CODE XREF: ResourceRecord_SeekAndRead_3BFB3+11p
					; ResourceRecord_SeekAndReadB_3C022+11p ...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+7Ch], 0
		jnz	short loc_3C47F
		mov	dword ptr [si+65h], 0
		jmp	short loc_3C48E
; ���������������������������������������������������������������������������

loc_3C47F:				; CODE XREF: ResourceRecord_SeekToStart_3C468+Bj
		mov	bx, [si+7Ch]
		mov	eax, [bx+2]
		add	eax, 0Ch
		mov	[si+65h], eax

loc_3C48E:				; CODE XREF: ResourceRecord_SeekToStart_3C468+15j
		pop	si
		pop	bp
		retf
ResourceRecord_SeekToStart_3C468	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_3C491	proc far		; CODE XREF: sub_5803+36P sub_5803+9BP ...

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	ax, [si+7Ch]
		mov	[bp+var_2], ax
		mov	ax, si
		add	ax, 69h	; 'i'
		mov	[bp+var_4], ax
		push	13h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_3C4F5
		mov	ax, [bp+var_2]
		mov	[di], ax
		mov	bx, [bp+var_4]
		mov	eax, [bx]
		mov	[di+2],	eax
		mov	eax, [bx+9]
		mov	[di+0Bh], eax
		push	4
		mov	ax, [bp+var_4]
		add	ax, 4
		push	ax
		mov	ax, di
		add	ax, 6
		push	ax
		call	CRT_Strncpy_Pad
		add	sp, 6
		mov	bx, [bp+var_4]
		mov	eax, [bx+0Dh]
		mov	[di+0Fh], eax
		mov	ax, di
		jmp	short loc_3C4F7
; ���������������������������������������������������������������������������

loc_3C4F5:				; CODE XREF: sub_3C491+25j
		mov	ax, di

loc_3C4F7:				; CODE XREF: sub_3C491+62j
		mov	[si+7Ch], ax
		cmp	word ptr [si+7Ch], 0
		jnz	short loc_3C50C
		push	0B0E0h
		push	si
		call	DisplayContext_CommitFrameWithTag_2FD1E
		add	sp, 4

loc_3C50C:				; CODE XREF: sub_3C491+6Dj
		inc	word ptr [si+7Ah]
		pop	di
		pop	si
		leave
		retf
sub_3C491	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_3C513	proc far		; CODE XREF: ResourceRecord_SeekAndReadC_3C09B+38p

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	ax, [si+7Ch]
		mov	[bp+var_2], ax
		mov	ax, si
		add	ax, 69h	; 'i'
		mov	[bp+var_4], ax
		push	13h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_3C577
		mov	ax, [bp+var_2]
		mov	[di], ax
		mov	bx, [bp+var_4]
		mov	eax, [bx]
		mov	[di+2],	eax
		mov	eax, [bx+9]
		mov	[di+0Bh], eax
		push	4
		mov	ax, [bp+var_4]
		add	ax, 4
		push	ax
		mov	ax, di
		add	ax, 6
		push	ax
		call	CRT_Strncpy_Pad
		add	sp, 6
		mov	bx, [bp+var_4]
		mov	eax, [bx+0Dh]
		mov	[di+0Fh], eax
		mov	ax, di
		jmp	short loc_3C579
; ���������������������������������������������������������������������������

loc_3C577:				; CODE XREF: sub_3C513+25j
		mov	ax, di

loc_3C579:				; CODE XREF: sub_3C513+62j
		mov	[si+7Ch], ax
		cmp	word ptr [si+7Ch], 0
		jnz	short loc_3C58E
		push	0B0E0h
		push	si
		call	DisplayContext_CommitFrameWithTag_2FD1E
		add	sp, 4

loc_3C58E:				; CODE XREF: sub_3C513+6Dj
		inc	word ptr [si+7Ah]
		pop	di
		pop	si
		leave
		retf
sub_3C513	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; ResourceRecord_ReleaseAndClear_64D25 (sub_64D25 de STRIKE.EXE). Résumé repris de STRIKE.EXE
; ; appelants et contexte à revérifier ici. — far, libère (sub_338) et réinitialise l'état de
; l'enregistrement courant.
; ==============================================================================================
ResourceRecord_ReleaseAndClear_3C595	proc far		; CODE XREF: sub_5803+DEP
					; sub_5803+2FEP ...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+7Ch], 0
		jz	short loc_3C5C5
		mov	dx, [si+7Ch]
		mov	bx, [si+7Ch]
		mov	eax, [bx+0Fh]
		mov	[si+65h], eax
		mov	ax, [bx]
		mov	[si+7Ch], ax
		or	dx, dx
		jz	short loc_3C5C2
		push	dx
		call	sub_308
		pop	cx
		jmp	short $+2

loc_3C5C2:				; CODE XREF: ResourceRecord_ReleaseAndClear_3C595+22j
		dec	word ptr [si+7Ah]

loc_3C5C5:				; CODE XREF: ResourceRecord_ReleaseAndClear_3C595+Bj
		pop	si
		pop	bp
		retf
ResourceRecord_ReleaseAndClear_3C595	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; ResourceRecord_ResetIfSet_64D58 (sub_64D58 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, appelle ResourceRecord_ReleaseAndClear_64D25
; conditionnellement.
; ==============================================================================================
ResourceRecord_ResetIfSet_3C5C8	proc far		; CODE XREF: seg009:07B1P

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	ax
		push	cs
		call	near ptr ResourceRecord_ReleaseAndClear_3C595
		pop	cx
		pop	bp
		retf
ResourceRecord_ResetIfSet_3C5C8	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_3C5D6	proc far		; CODE XREF: sub_58EEA+2A7P
					; sub_58EEA+399P

arg_0		= word ptr  6
arg_2		= dword	ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	eax, [bp+arg_2]
		mov	[si+82h], eax
		mov	eax, [si+72h]
		cdq
		idiv	[bp+arg_2]
		mov	[si+7Eh], eax
		shld	edx, eax, 10h
		pop	si
		pop	bp
		retf
sub_3C5D6	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		push	large dword ptr	[si+65h]
		mov	eax, [si+7Eh]
		imul	eax, [si+82h]
		push	eax
		push	ds
		push	word ptr [bp+8]
		push	si
		call	StreamReader_ReadTyped_3B811
		add	sp, 0Eh
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; ResourceRecord_ReadPayload_64DB3 (sub_64DB3 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, lit la charge utile d'un enregistrement
; (appelle StreamReader_GetCapacity_64062) — fonction de lecture de contenu, cœur du décodage
; d'enregistrement. Référencée massivement dans ce cluster. CONFIRMÉ IFF/FORM-CHUNK (voir
; seg339).
; ==============================================================================================
ResourceRecord_ReadPayload_3C623	proc far		; CODE XREF: seg009:0797P seg147:0144p ...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		call	StreamReader_GetCapacity_3B8D2
		push	dx
		push	ax
		pop	eax
		pop	cx
		cmp	eax, [si+65h]
		jg	short loc_3C640
		mov	ax, 1
		jmp	short loc_3C642
; ���������������������������������������������������������������������������

loc_3C640:				; CODE XREF: ResourceRecord_ReadPayload_3C623+16j
		xor	ax, ax

loc_3C642:				; CODE XREF: ResourceRecord_ReadPayload_3C623+1Bj
		pop	si
		pop	bp
		retf
ResourceRecord_ReadPayload_3C623	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 2
		mov	dx, [bp+6]
		push	large 0FFFFFFFFh
		push	large 1
		push	ss
		lea	ax, [bp-1]
		push	ax
		push	dx
		call	StreamReader_ReadTyped_3B811
		push	dx
		push	ax
		pop	eax
		add	sp, 0Eh
		cmp	eax, 1
		jz	short loc_3C671
		mov	ax, 1
		jmp	short locret_3C673
; ���������������������������������������������������������������������������

loc_3C671:				; CODE XREF: seg147:08FAj
		xor	ax, ax

locret_3C673:				; CODE XREF: seg147:08FFj
		leave
		retf
; ���������������������������������������������������������������������������

loc_3C675:				; DATA XREF: dseg:057Eo dseg:0596o ...
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		push	large 80h ; '�'
		push	0
		call	FileStream_Construct_3AE1E
		add	sp, 6
		pop	bp
		retf
seg147		ends
