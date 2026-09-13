seg157		segment	byte public 'CODE' use16
		assume cs:seg157
		;org 8
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, référencée via vtable (DATA XREF seg216) et par sub_638FF — stub transmettant
; simplement son argument.
; ==============================================================================================
DisplayContext_Method_PassThrough_5F458	proc far		; CODE XREF: StreamReader_Destruct_638FF:loc_6394FP
					; DATA XREF: seg339:off_70A8Bo	...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp

loc_5F45B:				; DATA XREF: seg216:05AEo
		mov	ax, [bp+arg_0]

loc_5F45E:
		pop	bp
		retf
DisplayContext_Method_PassThrough_5F458	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⭐ far, fonction de rendu/validation de trame : bascule le mode vidéo (sub_2962) si le mode
; demandé diffère du mode courant (word_70EA2), détruit les sous-objets mis en cache
; (CachedObject_DestructSubobjects_5E95A), puis dispatche deux appels virtuels ([bx] et
; [si+2]). Référencée dans des dizaines de segments (constructeurs de classes du cluster
; mémoire paginée/texte : PagedResourceC_Construct_5CD3A,
; TextObjectCluster_DestructVariantA_5C42C, etc.) — probable point de synchronisation
; d'affichage commun à toutes ces classes.
; ==============================================================================================
DisplayContext_CommitFrame_5F460	proc far		; CODE XREF: PagedResourceB_Construct_5C34F+62P
					; TextObjectCluster_DestructVariantA_5C42C+55P ...

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp

loc_5F463:
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	dx, [bp+arg_2]
		cmp	dx, word_70EA2
		jz	short loc_5F487
		lea	ax, [bp+arg_4]
		mov	[bp+var_2], ax
		push	ax
		push	dx
		push	word_70EA2
		call	CRT_Msg_Sprintf2
		add	sp, 6

loc_5F487:				; CODE XREF: DisplayContext_CommitFrame_5F460+11j
		push	word_70EA2
		mov	ax, si
		add	ax, 6
		push	ax

loc_5F491:
		call	CachedObject_DestructSubobjects_5E95A

loc_5F496:
		add	sp, 4
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		pop	cx
		push	word ptr [si+6]
		call	dword ptr [si+2]
		pop	cx
		pop	si
		leave
		retf
DisplayContext_CommitFrame_5F460	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, enveloppe fine appelant DisplayContext_CommitFrame_5F460 avec un tag fixe (3E13h).
; Référencée par PagedMemory_ReadTextResource_5C14E (seg128).
; ==============================================================================================
DisplayContext_CommitFrameWithTag_5F4A9	proc far		; CODE XREF: PagedMemory_ReadTextResource_5C14E+62P
					; seg128:0197P	...

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	[bp+arg_2]
		push	3E13h
		push	ax
		push	cs
		call	near ptr DisplayContext_CommitFrame_5F460
		add	sp, 6
		pop	bp
		retf
DisplayContext_CommitFrameWithTag_5F4A9	endp

; ���������������������������������������������������������������������������
		push	bp

loc_5F4C0:
		mov	bp, sp

loc_5F4C2:
		mov	ax, [bp+6]

loc_5F4C5:
		push	word ptr [bp+0Ah]
		push	word ptr [bp+8]
		push	3E21h
		push	ax
		push	cs

loc_5F4D0:
		call	near ptr DisplayContext_CommitFrame_5F460
		add	sp, 8
		pop	bp
		retf
seg157		ends
