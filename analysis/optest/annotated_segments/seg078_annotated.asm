seg078		segment	byte public 'CODE' use16
		assume cs:seg078
		;org 7
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_2CA87	proc far		; CODE XREF: seg080:0031P
					; DATA XREF: dseg:11E8o ...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+8]
		cmp	ax, [si+2]
		jge	short loc_2CAB0
		mov	ax, [si+0Ah]
		cmp	ax, [si+4]
		jge	short loc_2CAB0
		mov	al, byte_46F42
		push	ax
		push	word ptr [si+4]
		push	word ptr [si+2]
		push	word ptr [si+0Ah]
		push	word ptr [si+8]
		jmp	short loc_2CAF1
; ���������������������������������������������������������������������������

loc_2CAB0:				; CODE XREF: sub_2CA87+Dj
					; sub_2CA87+15j
		mov	ax, [si+8]
		cmp	ax, [si+2]
		jge	short loc_2CACA
		mov	al, byte_46F42
		push	ax
		push	word ptr [si+0Ah]
		push	word ptr [si+2]
		push	word ptr [si+4]
		push	word ptr [si+8]
		jmp	short loc_2CAF1
; ���������������������������������������������������������������������������

loc_2CACA:				; CODE XREF: sub_2CA87+2Fj
		mov	ax, [si+0Ah]
		cmp	ax, [si+4]
		jge	short loc_2CAE1
		mov	al, byte_46F42
		push	ax
		push	word ptr [si+4]
		push	word ptr [si+8]
		push	word ptr [si+0Ah]
		jmp	short loc_2CAEE
; ���������������������������������������������������������������������������

loc_2CAE1:				; CODE XREF: sub_2CA87+49j
		mov	al, byte_46F42
		push	ax
		push	word ptr [si+0Ah]
		push	word ptr [si+8]
		push	word ptr [si+4]

loc_2CAEE:				; CODE XREF: sub_2CA87+58j
		push	word ptr [si+2]

loc_2CAF1:				; CODE XREF: sub_2CA87+27j
					; sub_2CA87+41j
		push	word_46F44
		call	Render_DrawHorizontalLineClipped_32914
		add	sp, 0Ch
		pop	si
		pop	bp
		retf
sub_2CA87	endp

; ���������������������������������������������������������������������������

loc_2CB00:				; DATA XREF: dseg:11F8o dseg:120Co
		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		mov	si, [bp+6]
		mov	ax, [bp+8]
		mov	[bp-2],	ax
		mov	ax, [bp+0Ah]
		mov	[bp-4],	ax
		mov	ax, [bp-2]
		mov	[si+2],	ax
		mov	ax, [bp-4]
		mov	[si+4],	ax
		mov	ax, [bp+0Ch]
		mov	[si+8],	ax
		mov	ax, [bp+0Eh]
		mov	[si+0Ah], ax
		mov	al, [bp+10h]
		mov	[bp-5],	al
		mov	byte_46F42, al
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		pop	cx
		pop	si
		leave
		retf
seg078		ends
