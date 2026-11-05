ovr383		segment	para public 'OVERLAY' use16
		assume cs:ovr383
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D95A0		proc far

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	al, [si+10h]
		and	ax, 1
		or	ax, ax
		jz	short loc_D9604
		push	si
		call	sub_74AD7
		pop	cx
		mov	al, [si+10h]
		shr	ax, 5
		and	ax, 1
		or	ax, ax
		jz	short loc_D95CD
		mov	ax, [si+30h]
		jmp	short loc_D95D0

loc_D95CD:
		mov	ax, [si+28h]

loc_D95D0:
		mov	[bp+var_2], ax
		push	ax
		push	0
		mov	al, [si+22h]
		push	ax
		push	large [si+1Eh]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	word ptr [si+34h]
		push	word ptr [si+32h]
		push	word_7AF7C
		call	sub_6A514
		add	sp, 0Ch
		push	si
		call	sub_74ADC
		pop	cx

loc_D9604:
		pop	si
		leave
		retf
sub_D95A0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D9607		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	di, [bp+arg_0]
		mov	al, [di+10h]
		and	ax, 1
		or	ax, ax
		jz	short loc_D9622
		les	bx, [di+2Ah]
		mov	ax, [di+2Eh]
		mov	es:[bx], ax

loc_D9622:
		pop	di
		pop	si
		pop	bp
		retf
sub_D9607		endp
ovr383		ends
