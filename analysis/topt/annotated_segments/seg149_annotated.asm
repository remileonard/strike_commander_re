seg149		segment	para public 'CODE' use16
		assume cs:seg149
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		ret
		db 0

; ----------------------------------------------------------------------

sub_3D612		proc far
		call	sub_3E507
		jb	short loc_3D62A
		call	sub_3E3EE
		jnb	short loc_3D62F
		mov	word ptr ss:51EEh, 3CDh
		jmp	loc_3D6AA

loc_3D62A:
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf

loc_3D62F:
		mov	word ptr ss:51EEh, 2E6h

loc_3D636:
		mov	ax, ss:5076h
		mov	bp, ax
		shl	bp, 1
		add	bp, ss:50A1h
		mov	ch, ss:4F93h
		mov	cl, ss:505Eh

loc_3D64D:
		add	ch, dh
		jb	short loc_3D65F
		inc	word ptr ss:505Ah
		dec	cl
		jnz	short loc_3D64D
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf

loc_3D65F:
		mov	di, ss:505Ah

loc_3D664:
		mov	ax, [si]
		or	ax, ax
		jz	short loc_3D6A5
		cmp	[si+4], di
		jz	short loc_3D690
		jg	short loc_3D697
		add	si, 6
		shr	ax, 1
		jb	short loc_3D67C
		add	si, ax
		jmp	short loc_3D68E

loc_3D67C:
		push	di
		mov	di, ax

loc_3D67F:
		lodsb
		inc	si
		shr	al, 1
		cbw
		jb	short loc_3D689
		add	si, ax
		dec	si

loc_3D689:
		sub	di, ax
		jnz	short loc_3D67F
		pop	di

loc_3D68E:
		jmp	short loc_3D664

loc_3D690:
		call	word ptr ss:51EEh
		jmp	short loc_3D65F

loc_3D697:
		inc	word ptr ss:505Ah
		add	bp, 2
		dec	cl
		jz	short loc_3D6A5
		jmp	short loc_3D64D

loc_3D6A5:
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf

loc_3D6AA:
		mov	ax, ss:5076h
		mov	bp, ax
		shl	bp, 1
		add	bp, ss:50A1h
		mov	ch, ss:4F93h
		mov	cl, ss:505Eh
		cmp	ax, ss:50A5h
		jge	short loc_3D6E6

loc_3D6C8:
		inc	word ptr ss:505Ah
		add	ch, dh
		jnb	short loc_3D6E0
		add	bp, 2
		inc	ax
		mov	ss:5076h, ax
		cmp	ax, ss:50A5h
		jge	short loc_3D6E6

loc_3D6E0:
		dec	cl
		jnz	short loc_3D6C8
		jz	short loc_3D6F3

loc_3D6E6:
		add	ch, dh
		jb	short loc_3D6F8
		inc	word ptr ss:505Ah
		dec	cl
		jnz	short loc_3D6E6

loc_3D6F3:
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf

loc_3D6F8:
		mov	di, ss:505Ah

loc_3D6FD:
		mov	ax, [si]
		or	ax, ax
		jz	short loc_3D6F3
		cmp	[si+4], di
		jz	short loc_3D72B
		jl	short loc_3D70C
		jmp	short loc_3D732

loc_3D70C:
		add	si, 6
		shr	ax, 1
		jb	short loc_3D717
		add	si, ax
		jmp	short loc_3D729

loc_3D717:
		push	di
		mov	di, ax

loc_3D71A:
		lodsb
		inc	si
		shr	al, 1
		cbw
		jb	short loc_3D724
		add	si, ax
		dec	si

loc_3D724:
		sub	di, ax
		jnz	short loc_3D71A
		pop	di

loc_3D729:
		jmp	short loc_3D6FD

loc_3D72B:
		call	word ptr ss:51EEh
		jmp	short loc_3D6F8

loc_3D732:
		inc	word ptr ss:505Ah
		add	bp, 2
		inc	word ptr ss:5076h
		mov	ax, ss:5076h
		cmp	ax, ss:50A9h
		jg	short loc_3D74E
		dec	cl
		jnz	short loc_3D6E6

loc_3D74E:
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf
sub_3D612		endp

; ----------------------------------------------------------------------

sub_3D753		proc far
		call	sub_3E514
		jb	short loc_3D77A
		call	sub_3E3EE
		jnb	short loc_3D76B
		mov	word ptr ss:51EEh, 4DFh
		jmp	loc_3D6AA

loc_3D76B:
		mov	word ptr ss:51EEh, 354h
		mov	bx, ss:5068h
		jmp	loc_3D636

loc_3D77A:
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf
sub_3D753		endp

; ----------------------------------------------------------------------

sub_3D77F		proc far
		call	sub_3E521
		jb	short loc_3D7A5
		call	sub_3E3EE
		jnb	short loc_3D797
		mov	word ptr ss:51EEh, 3CDh
		jmp	loc_3D849

loc_3D797:
		mov	word ptr ss:51EEh, 2E6h
		mov	bx, ss:5064h
		jmp	short loc_3D7D5

loc_3D7A5:
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf
sub_3D77F		endp

; ----------------------------------------------------------------------

sub_3D7AA		proc far
		call	sub_3E52E
		jb	short loc_3D7D0
		call	sub_3E3EE
		jnb	short loc_3D7C2
		mov	word ptr ss:51EEh, 4DFh
		jmp	loc_3D849

loc_3D7C2:
		mov	word ptr ss:51EEh, 354h
		mov	bx, ss:5068h
		jmp	short loc_3D7D5

loc_3D7D0:
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf

loc_3D7D5:
		mov	ax, ss:506Ah
		mov	bp, ax
		shl	bp, 1
		add	bp, ss:50A1h
		mov	ch, ss:4F93h
		mov	cl, ss:505Eh

loc_3D7EC:
		add	ch, dh
		jb	short loc_3D7FE
		inc	word ptr ss:505Ah
		dec	cl
		jnz	short loc_3D7EC
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf

loc_3D7FE:
		mov	di, ss:505Ah

loc_3D803:
		mov	ax, [si]
		or	ax, ax
		jz	short loc_3D844
		cmp	[si+4], di
		jz	short loc_3D82F
		jg	short loc_3D836
		add	si, 6
		shr	ax, 1
		jb	short loc_3D81B
		add	si, ax
		jmp	short loc_3D82D

loc_3D81B:
		push	di
		mov	di, ax

loc_3D81E:
		lodsb
		inc	si
		shr	al, 1
		cbw
		jb	short loc_3D828
		add	si, ax
		dec	si

loc_3D828:
		sub	di, ax
		jnz	short loc_3D81E
		pop	di

loc_3D82D:
		jmp	short loc_3D803

loc_3D82F:
		call	word ptr ss:51EEh
		jmp	short loc_3D7FE

loc_3D836:
		inc	word ptr ss:505Ah
		sub	bp, 2
		dec	cl
		jz	short loc_3D844
		jmp	short loc_3D7EC

loc_3D844:
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf

loc_3D849:
		mov	ax, ss:506Ah
		mov	ss:5076h, ax
		mov	bp, ax
		shl	bp, 1
		add	bp, ss:50A1h
		mov	ch, ss:4F93h
		mov	cl, ss:505Eh
		cmp	ax, ss:50A9h
		jle	short loc_3D889

loc_3D86B:
		inc	word ptr ss:505Ah
		add	ch, dh
		jnb	short loc_3D883
		sub	bp, 2
		dec	ax
		mov	ss:5076h, ax
		cmp	ax, ss:50A9h
		jle	short loc_3D889

loc_3D883:
		dec	cl
		jnz	short loc_3D86B
		jz	short loc_3D896

loc_3D889:
		add	ch, dh
		jb	short loc_3D89B
		inc	word ptr ss:505Ah
		dec	cl
		jnz	short loc_3D889

loc_3D896:
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf

loc_3D89B:
		mov	di, ss:505Ah

loc_3D8A0:
		mov	ax, [si]
		or	ax, ax
		jz	short loc_3D896
		cmp	[si+4], di
		jz	short loc_3D8CE
		jl	short loc_3D8AF
		jmp	short loc_3D8D5

loc_3D8AF:
		add	si, 6
		shr	ax, 1
		jb	short loc_3D8BA
		add	si, ax
		jmp	short loc_3D8CC

loc_3D8BA:
		push	di
		mov	di, ax

loc_3D8BD:
		lodsb
		inc	si
		shr	al, 1
		cbw
		jb	short loc_3D8C7
		add	si, ax
		dec	si

loc_3D8C7:
		sub	di, ax
		jnz	short loc_3D8BD
		pop	di

loc_3D8CC:
		jmp	short loc_3D8A0

loc_3D8CE:
		call	word ptr ss:51EEh
		jmp	short loc_3D89B

loc_3D8D5:
		inc	word ptr ss:505Ah
		sub	bp, 2
		dec	word ptr ss:5076h
		mov	ax, ss:5076h
		cmp	ax, ss:50A5h
		jl	short loc_3D8F1
		dec	cl
		jnz	short loc_3D889

loc_3D8F1:
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf
sub_3D7AA		endp

; START OF FUNCTION CHUNK FOR sub_3D7AA
		db 50h, 8Bh, 44h, 2, 36h, 3, 6, 6Eh, 50h, 0F6h, 0E6h, 36h, 2, 6, 92h, 4Fh
		db 8Ah, 0D0h, 80h, 0D4h, 0, 8Ah, 0C4h, 32h, 0E4h, 3, 0C3h, 8Bh, 7Eh, 0, 3, 0F8h
		db 83h, 0C6h, 6, 58h, 0D1h, 0E8h, 72h, 13h, 8Ah, 0E0h, 0FEh, 0C4h, 0FEh, 0CCh, 74h, 0Ah
		db 0ACh, 2, 0D6h, 73h, 0F7h, 0AAh, 0FEh, 0CCh, 75h, 0F6h, 0C3h, 8Bh, 0D8h, 0ACh, 0D0h, 0E8h
		db 72h, 14h, 2Ah, 0D8h, 8Ah, 0E0h, 0ACh, 2, 0D6h, 73h, 1, 0AAh, 0FEh, 0CCh, 75h, 0F6h
		db 0Ah, 0DBh, 75h, 0E9h, 0EBh, 12h, 2Ah, 0D8h, 8Ah, 0E0h, 0ACh, 2, 0D6h, 73h, 1, 0AAh
		db 0FEh, 0CCh, 75h, 0F7h, 0Ah, 0DBh, 75h, 0D5h, 36h, 8Bh, 1Eh, 74h, 50h, 0C3h, 50h, 8Bh
		db 44h, 2, 36h, 3, 6, 6Eh, 50h, 0F6h, 0E6h, 36h, 2, 6, 92h, 4Fh, 8Ah, 0D0h
		db 80h, 0D4h, 0, 8Ah, 0C4h, 32h, 0E4h, 2Bh, 0C3h, 0F7h, 0D8h, 8Bh, 7Eh, 0, 3, 0F8h
		db 83h, 0C6h, 6, 58h, 0D1h, 0E8h, 72h, 16h, 8Ah, 0E0h, 0FEh, 0C4h, 0FEh, 0CCh, 74h, 0Dh
		db 0ACh, 2, 0D6h, 73h, 0F7h, 26h, 88h, 5, 4Fh, 0FEh, 0CCh, 75h, 0F3h, 0C3h, 8Bh, 0D8h
		db 0ACh, 0D0h, 0E8h, 72h, 17h, 2Ah, 0D8h, 8Ah, 0E0h, 0ACh, 2, 0D6h, 73h, 4, 26h, 88h
		db 5, 4Fh, 0FEh, 0CCh, 75h, 0F3h, 0Ah, 0DBh, 75h, 0E6h, 0EBh, 15h, 2Ah, 0D8h, 8Ah, 0E0h
		db 0ACh, 2, 0D6h, 73h, 4, 26h, 88h, 5, 4Fh, 0FEh, 0CCh, 75h, 0F4h, 0Ah, 0DBh, 75h
		db 0CFh, 36h, 8Bh, 1Eh, 68h, 50h, 0C3h, 0D1h, 0E8h, 36h, 0A3h, 95h, 50h, 73h, 4Ah, 8Bh
		db 0D8h, 8Bh, 44h, 2, 83h, 0C6h, 6, 51h, 50h, 6, 8Ch, 0D0h, 8Eh, 0C0h, 0BFh, 0AEh
		db 50h, 0ACh, 0D0h, 0E8h, 98h, 8Bh, 0C8h, 72h, 0Eh, 0D1h, 0E9h, 0F3h, 0A5h, 0D1h, 0D1h, 0F3h
		db 0A4h, 2Bh, 0D8h, 75h, 0ECh, 74h, 11h, 2Bh, 0D8h, 0ACh, 8Ah, 0E0h, 0D1h, 0E9h, 0F3h, 0ABh
		db 0D1h, 0D1h, 0F3h, 0AAh, 0Bh, 0DBh, 75h, 0D9h, 7, 58h, 59h, 36h, 8Bh, 1Eh, 74h, 50h
		db 56h, 1Eh, 16h, 1Fh, 0BEh, 0AEh, 50h, 0EBh, 0Ch, 8Bh, 0F8h, 8Bh, 44h, 2, 83h, 0C6h
		db 6, 3, 0FEh, 57h, 1Eh, 36h, 3, 6, 6Eh, 50h, 0F6h, 0E6h, 36h, 2, 6, 92h
		db 4Fh, 8Ah, 0D0h, 80h, 0D4h, 0, 8Ah, 0C4h, 32h, 0E4h, 36h, 3, 6, 74h, 50h, 8Bh
		db 0D8h, 36h, 3Bh, 6, 0A7h, 50h, 7Eh, 3, 0E9h, 8Bh, 0, 36h, 0A1h, 95h, 50h, 0F6h
		db 0E6h, 2, 0C2h, 80h, 0D4h, 0, 8Ah, 0C4h, 32h, 0E4h, 3, 0C3h, 36h, 3Bh, 6, 0A3h
		db 50h, 7Ch, 73h, 36h, 3Bh, 6, 0A7h, 50h, 7Eh, 1Eh, 36h, 0A1h, 0A7h, 50h, 40h, 2Bh
		db 0C3h, 8Ah, 0E0h, 32h, 0C0h, 2Ah, 0C2h, 80h, 0DCh, 0, 72h, 5Ah, 0F6h, 0F6h, 0Ah, 0E4h
		db 74h, 2, 0FEh, 0C0h, 36h, 0A2h, 95h, 50h, 8Bh, 0C3h, 36h, 2Bh, 6, 0A3h, 50h, 7Dh
		db 31h, 0Bh, 0C0h, 79h, 2, 0F7h, 0D8h, 8Ah, 0E0h, 32h, 0C0h, 2Ah, 0C2h, 80h, 0DCh, 0
		db 72h, 34h, 0F6h, 0F6h, 0Ah, 0E4h, 74h, 2, 0FEh, 0C0h, 32h, 0E4h, 36h, 29h, 6, 95h
		db 50h, 76h, 23h, 3, 0F0h, 0F6h, 0E6h, 2, 0D0h, 80h, 0D4h, 0, 8Ah, 0C4h, 32h, 0E4h
		db 3, 0D8h, 8Bh, 7Eh, 0, 3, 0FBh, 36h, 8Ah, 26h, 95h, 50h, 0ACh, 2, 0D6h, 73h
		db 1, 0AAh, 0FEh, 0CCh, 75h, 0F6h, 1Fh, 5Eh, 0C3h, 0D1h, 0E8h, 36h, 0A3h, 95h, 50h, 73h
		db 45h, 8Bh, 0D8h, 8Bh, 44h, 2, 83h, 0C6h, 6, 51h, 50h, 6, 8Ch, 0D0h, 8Eh, 0C0h
		db 0BFh, 0AEh, 50h, 0ACh, 0D0h, 0E8h, 98h, 8Bh, 0C8h, 72h, 0Eh, 0D1h, 0E9h, 0F3h, 0A5h, 0D1h
		db 0D1h, 0F3h, 0A4h, 2Bh, 0D8h, 75h, 0ECh, 74h, 11h, 2Bh, 0D8h, 0ACh, 8Ah, 0E0h, 0D1h, 0E9h
		db 0F3h, 0ABh, 0D1h, 0D1h, 0F3h, 0AAh, 0Bh, 0DBh, 75h, 0D9h, 7, 58h, 59h, 56h, 1Eh, 16h
		db 1Fh, 0BEh, 0AEh, 50h, 0EBh, 0Ch, 8Bh, 0F8h, 8Bh, 44h, 2, 83h, 0C6h, 6, 3, 0FEh
		db 57h, 1Eh, 36h, 3, 6, 6Eh, 50h, 0F6h, 0E6h, 36h, 2, 6, 92h, 4Fh, 8Ah, 0D0h
		db 80h, 0D4h, 0, 8Ah, 0C4h, 32h, 0E4h, 36h, 8Bh, 1Eh, 68h, 50h, 2Bh, 0D8h, 36h, 3Bh
		db 1Eh, 0A3h, 50h, 7Dh, 3, 0E9h, 8Bh, 0, 36h, 0A1h, 95h, 50h, 0F6h, 0E6h, 2, 0C2h
		db 80h, 0D4h, 0, 8Ah, 0C4h, 32h, 0E4h, 2Bh, 0C3h, 0F7h, 0D8h, 36h, 3Bh, 6, 0A7h, 50h
		db 7Fh, 71h, 36h, 3Bh, 6, 0A3h, 50h, 7Dh, 1Fh, 8Bh, 0C3h, 40h, 36h, 2Bh, 6, 0A3h
		db 50h, 8Ah, 0E0h, 32h, 0C0h, 2Ah, 0C2h, 80h, 0DCh, 0, 72h, 57h, 0F6h, 0F6h, 0Ah, 0E4h
		db 74h, 2, 0FEh, 0C0h, 36h, 0A2h, 95h, 50h, 8Bh, 0C3h, 36h, 2Bh, 6, 0A7h, 50h, 7Eh
		db 2Bh, 8Ah, 0E0h, 32h, 0C0h, 2Ah, 0C2h, 80h, 0DCh, 0, 72h, 37h, 0F6h, 0F6h, 0Ah, 0E4h
		db 74h, 2, 0FEh, 0C0h, 32h, 0E4h, 36h, 29h, 6, 95h, 50h, 76h, 26h, 3, 0F0h, 0F6h
		db 0E6h, 2, 0D0h, 80h, 0D4h, 0, 8Ah, 0C4h, 32h, 0E4h, 2Bh, 0D8h, 8Bh, 7Eh, 0, 3
		db 0FBh, 36h, 8Ah, 26h, 95h, 50h, 0ACh, 2, 0D6h, 73h
; END OF FUNCTION CHUNK FOR sub_3D7AA
seg149		ends
