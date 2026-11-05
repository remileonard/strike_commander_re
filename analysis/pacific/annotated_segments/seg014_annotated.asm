seg014		segment	para public 'CODE' use16
		assume cs:seg014
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 20h, 4Fh, 52h, 49h, 47h, 49h, 4Eh, 27h, 53h, 20h, 45h, 4Dh, 4Dh, 58h, 58h, 58h
		db 58h, 30h, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
		db 2Ch, 0, 2Ch, 0, 2Ch, 0, 2Ch, 0, 2Ch, 0, 2Ch, 0, 59h, 6Fh, 75h, 20h
		db 6Dh, 61h, 79h, 20h, 66h, 69h, 6Eh, 64h, 20h, 69h, 74h, 20h, 63h, 6Fh, 6Eh, 76h
		db 65h, 6Eh, 69h, 65h, 6Eh, 74h, 20h, 74h, 6Fh, 20h, 72h, 65h, 62h, 6Fh, 6Fh, 74h
		db 20h, 6Eh, 6Fh, 77h, 2Eh, 0Ah, 0Dh, 24h, 3Dh, 9, 12h, 75h, 0, 0CDh, 67h, 0CFh
		db 0FBh, 0B8h, 7, 0Eh, 0CDh, 10h, 0B8h, 3, 0, 0CDh, 10h, 5Fh, 0D1h, 0E7h, 81h, 0C7h
		db 2Ch, 0, 8Ch, 0CAh, 8Eh, 0DAh, 8Bh, 15h, 0B4h, 9, 0CDh, 21h, 0B4h, 9, 0BAh, 2Ch
		db 0, 0CDh, 21h, 0B8h, 1, 4Ch, 0CDh, 21h, 0, 0, 0, 0, 0, 2Eh, 0C6h, 6
		db 88h, 0, 1, 0CDh, 19h, 0B8h, 40h, 0, 8Eh, 0D8h, 0C7h, 6, 72h, 0, 34h, 12h
		db 2Eh, 0FFh, 2Eh, 89h, 0, 2Eh, 80h, 3Eh, 88h, 0, 0, 74h, 0E0h, 0CFh

; ----------------------------------------------------------------------

sub_932E		proc far
		push	ds
		push	es
		mov	ax, 3567h
		int	21h
		mov	cs:1Bh, bx
		mov	cs:1Dh, es
		mov	ax, 2567h
		push	cs
		pop	ds
		mov	dx, 58h
		int	21h
		mov	byte ptr cs:1Fh, 1
		mov	ax, 3519h
		int	21h
		mov	cs:13h, bx
		mov	cs:15h, es
		mov	ax, 2519h
		push	cs
		pop	ds
		mov	dx, 0A5h
		int	21h
		mov	ax, 0FFFFh
		mov	ds, ax
		mov	eax, dword ptr word_76731
		mov	cs:89h, eax
		mov	word_76731, 8Dh
		mov	word_76733, seg seg013
		pop	es
		pop	ds
		retf
sub_932E		endp

; START OF FUNCTION CHUNK FOR sub_932E
		db 0
		add	[bx+si], al
		add	[bx+si], al
		add	[bx+si], al
		add	[bx+si], al
		add	[bx+si], al
; END OF FUNCTION CHUNK FOR sub_932E
seg014		ends
