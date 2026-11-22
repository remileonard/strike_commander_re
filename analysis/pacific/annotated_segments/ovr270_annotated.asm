ovr270		segment	para public 'OVERLAY' use16
		assume cs:ovr270
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A2EC0		proc far

arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_4]
		push	0
		push	large 53495254h
		push	si
		call	ResourceRecord_SeekAndReadB_6D82B
		add	sp, 8
		or	ax, ax
		jnz	short loc_A2EDF
		jmp	loc_A2FDD

loc_A2EDF:
		push	0
		push	large 49525456h
		push	si
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_A2F00
		push	si
		push	large [bp+arg_0]
		call	sub_73A90
		jmp	short loc_A2F1F

loc_A2F00:
		push	0
		push	large 45434146h
		push	si
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_A2F2E
		push	si
		push	large [bp+arg_0]
		call	sub_73A95

loc_A2F1F:
		add	sp, 6
		mov	eax, [si+76h]
		mov	[si+65h], eax
		mov	byte ptr [si+6Dh], 0

loc_A2F2E:
		push	0
		push	large 5350414Dh
		push	si
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_A2F50
		push	si
		push	large [bp+arg_0]
		call	sub_73C7A
		add	sp, 6

loc_A2F50:
		push	0
		push	large 534D5854h
		push	si
		call	ResourceRecord_SeekAndReadB_6D82B
		add	sp, 8
		or	ax, ax
		jz	short loc_A2F71
		push	si
		push	large [bp+arg_0]
		call	sub_73B25
		jmp	short loc_A2F90

loc_A2F71:
		push	0
		push	large 534D5854h
		push	si
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_A2F9A
		push	si
		push	large [bp+arg_0]
		call	sub_73C10

loc_A2F90:
		add	sp, 6
		push	si
		call	ResourceRecord_ReleaseAndClear_6DD9E
		pop	cx

loc_A2F9A:
		push	0
		push	large 59585655h
		push	si
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_A2FD6
		push	0
		les	bx, word ptr [bp+arg_0]
		mov	al, es:[bx+0Ch]
		push	ax
		push	large es:[bx+8]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	si
		push	large [bp+arg_0]
		call	sub_73C70
		add	sp, 6

loc_A2FD6:
		push	si
		call	ResourceRecord_ReleaseAndClear_6DD9E
		pop	cx

loc_A2FDD:
		pop	si
		pop	bp
		retf
sub_A2EC0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A2FE0		proc far

arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_4]
		push	0
		push	large 44415551h
		push	si
		call	ResourceRecord_SeekAndReadB_6D82B
		add	sp, 8
		or	ax, ax
		jz	short loc_A3053
		push	0
		push	large 45434146h
		push	si
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_A302A
		push	si
		push	large [bp+arg_0]
		call	sub_73A9A
		add	sp, 6
		mov	eax, [si+76h]
		mov	[si+65h], eax
		mov	byte ptr [si+6Dh], 0

loc_A302A:
		push	0
		push	large 5350414Dh
		push	si
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_A304C
		push	si
		push	large [bp+arg_0]
		call	sub_73C75
		add	sp, 6

loc_A304C:
		push	si
		call	ResourceRecord_ReleaseAndClear_6DD9E
		pop	cx

loc_A3053:
		pop	si
		pop	bp
		retf
sub_A2FE0		endp
ovr270		ends
