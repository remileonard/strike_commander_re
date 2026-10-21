ovr188		segment	para public 'OVERLAY' use16
		assume cs:ovr188
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_51830	proc far		; CODE XREF: sub_4209FJ sub_51AB3+61p

var_B0		= word ptr -0B0h
var_53		= dword	ptr -53h
var_4F		= dword	ptr -4Fh
var_4B		= dword	ptr -4Bh
var_3E		= word ptr -3Eh
var_3A		= dword	ptr -3Ah
var_36		= word ptr -36h
var_34		= word ptr -34h
var_7		= byte ptr -7
var_6		= byte ptr -6
var_5		= byte ptr -5
var_4		= byte ptr -4
var_3		= byte ptr -3
var_2		= byte ptr -2
var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0B0h
		push	si
		mov	si, [bp+arg_0]
		cmp	[bp+arg_4], 0FFh
		jnz	short loc_51844
		jmp	loc_51AB0
; ���������������������������������������������������������������������������

loc_51844:				; CODE XREF: sub_51830+Fj
		lea	ax, [bp+var_B0]
		push	ax
		call	StreamReader_ConstructVariantA_3B2A9
		add	sp, 2
		mov	[bp+var_B0], 556h
		mov	[bp+var_4F], 100h
		mov	[bp+var_53], 0
		mov	[bp+var_B0], 56Eh
		mov	[bp+var_34], 0
		xor	ax, ax
		mov	[bp+var_36], ax
		movsx	eax, ax
		mov	[bp+var_4B], eax
		push	1
		push	[bp+arg_2]
		lea	ax, [bp+var_B0]
		push	ax
		mov	bx, [bp+var_B0]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		push	large 44414F4Ch
		lea	ax, [bp+var_B0]
		push	ax
		call	ResourceRecord_SeekAndReadB_3C022
		add	sp, 8
		or	ax, ax
		jnz	short loc_518B9
		push	16h
		push	9AAh
		call	sub_310B
		add	sp, 4

loc_518B9:				; CODE XREF: sub_51830+7Aj
		mov	[bp+var_6], 0
		jmp	short loc_518E5
; ���������������������������������������������������������������������������

loc_518BF:				; CODE XREF: sub_51830+CCj
		lea	ax, [bp+var_B0]
		push	ax
		call	ResourceRecord_ReadFinalField_3C3C1
		add	sp, 2
		mov	[bp+var_7], al
		mov	al, [bp+var_7]
		cmp	al, [bp+arg_4]
		jnz	short loc_518DD
		mov	[bp+var_6], 1
		jmp	short loc_518FE
; ���������������������������������������������������������������������������

loc_518DD:				; CODE XREF: sub_51830+A5j
		mov	eax, [bp+var_3A]
		mov	[bp+var_4B], eax

loc_518E5:				; CODE XREF: sub_51830+8Dj
		push	1
		push	large 44414F4Ch
		lea	ax, [bp+var_B0]
		push	ax
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		or	ax, ax
		jnz	short loc_518BF

loc_518FE:				; CODE XREF: sub_51830+ABj
		mov	al, [bp+var_6]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_51914
		push	17h
		push	9AAh
		call	sub_310B
		add	sp, 4

loc_51914:				; CODE XREF: sub_51830+D5j
		jmp	loc_51A4E
; ���������������������������������������������������������������������������

loc_51917:				; CODE XREF: sub_51830+24Ej
		lea	ax, [bp+var_B0]
		push	ax
		call	ResourceRecord_ReadFinalField_3C3C1
		add	sp, 2
		mov	[bp+var_4], al
		lea	ax, [bp+var_B0]
		push	ax
		call	ResourceRecord_ReadFinalField_3C3C1
		add	sp, 2
		mov	[bp+var_5], al
		cmp	[bp+var_4], 0
		jz	short loc_51943
		cmp	[bp+var_4], 1
		jnz	short loc_51951

loc_51943:				; CODE XREF: sub_51830+10Bj
		mov	[bp+var_1], 0
		mov	[bp+var_2], 2
		mov	[bp+var_3], 1
		jmp	short loc_519B3
; ���������������������������������������������������������������������������

loc_51951:				; CODE XREF: sub_51830+111j
		cmp	[bp+var_4], 6
		jnz	short loc_51965
		mov	[bp+var_1], 2
		mov	[bp+var_2], 3
		mov	[bp+var_3], 1
		jmp	short loc_519B3
; ���������������������������������������������������������������������������

loc_51965:				; CODE XREF: sub_51830+125j
		cmp	[bp+var_4], 8
		jnz	short loc_51979
		mov	[bp+var_1], 1
		mov	[bp+var_2], 2
		mov	[bp+var_3], 2
		jmp	short loc_519B3
; ���������������������������������������������������������������������������

loc_51979:				; CODE XREF: sub_51830+139j
		cmp	[bp+var_4], 5
		jz	short loc_51985
		cmp	[bp+var_4], 4
		jnz	short loc_51993

loc_51985:				; CODE XREF: sub_51830+14Dj
		mov	[bp+var_1], 2
		mov	[bp+var_2], 3
		mov	[bp+var_3], 6
		jmp	short loc_519B3
; ���������������������������������������������������������������������������

loc_51993:				; CODE XREF: sub_51830+153j
		cmp	[bp+var_4], 7
		jnz	short loc_519A7
		mov	[bp+var_1], 2
		mov	[bp+var_2], 3
		mov	[bp+var_3], 2
		jmp	short loc_519B3
; ���������������������������������������������������������������������������

loc_519A7:				; CODE XREF: sub_51830+167j
		mov	[bp+var_1], 2
		mov	[bp+var_2], 3
		mov	[bp+var_3], 3

loc_519B3:				; CODE XREF: sub_51830+11Fj
					; sub_51830+133j ...
		mov	al, [bp+var_5]
		mov	ah, 0
		mov	dl, [bp+var_4]
		mov	dh, 0
		shl	dx, 1
		mov	bx, dx
		cmp	ax, [bx+si+261h]
		jbe	short loc_519D7
		mov	al, [bp+var_4]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		mov	al, [bx+si+261h]
		mov	[bp+var_5], al

loc_519D7:				; CODE XREF: sub_51830+195j
		test	[bp+var_5], 1
		jz	short loc_519E0
		dec	[bp+var_5]

loc_519E0:				; CODE XREF: sub_51830+1ABj
		mov	al, [bp+var_1]
		mov	ah, 0
		mov	cx, ax
		jmp	short loc_51A45
; ���������������������������������������������������������������������������

loc_519E9:				; CODE XREF: sub_51830+21Cj
		cmp	[bp+var_5], 0
		jnz	short loc_519F1
		jmp	short loc_51A4E
; ���������������������������������������������������������������������������

loc_519F1:				; CODE XREF: sub_51830+1BDj
		mov	bx, cx
		shl	bx, 1
		cmp	byte ptr [bx+si+273h], 0FFh
		jnz	short loc_51A44
		mov	bx, cx
		shl	bx, 1
		mov	al, [bp+var_4]
		mov	[bx+si+273h], al
		mov	al, [bp+var_5]
		mov	ah, 0
		mov	dl, [bp+var_3]
		mov	dh, 0
		shl	dx, 1
		cmp	ax, dx
		jle	short loc_51A31
		mov	bx, cx
		shl	bx, 1
		mov	al, [bp+var_3]
		mov	[bx+si+274h], al
		mov	al, [bp+var_3]
		shl	al, 1
		mov	dl, [bp+var_5]
		sub	dl, al
		mov	[bp+var_5], dl
		jmp	short loc_51A44
; ���������������������������������������������������������������������������

loc_51A31:				; CODE XREF: sub_51830+1E5j
		mov	al, [bp+var_5]
		mov	ah, 0
		sar	ax, 1
		mov	bx, cx
		shl	bx, 1
		mov	[bx+si+274h], al
		mov	[bp+var_5], 0

loc_51A44:				; CODE XREF: sub_51830+1CAj
					; sub_51830+1FFj
		inc	cx

loc_51A45:				; CODE XREF: sub_51830+1B7j
		mov	al, [bp+var_2]
		mov	ah, 0
		cmp	ax, cx
		jge	short loc_519E9

loc_51A4E:				; CODE XREF: sub_51830:loc_51914j
					; sub_51830+1BFj
		test	[bp+var_3E], 1
		jz	short loc_51A69
		mov	eax, [bp+var_3A]
		dec	eax
		cmp	eax, [bp+var_4B]
		jnz	short loc_51A67
		inc	[bp+var_4B]
		jmp	short $+2

loc_51A67:				; CODE XREF: sub_51830+22Fj
		jmp	short $+2

loc_51A69:				; CODE XREF: sub_51830+223j
		mov	eax, [bp+var_4B]
		cmp	eax, [bp+var_3A]
		jl	short loc_51A78
		mov	ax, 1
		jmp	short loc_51A7A
; ���������������������������������������������������������������������������

loc_51A78:				; CODE XREF: sub_51830+241j
		xor	ax, ax

loc_51A7A:				; CODE XREF: sub_51830+246j
		or	ax, ax
		jnz	short loc_51A81
		jmp	loc_51917
; ���������������������������������������������������������������������������

loc_51A81:				; CODE XREF: sub_51830+24Cj
		lea	ax, [bp+var_B0]
		push	ax
		call	ResourceRecord_Helper_3BE15
		add	sp, 2
		mov	[bp+var_B0], 56Eh
		lea	ax, [bp+var_B0]
		push	ax
		call	ResourceRecord_Helper_3BE15
		add	sp, 2
		push	0
		lea	ax, [bp+var_B0]
		push	ax
		call	StreamReader_ReleaseBuffer_3CEB3
		add	sp, 4

loc_51AB0:				; CODE XREF: sub_51830+11j
		pop	si
		leave
		retf
sub_51830	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_51AB3	proc far		; CODE XREF: sub_420A4J

var_35C		= word ptr -35Ch
var_32A		= word ptr -32Ah
var_2CD		= dword	ptr -2CDh
var_2C9		= dword	ptr -2C9h
var_2C5		= dword	ptr -2C5h
var_2B0		= word ptr -2B0h
var_2AE		= word ptr -2AEh
var_282		= word ptr -282h
var_278		= word ptr -278h
var_263		= word ptr -263h
var_255		= word ptr -255h
var_252		= byte ptr -252h
var_249		= word ptr -249h
var_243		= byte ptr -243h
var_22E		= byte ptr -22Eh
var_223		= byte ptr -223h
var_222		= word ptr -222h
var_220		= word ptr -220h
var_21E		= word ptr -21Eh
var_21C		= word ptr -21Ch
var_21A		= word ptr -21Ah
var_215		= byte ptr -215h
var_213		= byte ptr -213h
var_210		= byte ptr -210h
var_20D		= byte ptr -20Dh
var_207		= byte ptr -207h
var_204		= byte ptr -204h
var_201		= byte ptr -201h
var_1F5		= byte ptr -1F5h
var_1F4		= byte ptr -1F4h
var_1F3		= byte ptr -1F3h
var_1F2		= byte ptr -1F2h
var_1F1		= byte ptr -1F1h
var_1F0		= byte ptr -1F0h
var_1E9		= byte ptr -1E9h
var_1E8		= byte ptr -1E8h
var_1E7		= byte ptr -1E7h
var_1E6		= byte ptr -1E6h
var_1E5		= byte ptr -1E5h
var_1E4		= byte ptr -1E4h
var_1DD		= byte ptr -1DDh
var_1DC		= byte ptr -1DCh
var_1DB		= byte ptr -1DBh
var_1DA		= byte ptr -1DAh
var_1D9		= byte ptr -1D9h
var_1D8		= byte ptr -1D8h
var_1D1		= byte ptr -1D1h
var_1D0		= byte ptr -1D0h
var_1CF		= byte ptr -1CFh
var_1CE		= byte ptr -1CEh
var_1CD		= byte ptr -1CDh
var_1CC		= byte ptr -1CCh
var_1C5		= byte ptr -1C5h
var_1C2		= byte ptr -1C2h
var_1B9		= byte ptr -1B9h
var_1B8		= byte ptr -1B8h
var_1B7		= byte ptr -1B7h
var_1B6		= byte ptr -1B6h
var_1B5		= byte ptr -1B5h
var_1B4		= byte ptr -1B4h
var_1B0		= byte ptr -1B0h
var_1AD		= byte ptr -1ADh
var_1AC		= byte ptr -1ACh
var_1AA		= word ptr -1AAh
var_42		= word ptr -42h
var_30		= word ptr -30h
var_1E		= byte ptr -1Eh
var_1D		= byte ptr -1Dh
var_1C		= byte ptr -1Ch
var_1B		= byte ptr -1Bh
var_1A		= word ptr -1Ah
var_17		= byte ptr -17h
var_16		= word ptr -16h
var_E		= word ptr -0Eh
var_6		= byte ptr -6
var_4		= byte ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= byte ptr  8

; FUNCTION CHUNK AT 0BBF SIZE 00000004 BYTES

		push	bp
		mov	bp, sp
		sub	sp, 35Ch
		push	si
		push	di
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		mov	si, 9BCh
		lea	di, [bp+var_30]
		push	ss
		pop	es
		mov	cx, 9
		rep movsw
		mov	[bp+var_2], 0
		jmp	short loc_51AFF
; ���������������������������������������������������������������������������

loc_51ADE:				; CODE XREF: sub_51AB3+50j
		mov	ax, [bp+var_2]
		shl	ax, 1
		mov	bx, [bp+arg_0]
		add	bx, ax
		mov	byte ptr [bx+273h], 0FFh
		mov	ax, [bp+var_2]
		shl	ax, 1
		mov	bx, [bp+arg_0]
		add	bx, ax
		mov	byte ptr [bx+274h], 0
		inc	[bp+var_2]

loc_51AFF:				; CODE XREF: sub_51AB3+29j
		cmp	[bp+var_2], 4
		jl	short loc_51ADE
		mov	al, [bp+arg_2]
		push	ax
		mov	ax, [bp+arg_0]
		add	ax, 43h	; 'C'
		push	ax
		push	[bp+arg_0]
		push	cs
		call	near ptr sub_51830
		add	sp, 6
		mov	[bp+var_2], 0
		jmp	short loc_51B62
; ���������������������������������������������������������������������������

loc_51B21:				; CODE XREF: sub_51AB3+B3j
		mov	ax, [bp+var_2]
		shl	ax, 1
		mov	bx, [bp+arg_0]
		add	bx, ax
		cmp	byte ptr [bx+273h], 0FFh
		jz	short loc_51B5F
		mov	ax, [bp+var_2]
		shl	ax, 1
		mov	bx, [bp+arg_0]
		add	bx, ax
		mov	al, [bx+274h]
		mov	ah, 0
		shl	ax, 1
		mov	dx, [bp+var_2]
		shl	dx, 1
		mov	bx, [bp+arg_0]
		add	bx, dx
		mov	dl, [bx+273h]
		mov	dh, 0
		shl	dx, 1
		lea	bx, [bp+var_30]
		add	dx, bx
		mov	bx, dx
		add	[bx], ax

loc_51B5F:				; CODE XREF: sub_51AB3+7Dj
		inc	[bp+var_2]

loc_51B62:				; CODE XREF: sub_51AB3+6Cj
		cmp	[bp+var_2], 4
		jl	short loc_51B21
		mov	[bp+var_2], 0
		jmp	short loc_51B98
; ���������������������������������������������������������������������������

loc_51B6F:				; CODE XREF: sub_51AB3+E9j
		mov	bx, [bp+var_2]
		shl	bx, 1
		lea	ax, [bp+var_30]
		add	bx, ax
		mov	ax, [bp+var_2]
		shl	ax, 1
		mov	si, [bp+arg_0]
		add	si, ax
		mov	ax, [si+261h]
		sub	ax, [bx]
		mov	bx, [bp+var_2]
		shl	bx, 1
		lea	dx, [bp+var_42]
		add	bx, dx
		mov	[bx], ax
		inc	[bp+var_2]

loc_51B98:				; CODE XREF: sub_51AB3+BAj
		cmp	[bp+var_2], 9
		jl	short loc_51B6F
		mov	[bp+var_2], 0
		jmp	short loc_51BB7
; ���������������������������������������������������������������������������

loc_51BA5:				; CODE XREF: sub_51AB3+108j
		mov	al, byte ptr [bp+var_2]
		add	al, 1Dh
		lea	dx, [bp+var_E]
		mov	bx, [bp+var_2]
		add	bx, dx
		mov	[bx], al
		inc	[bp+var_2]

loc_51BB7:				; CODE XREF: sub_51AB3+F0j
		cmp	[bp+var_2], 8
		jl	short loc_51BA5
		mov	[bp+var_6], 74h	; 't'
		mov	[bp+var_2], 0
		jmp	short loc_51BDA
; ���������������������������������������������������������������������������

loc_51BC8:				; CODE XREF: sub_51AB3+12Bj
		mov	al, byte ptr [bp+var_2]
		add	al, 75h	; 'u'
		lea	dx, [bp+var_16]
		mov	bx, [bp+var_2]
		add	bx, dx
		mov	[bx], al
		inc	[bp+var_2]

loc_51BDA:				; CODE XREF: sub_51AB3+113j
		cmp	[bp+var_2], 8
		jl	short loc_51BC8
		mov	[bp+var_213], 25h ; '%'
		mov	[bp+var_210], 26h ; '&'
		mov	[bp+var_20D], 49h ; 'I'
		mov	[bp+var_207], 27h ; '''
		mov	[bp+var_204], 28h ; '('
		mov	[bp+var_201], 4Ah ; 'J'
		mov	[bp+var_1F5], 29h ; ')'
		mov	[bp+var_1F4], 2Ah ; '*'
		mov	[bp+var_1F3], 2Bh ; '+'
		mov	[bp+var_1F2], 2Ch ; ','
		mov	[bp+var_1F1], 2Dh ; '-'
		mov	[bp+var_1F0], 2Eh ; '.'
		mov	[bp+var_1E9], 2Fh ; '/'
		mov	[bp+var_1E8], 30h ; '0'
		mov	[bp+var_1E7], 31h ; '1'
		mov	[bp+var_1E6], 32h ; '2'
		mov	[bp+var_1E5], 33h ; '3'
		mov	[bp+var_1E4], 34h ; '4'
		mov	[bp+var_1DD], 35h ; '5'
		mov	[bp+var_1DC], 36h ; '6'
		mov	[bp+var_1DB], 37h ; '7'
		mov	[bp+var_1DA], 38h ; '8'
		mov	[bp+var_1D9], 39h ; '9'
		mov	[bp+var_1D8], 3Ah ; ':'
		mov	[bp+var_1D1], 3Bh ; ';'
		mov	[bp+var_1D0], 3Ch ; '<'
		mov	[bp+var_1CF], 3Dh ; '='
		mov	[bp+var_1CE], 3Eh ; '>'
		mov	[bp+var_1CD], 3Fh ; '?'
		mov	[bp+var_1CC], 40h ; '@'
		mov	[bp+var_1C5], 41h ; 'A'
		mov	[bp+var_1C2], 42h ; 'B'
		mov	[bp+var_1B9], 43h ; 'C'
		mov	[bp+var_1B8], 44h ; 'D'
		mov	[bp+var_1B7], 45h ; 'E'
		mov	[bp+var_1B6], 46h ; 'F'
		mov	[bp+var_1B5], 47h ; 'G'
		mov	[bp+var_1B4], 48h ; 'H'
		mov	[bp+var_1B0], 71h ; 'q'
		mov	[bp+var_1AD], 72h ; 'r'
		mov	[bp+var_1AC], 73h ; 's'
		mov	[bp+var_17], 0FFh
		mov	bx, [bp+arg_0]
		mov	ax, [bx+0E4h]
		mov	[bp+var_1A], ax
		lea	ax, [bp+var_32A]
		push	ax
		call	StreamReader_ConstructVariantA_3B2A9
		add	sp, 2
		mov	[bp+var_32A], 556h
		mov	[bp+var_2C9], 100h
		mov	[bp+var_2CD], 0
		mov	[bp+var_32A], 56Eh
		mov	[bp+var_2AE], 0
		xor	ax, ax
		mov	[bp+var_2B0], ax
		movsx	eax, ax
		mov	[bp+var_2C5], eax
		push	[bp+var_1A]
		push	word_46F46
		push	0FFh
		push	0Ah
		lea	ax, [bp+var_282]
		push	ax
		call	sub_4C1F
		add	sp, 0Ah
		mov	[bp+var_32A], 586h
		mov	[bp+var_282], 59Eh
		mov	[bp+var_278], 5BEh
		mov	[bp+var_220], 2BDh
		xor	ax, ax
		mov	[bp+var_21C], ax
		mov	[bp+var_21E], ax
		mov	[bp+var_220], 552h
		push	100h
		push	0
		lea	ax, [bp+var_21A]
		push	ax
		call	Palette_Alloc_2CC76
		add	sp, 6
		mov	[bp+var_22E], 0
		mov	[bp+var_223], 0
		mov	[bp+var_243], 0Fh
		mov	[bp+var_215], 0FFh
		mov	ax, [bp+var_1A]
		mov	[bp+var_222], ax
		lea	ax, [bp+var_32A]
		push	ax
		call	sub_5803
		add	sp, 2
		mov	al, byte_43BAA
		mov	ah, 0
		or	ax, ax
		jnz	short loc_51D8E
		mov	al, [bp+var_215]
		mov	ah, 0
		push	ax
		call	sub_28C73
		add	sp, 2

loc_51D8E:				; CODE XREF: sub_51AB3+2CAj
		mov	[bp+var_2], 0
		jmp	short loc_51DC8
; ���������������������������������������������������������������������������

loc_51D95:				; CODE XREF: sub_51AB3+319j
		lea	ax, [bp+var_E]
		mov	bx, [bp+var_2]
		add	bx, ax
		mov	al, [bx]
		push	ax
		lea	ax, [bp+var_32A]
		push	ax
		call	sub_574F
		add	sp, 4
		push	ax
		mov	ax, [bp+var_2]
		mov	dx, 28h	; '('
		imul	dx
		lea	dx, [bp+var_1AA]
		add	ax, dx
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		inc	[bp+var_2]

loc_51DC8:				; CODE XREF: sub_51AB3+2E0j
		cmp	[bp+var_2], 9
		jl	short loc_51D95
		jmp	loc_52256
; ���������������������������������������������������������������������������

loc_51DD1:				; CODE XREF: sub_51AB3+7AFj
		lea	ax, [bp+var_32A]
		push	ax
		call	sub_56B6
		add	sp, 2
		push	0Ch
		lea	ax, [bp+var_32A]
		push	ax
		call	sub_563B
		add	sp, 4
		mov	bx, [bp+arg_0]
		cmp	byte ptr [bx+0FCh], 14h
		jnz	short loc_51E17
		push	14h
		lea	ax, [bp+var_32A]
		push	ax
		call	sub_563B
		add	sp, 4
		push	7Dh ; '}'
		lea	ax, [bp+var_32A]
		push	ax
		call	sub_56C5
		add	sp, 4
		jmp	short loc_51E26
; ���������������������������������������������������������������������������

loc_51E17:				; CODE XREF: sub_51AB3+342j
		push	0Bh
		lea	ax, [bp+var_32A]
		push	ax
		call	sub_563B
		add	sp, 4

loc_51E26:				; CODE XREF: sub_51AB3+362j
		mov	[bp+var_2], 0
		jmp	short loc_51E9F
; ���������������������������������������������������������������������������

loc_51E2D:				; CODE XREF: sub_51AB3+3F0j
		mov	bx, [bp+var_2]
		shl	bx, 1
		lea	ax, [bp+var_42]
		add	bx, ax
		cmp	word ptr [bx], 0
		jz	short loc_51E9C
		lea	ax, [bp+var_E]
		mov	bx, [bp+var_2]
		add	bx, ax
		mov	al, [bx]
		push	ax
		lea	ax, [bp+var_32A]
		push	ax
		call	sub_563B
		add	sp, 4
		mov	bx, [bp+var_2]
		shl	bx, 1
		lea	ax, [bp+var_42]
		add	bx, ax
		push	word ptr [bx]
		mov	ax, [bp+var_2]
		mov	dx, 28h	; '('
		imul	dx
		lea	dx, [bp+var_1AA]
		add	ax, dx
		push	ax
		push	9D8h
		lea	ax, [bp+var_35C]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 8
		lea	ax, [bp+var_35C]
		push	ax
		lea	ax, [bp+var_E]
		mov	bx, [bp+var_2]
		add	bx, ax
		mov	al, [bx]
		push	ax
		lea	ax, [bp+var_32A]
		push	ax
		call	sub_579A
		add	sp, 6

loc_51E9C:				; CODE XREF: sub_51AB3+387j
		inc	[bp+var_2]

loc_51E9F:				; CODE XREF: sub_51AB3+378j
		cmp	[bp+var_2], 9
		jl	short loc_51E2D
		mov	[bp+var_2], 0
		jmp	loc_51FD0
; ���������������������������������������������������������������������������

loc_51EAD:				; CODE XREF: sub_51AB3+523j
		mov	ax, [bp+var_2]
		shl	ax, 1
		mov	bx, [bp+arg_0]
		add	bx, ax
		cmp	byte ptr [bx+273h], 0FFh
		jnz	short loc_51EC1
		jmp	loc_51FCD
; ���������������������������������������������������������������������������

loc_51EC1:				; CODE XREF: sub_51AB3+409j
		mov	ax, [bp+var_2]
		shl	ax, 1
		mov	bx, [bp+arg_0]
		add	bx, ax
		mov	al, [bx+274h]
		mov	[bp+var_1C], al
		cmp	[bp+var_1C], 3
		jbe	short loc_51EDC
		mov	[bp+var_1C], 3

loc_51EDC:				; CODE XREF: sub_51AB3+423j
		mov	ax, [bp+var_2]
		shl	ax, 1
		mov	bx, [bp+arg_0]
		add	bx, ax
		mov	al, [bx+273h]
		mov	ah, 0
		mov	dx, 0Ch
		imul	dx
		mov	dx, [bp+var_2]
		shl	dx, 1
		add	dx, [bp+var_2]
		add	al, dl
		add	al, [bp+var_1C]
		mov	[bp+var_1B], al
		mov	al, [bp+var_1B]
		mov	ah, 0
		lea	dx, [bp-214h]
		add	ax, dx
		mov	bx, ax
		mov	al, [bx]
		push	ax
		lea	ax, [bp+var_32A]
		push	ax
		call	sub_56C5
		add	sp, 4
		mov	ax, [bp+var_2]
		shl	ax, 1
		mov	bx, [bp+arg_0]
		add	bx, ax
		mov	al, [bx+273h]
		mov	ah, 0
		shl	ax, 1
		lea	dx, [bp+var_30]
		add	ax, dx
		mov	bx, ax
		push	word ptr [bx]
		mov	ax, [bp+var_2]
		shl	ax, 1
		mov	bx, [bp+arg_0]
		add	bx, ax
		mov	al, [bx+273h]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		push	word ptr [bx+2DCh]
		push	9E0h
		lea	ax, [bp+var_35C]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 8
		mov	bx, [bp+var_2]
		shl	bx, 1
		lea	ax, [bp+var_16]
		add	bx, ax
		mov	al, [bx]
		mov	[bp+var_1D], al
		mov	bx, [bp+var_2]
		shl	bx, 1
		lea	ax, [bp+var_16+1]
		add	bx, ax
		mov	al, [bx]
		mov	[bp+var_1E], al
		mov	al, [bp+var_1D]
		push	ax
		lea	ax, [bp+var_32A]
		push	ax
		call	sub_563B
		add	sp, 4
		mov	al, [bp+var_1E]
		push	ax
		lea	ax, [bp+var_32A]
		push	ax
		call	sub_563B
		add	sp, 4
		lea	ax, [bp+var_35C]
		push	ax
		mov	al, [bp+var_1D]
		push	ax
		lea	ax, [bp+var_32A]
		push	ax
		call	sub_579A
		add	sp, 6
		lea	ax, [bp+var_35C]
		push	ax
		mov	al, [bp+var_1E]
		push	ax
		lea	ax, [bp+var_32A]
		push	ax
		call	sub_579A
		add	sp, 6

loc_51FCD:				; CODE XREF: sub_51AB3+40Bj
		inc	[bp+var_2]

loc_51FD0:				; CODE XREF: sub_51AB3+3F7j
		cmp	[bp+var_2], 4
		jge	short loc_51FD9
		jmp	loc_51EAD
; ���������������������������������������������������������������������������

loc_51FD9:				; CODE XREF: sub_51AB3+521j
		lea	ax, [bp+var_32A]
		push	ax
		call	sub_6162
		add	sp, 2
		mov	[bp+var_17], al
		mov	[bp+var_4], 0FFh
		mov	[bp+var_1B], 0
		mov	[bp+var_1C], 0
		mov	[bp+var_2], 0
		jmp	short loc_5201A
; ���������������������������������������������������������������������������

loc_51FFC:				; CODE XREF: sub_51AB3+56Bj
		lea	ax, [bp+var_E]
		mov	bx, [bp+var_2]
		add	bx, ax
		mov	al, [bx]
		cmp	al, [bp+var_17]
		jnz	short loc_52017
		mov	al, byte ptr [bp+var_2]
		mov	[bp+var_4], al
		mov	[bp+var_1B], 1
		jmp	short loc_52020
; ���������������������������������������������������������������������������

loc_52017:				; CODE XREF: sub_51AB3+556j
		inc	[bp+var_2]

loc_5201A:				; CODE XREF: sub_51AB3+547j
		cmp	[bp+var_2], 9
		jl	short loc_51FFC

loc_52020:				; CODE XREF: sub_51AB3+562j
		mov	[bp+var_2], 0
		jmp	short loc_52059
; ���������������������������������������������������������������������������

loc_52027:				; CODE XREF: sub_51AB3+5AAj
		lea	ax, [bp+var_16]
		mov	bx, [bp+var_2]
		add	bx, ax
		mov	al, [bx]
		cmp	al, [bp+var_17]
		jnz	short loc_52056
		mov	ax, [bp+var_2]
		cwd
		sub	ax, dx
		sar	ax, 1
		shl	ax, 1
		mov	bx, [bp+arg_0]
		add	bx, ax
		mov	al, [bx+273h]
		mov	[bp+var_4], al
		mov	[bp+var_1B], 1
		mov	[bp+var_1C], 1
		jmp	short loc_5205F
; ���������������������������������������������������������������������������

loc_52056:				; CODE XREF: sub_51AB3+581j
		inc	[bp+var_2]

loc_52059:				; CODE XREF: sub_51AB3+572j
		cmp	[bp+var_2], 8
		jl	short loc_52027

loc_5205F:				; CODE XREF: sub_51AB3+5A1j
		mov	al, [bp+var_1B]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_5206B
		jmp	loc_52265
; ���������������������������������������������������������������������������

loc_5206B:				; CODE XREF: sub_51AB3+5B3j
		cmp	[bp+var_252], 0
		jnz	short loc_5207B
		cmp	[bp+var_1C], 0
		jnz	short loc_5207B
		jmp	loc_5210C
; ���������������������������������������������������������������������������

loc_5207B:				; CODE XREF: sub_51AB3+5BDj
					; sub_51AB3+5C3j
		mov	[bp+var_2], 3
		jmp	short loc_52100
; ���������������������������������������������������������������������������

loc_52082:				; CODE XREF: sub_51AB3+653j
		mov	ax, [bp+var_2]
		shl	ax, 1
		mov	bx, [bp+arg_0]
		add	bx, ax
		mov	al, [bx+273h]
		cmp	al, [bp+var_4]
		jnz	short loc_520FD
		mov	ax, [bp+var_2]
		shl	ax, 1
		mov	bx, [bp+arg_0]
		add	bx, ax
		dec	byte ptr [bx+274h]
		mov	ax, [bp+var_2]
		shl	ax, 1
		mov	bx, [bp+arg_0]
		add	bx, ax
		mov	al, [bx+273h]
		mov	ah, 0
		shl	ax, 1
		lea	dx, [bp+var_42]
		add	ax, dx
		mov	bx, ax
		add	word ptr [bx], 2
		mov	ax, [bp+var_2]
		shl	ax, 1
		mov	bx, [bp+arg_0]
		add	bx, ax
		mov	al, [bx+273h]
		mov	ah, 0
		shl	ax, 1
		lea	dx, [bp+var_30]
		add	ax, dx
		mov	bx, ax
		sub	word ptr [bx], 2
		mov	ax, [bp+var_2]
		shl	ax, 1
		mov	bx, [bp+arg_0]
		add	bx, ax
		cmp	byte ptr [bx+274h], 0
		jnz	short loc_520FB
		mov	ax, [bp+var_2]
		shl	ax, 1
		mov	bx, [bp+arg_0]
		add	bx, ax
		mov	byte ptr [bx+273h], 0FFh

loc_520FB:				; CODE XREF: sub_51AB3+637j
		jmp	short loc_52109
; ���������������������������������������������������������������������������

loc_520FD:				; CODE XREF: sub_51AB3+5E0j
		dec	[bp+var_2]

loc_52100:				; CODE XREF: sub_51AB3+5CDj
		cmp	[bp+var_2], 0
		jl	short loc_52109
		jmp	loc_52082
; ���������������������������������������������������������������������������

loc_52109:				; CODE XREF: sub_51AB3:loc_520FBj
					; sub_51AB3+651j
		jmp	loc_52256
; ���������������������������������������������������������������������������

loc_5210C:				; CODE XREF: sub_51AB3+5C5j
		cmp	[bp+var_4], 0
		jz	short loc_52118
		cmp	[bp+var_4], 1
		jnz	short loc_52124

loc_52118:				; CODE XREF: sub_51AB3+65Dj
		mov	[bp+var_1D], 0
		mov	cl, 2
		mov	[bp+var_1E], 1
		jmp	short loc_5217C
; ���������������������������������������������������������������������������

loc_52124:				; CODE XREF: sub_51AB3+663j
		cmp	[bp+var_4], 6
		jnz	short loc_52136
		mov	[bp+var_1D], 2
		mov	cl, 3
		mov	[bp+var_1E], 1
		jmp	short loc_5217C
; ���������������������������������������������������������������������������

loc_52136:				; CODE XREF: sub_51AB3+675j
		cmp	[bp+var_4], 8
		jnz	short loc_52148
		mov	[bp+var_1D], 1
		mov	cl, 2
		mov	[bp+var_1E], 2
		jmp	short loc_5217C
; ���������������������������������������������������������������������������

loc_52148:				; CODE XREF: sub_51AB3+687j
		cmp	[bp+var_4], 5
		jz	short loc_52154
		cmp	[bp+var_4], 4
		jnz	short loc_52160

loc_52154:				; CODE XREF: sub_51AB3+699j
		mov	[bp+var_1D], 2
		mov	cl, 3
		mov	[bp+var_1E], 6
		jmp	short loc_5217C
; ���������������������������������������������������������������������������

loc_52160:				; CODE XREF: sub_51AB3+69Fj
		cmp	[bp+var_4], 7
		jnz	short loc_52172
		mov	[bp+var_1D], 2
		mov	cl, 3
		mov	[bp+var_1E], 2
		jmp	short loc_5217C
; ���������������������������������������������������������������������������

loc_52172:				; CODE XREF: sub_51AB3+6B1j
		mov	[bp+var_1D], 2
		mov	cl, 3
		mov	[bp+var_1E], 3

loc_5217C:				; CODE XREF: sub_51AB3+66Fj
					; sub_51AB3+681j ...
		mov	al, [bp+var_1D]
		mov	ah, 0
		mov	[bp+var_2], ax
		jmp	loc_5224A
; ���������������������������������������������������������������������������

loc_52187:				; CODE XREF: sub_51AB3+7A0j
		mov	al, [bp+var_4]
		mov	ah, 0
		shl	ax, 1
		lea	dx, [bp+var_42]
		add	ax, dx
		mov	bx, ax
		cmp	word ptr [bx], 1
		ja	short loc_5219D
		jmp	loc_52247
; ���������������������������������������������������������������������������

loc_5219D:				; CODE XREF: sub_51AB3+6E5j
		mov	ax, [bp+var_2]
		shl	ax, 1
		mov	bx, [bp+arg_0]
		add	bx, ax
		cmp	byte ptr [bx+273h], 0FFh
		jz	short loc_521EE
		mov	ax, [bp+var_2]
		shl	ax, 1
		mov	bx, [bp+arg_0]
		add	bx, ax
		mov	al, [bx+273h]
		cmp	al, [bp+var_4]
		jz	short loc_521C4
		jmp	loc_52247
; ���������������������������������������������������������������������������

loc_521C4:				; CODE XREF: sub_51AB3+70Cj
		mov	ax, [bp+var_2]
		shl	ax, 1
		mov	bx, [bp+arg_0]
		add	bx, ax
		mov	al, [bx+274h]
		cmp	al, [bp+var_1E]
		jnb	short loc_52247
		mov	ax, [bp+var_2]
		shl	ax, 1
		mov	bx, [bp+arg_0]
		add	bx, ax
		cmp	byte ptr [bx+273h], 8
		jnz	short loc_521EE
		cmp	[bp+var_2], 1
		jz	short loc_52247

loc_521EE:				; CODE XREF: sub_51AB3+6F9j
					; sub_51AB3+733j
		mov	ax, [bp+var_2]
		shl	ax, 1
		mov	bx, [bp+arg_0]
		add	bx, ax
		mov	al, [bp+var_4]
		mov	[bx+273h], al
		mov	ax, [bp+var_2]
		shl	ax, 1
		mov	bx, [bp+arg_0]
		add	bx, ax
		inc	byte ptr [bx+274h]
		mov	ax, [bp+var_2]
		shl	ax, 1
		mov	bx, [bp+arg_0]
		add	bx, ax
		mov	al, [bx+273h]
		mov	ah, 0
		shl	ax, 1
		lea	dx, [bp+var_42]
		add	ax, dx
		mov	bx, ax
		sub	word ptr [bx], 2
		mov	ax, [bp+var_2]
		shl	ax, 1
		mov	bx, [bp+arg_0]
		add	bx, ax
		mov	al, [bx+273h]
		mov	ah, 0
		shl	ax, 1
		lea	dx, [bp+var_30]
		add	ax, dx
		mov	bx, ax
		add	word ptr [bx], 2
		jmp	short loc_52256
; ���������������������������������������������������������������������������

loc_52247:				; CODE XREF: sub_51AB3+6E7j
					; sub_51AB3+70Ej ...
		inc	[bp+var_2]

loc_5224A:				; CODE XREF: sub_51AB3+6D1j
		mov	al, cl
		mov	ah, 0
		cmp	ax, [bp+var_2]
		jl	short loc_52256
		jmp	loc_52187
; ���������������������������������������������������������������������������

loc_52256:				; CODE XREF: sub_51AB3+31Bj
					; sub_51AB3:loc_52109j	...
		cmp	[bp+var_17], 0Bh
		jz	short loc_52265
		cmp	[bp+var_17], 0Ch
		jz	short loc_52265
		jmp	loc_51DD1
; ���������������������������������������������������������������������������

loc_52265:				; CODE XREF: sub_51AB3+5B5j
					; sub_51AB3+7A7j ...
		cmp	[bp+var_17], 0Ch
		jnz	short loc_5227D
		mov	bx, [bp+arg_0]
		mov	byte ptr [bx+0E8h], 1
		mov	bx, [bp+arg_0]
		mov	byte ptr [bx+0EEh], 1
		jmp	short loc_5228B
; ���������������������������������������������������������������������������

loc_5227D:				; CODE XREF: sub_51AB3+7B6j
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4

loc_5228B:				; CODE XREF: sub_51AB3+7C8j
		cmp	[bp+var_17], 0Ch
		jz	short loc_52294
		jmp	loc_52343
; ���������������������������������������������������������������������������

loc_52294:				; CODE XREF: sub_51AB3+7DCj
		push	0
		lea	ax, [bp+var_21A]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_220]
		push	ax
		call	sub_40F3
		add	sp, 4
		mov	[bp+var_282], 522h
		mov	[bp+var_278], 542h
		call	TextScrollDisplayB_ApplyHelperD_3F784
		mov	byte_497C0, 0
		cmp	[bp+var_255], 0
		jz	short loc_522ED
		mov	ax, [bp+var_255]
		add	ax, 2
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	[bp+var_255]
		call	sub_308
		add	sp, 2
		jmp	short $+2

loc_522ED:				; CODE XREF: sub_51AB3+81Aj
		push	2
		lea	ax, [bp+var_249]
		push	ax
		call	sub_49BC
		add	sp, 4
		lea	ax, [bp+var_263]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	0
		lea	ax, [bp+var_282]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		mov	[bp+var_32A], 56Eh
		lea	ax, [bp+var_32A]
		push	ax
		call	ResourceRecord_Helper_3BE15
		add	sp, 2
		push	0
		lea	ax, [bp+var_32A]
		push	ax
		call	StreamReader_ReleaseBuffer_3CEB3
		add	sp, 4
		mov	al, 1
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		jmp	loc_523EF
; ���������������������������������������������������������������������������

loc_52343:				; CODE XREF: sub_51AB3+7DEj
		push	0
		lea	ax, [bp+var_21A]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_220]
		push	ax
		call	sub_40F3
		add	sp, 4
		mov	[bp+var_282], 522h
		mov	[bp+var_278], 542h
		call	TextScrollDisplayB_ApplyHelperD_3F784
		mov	byte_497C0, 0
		cmp	[bp+var_255], 0
		jz	short loc_5239C
		mov	ax, [bp+var_255]
		add	ax, 2
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	[bp+var_255]
		call	sub_308
		add	sp, 2
		jmp	short $+2

loc_5239C:				; CODE XREF: sub_51AB3+8C9j
		push	2
		lea	ax, [bp+var_249]
		push	ax
		call	sub_49BC
		add	sp, 4
		lea	ax, [bp+var_263]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	0
		lea	ax, [bp+var_282]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		mov	[bp+var_32A], 56Eh
		lea	ax, [bp+var_32A]
		push	ax
		call	ResourceRecord_Helper_3BE15
		add	sp, 2
		push	0
		lea	ax, [bp+var_32A]
		push	ax
		call	StreamReader_ReleaseBuffer_3CEB3
		add	sp, 4
		mov	al, 0
		pop	di
		pop	si
		leave
		retf
sub_51AB3	endp

; ���������������������������������������������������������������������������
; START	OF FUNCTION CHUNK FOR sub_51AB3

loc_523EF:				; CODE XREF: sub_51AB3+88Dj
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK	FOR sub_51AB3

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_523F3	proc far		; CODE XREF: sub_420A9J sub_52662+B58p ...

var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_2		= byte ptr -2
var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= byte ptr  0Ah
arg_6		= byte ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 0Eh
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_1], 0
		mov	[bp+var_2], 0
		mov	ax, [bp+arg_2]
		add	ax, 0C7h ; '�'
		push	ax
		lea	ax, [bp+var_6]
		push	ax
		call	SmallObject_RegisterInList_2CB40
		add	sp, 4
		push	0
		push	0
		push	0
		push	[bp+arg_8]
		push	0
		call	ImageLayer_Construct_2E02C
		add	sp, 0Ah
		mov	di, ax
		cmp	[bp+arg_4], 0
		jz	short loc_52439
		mov	word ptr [di+1Bh], 5

loc_52439:				; CODE XREF: sub_523F3+3Fj
		mov	al, [bp+arg_6]
		mov	ah, 0
		dec	ax
		mov	bx, ax
		cmp	bx, 8		; switch 9 cases
		ja	short loc_524AF	; default
		shl	bx, 1
		jmp	cs:off_52650[bx] ; switch jump

loc_5244D:				; DATA XREF: ovr188:off_52650o
		mov	[bp+var_1], 4Fh	; 'O' ; case 0x0
		mov	[bp+var_2], 4Bh	; 'K'
		jmp	short loc_524AF	; default
; ���������������������������������������������������������������������������

loc_52457:				; CODE XREF: sub_523F3+55j
					; DATA XREF: ovr188:off_52650o
		cmp	[bp+arg_4], 0	; case 0x2
		jz	short loc_52467
		mov	[bp+var_1], 52h	; 'R'
		mov	[bp+var_2], 4Fh	; 'O'
		jmp	short loc_5246F
; ���������������������������������������������������������������������������

loc_52467:				; CODE XREF: sub_523F3+68j
		mov	[bp+var_1], 49h	; 'I'
		mov	[bp+var_2], 4Dh	; 'M'

loc_5246F:				; CODE XREF: sub_523F3+72j
		jmp	short loc_524AF	; default
; ���������������������������������������������������������������������������

loc_52471:				; CODE XREF: sub_523F3+55j
					; DATA XREF: ovr188:off_52650o
		cmp	[bp+arg_4], 0	; case 0x4
		jz	short loc_52481
		mov	[bp+var_1], 54h	; 'T'
		mov	[bp+var_2], 52h	; 'R'
		jmp	short loc_52489
; ���������������������������������������������������������������������������

loc_52481:				; CODE XREF: sub_523F3+82j
		mov	[bp+var_1], 4Dh	; 'M'
		mov	[bp+var_2], 51h	; 'Q'

loc_52489:				; CODE XREF: sub_523F3+8Cj
		jmp	short loc_524AF	; default
; ���������������������������������������������������������������������������

loc_5248B:				; CODE XREF: sub_523F3+55j
					; DATA XREF: ovr188:off_52650o
		cmp	[bp+arg_4], 0	; case 0x6
		jz	short loc_5249B
		mov	[bp+var_1], 56h	; 'V'
		mov	[bp+var_2], 54h	; 'T'
		jmp	short loc_524A3
; ���������������������������������������������������������������������������

loc_5249B:				; CODE XREF: sub_523F3+9Cj
		mov	[bp+var_1], 51h	; 'Q'
		mov	[bp+var_2], 53h	; 'S'

loc_524A3:				; CODE XREF: sub_523F3+A6j
		jmp	short loc_524AF	; default
; ���������������������������������������������������������������������������

loc_524A5:				; CODE XREF: sub_523F3+55j
					; DATA XREF: ovr188:off_52650o
		mov	[bp+var_1], 53h	; 'S' ; case 0x8
		mov	[bp+var_2], 55h	; 'U'
		jmp	short $+2

loc_524AF:				; CODE XREF: sub_523F3+51j
					; sub_523F3+55j ...
		mov	al, [bp+var_1]	; default
		push	ax
		push	[bp+arg_2]
		call	sub_563B
		add	sp, 4
		mov	al, [bp+var_2]
		push	ax
		push	[bp+arg_2]
		call	sub_5658
		add	sp, 4
		mov	[bp+var_8], 0
		jmp	short loc_524F8
; ���������������������������������������������������������������������������

loc_524D4:				; CODE XREF: sub_523F3+11Aj
		mov	bx, [bp+var_8]
		mov	al, [bx+6]
		cmp	al, [bp+var_1]
		jnz	short loc_524E6
		mov	bx, [bp+var_8]
		mov	byte ptr [bx+7], 1

loc_524E6:				; CODE XREF: sub_523F3+EAj
		mov	bx, [bp+var_8]
		mov	al, [bx+6]
		cmp	al, [bp+var_2]
		jnz	short loc_524F8
		mov	bx, [bp+var_8]
		mov	byte ptr [bx+7], 0

loc_524F8:				; CODE XREF: sub_523F3+DFj
					; sub_523F3+FCj
		lea	ax, [bp+var_8]
		push	ax
		mov	ax, [bp+arg_2]
		add	ax, 0E1h ; '�'
		push	ax
		call	sub_2FF1E
		add	sp, 4
		or	ax, ax
		jnz	short loc_524D4
		call	TextScrollDisplayB_ApplyHelperD_3F784
		jmp	loc_52608
; ���������������������������������������������������������������������������

loc_52517:				; CODE XREF: sub_523F3+221j
					; sub_523F3+233j
		mov	[bp+var_8], 0
		jmp	short loc_52536
; ���������������������������������������������������������������������������

loc_5251E:				; CODE XREF: sub_523F3+158j
		push	0
		push	0
		mov	bx, [bp+var_8]
		push	word ptr [bx+6]
		mov	bx, [bp+var_8]
		mov	bx, [bx+6]
		mov	bx, [bx]
		call	dword ptr [bx+10h]
		add	sp, 6

loc_52536:				; CODE XREF: sub_523F3+129j
		lea	ax, [bp+var_8]
		push	ax
		mov	ax, [bp+arg_2]
		add	ax, 0ACh ; '�'
		push	ax
		call	sub_2FC4A
		add	sp, 4
		or	ax, ax
		jnz	short loc_5251E
		mov	[bp+var_A], 0
		jmp	short loc_5259B
; ���������������������������������������������������������������������������

loc_52554:				; CODE XREF: sub_523F3+1BDj
		mov	bx, [bp+var_A]
		cmp	byte ptr [bx+7], 0
		jz	short loc_5259B
		mov	bx, [bp+var_A]
		cmp	word ptr [bx+4], 0
		jz	short loc_5257E
		push	0
		push	0
		mov	bx, [bp+var_A]
		push	word ptr [bx+4]
		mov	bx, [bp+var_A]
		mov	bx, [bx+4]
		mov	bx, [bx]
		call	dword ptr [bx+10h]
		add	sp, 6

loc_5257E:				; CODE XREF: sub_523F3+171j
		mov	bx, [bp+var_A]
		cmp	word ptr [bx+4], 0
		jz	short loc_5259B
		mov	bx, [bp+var_A]
		push	word ptr [bx+4]
		mov	bx, [bp+var_A]
		mov	bx, [bx+4]
		mov	bx, [bx]
		call	dword ptr [bx+1Ch]
		add	sp, 2

loc_5259B:				; CODE XREF: sub_523F3+15Fj
					; sub_523F3+168j ...
		lea	ax, [bp+var_A]
		push	ax
		mov	ax, [bp+arg_2]
		add	ax, 0E1h ; '�'
		push	ax
		call	sub_2FF1E
		add	sp, 4
		or	ax, ax
		jnz	short loc_52554
		push	0
		push	0
		push	di
		mov	bx, [di]
		call	dword ptr [bx+10h]
		add	sp, 6
		push	word_46F44
		mov	bx, [bp+arg_2]
		push	word ptr [bx+0BBh]
		call	UI_ApplyEncodingHelper_2EC65
		add	sp, 4
		cmp	[bp+arg_4], 0
		jz	short loc_525E7
		mov	ax, [di+1Bh]
		dec	ax
		mov	[bp+var_C], ax
		mov	ax, [bp+var_C]
		mov	[di+1Bh], ax
		jmp	short loc_525F4
; ���������������������������������������������������������������������������

loc_525E7:				; CODE XREF: sub_523F3+1E3j
		mov	ax, [di+1Bh]
		inc	ax
		mov	[bp+var_E], ax
		mov	ax, [bp+var_E]
		mov	[di+1Bh], ax

loc_525F4:				; CODE XREF: sub_523F3+1F2j
		mov	ax, [bp+arg_2]
		add	ax, 0A8h ; '�'
		push	ax
		mov	bx, [bp+arg_2]
		mov	bx, [bx+0A8h]
		call	dword ptr [bx+1Ch]
		add	sp, 2

loc_52608:				; CODE XREF: sub_523F3+121j
		cmp	[bp+arg_4], 0
		jz	short loc_52617
		cmp	word ptr [di+1Bh], 0
		jz	short loc_52617
		jmp	loc_52517
; ���������������������������������������������������������������������������

loc_52617:				; CODE XREF: sub_523F3+219j
					; sub_523F3+21Fj
		mov	al, [bp+arg_4]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_52629
		cmp	word ptr [di+1Bh], 5
		jz	short loc_52629
		jmp	loc_52517
; ���������������������������������������������������������������������������

loc_52629:				; CODE XREF: sub_523F3+22Bj
					; sub_523F3+231j
		call	TextScrollDisplayB_ApplyHelperC_3F74A
		or	di, di
		jz	short loc_5263E
		push	3
		push	di
		mov	bx, [di]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short $+2

loc_5263E:				; CODE XREF: sub_523F3+23Dj
		push	2
		lea	ax, [bp+var_6]
		push	ax
		call	SmallObject_UnregisterFromList_2CB7A
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_523F3	endp

; ���������������������������������������������������������������������������
off_52650	dw offset loc_5244D	; DATA XREF: sub_523F3+55r
		dw offset loc_524AF	; jump table for switch	statement
		dw offset loc_52457
		dw offset loc_524AF
		dw offset loc_52471
		dw offset loc_524AF
		dw offset loc_5248B
		dw offset loc_524AF
		dw offset loc_524A5

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_52662	proc far		; CODE XREF: sub_420AEJ

var_33E		= word ptr -33Eh
var_324		= word ptr -324h
var_30A		= word ptr -30Ah
var_2F0		= word ptr -2F0h
var_2EE		= word ptr -2EEh
var_2DA		= byte ptr -2DAh
var_2D6		= word ptr -2D6h
var_2BE		= word ptr -2BEh
var_261		= dword	ptr -261h
var_25D		= dword	ptr -25Dh
var_259		= dword	ptr -259h
var_244		= word ptr -244h
var_242		= word ptr -242h
var_216		= word ptr -216h
var_20C		= word ptr -20Ch
var_1F7		= word ptr -1F7h
var_1E9		= word ptr -1E9h
var_1E6		= byte ptr -1E6h
var_1E4		= byte ptr -1E4h
var_1DD		= word ptr -1DDh
var_1D7		= byte ptr -1D7h
var_1C2		= byte ptr -1C2h
var_1B7		= byte ptr -1B7h
var_1B6		= word ptr -1B6h
var_1B4		= word ptr -1B4h
var_1B2		= word ptr -1B2h
var_1B0		= word ptr -1B0h
var_1AE		= word ptr -1AEh
var_1A9		= byte ptr -1A9h
var_1A8		= word ptr -1A8h
var_130		= word ptr -130h
var_E0		= word ptr -0E0h
var_D6		= word ptr -0D6h
var_CC		= word ptr -0CCh
var_C2		= dword	ptr -0C2h
var_BD		= word ptr -0BDh
var_BB		= word ptr -0BBh
var_B9		= byte ptr -0B9h
var_B8		= dword	ptr -0B8h
var_B0		= byte ptr -0B0h
var_AF		= dword	ptr -0AFh
var_A7		= byte ptr -0A7h
var_A6		= dword	ptr -0A6h
var_9E		= byte ptr -9Eh
var_9D		= dword	ptr -9Dh
var_95		= byte ptr -95h
var_94		= dword	ptr -94h
var_8C		= byte ptr -8Ch
var_8B		= dword	ptr -8Bh
var_83		= byte ptr -83h
var_82		= dword	ptr -82h
var_7A		= byte ptr -7Ah
var_79		= dword	ptr -79h
var_68		= byte ptr -68h
var_67		= dword	ptr -67h
var_5F		= byte ptr -5Fh
var_5E		= dword	ptr -5Eh
var_56		= byte ptr -56h
var_55		= dword	ptr -55h
var_4D		= byte ptr -4Dh
var_4C		= dword	ptr -4Ch
var_44		= word ptr -44h
var_42		= dword	ptr -42h
var_3E		= byte ptr -3Eh
var_3D		= byte ptr -3Dh
var_3C		= word ptr -3Ch
var_3A		= word ptr -3Ah
var_38		= word ptr -38h
var_36		= word ptr -36h
var_33		= byte ptr -33h
var_32		= word ptr -32h
var_30		= word ptr -30h
var_2E		= word ptr -2Eh
var_2C		= word ptr -2Ch
var_2A		= dword	ptr -2Ah
var_26		= dword	ptr -26h
var_22		= byte ptr -22h
var_21		= byte ptr -21h
var_20		= dword	ptr -20h
var_1C		= word ptr -1Ch
var_1A		= word ptr -1Ah
var_17		= byte ptr -17h
var_16		= word ptr -16h
var_13		= byte ptr -13h
var_12		= dword	ptr -12h
var_E		= dword	ptr -0Eh
var_A		= dword	ptr -0Ah
var_6		= byte ptr -6
var_5		= byte ptr -5
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 33Eh
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		mov	[bp+var_A], 0
		mov	[bp+var_6], 2
		mov	[bp+var_5], 0
		mov	[bp+var_4], 0
		mov	eax, [si+27Bh]
		sub	eax, [si+283h]
		mov	[bp+var_E], eax
		mov	[bp+var_12], 0
		mov	[bp+var_13], 0
		push	seg stub188
		push	offset sub_4209A
		push	1
		push	0Eh
		push	9
		lea	ax, [bp+var_C2]
		push	ax
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		mov	[bp+var_16], 0
		jmp	short loc_526EF
; ���������������������������������������������������������������������������

loc_526CE:				; CODE XREF: sub_52662+91j
		mov	ax, [bp+var_16]
		mov	dx, 9
		imul	dx
		lea	dx, [bp+var_C2+1]
		add	ax, dx
		mov	bx, [bp+var_16]
		shl	bx, 2
		mov	edx, [bx+32Ah]
		mov	bx, ax
		mov	[bx], edx
		inc	[bp+var_16]

loc_526EF:				; CODE XREF: sub_52662+6Aj
		cmp	[bp+var_16], 0Eh
		jl	short loc_526CE
		push	seg stub188
		push	offset Stub_ResourceHandle_Construct_42095
		push	1
		push	3
		push	0Ah
		lea	ax, [bp+var_E0]
		push	ax
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		lea	ax, [bp+var_1A8]
		push	ax
		call	IndexedRecordReader_ConstructVariantA_3D28A
		add	sp, 2
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aOptshps_0 ; "optshps"
		push	ds
		push	offset a____DataGamefl ; "..\\..\\data\\gameflow\\"
		lea	ax, [bp+var_130]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_130]
		push	ax
		lea	ax, [bp+var_1A8]
		push	ax
		mov	bx, [bp+var_1A8]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	2
		lea	ax, [bp+var_E0]
		push	ax
		push	9Bh ; '�'
		lea	ax, [bp+var_1A8]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	2
		lea	ax, [bp+var_D6]
		push	ax
		push	9Ch ; '�'
		lea	ax, [bp+var_1A8]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	2
		lea	ax, [bp+var_CC]
		push	ax
		push	9Dh ; '�'
		lea	ax, [bp+var_1A8]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	3
		lea	ax, [bp+var_A]
		push	ax
		push	9Ah ; '�'
		lea	ax, [bp+var_1A8]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		lea	ax, [bp+var_1A8]
		push	ax
		call	StreamReader_CloseHook_3B5DE
		add	sp, 2
		cmp	[bp+arg_2], 1
		jnz	short loc_527ED
		xor	cx, cx
		jmp	short loc_527E8
; ���������������������������������������������������������������������������

loc_527BC:				; CODE XREF: sub_52662+189j
		mov	ax, cx
		mov	dx, 9
		imul	dx
		lea	dx, [bp+var_C2+1]
		add	ax, dx
		mov	bx, ax
		mov	eax, [bx]
		shl	eax, 1
		push	eax
		mov	ax, cx
		mov	dx, 9
		imul	dx
		lea	dx, [bp+var_C2+1]
		add	ax, dx
		mov	bx, ax
		pop	eax
		mov	[bx], eax
		inc	cx

loc_527E8:				; CODE XREF: sub_52662+158j
		cmp	cx, 0Eh
		jl	short loc_527BC

loc_527ED:				; CODE XREF: sub_52662+154j
		mov	[bp+var_17], 1
		mov	ax, [si+0E4h]
		mov	[bp+var_1A], ax
		lea	ax, [bp+var_2BE]
		push	ax
		call	StreamReader_ConstructVariantA_3B2A9
		add	sp, 2
		mov	[bp+var_2BE], 556h
		mov	[bp+var_25D], 100h
		mov	[bp+var_261], 0
		mov	[bp+var_2BE], 56Eh
		mov	[bp+var_242], 0
		xor	ax, ax
		mov	[bp+var_244], ax
		movsx	eax, ax
		mov	[bp+var_259], eax
		push	[bp+var_1A]
		push	word_46F46
		push	0FFh
		push	0Ah
		lea	ax, [bp+var_216]
		push	ax
		call	sub_4C1F
		add	sp, 0Ah
		mov	[bp+var_2BE], 586h
		mov	[bp+var_216], 59Eh
		mov	[bp+var_20C], 5BEh
		mov	[bp+var_1B4], 2BDh
		xor	ax, ax
		mov	[bp+var_1B0], ax
		mov	[bp+var_1B2], ax
		mov	[bp+var_1B4], 552h
		push	100h
		push	0
		lea	ax, [bp+var_1AE]
		push	ax
		call	Palette_Alloc_2CC76
		add	sp, 6
		mov	[bp+var_1C2], 0
		mov	[bp+var_1B7], 0
		mov	[bp+var_1D7], 1Eh
		mov	[bp+var_1A9], 0FFh
		mov	ax, [bp+var_1A]
		mov	[bp+var_1B6], ax
		lea	ax, [bp+var_2BE]
		mov	[bp+var_1C], ax
		lea	ax, [bp+var_2BE]
		push	ax
		call	sub_5803
		add	sp, 2
		push	ds
		push	offset a_shp	; ".shp"
		push	ds
		push	offset aCalcfont ; "calcfont"
		push	ds
		push	offset a____DataFonts ;	"..\\..\\data\\fonts\\"
		lea	ax, [bp+var_130]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	2
		lea	ax, [bp+var_130]
		push	ax
		call	TextRenderer_LoadResourceFile_3DA1F
		add	sp, 4
		mov	word ptr [bp+var_2A+2],	dx
		mov	word ptr [bp+var_2A], ax
		mov	eax, [bp+var_2A]
		mov	[bp+var_26], eax
		mov	[bp+var_22], 2
		mov	[bp+var_21], 1
		mov	[bp+var_20], 0
		lea	ax, [bp+var_26]
		push	ax
		lea	ax, [bp+var_2D6]
		push	ax
		call	GlyphObject_ConstructWithBuffer_311CF
		add	sp, 4
		lea	ax, [bp+var_2D6]
		mov	[bp+var_2C], ax
		push	0Bh
		push	[bp+var_2C]
		mov	bx, [bp+var_2C]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 4
		mov	bx, [bp+var_2C]
		mov	word ptr [bx+10h], 1
		mov	bx, [bp+var_2C]
		mov	word ptr [bx+12h], 0
		push	2Dh ; '-'
		push	[bp+var_2C]
		mov	bx, [bp+var_2C]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 4
		mov	bx, [bp+var_2C]
		mov	[bx+14h], ax
		push	[bp+var_2C]
		lea	ax, [bp+var_1F7]
		push	ax
		lea	ax, [bp+var_2F0]
		push	ax
		call	Widget_ApplyStyleAndAllocate_3144B
		add	sp, 6
		mov	[bp+var_2DA], 4
		push	0
		push	0
		lea	ax, [bp+var_2F0]
		push	ax
		push	0
		call	TextLayer_Construct_ACF1
		add	sp, 8
		mov	[bp+var_2E], ax
		push	0
		push	0
		lea	ax, [bp+var_2F0]
		push	ax
		push	0
		call	TextLayer_Construct_ACF1
		add	sp, 8
		mov	[bp+var_30], ax
		push	0
		push	0
		lea	ax, [bp+var_2F0]
		push	ax
		push	0
		call	TextLayer_Construct_ACF1
		add	sp, 8
		mov	[bp+var_32], ax
		push	[bp+var_2E]
		lea	ax, [bp+var_216]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	[bp+var_30]
		lea	ax, [bp+var_216]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	[bp+var_32]
		lea	ax, [bp+var_216]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		mov	al, [si+0FCh]
		mov	[bp+var_33], al
		mov	al, [bp+var_33]
		mov	[bp+var_1E4], al
		jmp	loc_5343F
; ���������������������������������������������������������������������������

loc_529EB:				; CODE XREF: sub_52662+DE6j
		xor	di, di
		jmp	loc_52B99
; ���������������������������������������������������������������������������

loc_529F0:				; CODE XREF: sub_52662+53Cj
		mov	ax, di
		mov	dx, 9
		imul	dx
		lea	dx, [bp+var_C2]
		add	ax, dx
		mov	bx, ax
		cmp	byte ptr [bx], 0
		jge	short loc_52A16
		mov	ax, di
		mov	dx, 9
		imul	dx
		lea	dx, [bp+var_C2]
		add	ax, dx
		mov	bx, ax
		mov	byte ptr [bx], 0

loc_52A16:				; CODE XREF: sub_52662+3A0j
		mov	ax, di
		mov	dx, 9
		imul	dx
		lea	dx, [bp+var_C2]
		add	ax, dx
		mov	bx, ax
		cmp	byte ptr [bx], 63h ; 'c'
		jle	short loc_52A3C
		mov	ax, di
		mov	dx, 9
		imul	dx
		lea	dx, [bp+var_C2]
		add	ax, dx
		mov	bx, ax
		mov	byte ptr [bx], 63h ; 'c'

loc_52A3C:				; CODE XREF: sub_52662+3C6j
		mov	ax, di
		mov	dx, 9
		imul	dx
		lea	dx, [bp+var_C2]
		add	ax, dx
		mov	bx, ax
		cmp	byte ptr [bx], 0
		jnz	short loc_52A53
		jmp	loc_52B98
; ���������������������������������������������������������������������������

loc_52A53:				; CODE XREF: sub_52662+3ECj
		mov	al, [di+30Eh]
		push	ax
		lea	ax, [bp+var_2BE]
		push	ax
		call	sub_563B
		add	sp, 4
		mov	[bp+var_44], 0
		jmp	loc_52B80
; ���������������������������������������������������������������������������

loc_52A6D:				; CODE XREF: sub_52662+533j
		mov	bx, [bp+var_44]
		mov	al, [bx+6]
		cmp	al, [di+30Eh]
		jz	short loc_52A7C
		jmp	loc_52B80
; ���������������������������������������������������������������������������

loc_52A7C:				; CODE XREF: sub_52662+415j
		mov	ax, di
		mov	dx, 9
		imul	dx
		lea	dx, [bp+var_C2]
		add	ax, dx
		mov	bx, ax
		cmp	byte ptr [bx], 9
		jle	short loc_52B07
		mov	ax, di
		mov	dx, 9
		imul	dx
		lea	dx, [bp+var_C2]
		add	ax, dx
		mov	bx, ax
		mov	al, [bx]
		cbw
		mov	bx, 0Ah
		cwd
		idiv	bx
		push	ax
		mov	bx, di
		shl	bx, 1
		push	word ptr [bx+37Eh]
		mov	bx, di
		shl	bx, 1
		push	word ptr [bx+362h]
		mov	al, [di+31Ch]
		mov	ah, 0
		mov	dx, 0Ah
		imul	dx
		lea	dx, [bp+var_E0]
		add	ax, dx
		push	ax
		push	0
		call	ImageLayer_Construct_2E02C
		add	sp, 0Ah
		push	ax
		mov	ax, di
		mov	dx, 9
		imul	dx
		lea	dx, [bp+var_BD]
		add	ax, dx
		mov	bx, ax
		pop	ax
		mov	[bx], ax
		mov	ax, di
		mov	dx, 9
		imul	dx
		lea	dx, [bp+var_BD]
		add	ax, dx
		mov	bx, ax
		push	word ptr [bx]
		mov	bx, [bp+var_44]
		push	word ptr [bx+4]
		call	LayerGroup_Add_2DB84
		add	sp, 4

loc_52B07:				; CODE XREF: sub_52662+42Cj
		mov	ax, di
		mov	dx, 9
		imul	dx
		lea	dx, [bp+var_C2]
		add	ax, dx
		mov	bx, ax
		mov	al, [bx]
		cbw
		mov	bx, 0Ah
		cwd
		idiv	bx
		push	dx
		mov	bx, di
		shl	bx, 1
		push	word ptr [bx+3B6h]
		mov	bx, di
		shl	bx, 1
		push	word ptr [bx+39Ah]
		mov	al, [di+31Ch]
		mov	ah, 0
		mov	dx, 0Ah
		imul	dx
		lea	dx, [bp+var_E0]
		add	ax, dx
		push	ax
		push	0
		call	ImageLayer_Construct_2E02C
		add	sp, 0Ah
		push	ax
		mov	ax, di
		mov	dx, 9
		imul	dx
		lea	dx, [bp+var_BB]
		add	ax, dx
		mov	bx, ax
		pop	ax
		mov	[bx], ax
		mov	ax, di
		mov	dx, 9
		imul	dx
		lea	dx, [bp+var_BB]
		add	ax, dx
		mov	bx, ax
		push	word ptr [bx]
		mov	bx, [bp+var_44]
		push	word ptr [bx+4]
		call	LayerGroup_Add_2DB84
		add	sp, 4
		jmp	short loc_52B98
; ���������������������������������������������������������������������������

loc_52B80:				; CODE XREF: sub_52662+408j
					; sub_52662+417j
		lea	ax, [bp+var_44]
		push	ax
		lea	ax, [bp+var_1DD]
		push	ax
		call	sub_2FF1E
		add	sp, 4
		or	ax, ax
		jz	short loc_52B98
		jmp	loc_52A6D
; ���������������������������������������������������������������������������

loc_52B98:				; CODE XREF: sub_52662+3EEj
					; sub_52662+51Cj ...
		inc	di

loc_52B99:				; CODE XREF: sub_52662+38Bj
		cmp	di, 0Eh
		jge	short loc_52BA1
		jmp	loc_529F0
; ���������������������������������������������������������������������������

loc_52BA1:				; CODE XREF: sub_52662+53Aj
		cmp	byte ptr [si+0FCh], 0Dh
		jnz	short loc_52BB9
		push	0Dh
		lea	ax, [bp+var_2BE]
		push	ax
		call	sub_563B
		add	sp, 4
		jmp	short loc_52BC8
; ���������������������������������������������������������������������������

loc_52BB9:				; CODE XREF: sub_52662+544j
		push	1Dh
		lea	ax, [bp+var_2BE]
		push	ax
		call	sub_563B
		add	sp, 4

loc_52BC8:				; CODE XREF: sub_52662+555j
		cmp	[bp+var_17], 1
		jz	short loc_52BDD
		push	57h ; 'W'
		lea	ax, [bp+var_2BE]
		push	ax
		call	sub_563B
		add	sp, 4

loc_52BDD:				; CODE XREF: sub_52662+56Aj
		cmp	[bp+var_17], 9
		jz	short loc_52BF2
		push	58h ; 'X'
		lea	ax, [bp+var_2BE]
		push	ax
		call	sub_563B
		add	sp, 4

loc_52BF2:				; CODE XREF: sub_52662+57Fj
		mov	al, [bp+var_17]
		mov	ah, 0
		dec	ax
		mov	bx, ax
		cmp	bx, 8		; switch 9 cases
		jbe	short loc_52C02
		jmp	loc_52CE6	; default
; ���������������������������������������������������������������������������

loc_52C02:				; CODE XREF: sub_52662+59Bj
		shl	bx, 1
		jmp	cs:off_53674[bx] ; switch jump

loc_52C09:				; DATA XREF: ovr188:off_53674o
		push	49h ; 'I'       ; case 0x0
		lea	ax, [bp+var_2BE]
		push	ax
		call	sub_563B
		add	sp, 4
		push	4Ah ; 'J'
		lea	ax, [bp+var_2BE]
		push	ax
		call	sub_563B
		add	sp, 4
		push	4Bh ; 'K'
		lea	ax, [bp+var_2BE]
		push	ax
		call	sub_563B
		add	sp, 4
		push	4Ch ; 'L'
		lea	ax, [bp+var_2BE]
		push	ax
		call	sub_563B
		add	sp, 4
		jmp	loc_52CE6	; default
; ���������������������������������������������������������������������������

loc_52C48:				; CODE XREF: sub_52662+5A2j
					; DATA XREF: ovr188:off_53674o
		push	4Dh ; 'M'       ; case 0x2
		lea	ax, [bp+var_2BE]
		push	ax
		call	sub_563B
		add	sp, 4
		push	4Eh ; 'N'
		lea	ax, [bp+var_2BE]
		push	ax
		call	sub_563B
		add	sp, 4
		push	4Fh ; 'O'
		lea	ax, [bp+var_2BE]
		push	ax
		call	sub_563B
		add	sp, 4
		push	50h ; 'P'
		lea	ax, [bp+var_2BE]
		push	ax
		call	sub_563B
		add	sp, 4
		jmp	short loc_52CE6	; default
; ���������������������������������������������������������������������������

loc_52C86:				; CODE XREF: sub_52662+5A2j
					; DATA XREF: ovr188:off_53674o
		push	51h ; 'Q'       ; case 0x4
		lea	ax, [bp+var_2BE]
		push	ax
		call	sub_563B
		add	sp, 4
		push	52h ; 'R'
		lea	ax, [bp+var_2BE]
		push	ax
		call	sub_563B
		add	sp, 4
		jmp	short loc_52CE6	; default
; ���������������������������������������������������������������������������

loc_52CA6:				; CODE XREF: sub_52662+5A2j
					; DATA XREF: ovr188:off_53674o
		push	53h ; 'S'       ; case 0x6
		lea	ax, [bp+var_2BE]
		push	ax
		call	sub_563B
		add	sp, 4
		push	54h ; 'T'
		lea	ax, [bp+var_2BE]
		push	ax
		call	sub_563B
		add	sp, 4
		jmp	short loc_52CE6	; default
; ���������������������������������������������������������������������������

loc_52CC6:				; CODE XREF: sub_52662+5A2j
					; DATA XREF: ovr188:off_53674o
		push	55h ; 'U'       ; case 0x8
		lea	ax, [bp+var_2BE]
		push	ax
		call	sub_563B
		add	sp, 4
		push	56h ; 'V'
		lea	ax, [bp+var_2BE]
		push	ax
		call	sub_563B
		add	sp, 4
		jmp	short $+2

loc_52CE6:				; CODE XREF: sub_52662+59Dj
					; sub_52662+5A2j ...
		push	0Ah		; default
		lea	ax, [bp+var_30A]
		push	ax
		push	large [bp+var_E]
		call	CRT_Itoa_BaseVariant
		add	sp, 8
		push	0Ah
		lea	ax, [bp+var_324]
		push	ax
		push	large [bp+var_12]
		call	CRT_Itoa_BaseVariant
		add	sp, 8
		push	0Ah
		lea	ax, [bp+var_33E]
		push	ax
		mov	eax, [bp+var_E]
		sub	eax, [bp+var_12]
		push	eax
		call	CRT_Itoa_BaseVariant
		add	sp, 8
		cmp	[bp+var_E], 0
		jz	short loc_52D3C
		push	9F8h
		lea	ax, [bp+var_30A]
		push	ax
		call	CRT_Strcat
		add	sp, 4

loc_52D3C:				; CODE XREF: sub_52662+6C8j
		cmp	[bp+var_12], 0
		jz	short loc_52D53
		push	9FCh
		lea	ax, [bp+var_324]
		push	ax
		call	CRT_Strcat
		add	sp, 4

loc_52D53:				; CODE XREF: sub_52662+6DFj
		mov	eax, [bp+var_E]
		sub	eax, [bp+var_12]
		jz	short loc_52D6D
		push	0A00h
		lea	ax, [bp+var_33E]
		push	ax
		call	CRT_Strcat
		add	sp, 4

loc_52D6D:				; CODE XREF: sub_52662+6F9j
		lea	ax, [bp+var_30A]
		push	ax
		lea	ax, [bp+var_2F0]
		push	ax
		call	GlyphObject_RenderToWidget_31A68
		add	sp, 4
		mov	[bp+var_36], ax
		mov	ax, 127h
		sub	ax, [bp+var_36]
		mov	[bp+var_38], ax
		mov	bx, [bp+var_2E]
		mov	ax, [bp+var_38]
		mov	[bx+0Ch], ax
		mov	bx, [bp+var_2E]
		mov	word ptr [bx+0Eh], 23h ; '#'
		lea	ax, [bp+var_30A]
		push	ax
		push	[bp+var_2E]
		call	TextLayer_SetText_ADB7
		add	sp, 4
		lea	ax, [bp+var_324]
		push	ax
		lea	ax, [bp+var_2F0]
		push	ax
		call	GlyphObject_RenderToWidget_31A68
		add	sp, 4
		mov	[bp+var_36], ax
		mov	ax, 127h
		sub	ax, [bp+var_36]
		mov	[bp+var_3A], ax
		mov	bx, [bp+var_30]
		mov	ax, [bp+var_3A]
		mov	[bx+0Ch], ax
		mov	bx, [bp+var_30]
		mov	word ptr [bx+0Eh], 29h ; ')'
		lea	ax, [bp+var_324]
		push	ax
		push	[bp+var_30]
		call	TextLayer_SetText_ADB7
		add	sp, 4
		lea	ax, [bp+var_33E]
		push	ax
		lea	ax, [bp+var_2F0]
		push	ax
		call	GlyphObject_RenderToWidget_31A68
		add	sp, 4
		mov	[bp+var_36], ax
		mov	ax, 127h
		sub	ax, [bp+var_36]
		mov	[bp+var_3C], ax
		mov	bx, [bp+var_32]
		mov	ax, [bp+var_3C]
		mov	[bx+0Ch], ax
		mov	bx, [bp+var_32]
		mov	word ptr [bx+0Eh], 2Fh ; '/'
		lea	ax, [bp+var_33E]
		push	ax
		push	[bp+var_32]
		call	TextLayer_SetText_ADB7
		add	sp, 4
		lea	ax, [bp+var_2BE]
		push	ax
		call	sub_6162
		add	sp, 2
		mov	[bp+var_3D], al
		mov	al, [bp+var_1E6]
		mov	[bp+var_3E], al
		mov	eax, [bp+var_E]
		sub	eax, [bp+var_12]
		add	eax, 3E8h
		mov	[bp+var_42], eax
		mov	al, [bp+var_3D]
		mov	ah, 0
		sub	ax, 0Dh
		mov	bx, ax
		cmp	bx, 59h	; 'Y'   ; switch 90 cases
		jbe	short loc_52E65
		jmp	loc_532EC	; default
; ���������������������������������������������������������������������������

loc_52E65:				; CODE XREF: sub_52662+7FEj
		shl	bx, 1
		jmp	cs:off_535C0[bx] ; switch jump

loc_52E6C:				; DATA XREF: ovr188:off_535C0o
		mov	[bp+var_13], 1	; case 0x0
		jmp	loc_532EC	; default
; ���������������������������������������������������������������������������

loc_52E73:				; CODE XREF: sub_52662+805j
					; DATA XREF: ovr188:off_535C0o
		mov	[bp+var_13], 1	; case 0x10
		jmp	loc_532EC	; default
; ���������������������������������������������������������������������������

loc_52E7A:				; CODE XREF: sub_52662+805j
					; DATA XREF: ovr188:off_535C0o
		cmp	[bp+var_3E], 0	; case 0x3C
		jz	short loc_52E9A
		cmp	byte ptr [bp+var_C2], 0
		jz	short loc_52E98
		dec	byte ptr [bp+var_C2]
		mov	eax, [bp+var_C2+1]
		sub	[bp+var_12], eax
		dec	word ptr [si+261h]

loc_52E98:				; CODE XREF: sub_52662+823j
		jmp	short loc_52EB6
; ���������������������������������������������������������������������������

loc_52E9A:				; CODE XREF: sub_52662+81Cj
		mov	eax, [bp+var_42]
		cmp	eax, [bp+var_C2+1]
		jl	short loc_52EB6
		inc	byte ptr [bp+var_C2]
		mov	eax, [bp+var_C2+1]
		add	[bp+var_12], eax
		inc	word ptr [si+261h]

loc_52EB6:				; CODE XREF: sub_52662:loc_52E98j
					; sub_52662+841j
		jmp	loc_532EC	; default
; ���������������������������������������������������������������������������

loc_52EB9:				; CODE XREF: sub_52662+805j
					; DATA XREF: ovr188:off_535C0o
		cmp	[bp+var_3E], 0	; case 0x3D
		jz	short loc_52ED9
		cmp	[bp+var_B9], 0
		jz	short loc_52ED7
		dec	[bp+var_B9]
		mov	eax, [bp+var_B8]
		sub	[bp+var_12], eax
		dec	word ptr [si+263h]

loc_52ED7:				; CODE XREF: sub_52662+862j
		jmp	short loc_52EF5
; ���������������������������������������������������������������������������

loc_52ED9:				; CODE XREF: sub_52662+85Bj
		mov	eax, [bp+var_42]
		cmp	eax, [bp+var_B8]
		jl	short loc_52EF5
		inc	[bp+var_B9]
		mov	eax, [bp+var_B8]
		add	[bp+var_12], eax
		inc	word ptr [si+263h]

loc_52EF5:				; CODE XREF: sub_52662:loc_52ED7j
					; sub_52662+880j
		jmp	loc_532EC	; default
; ���������������������������������������������������������������������������

loc_52EF8:				; CODE XREF: sub_52662+805j
					; DATA XREF: ovr188:off_535C0o
		cmp	[bp+var_3E], 0	; case 0x3E
		jz	short loc_52F18
		cmp	[bp+var_B0], 0
		jz	short loc_52F16
		dec	[bp+var_B0]
		mov	eax, [bp+var_AF]
		sub	[bp+var_12], eax
		dec	word ptr [si+271h]

loc_52F16:				; CODE XREF: sub_52662+8A1j
		jmp	short loc_52F34
; ���������������������������������������������������������������������������

loc_52F18:				; CODE XREF: sub_52662+89Aj
		mov	eax, [bp+var_42]
		cmp	eax, [bp+var_AF]
		jl	short loc_52F34
		inc	[bp+var_B0]
		mov	eax, [bp+var_AF]
		add	[bp+var_12], eax
		inc	word ptr [si+271h]

loc_52F34:				; CODE XREF: sub_52662:loc_52F16j
					; sub_52662+8BFj
		jmp	loc_532EC	; default
; ���������������������������������������������������������������������������

loc_52F37:				; CODE XREF: sub_52662+805j
					; DATA XREF: ovr188:off_535C0o
		cmp	[bp+var_3E], 0	; case 0x3F
		jz	short loc_52F57
		cmp	[bp+var_9E], 0
		jz	short loc_52F55
		dec	[bp+var_9E]
		mov	eax, [bp+var_9D]
		sub	[bp+var_12], eax
		dec	word ptr [si+26Fh]

loc_52F55:				; CODE XREF: sub_52662+8E0j
		jmp	short loc_52F73
; ���������������������������������������������������������������������������

loc_52F57:				; CODE XREF: sub_52662+8D9j
		mov	eax, [bp+var_42]
		cmp	eax, [bp+var_9D]
		jl	short loc_52F73
		inc	[bp+var_9E]
		mov	eax, [bp+var_9D]
		add	[bp+var_12], eax
		inc	word ptr [si+26Fh]

loc_52F73:				; CODE XREF: sub_52662:loc_52F55j
					; sub_52662+8FEj
		jmp	loc_532EC	; default
; ���������������������������������������������������������������������������

loc_52F76:				; CODE XREF: sub_52662+805j
					; DATA XREF: ovr188:off_535C0o
		cmp	[bp+var_3E], 0	; case 0x40
		jz	short loc_52F96
		cmp	[bp+var_A7], 0
		jz	short loc_52F94
		dec	[bp+var_A7]
		mov	eax, [bp+var_A6]
		sub	[bp+var_12], eax
		dec	word ptr [si+265h]

loc_52F94:				; CODE XREF: sub_52662+91Fj
		jmp	short loc_52FB2
; ���������������������������������������������������������������������������

loc_52F96:				; CODE XREF: sub_52662+918j
		mov	eax, [bp+var_42]
		cmp	eax, [bp+var_A6]
		jl	short loc_52FB2
		inc	[bp+var_A7]
		mov	eax, [bp+var_A6]
		add	[bp+var_12], eax
		inc	word ptr [si+265h]

loc_52FB2:				; CODE XREF: sub_52662:loc_52F94j
					; sub_52662+93Dj
		jmp	loc_532EC	; default
; ���������������������������������������������������������������������������

loc_52FB5:				; CODE XREF: sub_52662+805j
					; DATA XREF: ovr188:off_535C0o
		cmp	[bp+var_3E], 0	; case 0x41
		jz	short loc_52FD2
		cmp	[bp+var_7A], 0
		jz	short loc_52FD0
		dec	[bp+var_7A]
		mov	eax, [bp+var_79]
		sub	[bp+var_12], eax
		dec	word ptr [si+26Dh]

loc_52FD0:				; CODE XREF: sub_52662+95Dj
		jmp	short loc_52FEB
; ���������������������������������������������������������������������������

loc_52FD2:				; CODE XREF: sub_52662+957j
		mov	eax, [bp+var_42]
		cmp	eax, [bp+var_79]
		jl	short loc_52FEB
		inc	[bp+var_7A]
		mov	eax, [bp+var_79]
		add	[bp+var_12], eax
		inc	word ptr [si+26Dh]

loc_52FEB:				; CODE XREF: sub_52662:loc_52FD0j
					; sub_52662+978j
		jmp	loc_532EC	; default
; ���������������������������������������������������������������������������

loc_52FEE:				; CODE XREF: sub_52662+805j
					; DATA XREF: ovr188:off_535C0o
		cmp	[bp+var_3E], 0	; case 0x42
		jz	short loc_5300E
		cmp	[bp+var_95], 0
		jz	short loc_5300C
		dec	[bp+var_95]
		mov	eax, [bp+var_94]
		sub	[bp+var_12], eax
		dec	word ptr [si+269h]

loc_5300C:				; CODE XREF: sub_52662+997j
		jmp	short loc_5302A
; ���������������������������������������������������������������������������

loc_5300E:				; CODE XREF: sub_52662+990j
		mov	eax, [bp+var_42]
		cmp	eax, [bp+var_94]
		jl	short loc_5302A
		inc	[bp+var_95]
		mov	eax, [bp+var_94]
		add	[bp+var_12], eax
		inc	word ptr [si+269h]

loc_5302A:				; CODE XREF: sub_52662:loc_5300Cj
					; sub_52662+9B5j
		jmp	loc_532EC	; default
; ���������������������������������������������������������������������������

loc_5302D:				; CODE XREF: sub_52662+805j
					; DATA XREF: ovr188:off_535C0o
		cmp	[bp+var_3E], 0	; case 0x43
		jz	short loc_5304D
		cmp	[bp+var_8C], 0
		jz	short loc_5304B
		dec	[bp+var_8C]
		mov	eax, [bp+var_8B]
		sub	[bp+var_12], eax
		dec	word ptr [si+26Bh]

loc_5304B:				; CODE XREF: sub_52662+9D6j
		jmp	short loc_53069
; ���������������������������������������������������������������������������

loc_5304D:				; CODE XREF: sub_52662+9CFj
		mov	eax, [bp+var_42]
		cmp	eax, [bp+var_8B]
		jl	short loc_53069
		inc	[bp+var_8C]
		mov	eax, [bp+var_8B]
		add	[bp+var_12], eax
		inc	word ptr [si+26Bh]

loc_53069:				; CODE XREF: sub_52662:loc_5304Bj
					; sub_52662+9F4j
		jmp	loc_532EC	; default
; ���������������������������������������������������������������������������

loc_5306C:				; CODE XREF: sub_52662+805j
					; DATA XREF: ovr188:off_535C0o
		cmp	[bp+var_3E], 0	; case 0x44
		jz	short loc_5308C
		cmp	[bp+var_83], 0
		jz	short loc_5308A
		dec	[bp+var_83]
		mov	eax, [bp+var_82]
		sub	[bp+var_12], eax
		dec	word ptr [si+267h]

loc_5308A:				; CODE XREF: sub_52662+A15j
		jmp	short loc_530A8
; ���������������������������������������������������������������������������

loc_5308C:				; CODE XREF: sub_52662+A0Ej
		mov	eax, [bp+var_42]
		cmp	eax, [bp+var_82]
		jl	short loc_530A8
		inc	[bp+var_83]
		mov	eax, [bp+var_82]
		add	[bp+var_12], eax
		inc	word ptr [si+267h]

loc_530A8:				; CODE XREF: sub_52662:loc_5308Aj
					; sub_52662+A33j
		jmp	loc_532EC	; default
; ���������������������������������������������������������������������������

loc_530AB:				; CODE XREF: sub_52662+805j
					; DATA XREF: ovr188:off_535C0o
		cmp	[bp+var_3E], 0	; case 0x46
		jz	short loc_530CE
		cmp	[bp+var_68], 0
		jz	short loc_530CC
		dec	[bp+var_68]
		mov	eax, [bp+var_67]
		sub	[bp+var_12], eax
		sub	word ptr [si+26Dh], 2
		sub	word ptr [si+26Bh], 18h

loc_530CC:				; CODE XREF: sub_52662+A53j
		jmp	short loc_530ED
; ���������������������������������������������������������������������������

loc_530CE:				; CODE XREF: sub_52662+A4Dj
		mov	eax, [bp+var_42]
		cmp	eax, [bp+var_67]
		jl	short loc_530ED
		inc	[bp+var_68]
		mov	eax, [bp+var_67]
		add	[bp+var_12], eax
		add	word ptr [si+26Dh], 2
		add	word ptr [si+26Bh], 18h

loc_530ED:				; CODE XREF: sub_52662:loc_530CCj
					; sub_52662+A74j
		jmp	loc_532EC	; default
; ���������������������������������������������������������������������������

loc_530F0:				; CODE XREF: sub_52662+805j
					; DATA XREF: ovr188:off_535C0o
		cmp	[bp+var_3E], 0	; case 0x47
		jz	short loc_53113
		cmp	[bp+var_5F], 0
		jz	short loc_53111
		dec	[bp+var_5F]
		mov	eax, [bp+var_5E]
		sub	[bp+var_12], eax
		sub	word ptr [si+261h], 6
		sub	word ptr [si+263h], 6

loc_53111:				; CODE XREF: sub_52662+A98j
		jmp	short loc_53132
; ���������������������������������������������������������������������������

loc_53113:				; CODE XREF: sub_52662+A92j
		mov	eax, [bp+var_42]
		cmp	eax, [bp+var_5E]
		jl	short loc_53132
		inc	[bp+var_5F]
		mov	eax, [bp+var_5E]
		add	[bp+var_12], eax
		add	word ptr [si+261h], 6
		add	word ptr [si+263h], 6

loc_53132:				; CODE XREF: sub_52662:loc_53111j
					; sub_52662+AB9j
		jmp	loc_532EC	; default
; ���������������������������������������������������������������������������

loc_53135:				; CODE XREF: sub_52662+805j
					; DATA XREF: ovr188:off_535C0o
		cmp	[bp+var_3E], 0	; case 0x48
		jz	short loc_53153
		cmp	[bp+var_56], 0
		jz	short loc_53151
		dec	[bp+var_56]
		mov	eax, [bp+var_55]
		sub	[bp+var_12], eax
		sub	word ptr [si+265h], 0Ah

loc_53151:				; CODE XREF: sub_52662+ADDj
		jmp	short loc_5316D
; ���������������������������������������������������������������������������

loc_53153:				; CODE XREF: sub_52662+AD7j
		mov	eax, [bp+var_42]
		cmp	eax, [bp+var_55]
		jl	short loc_5316D
		inc	[bp+var_56]
		mov	eax, [bp+var_55]
		add	[bp+var_12], eax
		add	word ptr [si+265h], 0Ah

loc_5316D:				; CODE XREF: sub_52662:loc_53151j
					; sub_52662+AF9j
		jmp	loc_532EC	; default
; ���������������������������������������������������������������������������

loc_53170:				; CODE XREF: sub_52662+805j
					; DATA XREF: ovr188:off_535C0o
		cmp	[bp+var_3E], 0	; case 0x49
		jz	short loc_5318E
		cmp	[bp+var_4D], 0
		jz	short loc_5318C
		dec	[bp+var_4D]
		mov	eax, [bp+var_4C]
		sub	[bp+var_12], eax
		sub	word ptr [si+261h], 0Ch

loc_5318C:				; CODE XREF: sub_52662+B18j
		jmp	short loc_531A8
; ���������������������������������������������������������������������������

loc_5318E:				; CODE XREF: sub_52662+B12j
		mov	eax, [bp+var_42]
		cmp	eax, [bp+var_4C]
		jl	short loc_531A8
		inc	[bp+var_4D]
		mov	eax, [bp+var_4C]
		add	[bp+var_12], eax
		add	word ptr [si+261h], 0Ch

loc_531A8:				; CODE XREF: sub_52662:loc_5318Cj
					; sub_52662+B34j
		jmp	loc_532EC	; default
; ���������������������������������������������������������������������������

loc_531AB:				; CODE XREF: sub_52662+805j
					; DATA XREF: ovr188:off_535C0o
		lea	ax, [bp+var_A]	; case 0x4A
		push	ax
		mov	al, [bp+var_17]
		push	ax
		push	0
		push	[bp+var_1C]
		push	si
		push	cs
		call	near ptr sub_523F3
		add	sp, 0Ah
		mov	al, [bp+var_17]
		add	al, 0FEh ; '�'
		mov	[bp+var_17], al
		jmp	loc_532EC	; default
; ���������������������������������������������������������������������������

loc_531CB:				; CODE XREF: sub_52662+805j
					; DATA XREF: ovr188:off_535C0o
		lea	ax, [bp+var_A]	; case 0x4B
		push	ax
		mov	al, [bp+var_17]
		push	ax
		push	1
		push	[bp+var_1C]
		push	si
		push	cs
		call	near ptr sub_523F3
		add	sp, 0Ah
		mov	al, [bp+var_17]
		add	al, 2
		mov	[bp+var_17], al
		jmp	loc_532EC	; default
; ���������������������������������������������������������������������������

loc_531EB:				; CODE XREF: sub_52662+805j
					; DATA XREF: ovr188:off_535C0o
		dec	byte ptr [bp+var_C2] ; case 0x4C
		mov	eax, [bp+var_C2+1]
		sub	[bp+var_12], eax
		dec	word ptr [si+261h]
		jmp	loc_532EC	; default
; ���������������������������������������������������������������������������

loc_531FF:				; CODE XREF: sub_52662+805j
					; DATA XREF: ovr188:off_535C0o
		dec	[bp+var_B9]	; case 0x4D
		mov	eax, [bp+var_B8]
		sub	[bp+var_12], eax
		dec	word ptr [si+263h]
		jmp	loc_532EC	; default
; ���������������������������������������������������������������������������

loc_53213:				; CODE XREF: sub_52662+805j
					; DATA XREF: ovr188:off_535C0o
		dec	[bp+var_B0]	; case 0x4E
		mov	eax, [bp+var_AF]
		sub	[bp+var_12], eax
		dec	word ptr [si+271h]
		jmp	loc_532EC	; default
; ���������������������������������������������������������������������������

loc_53227:				; CODE XREF: sub_52662+805j
					; DATA XREF: ovr188:off_535C0o
		dec	[bp+var_A7]	; case 0x4F
		mov	eax, [bp+var_A6]
		sub	[bp+var_12], eax
		dec	word ptr [si+265h]
		jmp	loc_532EC	; default
; ���������������������������������������������������������������������������

loc_5323B:				; CODE XREF: sub_52662+805j
					; DATA XREF: ovr188:off_535C0o
		dec	[bp+var_9E]	; case 0x50
		mov	eax, [bp+var_9D]
		sub	[bp+var_12], eax
		dec	word ptr [si+26Fh]
		jmp	loc_532EC	; default
; ���������������������������������������������������������������������������

loc_5324F:				; CODE XREF: sub_52662+805j
					; DATA XREF: ovr188:off_535C0o
		dec	[bp+var_95]	; case 0x51
		mov	eax, [bp+var_94]
		sub	[bp+var_12], eax
		dec	word ptr [si+269h]
		jmp	loc_532EC	; default
; ���������������������������������������������������������������������������

loc_53263:				; CODE XREF: sub_52662+805j
					; DATA XREF: ovr188:off_535C0o
		dec	[bp+var_8C]	; case 0x52
		mov	eax, [bp+var_8B]
		sub	[bp+var_12], eax
		dec	word ptr [si+26Bh]
		jmp	short loc_532EC	; default
; ���������������������������������������������������������������������������

loc_53276:				; CODE XREF: sub_52662+805j
					; DATA XREF: ovr188:off_535C0o
		dec	[bp+var_83]	; case 0x53
		mov	eax, [bp+var_82]
		sub	[bp+var_12], eax
		dec	word ptr [si+267h]
		jmp	short loc_532EC	; default
; ���������������������������������������������������������������������������

loc_53289:				; CODE XREF: sub_52662+805j
					; DATA XREF: ovr188:off_535C0o
		dec	[bp+var_7A]	; case 0x54
		mov	eax, [bp+var_79]
		sub	[bp+var_12], eax
		dec	word ptr [si+26Dh]
		jmp	short loc_532EC	; default
; ���������������������������������������������������������������������������

loc_5329A:				; CODE XREF: sub_52662+805j
					; DATA XREF: ovr188:off_535C0o
		dec	[bp+var_68]	; case 0x56
		mov	eax, [bp+var_67]
		sub	[bp+var_12], eax
		sub	word ptr [si+26Dh], 2
		sub	word ptr [si+26Bh], 18h
		jmp	short loc_532EC	; default
; ���������������������������������������������������������������������������

loc_532B1:				; CODE XREF: sub_52662+805j
					; DATA XREF: ovr188:off_535C0o
		dec	[bp+var_5F]	; case 0x57
		mov	eax, [bp+var_5E]
		sub	[bp+var_12], eax
		sub	word ptr [si+261h], 6
		sub	word ptr [si+263h], 6
		jmp	short loc_532EC	; default
; ���������������������������������������������������������������������������

loc_532C8:				; CODE XREF: sub_52662+805j
					; DATA XREF: ovr188:off_535C0o
		dec	[bp+var_56]	; case 0x58
		mov	eax, [bp+var_55]
		sub	[bp+var_12], eax
		sub	word ptr [si+265h], 0Ah
		jmp	short loc_532EC	; default
; ���������������������������������������������������������������������������

loc_532DA:				; CODE XREF: sub_52662+805j
					; DATA XREF: ovr188:off_535C0o
		dec	[bp+var_4D]	; case 0x59
		mov	eax, [bp+var_4C]
		sub	[bp+var_12], eax
		sub	word ptr [si+261h], 0Ch
		jmp	short $+2

loc_532EC:				; CODE XREF: sub_52662+800j
					; sub_52662+805j ...
		xor	di, di		; default
		jmp	loc_5342A
; ���������������������������������������������������������������������������

loc_532F1:				; CODE XREF: sub_52662+DCDj
		mov	[bp+var_44], 0
		jmp	short loc_53306
; ���������������������������������������������������������������������������

loc_532F8:				; CODE XREF: sub_52662+CB7j
		mov	bx, [bp+var_44]
		mov	al, [bx+6]
		cmp	al, [di+30Eh]
		jnz	short loc_53306
		jmp	short loc_5331B
; ���������������������������������������������������������������������������

loc_53306:				; CODE XREF: sub_52662+C94j
					; sub_52662+CA0j
		lea	ax, [bp+var_44]
		push	ax
		lea	ax, [bp+var_1DD]
		push	ax
		call	sub_2FF1E
		add	sp, 4
		or	ax, ax
		jnz	short loc_532F8

loc_5331B:				; CODE XREF: sub_52662+CA2j
		mov	ax, di
		mov	dx, 9
		imul	dx
		lea	dx, [bp+var_BD]
		add	ax, dx
		mov	bx, ax
		cmp	word ptr [bx], 0
		jz	short loc_533A2
		mov	ax, di
		mov	dx, 9
		imul	dx
		lea	dx, [bp+var_BD]
		add	ax, dx
		mov	bx, ax
		push	word ptr [bx]
		mov	bx, [bp+var_44]
		push	word ptr [bx+4]
		call	LayerGroup_Remove_2DBC1
		add	sp, 4
		mov	ax, di
		mov	dx, 9
		imul	dx
		lea	dx, [bp+var_BD]
		add	ax, dx
		mov	bx, ax
		cmp	word ptr [bx], 0
		jz	short loc_5338F
		push	3
		mov	ax, di
		mov	dx, 9
		imul	dx
		lea	dx, [bp+var_BD]
		add	ax, dx
		mov	bx, ax
		push	word ptr [bx]
		mov	ax, di
		mov	dx, 9
		imul	dx
		lea	dx, [bp+var_BD]
		add	ax, dx
		mov	bx, ax
		mov	bx, [bx]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short $+2

loc_5338F:				; CODE XREF: sub_52662+CFEj
		mov	ax, di
		mov	dx, 9
		imul	dx
		lea	dx, [bp+var_BD]
		add	ax, dx
		mov	bx, ax
		mov	word ptr [bx], 0

loc_533A2:				; CODE XREF: sub_52662+CCBj
		mov	ax, di
		mov	dx, 9
		imul	dx
		lea	dx, [bp+var_BB]
		add	ax, dx
		mov	bx, ax
		cmp	word ptr [bx], 0
		jz	short loc_53429
		mov	ax, di
		mov	dx, 9
		imul	dx
		lea	dx, [bp+var_BB]
		add	ax, dx
		mov	bx, ax
		push	word ptr [bx]
		mov	bx, [bp+var_44]
		push	word ptr [bx+4]
		call	LayerGroup_Remove_2DBC1
		add	sp, 4
		mov	ax, di
		mov	dx, 9
		imul	dx
		lea	dx, [bp+var_BB]
		add	ax, dx
		mov	bx, ax
		cmp	word ptr [bx], 0
		jz	short loc_53416
		push	3
		mov	ax, di
		mov	dx, 9
		imul	dx
		lea	dx, [bp+var_BB]
		add	ax, dx
		mov	bx, ax
		push	word ptr [bx]
		mov	ax, di
		mov	dx, 9
		imul	dx
		lea	dx, [bp+var_BB]
		add	ax, dx
		mov	bx, ax
		mov	bx, [bx]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short $+2

loc_53416:				; CODE XREF: sub_52662+D85j
		mov	ax, di
		mov	dx, 9
		imul	dx
		lea	dx, [bp+var_BB]
		add	ax, dx
		mov	bx, ax
		mov	word ptr [bx], 0

loc_53429:				; CODE XREF: sub_52662+D52j
		inc	di

loc_5342A:				; CODE XREF: sub_52662+C8Cj
		cmp	di, 0Eh
		jge	short loc_53432
		jmp	loc_532F1
; ���������������������������������������������������������������������������

loc_53432:				; CODE XREF: sub_52662+DCBj
		lea	ax, [bp+var_2BE]
		push	ax
		call	sub_56B6
		add	sp, 2

loc_5343F:				; CODE XREF: sub_52662+386j
		mov	al, [bp+var_13]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_5344B
		jmp	loc_529EB
; ���������������������������������������������������������������������������

loc_5344B:				; CODE XREF: sub_52662+DE4j
		mov	eax, [bp+var_12]
		add	[si+283h], eax
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		lea	ax, [bp+var_2EE]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_2D6]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_313D6
		add	sp, 4
		cmp	[bp+var_21], 0
		jz	short loc_534A2
		cmp	[bp+var_26], 0
		jz	short loc_534A2
		push	0
		mov	al, [bp+var_22]
		push	ax
		lea	ax, [bp+var_26]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_534A2:				; CODE XREF: sub_52662+E20j
					; sub_52662+E27j
		mov	[bp+var_26], 0
		mov	[bp+var_21], 0
		mov	[bp+var_20], 0
		push	0
		lea	ax, [bp+var_1AE]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_1B4]
		push	ax
		call	sub_40F3
		add	sp, 4
		mov	[bp+var_216], 522h
		mov	[bp+var_20C], 542h
		call	TextScrollDisplayB_ApplyHelperD_3F784
		mov	byte_497C0, 0
		cmp	[bp+var_1E9], 0
		jz	short loc_5350F
		mov	ax, [bp+var_1E9]
		add	ax, 2
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	[bp+var_1E9]
		call	sub_308
		add	sp, 2
		jmp	short $+2

loc_5350F:				; CODE XREF: sub_52662+E8Dj
		push	2
		lea	ax, [bp+var_1DD]
		push	ax
		call	sub_49BC
		add	sp, 4
		lea	ax, [bp+var_1F7]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	0
		lea	ax, [bp+var_216]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		mov	[bp+var_2BE], 56Eh
		lea	ax, [bp+var_2BE]
		push	ax
		call	ResourceRecord_Helper_3BE15
		add	sp, 2
		push	0
		lea	ax, [bp+var_2BE]
		push	ax
		call	StreamReader_ReleaseBuffer_3CEB3
		add	sp, 4
		push	2
		lea	ax, [bp+var_1A8]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	seg stub188
		push	offset Stub_ResourceHandle_Destruct_42090
		push	1
		push	3
		push	0Ah
		lea	ax, [bp+var_E0]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		cmp	[bp+var_5], 0
		jz	short loc_535A8
		cmp	[bp+var_A], 0
		jz	short loc_535A8
		push	0
		mov	al, [bp+var_6]
		push	ax
		lea	ax, [bp+var_A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_535A8:				; CODE XREF: sub_52662+F26j
					; sub_52662+F2Dj
		mov	[bp+var_A], 0
		mov	[bp+var_5], 0
		mov	[bp+var_4], 0
		pop	di
		pop	si
		leave
		retf
sub_52662	endp

; ���������������������������������������������������������������������������
off_535C0	dw offset loc_52E6C, offset loc_532EC, offset loc_532EC
					; DATA XREF: sub_52662+805r
		dw offset loc_532EC, offset loc_532EC, offset loc_532EC	; jump table for switch	statement
		dw offset loc_532EC, offset loc_532EC, offset loc_532EC
		dw offset loc_532EC, offset loc_532EC, offset loc_532EC
		dw offset loc_532EC, offset loc_532EC, offset loc_532EC
		dw offset loc_532EC, offset loc_52E73, offset loc_532EC
		dw offset loc_532EC, offset loc_532EC, offset loc_532EC
		dw offset loc_532EC, offset loc_532EC, offset loc_532EC
		dw offset loc_532EC, offset loc_532EC, offset loc_532EC
		dw offset loc_532EC, offset loc_532EC, offset loc_532EC
		dw offset loc_532EC, offset loc_532EC, offset loc_532EC
		dw offset loc_532EC, offset loc_532EC, offset loc_532EC
		dw offset loc_532EC, offset loc_532EC, offset loc_532EC
		dw offset loc_532EC, offset loc_532EC, offset loc_532EC
		dw offset loc_532EC, offset loc_532EC, offset loc_532EC
		dw offset loc_532EC, offset loc_532EC, offset loc_532EC
		dw offset loc_532EC, offset loc_532EC, offset loc_532EC
		dw offset loc_532EC, offset loc_532EC, offset loc_532EC
		dw offset loc_532EC, offset loc_532EC, offset loc_532EC
		dw offset loc_532EC, offset loc_532EC, offset loc_532EC
		dw offset loc_52E7A, offset loc_52EB9, offset loc_52EF8
		dw offset loc_52F37, offset loc_52F76, offset loc_52FB5
		dw offset loc_52FEE, offset loc_5302D, offset loc_5306C
		dw offset loc_532EC, offset loc_530AB, offset loc_530F0
		dw offset loc_53135, offset loc_53170, offset loc_531AB
		dw offset loc_531CB, offset loc_531EB, offset loc_531FF
		dw offset loc_53213, offset loc_53227, offset loc_5323B
		dw offset loc_5324F, offset loc_53263, offset loc_53276
		dw offset loc_53289, offset loc_532EC, offset loc_5329A
		dw offset loc_532B1, offset loc_532C8, offset loc_532DA
off_53674	dw offset loc_52C09	; DATA XREF: sub_52662+5A2r
		dw offset loc_52CE6	; jump table for switch	statement
		dw offset loc_52C48
		dw offset loc_52CE6
		dw offset loc_52C86
		dw offset loc_52CE6
		dw offset loc_52CA6
		dw offset loc_52CE6
		dw offset loc_52CC6

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_53686	proc far		; CODE XREF: sub_420B3J

var_726		= word ptr -726h
var_724		= word ptr -724h
var_710		= byte ptr -710h
var_70C		= word ptr -70Ch
var_6AF		= dword	ptr -6AFh
var_6AB		= dword	ptr -6ABh
var_6A7		= dword	ptr -6A7h
var_692		= word ptr -692h
var_690		= word ptr -690h
var_664		= word ptr -664h
var_660		= word ptr -660h
var_65A		= word ptr -65Ah
var_645		= word ptr -645h
var_637		= word ptr -637h
var_632		= byte ptr -632h
var_62B		= word ptr -62Bh
var_625		= byte ptr -625h
var_610		= byte ptr -610h
var_605		= byte ptr -605h
var_604		= word ptr -604h
var_602		= word ptr -602h
var_600		= word ptr -600h
var_5FE		= word ptr -5FEh
var_5FC		= word ptr -5FCh
var_5F7		= byte ptr -5F7h
var_5F6		= word ptr -5F6h
var_5F4		= word ptr -5F4h
var_5D6		= word ptr -5D6h
var_5C6		= word ptr -5C6h
var_54E		= word ptr -54Eh
var_53E		= word ptr -53Eh
var_53C		= word ptr -53Ch
var_53A		= word ptr -53Ah
var_536		= word ptr -536h
var_4E6		= word ptr -4E6h
var_4AA		= word ptr -4AAh
var_46E		= word ptr -46Eh
var_432		= word ptr -432h
var_3F6		= word ptr -3F6h
var_3BA		= word ptr -3BAh
var_37E		= byte ptr -37Eh
var_342		= byte ptr -342h
var_306		= word ptr -306h
var_2CA		= word ptr -2CAh
var_28E		= byte ptr -28Eh
var_252		= byte ptr -252h
var_216		= word ptr -216h
var_1DA		= word ptr -1DAh
var_19E		= word ptr -19Eh
var_162		= word ptr -162h
var_36		= word ptr -36h
var_34		= word ptr -34h
var_32		= word ptr -32h
var_2E		= byte ptr -2Eh
var_2D		= byte ptr -2Dh
var_2C		= word ptr -2Ch
var_29		= byte ptr -29h
var_28		= word ptr -28h
var_26		= dword	ptr -26h
var_22		= byte ptr -22h
var_21		= byte ptr -21h
var_20		= dword	ptr -20h
var_1C		= dword	ptr -1Ch
var_18		= dword	ptr -18h
var_14		= byte ptr -14h
var_13		= byte ptr -13h
var_12		= dword	ptr -12h
var_D		= byte ptr -0Dh
var_C		= byte ptr -0Ch
var_B		= byte ptr -0Bh
var_A		= word ptr -0Ah
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 726h
		push	si
		push	di
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		mov	si, 9CEh
		lea	di, [bp+var_A]
		push	ss
		pop	es
		mov	cx, 5
		rep movsw
		mov	[bp+var_B], 2
		mov	[bp+var_C], 0
		mov	[bp+var_D], 0
		push	ds
		push	offset a_shp	; ".shp"
		push	ds
		push	offset aLedgfont ; "ledgfont"
		push	ds
		push	offset a____DataFonts ;	"..\\..\\data\\fonts\\"
		lea	ax, [bp+var_536]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	2
		lea	ax, [bp+var_536]
		push	ax
		call	TextRenderer_LoadResourceFile_3DA1F
		add	sp, 4
		mov	word ptr [bp+var_1C+2],	dx
		mov	word ptr [bp+var_1C], ax
		mov	eax, [bp+var_1C]
		mov	[bp+var_18], eax
		mov	[bp+var_14], 2
		mov	[bp+var_13], 1
		mov	[bp+var_12], 0
		lea	ax, [bp+var_18]
		push	ax
		lea	ax, [bp+var_54E]
		push	ax
		call	GlyphObject_ConstructWithBuffer_311CF
		add	sp, 4
		mov	[bp+var_53E], 1
		mov	[bp+var_53C], 0
		push	2Dh ; '-'
		lea	ax, [bp+var_54E]
		push	ax
		mov	bx, [bp+var_54E]
		call	dword ptr [bx+18h]
		add	sp, 4
		mov	[bp+var_53A], ax
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aOptshps_0 ; "optshps"
		push	ds
		push	offset a____DataGamefl ; "..\\..\\data\\gameflow\\"
		lea	ax, [bp+var_536]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		mov	[bp+var_26], 0
		mov	[bp+var_22], 2
		mov	[bp+var_21], 0
		mov	[bp+var_20], 0
		push	1
		lea	ax, [bp+var_536]
		push	ax
		lea	ax, [bp+var_5C6]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_3D2BA
		add	sp, 6
		push	3
		lea	ax, [bp+var_26]
		push	ax
		push	29h ; ')'
		lea	ax, [bp+var_5C6]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		lea	ax, [bp+var_5C6]
		push	ax
		call	StreamReader_CloseHook_3B5DE
		add	sp, 2
		push	0
		push	0
		push	0
		lea	ax, [bp+var_26]
		push	ax
		push	0
		call	ImageLayer_Construct_2E02C
		add	sp, 0Ah
		mov	[bp+var_28], ax
		mov	[bp+var_29], 0
		mov	bx, [bp+arg_0]
		mov	ax, [bx+0E4h]
		mov	[bp+var_2C], ax
		lea	ax, [bp+var_70C]
		push	ax
		call	StreamReader_ConstructVariantA_3B2A9
		add	sp, 2
		mov	[bp+var_70C], 556h
		mov	[bp+var_6AB], 100h
		mov	[bp+var_6AF], 0
		mov	[bp+var_70C], 56Eh
		mov	[bp+var_690], 0
		xor	ax, ax
		mov	[bp+var_692], ax
		movsx	eax, ax
		mov	[bp+var_6A7], eax
		push	[bp+var_2C]
		push	word_46F46
		push	0FFh
		push	0Ah
		lea	ax, [bp+var_664]
		push	ax
		call	sub_4C1F
		add	sp, 0Ah
		mov	[bp+var_70C], 586h
		mov	[bp+var_664], 59Eh
		mov	[bp+var_65A], 5BEh
		mov	[bp+var_602], 2BDh
		xor	ax, ax
		mov	[bp+var_5FE], ax
		mov	[bp+var_600], ax
		mov	[bp+var_602], 552h
		push	100h
		push	0
		lea	ax, [bp+var_5FC]
		push	ax
		call	Palette_Alloc_2CC76
		add	sp, 6
		mov	[bp+var_610], 0
		mov	[bp+var_605], 0
		mov	[bp+var_625], 80h ; '�'
		mov	[bp+var_5F7], 0FFh
		mov	ax, [bp+var_2C]
		mov	[bp+var_604], ax
		lea	ax, [bp+var_70C]
		push	ax
		call	sub_5803
		add	sp, 2
		lea	ax, [bp+var_54E]
		push	ax
		lea	ax, [bp+var_645]
		push	ax
		lea	ax, [bp+var_726]
		push	ax
		call	Widget_ApplyStyleAndAllocate_3144B
		add	sp, 6
		mov	[bp+var_710], 4
		mov	bx, [bp+arg_0]
		mov	al, [bx+0FCh]
		mov	[bp+var_2D], al
		mov	al, [bp+var_2D]
		mov	[bp+var_632], al
		jmp	loc_53DF9
; ���������������������������������������������������������������������������

loc_538A5:				; CODE XREF: sub_53686+77Cj
		mov	bx, [bp+arg_0]
		cmp	byte ptr [bx+0FCh], 0Dh
		jnz	short loc_538C0
		push	0Dh
		lea	ax, [bp+var_70C]
		push	ax
		call	sub_563B
		add	sp, 4
		jmp	short loc_538CF
; ���������������������������������������������������������������������������

loc_538C0:				; CODE XREF: sub_53686+227j
		push	1Dh
		lea	ax, [bp+var_70C]
		push	ax
		call	sub_563B
		add	sp, 4

loc_538CF:				; CODE XREF: sub_53686+238j
		cmp	[bp+var_B], 2
		jz	short loc_538D8
		jmp	loc_53A17
; ���������������������������������������������������������������������������

loc_538D8:				; CODE XREF: sub_53686+24Dj
		push	7Eh ; '~'
		lea	ax, [bp+var_70C]
		push	ax
		call	sub_563B
		add	sp, 4
		mov	[bp+var_29], 18h
		push	0A0Dh
		lea	ax, [bp+var_4E6]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 4
		mov	bx, [bp+arg_0]
		mov	eax, [bx+27Bh]
		mov	bx, [bp+arg_0]
		add	eax, [bx+287h]
		push	eax
		push	0A1Bh
		lea	ax, [bp+var_4AA]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 8
		push	0A1Fh
		lea	ax, [bp+var_46E]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 4
		mov	bx, [bp+arg_0]
		push	large dword ptr	[bx+287h]
		push	0A30h
		lea	ax, [bp+var_432]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 8
		push	0A34h
		lea	ax, [bp+var_3F6]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 4
		mov	bx, [bp+arg_0]
		push	large dword ptr	[bx+283h]
		push	0A3Ch
		lea	ax, [bp+var_3BA]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 8
		mov	[bp+var_37E], 0
		mov	[bp+var_342], 0
		push	0A40h
		lea	ax, [bp+var_306]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 4
		mov	bx, [bp+arg_0]
		mov	eax, [bx+27Bh]
		mov	bx, [bp+arg_0]
		sub	eax, [bx+283h]
		push	eax
		push	0A4Dh
		lea	ax, [bp+var_2CA]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 8
		mov	[bp+var_28E], 0
		mov	[bp+var_252], 0
		push	0A51h
		lea	ax, [bp+var_216]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 4
		mov	bx, [bp+arg_0]
		push	large dword ptr	[bx+27Fh]
		push	0A5Fh
		lea	ax, [bp+var_1DA]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 8
		push	0A63h
		lea	ax, [bp+var_19E]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 4
		mov	bx, [bp+arg_0]
		mov	eax, [bx+27Bh]
		mov	bx, [bp+arg_0]
		sub	eax, [bx+27Fh]
		mov	bx, [bp+arg_0]
		sub	eax, [bx+283h]
		push	eax
		push	0A6Dh
		lea	ax, [bp+var_162]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 8
		jmp	short loc_53A94
; ���������������������������������������������������������������������������

loc_53A17:				; CODE XREF: sub_53686+24Fj
		push	7Fh ; ''
		lea	ax, [bp+var_70C]
		push	ax
		call	sub_563B
		add	sp, 4
		mov	[bp+var_29], 14h
		xor	si, si
		jmp	short loc_53A8F
; ���������������������������������������������������������������������������

loc_53A2E:				; CODE XREF: sub_53686+40Cj
		mov	bx, si
		shl	bx, 1
		push	word ptr [bx+2DCh]
		mov	ax, si
		shl	ax, 1
		mov	dx, 3Ch	; '<'
		imul	dx
		lea	dx, [bp+var_4E6]
		add	ax, dx
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 4
		mov	ax, si
		shl	ax, 1
		mov	dx, 3Ch	; '<'
		imul	dx
		lea	dx, [bp+var_4E6]
		add	ax, dx
		push	ax
		call	CRT_Strupr
		add	sp, 2
		mov	ax, si
		shl	ax, 1
		mov	bx, [bp+arg_0]
		add	bx, ax
		push	word ptr [bx+261h]
		push	0A71h
		mov	ax, si
		shl	ax, 1
		mov	dx, 3Ch	; '<'
		imul	dx
		lea	dx, [bp+var_4AA]
		add	ax, dx
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 6
		inc	si

loc_53A8F:				; CODE XREF: sub_53686+3A6j
		cmp	si, 9
		jl	short loc_53A2E

loc_53A94:				; CODE XREF: sub_53686+38Fj
		xor	si, si
		jmp	loc_53B53
; ���������������������������������������������������������������������������

loc_53A99:				; CODE XREF: sub_53686+4DBj
		mov	al, byte ptr [bp+si+var_A]
		mov	ah, 0
		push	ax
		push	44h ; 'D'
		lea	ax, [bp+var_726]
		push	ax
		push	0
		call	TextLayer_Construct_ACF1
		add	sp, 8
		mov	bx, si
		shl	bx, 1
		shl	bx, 1
		lea	dx, [bp+var_5F6]
		add	bx, dx
		mov	[bx], ax
		mov	ax, si
		shl	ax, 1
		mov	dx, 3Ch	; '<'
		imul	dx
		lea	dx, [bp+var_4E6]
		add	ax, dx
		push	ax
		mov	bx, si
		shl	bx, 1
		shl	bx, 1
		lea	ax, [bp+var_5F6]
		add	bx, ax
		push	word ptr [bx]
		call	TextLayer_SetText_ADB7
		add	sp, 4
		mov	ax, si
		shl	ax, 1
		mov	dx, 3Ch	; '<'
		imul	dx
		lea	dx, [bp+var_4AA]
		add	ax, dx
		push	ax
		lea	ax, [bp+var_726]
		push	ax
		call	GlyphObject_RenderToWidget_31A68
		add	sp, 4
		mov	di, ax
		mov	al, byte ptr [bp+si+var_A]
		mov	ah, 0
		push	ax
		mov	ax, 0DAh ; '�'
		sub	ax, di
		push	ax
		lea	ax, [bp+var_726]
		push	ax
		push	0
		call	TextLayer_Construct_ACF1
		add	sp, 8
		mov	bx, si
		shl	bx, 1
		shl	bx, 1
		lea	dx, [bp+var_5F4]
		add	bx, dx
		mov	[bx], ax
		mov	ax, si
		shl	ax, 1
		mov	dx, 3Ch	; '<'
		imul	dx
		lea	dx, [bp+var_4AA]
		add	ax, dx
		push	ax
		mov	bx, si
		shl	bx, 1
		shl	bx, 1
		lea	ax, [bp+var_5F4]
		add	bx, ax
		push	word ptr [bx]
		call	TextLayer_SetText_ADB7
		add	sp, 4
		inc	si

loc_53B53:				; CODE XREF: sub_53686+410j
		mov	al, [bp+var_29]
		mov	ah, 0
		cwd
		sub	ax, dx
		sar	ax, 1
		cmp	ax, si
		jle	short loc_53B64
		jmp	loc_53A99
; ���������������������������������������������������������������������������

loc_53B64:				; CODE XREF: sub_53686+4D9j
		cmp	[bp+var_B], 2
		jnz	short loc_53BC5
		xor	di, di
		jmp	short loc_53BC0
; ���������������������������������������������������������������������������

loc_53B6E:				; CODE XREF: sub_53686+53Dj
		mov	al, byte ptr [bp+di+var_A]
		mov	ah, 0
		push	ax
		push	0DEh ; '�'
		lea	ax, [bp+var_726]
		push	ax
		push	0
		call	TextLayer_Construct_ACF1
		add	sp, 8
		mov	bx, di
		shl	bx, 1
		lea	dx, [bp+var_5D6]
		add	bx, dx
		mov	[bx], ax
		mov	ax, di
		shl	ax, 1
		mov	dx, 3Ch	; '<'
		imul	dx
		lea	dx, [bp+var_4E6]
		add	ax, dx
		mov	bx, ax
		cmp	byte ptr [bx], 0
		jz	short loc_53BBF
		push	0A75h
		mov	bx, di
		shl	bx, 1
		lea	ax, [bp+var_5D6]
		add	bx, ax
		push	word ptr [bx]
		call	TextLayer_SetText_ADB7
		add	sp, 4

loc_53BBF:				; CODE XREF: sub_53686+520j
		inc	di

loc_53BC0:				; CODE XREF: sub_53686+4E6j
		cmp	di, 8
		jl	short loc_53B6E

loc_53BC5:				; CODE XREF: sub_53686+4E2j
		xor	si, si
		jmp	short loc_53BE3
; ���������������������������������������������������������������������������

loc_53BC9:				; CODE XREF: sub_53686+564j
		mov	bx, si
		shl	bx, 1
		lea	ax, [bp+var_5F6]
		add	bx, ax
		push	word ptr [bx]
		lea	ax, [bp+var_664]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		inc	si

loc_53BE3:				; CODE XREF: sub_53686+541j
		mov	al, [bp+var_29]
		mov	ah, 0
		cmp	ax, si
		jg	short loc_53BC9
		cmp	[bp+var_D], 0
		jnz	short loc_53BF5
		jmp	loc_53C9B
; ���������������������������������������������������������������������������

loc_53BF5:				; CODE XREF: sub_53686+56Aj
		cmp	[bp+var_B], 1
		jz	short loc_53BFE
		jmp	loc_53C9B
; ���������������������������������������������������������������������������

loc_53BFE:				; CODE XREF: sub_53686+573j
		lea	ax, [bp+var_645]
		push	ax
		lea	ax, [bp+var_32]
		push	ax
		call	SmallObject_RegisterInList_2CB40
		add	sp, 4
		push	[bp+var_28]
		lea	ax, [bp+var_664]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		xor	di, di
		jmp	short loc_53C74
; ���������������������������������������������������������������������������

loc_53C23:				; CODE XREF: sub_53686+5F1j
		mov	[bp+var_34], di
		mov	bx, [bp+var_28]
		mov	ax, [bp+var_34]
		mov	[bx+1Bh], ax
		mov	[bp+var_36], 0
		jmp	short loc_53C4E
; ���������������������������������������������������������������������������

loc_53C36:				; CODE XREF: sub_53686+5DBj
		push	0
		push	0
		mov	bx, [bp+var_36]
		push	word ptr [bx+6]
		mov	bx, [bp+var_36]
		mov	bx, [bx+6]
		mov	bx, [bx]
		call	dword ptr [bx+10h]
		add	sp, 6

loc_53C4E:				; CODE XREF: sub_53686+5AEj
		lea	ax, [bp+var_36]
		push	ax
		lea	ax, [bp+var_660]
		push	ax
		call	sub_2FC4A
		add	sp, 4
		or	ax, ax
		jnz	short loc_53C36
		push	word_46F44
		push	word_46F46
		call	UI_ApplyEncodingHelper_2EC65
		add	sp, 4
		inc	di

loc_53C74:				; CODE XREF: sub_53686+59Bj
		cmp	di, 5
		jl	short loc_53C23
		push	[bp+var_28]
		lea	ax, [bp+var_664]
		push	ax
		call	LayerGroup_Remove_2DBC1
		add	sp, 4
		mov	[bp+var_D], 0
		push	2
		lea	ax, [bp+var_32]
		push	ax
		call	SmallObject_UnregisterFromList_2CB7A
		add	sp, 4

loc_53C9B:				; CODE XREF: sub_53686+56Cj
					; sub_53686+575j
		lea	ax, [bp+var_70C]
		push	ax
		call	sub_6162
		add	sp, 2
		mov	[bp+var_2E], al
		mov	al, [bp+var_2E]
		mov	ah, 0
		cmp	ax, 7Eh	; '~'
		jz	short loc_53CCA
		jg	short loc_53CC3
		cmp	ax, 0Dh
		jz	short loc_53CDE
		cmp	ax, 1Dh
		jz	short loc_53CDE
		jmp	short loc_53CE4
; ���������������������������������������������������������������������������

loc_53CC3:				; CODE XREF: sub_53686+62Fj
		cmp	ax, 7Fh	; ''
		jz	short loc_53CD4
		jmp	short loc_53CE4
; ���������������������������������������������������������������������������

loc_53CCA:				; CODE XREF: sub_53686+62Dj
		mov	[bp+var_B], 1
		mov	[bp+var_D], 1
		jmp	short loc_53CE4
; ���������������������������������������������������������������������������

loc_53CD4:				; CODE XREF: sub_53686+640j
		mov	[bp+var_B], 2
		mov	[bp+var_D], 1
		jmp	short loc_53CE4
; ���������������������������������������������������������������������������

loc_53CDE:				; CODE XREF: sub_53686+634j
					; sub_53686+639j
		mov	[bp+var_C], 1
		jmp	short $+2

loc_53CE4:				; CODE XREF: sub_53686+63Bj
					; sub_53686+642j ...
		cmp	[bp+var_D], 0
		jnz	short loc_53CED
		jmp	loc_53D93
; ���������������������������������������������������������������������������

loc_53CED:				; CODE XREF: sub_53686+662j
		cmp	[bp+var_B], 2
		jz	short loc_53CF6
		jmp	loc_53D93
; ���������������������������������������������������������������������������

loc_53CF6:				; CODE XREF: sub_53686+66Bj
		lea	ax, [bp+var_645]
		push	ax
		lea	ax, [bp+var_32]
		push	ax
		call	SmallObject_RegisterInList_2CB40
		add	sp, 4
		push	[bp+var_28]
		lea	ax, [bp+var_664]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		mov	di, 4
		jmp	short loc_53D6D
; ���������������������������������������������������������������������������

loc_53D1C:				; CODE XREF: sub_53686+6E9j
		mov	[bp+var_34], di
		mov	bx, [bp+var_28]
		mov	ax, [bp+var_34]
		mov	[bx+1Bh], ax
		mov	[bp+var_36], 0
		jmp	short loc_53D47
; ���������������������������������������������������������������������������

loc_53D2F:				; CODE XREF: sub_53686+6D4j
		push	0
		push	0
		mov	bx, [bp+var_36]
		push	word ptr [bx+6]
		mov	bx, [bp+var_36]
		mov	bx, [bx+6]
		mov	bx, [bx]
		call	dword ptr [bx+10h]
		add	sp, 6

loc_53D47:				; CODE XREF: sub_53686+6A7j
		lea	ax, [bp+var_36]
		push	ax
		lea	ax, [bp+var_660]
		push	ax
		call	sub_2FC4A
		add	sp, 4
		or	ax, ax
		jnz	short loc_53D2F
		push	word_46F44
		push	word_46F46
		call	UI_ApplyEncodingHelper_2EC65
		add	sp, 4
		dec	di

loc_53D6D:				; CODE XREF: sub_53686+694j
		or	di, di
		jge	short loc_53D1C
		push	[bp+var_28]
		lea	ax, [bp+var_664]
		push	ax
		call	LayerGroup_Remove_2DBC1
		add	sp, 4
		mov	[bp+var_D], 0
		push	2
		lea	ax, [bp+var_32]
		push	ax
		call	SmallObject_UnregisterFromList_2CB7A
		add	sp, 4

loc_53D93:				; CODE XREF: sub_53686+664j
					; sub_53686+66Dj
		xor	si, si
		jmp	short loc_53DE3
; ���������������������������������������������������������������������������

loc_53D97:				; CODE XREF: sub_53686+764j
		mov	bx, si
		shl	bx, 1
		lea	ax, [bp+var_5F6]
		add	bx, ax
		push	word ptr [bx]
		lea	ax, [bp+var_664]
		push	ax
		call	LayerGroup_Remove_2DBC1
		add	sp, 4
		mov	bx, si
		shl	bx, 1
		lea	ax, [bp+var_5F6]
		add	bx, ax
		cmp	word ptr [bx], 0
		jz	short loc_53DE2
		push	3
		mov	bx, si
		shl	bx, 1
		lea	ax, [bp+var_5F6]
		add	bx, ax
		push	word ptr [bx]
		mov	bx, si
		shl	bx, 1
		lea	ax, [bp+var_5F6]
		add	bx, ax
		mov	bx, [bx]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short $+2

loc_53DE2:				; CODE XREF: sub_53686+737j
		inc	si

loc_53DE3:				; CODE XREF: sub_53686+70Fj
		mov	al, [bp+var_29]
		mov	ah, 0
		cmp	ax, si
		jg	short loc_53D97
		lea	ax, [bp+var_70C]
		push	ax
		call	sub_56B6
		add	sp, 2

loc_53DF9:				; CODE XREF: sub_53686+21Cj
		mov	al, [bp+var_C]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_53E05
		jmp	loc_538A5
; ���������������������������������������������������������������������������

loc_53E05:				; CODE XREF: sub_53686+77Aj
		cmp	[bp+var_28], 0
		jz	short loc_53E1C
		push	3
		push	[bp+var_28]
		mov	bx, [bp+var_28]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short $+2

loc_53E1C:				; CODE XREF: sub_53686+783j
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		lea	ax, [bp+var_724]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	0
		lea	ax, [bp+var_5FC]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_602]
		push	ax
		call	sub_40F3
		add	sp, 4
		mov	[bp+var_664], 522h
		mov	[bp+var_65A], 542h
		call	TextScrollDisplayB_ApplyHelperD_3F784
		mov	byte_497C0, 0
		cmp	[bp+var_637], 0
		jz	short loc_53E90
		mov	ax, [bp+var_637]
		add	ax, 2
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	[bp+var_637]
		call	sub_308
		add	sp, 2
		jmp	short $+2

loc_53E90:				; CODE XREF: sub_53686+7EAj
		push	2
		lea	ax, [bp+var_62B]
		push	ax
		call	sub_49BC
		add	sp, 4
		lea	ax, [bp+var_645]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	0
		lea	ax, [bp+var_664]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		mov	[bp+var_70C], 56Eh
		lea	ax, [bp+var_70C]
		push	ax
		call	ResourceRecord_Helper_3BE15
		add	sp, 2
		push	0
		lea	ax, [bp+var_70C]
		push	ax
		call	StreamReader_ReleaseBuffer_3CEB3
		add	sp, 4
		push	2
		lea	ax, [bp+var_5C6]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		cmp	[bp+var_21], 0
		jz	short loc_53F10
		cmp	[bp+var_26], 0
		jz	short loc_53F10
		push	0
		mov	al, [bp+var_22]
		push	ax
		lea	ax, [bp+var_26]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_53F10:				; CODE XREF: sub_53686+86Aj
					; sub_53686+871j
		mov	[bp+var_26], 0
		mov	[bp+var_21], 0
		mov	[bp+var_20], 0
		push	2
		lea	ax, [bp+var_54E]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_313D6
		add	sp, 4
		cmp	[bp+var_13], 0
		jz	short loc_53F57
		cmp	[bp+var_18], 0
		jz	short loc_53F57
		push	0
		mov	al, [bp+var_14]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_53F57:				; CODE XREF: sub_53686+8B1j
					; sub_53686+8B8j
		mov	[bp+var_18], 0
		mov	[bp+var_13], 0
		mov	[bp+var_12], 0
		pop	di
		pop	si
		leave
		retf
sub_53686	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_53F6F	proc far		; CODE XREF: sub_4209AJ

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_53F8A
		push	9
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_53F97

loc_53F8A:				; CODE XREF: sub_53F6F+9j
		mov	byte ptr [si], 0
		mov	word ptr [si+5], 0
		mov	word ptr [si+7], 0

loc_53F97:				; CODE XREF: sub_53F6F+19j
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_53F6F	endp

; ���������������������������������������������������������������������������
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE 2026-10-17. Construit un descripteur de bloc mémoire de ressource de 10 octets
; (alloué si pointeur nul) : +0 handle (dword) = 0, +4 type de mémoire = 2, +5 drapeau «
; possédé » = 0, +6 taille (dword) = 0.
; ==============================================================================================
ResourceHandle_Construct_53F9F	proc far		; CODE XREF: Stub_ResourceHandle_Construct_42095J

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_53FBA
		push	0Ah
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_53FD1

loc_53FBA:				; CODE XREF: ResourceHandle_Construct_53F9F+9j
		mov	dword ptr [si],	0
		mov	byte ptr [si+4], 2
		mov	byte ptr [si+5], 0
		mov	dword ptr [si+6], 0

loc_53FD1:				; CODE XREF: ResourceHandle_Construct_53F9F+19j
		mov	ax, si
		pop	si
		pop	bp
		retf
ResourceHandle_Construct_53F9F	endp

; ���������������������������������������������������������������������������
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE 2026-10-17. Si le descripteur possède un bloc (+5 non nul, +0 non nul) :
; Memory_TypedFree_2B8A4 ; remet +0, +5, +6 à zéro ; libère l'objet si bit 1 de l'argument.
; ==============================================================================================
ResourceHandle_Destruct_53FD9	proc far		; CODE XREF: Stub_ResourceHandle_Destruct_42090J

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_5402A
		cmp	byte ptr [si+5], 0
		jz	short loc_54008
		cmp	dword ptr [si],	0
		jz	short loc_54008
		push	0
		mov	al, [si+4]
		push	ax
		push	si
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_54008:				; CODE XREF: ResourceHandle_Destruct_53FD9+13j
					; ResourceHandle_Destruct_53FD9+19j
		mov	dword ptr [si],	0
		mov	byte ptr [si+5], 0
		mov	dword ptr [si+6], 0
		test	di, 1
		jz	short loc_5402A
		push	si
		call	sub_308
		add	sp, 2

loc_5402A:				; CODE XREF: ResourceHandle_Destruct_53FD9+Dj
					; ResourceHandle_Destruct_53FD9+46j
		pop	di
		pop	si
		pop	bp
		retf
ResourceHandle_Destruct_53FD9	endp

ovr188		ends
