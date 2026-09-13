ovr305		segment	para public 'OVERLAY' use16
		assume cs:ovr305
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, aucun appel externe visible (64 lignes).
; ==============================================================================================
Debris_Helper5_9C940	proc far		; CODE XREF: VROOMM_StubThunk_6C0B0J

var_4		= dword	ptr -4
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	di, [bp+arg_6]
		push	di
		mov	bx, [di]
		call	dword ptr [bx+34h]
		pop	cx
		cmp	al, 0Fh
		jnz	short loc_9C96C
		cmp	word ptr [di+5Ch], 20h ; ' '
		jnz	short loc_9C962
		inc	word ptr [si+2Ah]

loc_9C962:				; CODE XREF: Debris_Helper5_9C940+1Dj
		cmp	word ptr [di+5Ch], 40h ; '@'
		jnz	short loc_9C96C
		add	word ptr [si+2Ah], 2

loc_9C96C:				; CODE XREF: Debris_Helper5_9C940+17j
					; Debris_Helper5_9C940+26j
		mov	ax, [si+2Ah]
		push	ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		pop	cx
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		les	bx, [bp+var_4]
		pop	ax

loc_9C980:
		cmp	ax, es:[bx+6]
		jb	short loc_9C98A
		mov	al, 1
		jmp	short loc_9C997
; ���������������������������������������������������������������������������

loc_9C98A:				; CODE XREF: Debris_Helper5_9C940+44j
		cmp	di, word_722E6
		jnz	short loc_9C995

loc_9C990:
		mov	byte_6E4D0, 1

loc_9C995:				; CODE XREF: Debris_Helper5_9C940+4Ej
		mov	al, 0

loc_9C997:				; CODE XREF: Debris_Helper5_9C940+48j
		pop	di
		pop	si
		leave
		retf
Debris_Helper5_9C940	endp

ovr305		ends
