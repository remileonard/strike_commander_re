seg034		segment	byte public 'CODE' use16
		assume cs:seg034
		;org 8
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing
		mov	ax, [si+10h]
		shr	ax, 8
		mov	bx, [si+12h]
		shr	bx, 8
		mov	cx, [di+10h]
		shr	cx, 8
		mov	dx, [di+12h]
		shr	dx, 8
		mov	si, [si+0Ah]
		mov	di, [di+0Ah]
		xchg	si, di
		sub	si, di
		inc	si
		add	di, word_45F0C
		mov	es, word_45EFE
		assume es:seg000

loc_18903:				; CODE XREF: seg034:019Bj
		mov	word_45F74, si
		push	ax
		push	dx
		lfs	si, dword_45F12
		add	si, ax
		mov	ax, word_45F0E
		mul	bx
		add	si, ax
		pop	dx
		sub	dx, bx
		mov	bx, dx
		mov	dx, word_45F0E
		jns	short loc_18928
		nop
		nop
		neg	dx
		neg	bx

loc_18928:				; CODE XREF: seg034:0050j
		pop	ax
		sub	cx, ax
		mov	ax, cx
		mov	cx, 1
		jns	short loc_18938
		nop
		nop
		neg	cx
		neg	ax

loc_18938:				; CODE XREF: seg034:0060j
		cmp	ax, bx
		jle	short loc_1893F
		xchg	ax, bx
		xchg	cx, dx

loc_1893F:				; CODE XREF: seg034:006Aj
		mov	word_45F88, bx
		mov	word_45F8C, ax
		mov	word_45F8A, dx
		mov	word_45F8E, cx
		mov	dx, bx
		mov	cx, word_45F74
		push	bp
		xor	bx, bx
		mov	bp, cx

loc_18959:				; CODE XREF: seg034:009Ej seg034:00AAj ...
		mov	al, fs:[si]
		cmp	al, 0FFh
		jz	short loc_18963
		mov	es:[di], al

loc_18963:				; CODE XREF: seg034:008Ej
		inc	di
		dec	cx
		jle	short loc_1898C
		mov	ax, word_45F8C
		add	bx, word_45F88
		jle	short loc_18959

loc_18970:				; CODE XREF: seg034:00ACj seg034:00BAj
		add	si, word_45F8A
		sub	dx, ax
		jle	short loc_1897E
		sub	bx, bp
		jle	short loc_18959
		jmp	short loc_18970
; ���������������������������������������������������������������������������

loc_1897E:				; CODE XREF: seg034:00A6j
		add	dx, word_45F88
		add	si, word_45F8E
		sub	bx, bp
		jle	short loc_18959
		jmp	short loc_18970
; ���������������������������������������������������������������������������

loc_1898C:				; CODE XREF: seg034:0095j
		pop	bp
		retn
; ���������������������������������������������������������������������������
		mov	ax, [si+0Ah]
		cmp	ax, word_45F06
		jg	loc_18A44
		mov	cx, [di+0Ah]
		cmp	cx, word_45F02
		jl	loc_18A44
		mov	dx, cx
		sub	dx, ax
		inc	dx
		mov	word_45F82, dx
		mov	dx, [si+10h]
		shr	dx, 8
		mov	word_45F7A, dx
		mov	dx, [di+10h]
		shr	dx, 8
		mov	word_45F7C, dx
		sub	dx, word_45F7A
		mov	word_45F84, dx
		mov	dx, [si+12h]
		shr	dx, 8
		mov	word_45F7E, dx
		mov	dx, [di+12h]
		shr	dx, 8
		mov	word_45F80, dx
		sub	dx, word_45F7E
		mov	word_45F86, dx
		cmp	ax, word_45F02
		jge	short loc_18A12
		nop
		nop
		mov	bx, word_45F02
		sub	bx, ax
		push	bx
		mov	ax, bx
		imul	word_45F84
		idiv	word_45F82
		add	word_45F7A, ax
		pop	ax
		imul	word_45F86
		idiv	word_45F82
		add	word_45F7E, ax
		mov	ax, word_45F02

loc_18A12:				; CODE XREF: seg034:0119j
		mov	word_45F76, ax
		cmp	cx, word_45F06
		jle	short loc_18A47
		nop
		nop
		mov	ax, cx
		sub	ax, word_45F06
		push	ax
		imul	word_45F84
		idiv	word_45F82
		sub	word_45F7C, ax
		pop	ax
		imul	word_45F86
		idiv	word_45F82
		sub	word_45F80, ax
		mov	cx, word_45F06
		jmp	short loc_18A47
; ���������������������������������������������������������������������������
		align 2

loc_18A44:				; CODE XREF: seg034:00C5j seg034:00D0j
		jmp	short locret_18A6E
; ���������������������������������������������������������������������������
		db 90h
; ���������������������������������������������������������������������������

loc_18A47:				; CODE XREF: seg034:0149j seg034:0171j
		mov	word_45F78, cx
		mov	si, cx
		mov	di, word_45F76
		sub	si, di
		inc	si
		add	di, word_45F0C
		mov	es, word_45EFE
		mov	ax, word_45F7A
		mov	bx, word_45F7E
		mov	cx, word_45F7C
		mov	dx, word_45F80
		jmp	loc_18903
; ���������������������������������������������������������������������������

locret_18A6E:				; CODE XREF: seg034:loc_18A44j
		retn
; ���������������������������������������������������������������������������
		mov	ax, [si+10h]
		shr	ax, 8
		mov	bx, [si+12h]
		shr	bx, 8
		mov	cx, [di+10h]
		shr	cx, 8
		mov	dx, [di+12h]
		shr	dx, 8
		mov	si, [si+0Ah]
		mov	di, [di+0Ah]
		xchg	si, di
		sub	si, di
		inc	si
		cmp	si, 0
		jg	short loc_18A9A
		nop
		nop
		nop

loc_18A9A:				; CODE XREF: seg034:01C5j
		add	di, word_45F0C
		mov	es, word_45EFE

loc_18AA2:				; CODE XREF: seg034:033Cj
		mov	word_45F74, si
		push	ax
		push	dx
		lfs	si, dword_45F12
		add	si, ax
		mov	ax, word_45F0E
		mul	bx
		add	si, ax
		pop	dx
		sub	dx, bx
		mov	bx, dx
		mov	dx, word_45F0E
		jns	short loc_18AC7
		nop
		nop
		neg	dx
		neg	bx

loc_18AC7:				; CODE XREF: seg034:01EFj
		pop	ax
		sub	cx, ax
		mov	ax, cx
		mov	cx, 1
		jns	short loc_18AD7
		nop
		nop
		neg	cx
		neg	ax

loc_18AD7:				; CODE XREF: seg034:01FFj
		cmp	ax, bx
		jle	short loc_18ADE
		xchg	ax, bx
		xchg	cx, dx

loc_18ADE:				; CODE XREF: seg034:0209j
		mov	word_45F88, bx
		mov	word_45F8C, ax
		mov	word_45F8A, dx
		mov	word_45F8E, cx
		mov	dx, bx
		mov	cx, word_45F74
		lgs	bx, dword_45F90
		push	bp
		xor	bp, bp
		mov	ah, 0FFh

loc_18AFD:				; CODE XREF: seg034:0243j
		add	bp, word_45F88
		mov	al, fs:[si]
		cmp	al, ah
		jz	short loc_18B0D
		xlat	byte ptr gs:[bx]
		mov	es:[di], al

loc_18B0D:				; CODE XREF: seg034:0236j
		inc	di
		dec	cx
		jle	short loc_18B2D

loc_18B11:				; CODE XREF: seg034:0251j seg034:025Bj
		or	bp, bp
		jle	short loc_18AFD
		sub	bp, word_45F74
		add	si, word_45F8A
		sub	dx, word_45F8C
		jg	short loc_18B11
		add	dx, word_45F88
		add	si, word_45F8E
		jmp	short loc_18B11
; ���������������������������������������������������������������������������

loc_18B2D:				; CODE XREF: seg034:023Fj
		pop	bp
		retn
; ���������������������������������������������������������������������������
		mov	ax, [si+0Ah]
		cmp	ax, word_45F06
		jg	loc_18BE5
		mov	cx, [di+0Ah]
		cmp	cx, word_45F02
		jl	loc_18BE5
		mov	dx, cx
		sub	dx, ax
		inc	dx
		mov	word_45F82, dx
		mov	dx, [si+10h]
		shr	dx, 8
		mov	word_45F7A, dx
		mov	dx, [di+10h]
		shr	dx, 8
		mov	word_45F7C, dx
		sub	dx, word_45F7A
		mov	word_45F84, dx
		mov	dx, [si+12h]
		shr	dx, 8
		mov	word_45F7E, dx
		mov	dx, [di+12h]
		shr	dx, 8
		mov	word_45F80, dx
		sub	dx, word_45F7E
		mov	word_45F86, dx
		cmp	ax, word_45F02
		jge	short loc_18BB3
		nop
		nop
		mov	bx, word_45F02
		sub	bx, ax
		push	bx
		mov	ax, bx
		imul	word_45F84
		idiv	word_45F82
		add	word_45F7A, ax
		pop	ax
		imul	word_45F86
		idiv	word_45F82
		add	word_45F7E, ax
		mov	ax, word_45F02

loc_18BB3:				; CODE XREF: seg034:02BAj
		mov	word_45F76, ax
		cmp	cx, word_45F06
		jle	short loc_18BE8
		nop
		nop
		mov	ax, cx
		sub	ax, word_45F06
		push	ax
		imul	word_45F84
		idiv	word_45F82
		sub	word_45F7C, ax
		pop	ax
		imul	word_45F86
		idiv	word_45F82
		sub	word_45F80, ax
		mov	cx, word_45F06
		jmp	short loc_18BE8
; ���������������������������������������������������������������������������
		db 90h
; ���������������������������������������������������������������������������

loc_18BE5:				; CODE XREF: seg034:0266j seg034:0271j
		jmp	short locret_18C0F
; ���������������������������������������������������������������������������
		align 2

loc_18BE8:				; CODE XREF: seg034:02EAj seg034:0312j
		mov	word_45F78, cx
		mov	si, cx
		mov	di, word_45F76
		sub	si, di
		inc	si
		add	di, word_45F0C
		mov	es, word_45EFE
		mov	ax, word_45F7A
		mov	bx, word_45F7E
		mov	cx, word_45F7C
		mov	dx, word_45F80
		jmp	loc_18AA2
; ���������������������������������������������������������������������������

locret_18C0F:				; CODE XREF: seg034:loc_18BE5j
		retn
; ���������������������������������������������������������������������������
		enter	0, 0
		push	ds
		push	bp
		push	si
		push	di
		cld
		mov	eax, [bp+0Eh]
		mov	dword_45F12, eax
		mov	ax, [bp+12h]
		mov	word_45F0E, ax
		mov	ax, [bp+14h]
		mov	word_45F10, ax
		mov	eax, [bp+16h]
		mov	dword_45F90, eax
		mov	ax, [bp+8]
		mov	word_45F16, ax
		mov	ax, [bp+0Ah]
		mov	word_45F18, ax
		mov	ax, [bp+0Ch]
		mov	word_45F1A, ax
		push	ss
		pop	es
		assume es:nothing
		mov	si, [bp+6]
		mov	di, 2EDEh
		mov	cx, 6
		rep movsw
		mov	bx, word_45F16
		mov	si, word_45F18
		mov	di, word_45F1A
		mov	ax, [bx+2]
		cmp	ax, [di+2]
		jl	short loc_18C72
		jnz	short loc_18C70
		mov	ax, [bx]
		cmp	ax, [di]
		jle	short loc_18C72

loc_18C70:				; CODE XREF: seg034:0398j
		xchg	bx, di

loc_18C72:				; CODE XREF: seg034:0396j seg034:039Ej
		mov	ax, [bx+2]
		cmp	ax, [si+2]
		jl	short loc_18C84
		jnz	short loc_18C82
		mov	ax, [bx]
		cmp	ax, [si]
		jle	short loc_18C84

loc_18C82:				; CODE XREF: seg034:03AAj
		xchg	bx, si

loc_18C84:				; CODE XREF: seg034:03A8j seg034:03B0j
		mov	ax, [si+2]
		cmp	ax, [di+2]
		jl	short loc_18C96
		jnz	short loc_18C94
		mov	ax, [si]
		cmp	ax, [di]
		jle	short loc_18C96

loc_18C94:				; CODE XREF: seg034:03BCj
		xchg	si, di

loc_18C96:				; CODE XREF: seg034:03BAj seg034:03C2j
		mov	word_45F16, bx
		mov	word_45F18, si
		mov	word_45F1A, di
		mov	ax, [bx+2]
		cmp	ax, word_45F08
		jle	short loc_18CAE
		jmp	loc_18ECF
; ���������������������������������������������������������������������������

loc_18CAE:				; CODE XREF: seg034:03D9j
		mov	ax, [di+2]
		cmp	ax, word_45F04
		jge	short loc_18CBA
		jmp	loc_18ECF
; ���������������������������������������������������������������������������

loc_18CBA:				; CODE XREF: seg034:03E5j
		mov	si, word_45F02
		mov	di, word_45F06
		mov	bx, word_45F16
		mov	ax, [bx]
		mov	cx, ax
		sub	cx, si
		sar	cx, 0Fh
		neg	ax
		add	ax, di
		sar	ax, 0Fh
		neg	ax
		or	ax, cx
		mov	word_45F6C, ax
		mov	bx, word_45F18
		mov	ax, [bx]
		mov	cx, ax
		sub	cx, si
		sar	cx, 0Fh
		neg	ax
		add	ax, di
		sar	ax, 0Fh
		neg	ax
		or	ax, cx
		mov	word_45F6E, ax
		mov	bx, word_45F1A
		mov	ax, [bx]
		mov	cx, ax
		sub	cx, si
		sar	cx, 0Fh
		neg	ax
		add	ax, di
		sar	ax, 0Fh
		neg	ax
		or	ax, cx
		mov	word_45F70, ax
		or	ax, word_45F6E
		or	ax, word_45F6C
		mov	word_45F72, ax
		jz	short loc_18D3E
		nop
		nop
		mov	ax, word_45F6C
		or	ax, ax
		jz	short loc_18D3E
		nop
		nop
		cmp	word_45F6E, ax
		jnz	short loc_18D3E
		nop
		nop
		cmp	word_45F70, ax
		jnz	short loc_18D3E
		nop
		nop
		jmp	loc_18ECF
; ���������������������������������������������������������������������������

loc_18D3E:				; CODE XREF: seg034:044Ej seg034:0457j ...
		mov	bx, 2F14h
		mov	si, word_45F16
		mov	di, word_45F1A
		call	sub_18ED5
		mov	bx, 2F2Ch
		mov	si, word_45F18
		mov	di, word_45F1A
		call	sub_18ED5
		mov	bx, 2EFCh
		mov	si, word_45F16
		mov	di, word_45F18
		call	sub_18ED5
		mov	ax, word_45F1C
		and	ax, word_45F4C
		jz	short loc_18D7D
		dec	word_45F22
		jg	short loc_18D7D
		mov	word_45F1C, 0

loc_18D7D:				; CODE XREF: seg034:049Fj seg034:04A5j
		cmp	word_45F34, 0
		jnz	short loc_18DBA
		mov	word_45F1C, 1
		mov	word_45F34, 1
		xor	eax, eax
		mov	dword_45F28, eax
		mov	dword_45F40, eax
		mov	si, word_45F1A
		mov	ax, [si]
		shl	eax, 10h
		mov	ax, 8000h
		mov	dword_45F3C, eax
		mov	al, 80h	; '�'
		mov	ah, [si+6]
		mov	word_45F44, ax
		mov	ah, [si+8]
		mov	word_45F46, ax

loc_18DBA:				; CODE XREF: seg034:04B2j
		mov	ax, 2EFCh
		mov	bx, 2F2Ch
		mov	cx, 2F14h
		cmp	word_45F1C, 0
		jz	short loc_18DFC
		mov	edx, dword_45F28
		cmp	edx, dword_45F40
		jg	short loc_18DE9
		mov	word_45F64, ax
		mov	word_45F68, bx
		mov	word_45F66, cx
		mov	word_45F6A, 0
		jmp	short loc_18E32
; ���������������������������������������������������������������������������

loc_18DE9:				; CODE XREF: seg034:0504j
		mov	word_45F64, cx
		mov	word_45F68, 0
		mov	word_45F66, ax
		mov	word_45F6A, bx
		jmp	short loc_18E32
; ���������������������������������������������������������������������������

loc_18DFC:				; CODE XREF: seg034:04F8j
		mov	edx, dword_45F58
		cmp	edx, dword_45F40
		jl	short loc_18E1E
		mov	word_45F64, bx
		mov	word_45F68, 0
		mov	word_45F66, cx
		mov	word_45F6A, 0
		jmp	short loc_18E32
; ���������������������������������������������������������������������������

loc_18E1E:				; CODE XREF: seg034:0536j
		mov	word_45F64, cx
		mov	word_45F68, 0
		mov	word_45F66, bx
		mov	word_45F6A, 0

loc_18E32:				; CODE XREF: seg034:0517j seg034:052Aj ...
		mov	ax, 8
		mov	si, 0BEh ; '�'
		cmp	dword_45F90, 0
		jz	short loc_18E46
		mov	ax, 19Fh
		mov	si, 25Fh

loc_18E46:				; CODE XREF: seg034:056Ej
		cmp	word_45F72, 0
		jz	short loc_18E4F
		mov	ax, si

loc_18E4F:				; CODE XREF: seg034:057Bj
		mov	word_45F94, ax
		mov	bx, word_45F00
		mov	ax, [bx+2]
		sub	ax, [bx]
		mov	word_45F0A, ax
		mov	si, word_45F64
		mov	di, word_45F66
		mov	ax, si
		or	ax, di
		jz	short loc_18ECF
		mov	bx, [si+2]
		shl	bx, 1
		add	bx, word_45F00
		mov	ax, [bx]
		mov	word_45F0C, ax

loc_18E7A:				; CODE XREF: seg034:05F3j seg034:05FDj
		push	si
		push	di
		call	word_45F94
		pop	di
		pop	si
		mov	ax, word_45F0A
		add	word_45F0C, ax
		mov	eax, [si+0Ch]
		add	[si+8],	eax
		mov	ax, [si+14h]
		add	[si+10h], ax
		mov	ax, [si+16h]
		add	[si+12h], ax
		dec	word ptr [si+6]
		jg	short loc_18EAC
		xor	si, si
		xchg	si, word_45F68
		or	si, si
		jz	short loc_18ECF

loc_18EAC:				; CODE XREF: seg034:05D0j
		mov	eax, [di+0Ch]
		add	[di+8],	eax
		mov	ax, [di+14h]
		add	[di+10h], ax
		mov	ax, [di+16h]
		add	[di+12h], ax
		dec	word ptr [di+6]
		jg	short loc_18E7A
		xor	di, di
		xchg	di, word_45F6A
		or	di, di
		jnz	short loc_18E7A

loc_18ECF:				; CODE XREF: seg034:03DBj seg034:03E7j ...
		pop	di
		pop	si
		pop	bp
		pop	ds
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������


sub_18ED5	proc near		; CODE XREF: seg034:0479p seg034:0487p ...
		mov	word ptr [bx], 0
		mov	ax, [si]
		shl	eax, 10h
		mov	ax, 8000h
		mov	[bx+8],	eax
		mov	al, 80h	; '�'
		mov	ah, [si+6]
		mov	[bx+10h], ax
		mov	ah, [si+8]
		mov	[bx+12h], ax
		mov	ax, [si+2]
		mov	[bx+2],	ax
		mov	cx, [di+2]
		mov	[bx+4],	cx
		cmp	ax, word_45F08
		jle	short loc_18F0B
		nop
		nop
		jmp	locret_18F98
; ���������������������������������������������������������������������������

loc_18F0B:				; CODE XREF: sub_18ED5+2Fj
		cmp	cx, word_45F04
		jge	short loc_18F16
		nop
		nop
		jmp	locret_18F98
; ���������������������������������������������������������������������������

loc_18F16:				; CODE XREF: sub_18ED5+3Aj
		sub	cx, ax
		jz	short locret_18F98
		nop
		nop
		mov	word ptr [bx], 1
		mov	ax, [di+6]
		sub	ax, [si+6]
		shl	ax, 8
		cwd
		idiv	cx
		mov	[bx+14h], ax
		mov	ax, [di+8]
		sub	ax, [si+8]
		shl	ax, 8
		cwd
		idiv	cx
		mov	[bx+16h], ax
		mov	ax, [di]
		sub	ax, [si]
		shl	eax, 10h
		cdq
		movsx	ecx, cx
		idiv	ecx
		mov	[bx+0Ch], eax
		mov	ax, word_45F04
		mov	cx, [bx+2]
		cmp	ax, cx
		jle	short loc_18F7E
		nop
		nop
		mov	cx, ax
		sub	ax, [bx+2]
		cwde
		push	ax
		imul	dword ptr [bx+0Ch]
		add	[bx+8],	eax
		pop	ax
		push	ax
		imul	word ptr [bx+14h]
		add	[bx+10h], ax
		pop	ax
		imul	word ptr [bx+16h]
		add	[bx+12h], ax

loc_18F7E:				; CODE XREF: sub_18ED5+86j
		mov	ax, word_45F08
		mov	dx, [bx+4]
		cmp	ax, dx
		jge	short loc_18F8C
		nop
		nop
		mov	dx, ax

loc_18F8C:				; CODE XREF: sub_18ED5+B1j
		mov	[bx+2],	cx
		mov	[bx+4],	dx
		sub	dx, cx
		inc	dx
		mov	[bx+6],	dx

locret_18F98:				; CODE XREF: sub_18ED5+33j
					; sub_18ED5+3Ej ...
		retn
sub_18ED5	endp

seg034		ends
