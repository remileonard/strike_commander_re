seg107		segment	byte public 'CODE' use16
		assume cs:seg107
		;org 0Ch
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing
		push	bp
		mov	bp, sp
		sub	sp, 18h
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		or	si, si
		jnz	short loc_30CEF
		push	41h ; 'A'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jnz	short loc_30CEF
		jmp	loc_30E89
; ���������������������������������������������������������������������������

loc_30CEF:				; CODE XREF: seg107:001Cj seg107:002Aj
		mov	word ptr [si], 408Ah
		mov	dword ptr [si+2], 0
		mov	byte ptr [si+6], 2
		mov	byte ptr [si+7], 0
		mov	dword ptr [si+8], 0
		mov	dword ptr [si+1Ah], 0
		mov	byte ptr [si+28h], 0
		mov	word ptr [si], 4062h
		push	0
		mov	al, [di+4]
		push	ax
		push	large dword ptr	[di]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		or	ax, dx
		jnz	short loc_30D36
		jmp	loc_30DE5
; ���������������������������������������������������������������������������

loc_30D36:				; CODE XREF: seg107:0071j
		mov	dx, di
		mov	bx, dx
		mov	eax, [bx]
		mov	[bp-4],	eax
		mov	al, [bx+4]
		mov	[bp-5],	al
		mov	eax, [bp-4]
		mov	[si+2],	eax
		mov	al, [bp-5]
		mov	[si+6],	al
		mov	byte ptr [si+7], 0
		mov	dword ptr [si+8], 0
		mov	eax, [bx+6]
		mov	[si+8],	eax
		mov	[bp-8],	di
		mov	bx, [bp-8]
		mov	byte ptr [bx+5], 0
		mov	byte ptr [si+7], 1
		push	0
		mov	al, [di+4]
		push	ax
		push	large dword ptr	[di]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		add	ax, 4
		mov	[si+2Bh], dx
		mov	[si+29h], ax
		mov	ax, [si+2Bh]
		mov	dx, [si+29h]
		add	dx, 2
		mov	[si+2Fh], ax
		mov	[si+2Dh], dx
		mov	ax, [si+2Fh]
		mov	dx, [si+2Dh]
		add	dx, 6
		mov	[si+33h], ax
		mov	[si+31h], dx
		mov	ax, [si+33h]
		mov	dx, [si+31h]
		add	dx, 200h
		mov	[si+3Bh], ax
		mov	[si+39h], dx
		mov	ax, [si+3Bh]
		mov	dx, [si+39h]
		add	dx, 100h
		mov	[si+37h], ax
		mov	[si+35h], dx
		mov	ax, [si+37h]
		mov	dx, [si+35h]
		add	dx, 100h
		mov	[si+3Fh], ax
		mov	[si+3Dh], dx
		jmp	loc_30E89
; ���������������������������������������������������������������������������

loc_30DE5:				; CODE XREF: seg107:0073j
		push	1
		push	0
		push	2
		push	large 0
		push	661Ah
		call	Memory_TypedFreeWrapper_2B7E1
		add	sp, 0Ch
		mov	[bp-0Ah], dx
		mov	[bp-0Ch], ax
		mov	eax, [bp-0Ch]
		mov	[bp-16h], eax
		mov	byte ptr [bp-12h], 2
		mov	byte ptr [bp-11h], 1
		mov	dword ptr [bp-10h], 0
		mov	dword ptr [bp-10h], 0
		mov	al, [bp-12h]
		mov	[bp-17h], al
		mov	eax, [bp-16h]
		mov	[si+2],	eax
		mov	al, [bp-17h]
		mov	[si+6],	al
		mov	byte ptr [si+7], 0
		mov	dword ptr [si+8], 0
		mov	eax, [bp-10h]
		mov	[si+8],	eax
		cmp	byte ptr [bp-11h], 0
		jz	short loc_30E6B
		cmp	dword ptr [bp-16h], 0
		jz	short loc_30E6B
		push	0
		mov	al, [bp-12h]
		push	ax
		lea	ax, [bp-16h]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_30E6B:				; CODE XREF: seg107:018Bj seg107:0192j
		xor	eax, eax
		mov	[si+2Dh], eax
		mov	[si+31h], eax
		mov	[si+29h], eax
		xor	eax, eax
		mov	[si+3Dh], eax
		mov	[si+35h], eax
		mov	[si+39h], eax

loc_30E89:				; CODE XREF: seg107:002Cj seg107:0122j
		mov	ax, si
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_30E8F:				; DATA XREF: dseg:4082o
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		mov	bx, ax
		les	bx, [bx+29h]
		mov	ax, es:[bx]
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_30E9F:				; DATA XREF: dseg:4086o
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		mov	bx, ax
		les	bx, [bx+2Dh]
		mov	ax, es:[bx]
		dec	ax
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_30EB0:				; DATA XREF: dseg:4066o
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	di, [bp+6]
		mov	al, [bp+0Ah]
		push	ax
		push	di
		mov	bx, [di]
		call	dword ptr [bx+1Ch]
		add	sp, 4
		mov	dx, [bp+0Ch]
		add	dx, ax
		mov	[di+16h], dx
		mov	ax, [bp+0Eh]
		mov	[di+18h], ax
		mov	al, [bp+0Ah]
		push	ax
		push	di
		nop
		push	cs
		call	near ptr sub_30F46
		add	sp, 4
		mov	[di+1Eh], ax
		les	bx, [di+29h]
		mov	ax, es:[bx]
		mov	[di+20h], ax
		mov	al, [bp+0Ah]
		mov	ah, 0
		shl	ax, 1
		les	bx, [di+31h]
		add	bx, ax
		mov	ax, [di+3Fh]
		mov	dx, [di+3Dh]
		add	dx, es:[bx]
		mov	[di+1Ch], ax
		mov	[di+1Ah], dx
		mov	dx, [bp+8]
		cmp	byte ptr [di+28h], 0
		jz	short loc_30F2D
		cmp	dword ptr [di+1Ah], 0
		jz	short loc_30F42
		push	dx
		mov	ax, di
		add	ax, 16h
		push	ax
		push	word ptr [di+24h]
		push	word ptr [di+26h]
		call	sub_31CE8
		jmp	short loc_30F42
; ���������������������������������������������������������������������������
		jmp	short loc_30F42
; ���������������������������������������������������������������������������

loc_30F2D:				; CODE XREF: seg107:024Ej
		cmp	dword ptr [di+1Ah], 0
		jz	short loc_30F42
		push	dx
		mov	ax, di
		add	ax, 16h
		push	ax
		call	sub_31BA0
		jmp	short $+2

loc_30F42:				; CODE XREF: seg107:0255j seg107:0269j ...
		pop	di
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_30F46	proc far		; CODE XREF: seg107:021Ap
					; DATA XREF: dseg:407Ao

arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		mov	al, [bp+arg_2]
		mov	ah, 0
		mov	bx, dx
		les	bx, [bx+39h]
		add	bx, ax
		mov	al, es:[bx]
		mov	ah, 0
		pop	bp
		retf
sub_30F46	endp

; ���������������������������������������������������������������������������

loc_30F5F:				; DATA XREF: dseg:407Eo
		push	bp
		mov	bp, sp
		mov	dx, [bp+6]
		mov	al, [bp+8]
		mov	ah, 0
		mov	bx, dx
		les	bx, [bx+35h]
		add	bx, ax
		mov	al, es:[bx]
		mov	ah, 0
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_30F78:				; DATA XREF: dseg:406Ao
		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+6]
		mov	al, [bp+8]
		mov	[si+22h], al
		mov	al, [si+22h]
		mov	[bp-1],	al
		mov	[si+22h], al
		mov	byte ptr [si+28h], 0
		mov	al, [si+22h]
		mov	ah, 0
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_30F9D:				; DATA XREF: dseg:406Eo
		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+6]
		mov	al, [bp+8]
		mov	[si+23h], al
		mov	al, [si+23h]
		mov	[bp-1],	al
		mov	[si+23h], al
		mov	byte ptr [si+28h], 0
		mov	al, [si+23h]
		mov	ah, 0
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_30FC2:				; DATA XREF: dseg:4072o
		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+6]
		mov	ax, [bp+8]
		mov	[si+24h], ax
		mov	ax, [si+24h]
		mov	[bp-2],	ax
		mov	[si+24h], ax
		mov	byte ptr [si+28h], 1
		mov	al, [si+22h]
		mov	ah, 0
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_30FE7:				; DATA XREF: dseg:4076o
		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+6]
		mov	ax, [bp+8]
		mov	[si+26h], ax
		mov	ax, [si+26h]
		mov	[bp-2],	ax
		mov	[si+26h], ax
		mov	byte ptr [si+28h], 1
		mov	al, [si+22h]
		mov	ah, 0
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_3100C:				; DATA XREF: dseg:4062o
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		or	si, si
		jnz	short loc_3101E
		jmp	loc_310BC
; ���������������������������������������������������������������������������

loc_3101E:				; CODE XREF: seg107:0359j
		mov	word ptr [si], 4062h
		push	0
		mov	al, [si+6]
		push	ax
		push	large dword ptr	[si+2]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		or	ax, dx
		jz	short loc_31075
		cmp	byte ptr [si+7], 0
		jz	short loc_31061
		cmp	dword ptr [si+2], 0
		jz	short loc_31061
		push	0
		mov	al, [si+6]
		push	ax
		mov	ax, si
		add	ax, 2
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_31061:				; CODE XREF: seg107:037Fj seg107:0386j
		mov	dword ptr [si+2], 0
		mov	byte ptr [si+7], 0
		mov	dword ptr [si+8], 0

loc_31075:				; CODE XREF: seg107:0379j
		cmp	byte ptr [si+7], 0
		jz	short loc_3109B
		cmp	dword ptr [si+2], 0
		jz	short loc_3109B
		push	0
		mov	al, [si+6]
		push	ax
		mov	ax, si
		add	ax, 2
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_3109B:				; CODE XREF: seg107:03B9j seg107:03C0j
		mov	dword ptr [si+2], 0
		mov	byte ptr [si+7], 0
		mov	dword ptr [si+8], 0
		test	di, 1
		jz	short loc_310BC
		push	si
		call	sub_308
		pop	cx

loc_310BC:				; CODE XREF: seg107:035Bj seg107:03F3j
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_310C0:				; DATA XREF: dseg:408Ao
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		or	si, si
		jz	short loc_3111A
		mov	word ptr [si], 408Ah
		cmp	byte ptr [si+7], 0
		jz	short loc_310F9
		cmp	dword ptr [si+2], 0
		jz	short loc_310F9
		push	0
		mov	al, [si+6]
		push	ax
		mov	ax, si
		add	ax, 2
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_310F9:				; CODE XREF: seg107:0417j seg107:041Ej
		mov	dword ptr [si+2], 0
		mov	byte ptr [si+7], 0
		mov	dword ptr [si+8], 0
		test	di, 1
		jz	short loc_3111A
		push	si
		call	sub_308
		pop	cx

loc_3111A:				; CODE XREF: seg107:040Dj seg107:0451j
		pop	di
		pop	si
		pop	bp
		retf
seg107		ends
