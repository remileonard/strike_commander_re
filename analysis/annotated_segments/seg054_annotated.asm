seg054		segment	byte public 'CODE' use16
		assume cs:seg054
		;org 0Fh
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

loc_2918F:				; DATA XREF: seg339:11A4o seg339:11C8o ...
		push	bp
		mov	bp, sp
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,42L — résout une table d'interpolation (sub_2F404/sub_2E8F1, table 0x541A) selon la
; progression d'une animation (+2 >>8), indexe la table par un paramètre (arg_4) : résolution
; de valeur d'easing/interpolation pour le système de keyframe (utilisée par seg042).
; ==============================================================================================
Keyframe_ResolveEasingValue	proc far		; CODE XREF: seg042:0A27P seg042:0B67P ...

var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+2]
		sar	eax, 8
		push	eax
		push	541Ah
		call	Interp_ResolveCached
		add	sp, 6
		push	ax
		push	541Ah
		call	Text_ResolveTruncated
		add	sp, 4
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		cmp	[bp+var_4], 0
		jnz	short loc_291D1
		mov	dl, [bp+arg_4]
		jmp	short loc_291DE
; ���������������������������������������������������������������������������

loc_291D1:				; CODE XREF: Keyframe_ResolveEasingValue+36j
		mov	al, [bp+arg_4]
		mov	ah, 0
		les	bx, [bp+var_4]
		add	bx, ax
		mov	dl, es:[bx]

loc_291DE:				; CODE XREF: Keyframe_ResolveEasingValue+3Bj
		mov	al, dl

locret_291E0:
		leave
		retf
Keyframe_ResolveEasingValue	endp

seg054		ends
