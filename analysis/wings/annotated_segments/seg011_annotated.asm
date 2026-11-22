seg011		segment	para public 'CODE' use16
		assume cs:seg011
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 26h, 0C7h, 6, 60h, 0, 54h, 6, 5Dh, 0CBh, 0

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_835A		proc far

arg_0		= dword ptr  6
arg_4		= dword ptr  0Ah

		enter	0, 0
		mov	eax, [bp+arg_0]
		imul	[bp+arg_4]
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		leave
		retf
sub_835A		endp

; START OF FUNCTION CHUNK FOR sub_835A
		xchg	bx, bx
		nop
; END OF FUNCTION CHUNK FOR sub_835A

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_837A		proc far

arg_0		= dword ptr  6
arg_4		= dword ptr  0Ah

		enter	0, 0
		mov	eax, [bp+arg_0]
		imul	[bp+arg_4]
		add	eax, 80000000h
		adc	edx, 0
		mov	eax, edx
		sar	edx, 10h
		leave
		retf
sub_837A		endp

; START OF FUNCTION CHUNK FOR sub_837A
		nop
; END OF FUNCTION CHUNK FOR sub_837A

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_839A		proc far

arg_0		= dword ptr  6
arg_4		= dword ptr  0Ah

		enter	0, 0
		push	ebx
		sub	ecx, ecx
		mov	eax, [bp+arg_0]
		and	eax, eax
		jns	short loc_83B3
		nop
		nop
		inc	ecx
		neg	eax

loc_83B3:
		sub	edx, edx
		rol	eax, 10h
		mov	dx, ax
		sub	ax, ax
		mov	ebx, [bp+arg_4]
		and	ebx, ebx
		jns	short loc_83CE
		nop
		nop
		dec	ecx
		neg	ebx

loc_83CE:
		div	ebx
		shr	ebx, 1
		adc	ebx, 0
		dec	ebx
		cmp	ebx, edx
		adc	eax, 0
		and	ecx, ecx
		jz	short loc_83EB
		nop
		nop
		neg	eax

loc_83EB:
		shld	edx, eax, 10h
		pop	ebx
		leave
		retf
sub_839A		endp

; START OF FUNCTION CHUNK FOR sub_839A
		xchg	bx, bx
; END OF FUNCTION CHUNK FOR sub_839A

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_83F6		proc far

arg_0		= dword ptr  6

		enter	0, 0
		push	ebx
		mov	edx, 1
		sub	eax, eax
		sub	ecx, ecx
		mov	ebx, [bp+arg_0]
		and	ebx, ebx
		jns	short loc_8418
		nop
		nop
		dec	ecx
		neg	ebx

loc_8418:
		div	ebx
		shr	ebx, 1
		adc	ebx, 0
		dec	ebx
		cmp	ebx, edx
		adc	eax, 0
		and	ecx, ecx
		jz	short loc_8435
		nop
		nop
		neg	eax

loc_8435:
		shld	edx, eax, 10h
		pop	ebx
		leave
		retf
sub_83F6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_843E		proc far

arg_0		= dword ptr  6
arg_4		= dword ptr  0Ah

		enter	0, 0
		push	ebx
		mov	eax, [bp+arg_0]
		imul	[bp+arg_4]
		add	eax, 20000000h
		adc	edx, 0
		shld	edx, eax, 2
		mov	eax, edx
		sar	edx, 10h
		pop	ebx
		leave
		retf
sub_843E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_8466		proc far

arg_0		= dword ptr  6
arg_4		= dword ptr  0Ah

		enter	0, 0
		push	ebx
		sub	ecx, ecx
		mov	eax, [bp+arg_0]
		and	eax, eax
		jns	short loc_847F
		nop
		nop
		inc	ecx
		neg	eax

loc_847F:
		mov	edx, eax
		sar	edx, 2
		shl	eax, 1Eh
		mov	ebx, [bp+arg_4]
		and	ebx, ebx
		jns	short loc_849A
		nop
		nop
		dec	ecx
		neg	ebx

loc_849A:
		div	ebx
		shr	ebx, 1
		adc	ebx, 0
		dec	ebx
		cmp	ebx, edx
		adc	eax, 0
		and	ecx, ecx
		jz	short loc_84B7
		nop
		nop
		neg	eax

loc_84B7:
		shld	edx, eax, 10h
		pop	ebx
		leave
		retf
sub_8466		endp

; START OF FUNCTION CHUNK FOR sub_8466
		xchg	bx, bx
; END OF FUNCTION CHUNK FOR sub_8466

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_84C2		proc far

arg_0		= dword ptr  6
arg_4		= dword ptr  0Ah

		enter	0, 0
		mov	eax, [bp+arg_0]
		imul	[bp+arg_4]
		add	eax, 20000000h
		adc	edx, 0
		shld	edx, eax, 2
		mov	eax, edx
		sar	edx, 10h
		leave
		retf
sub_84C2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_84E6		proc far

arg_0		= dword ptr  6

		enter	0, 0
		push	ebx
		sub	ecx, ecx
		mov	edx, 4000h
		xor	eax, eax
		mov	ebx, [bp+arg_0]
		and	ebx, ebx
		jns	short loc_8508
		nop
		nop
		dec	ecx
		neg	ebx

loc_8508:
		div	ebx
		shr	ebx, 1
		adc	ebx, 0
		dec	ebx
		cmp	ebx, edx
		adc	eax, 0
		and	ecx, ecx
		jz	short loc_8525
		nop
		nop
		neg	eax

loc_8525:
		shld	edx, eax, 10h
		pop	ebx
		leave
		retf
sub_84E6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_852E		proc far

arg_0		= dword ptr  6
arg_4		= dword ptr  0Ah

		enter	0, 0
		push	ebx
		sub	ecx, ecx
		mov	eax, [bp+arg_0]
		and	eax, eax
		jns	short loc_8547
		nop
		nop
		inc	ecx
		neg	eax

loc_8547:
		mov	edx, eax
		sar	edx, 2
		shl	eax, 1Eh
		mov	ebx, [bp+arg_4]
		and	ebx, ebx
		jns	short loc_8562
		nop
		nop
		dec	ecx
		neg	ebx

loc_8562:
		div	ebx
		shr	ebx, 1
		adc	ebx, 0
		dec	ebx
		cmp	ebx, edx
		adc	eax, 0
		and	ecx, ecx
		jz	short loc_857F
		nop
		nop
		neg	eax
sub_852E		endp

; START OF FUNCTION CHUNK FOR sub_852E

loc_857F:
		db 66h
; END OF FUNCTION CHUNK FOR sub_852E
seg011		ends
