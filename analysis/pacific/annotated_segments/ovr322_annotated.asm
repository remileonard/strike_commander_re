ovr322		segment	para public 'OVERLAY' use16
		assume cs:ovr322
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B1790		proc far

var_80		= dword ptr -80h
var_78		= dword ptr -78h
var_74		= dword ptr -74h
var_70		= dword ptr -70h
var_6C		= dword ptr -6Ch
var_68		= dword ptr -68h
var_64		= dword ptr -64h
var_60		= dword ptr -60h
var_5C		= dword ptr -5Ch
var_58		= dword ptr -58h
var_54		= dword ptr -54h
var_50		= dword ptr -50h
var_4C		= dword ptr -4Ch
var_30		= byte ptr -30h
var_2F		= byte ptr -2Fh
var_2E		= word ptr -2Eh
var_2A		= dword ptr -2Ah
var_26		= dword ptr -26h
var_24		= dword ptr -24h
var_22		= dword ptr -22h
var_20		= dword ptr -20h
var_1E		= dword ptr -1Eh
var_1C		= dword ptr -1Ch
var_17		= byte ptr -17h
var_16		= dword ptr -16h
var_12		= dword ptr -12h
var_E		= word ptr -0Eh
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 78h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_C], 600h
		mov	eax, [bp+var_C]
		mov	[bp+var_8], eax
		mov	di, word_7CADA
		push	word ptr [di+52h]
		mov	bx, [di+52h]
		mov	bx, [bx]
		call	dword ptr [bx+48h]
		pop	cx
		mov	[bp+var_E], ax
		push	di
		push	ss
		lea	ax, word ptr [bp+var_54]
		push	ax
		mov	bx, [di]
		call	dword ptr [bx+50h]
		add	sp, 6
		push	large [bp+var_4C]
		push	large [bp+var_50]
		push	large [bp+var_54]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_12], eax
		mov	[bp+var_16], eax
		mov	[bp+var_4], eax
		cmp	byte_78EB7, 0
		jnz	short loc_B17FA
		jmp	loc_B1B07

loc_B17FA:
		cmp	byte_7CB09, 0
		jz	short loc_B1813
		mov	[bp+var_17], 1
		mov	bx, [bp+var_E]
		mov	bx, [bx]
		mov	al, [bp+var_17]
		mov	[bx+20h], al
		jmp	loc_B18F7

loc_B1813:
		push	di
		mov	bx, [di]
		call	dword ptr [bx+3Ch]
		pop	cx
		mov	word ptr [bp+var_1C+2], ax
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_1E]
		push	ax
		call	Matrix_RollAngle_59A30
		add	sp, 6
		mov	eax, [bp+var_1E]
		or	eax, eax
		jge	short loc_B1837
		neg	eax

loc_B1837:
		mov	[bp+var_1E], eax
		push	word ptr [bp+var_1C+2]
		push	ss
		lea	ax, word ptr [bp+var_22]
		push	ax
		call	sub_59A03
		add	sp, 6
		push	di
		push	ss
		lea	ax, word ptr [bp+var_60]
		push	ax
		mov	bx, [di]
		call	dword ptr [bx+50h]
		add	sp, 6
		mov	eax, [bp+var_60]
		mov	[bp+var_2A], eax
		mov	eax, [bp+var_5C]
		mov	[bp+var_26], eax
		lea	ax, word ptr [bp+var_2A]
		push	ax
		push	ss
		lea	ax, [bp+var_2E]
		push	ax
		call	Math_VectorLength3D_Scaled_Variant_57CA1
		add	sp, 6
		mov	bx, [bp+var_E]
		mov	al, [bx+67h]
		mov	ah, 0
		movsx	eax, ax
		shl	eax, 8
		cmp	eax, [bp+var_1E]
		jle	short loc_B18E8
		mov	al, [bx+68h]
		mov	ah, 0
		movsx	eax, ax
		shl	eax, 8
		cmp	eax, [bp+var_22]
		jle	short loc_B18E8
		mov	al, [bx+69h]
		mov	ah, 0
		add	ax, 0Ah
		movsx	eax, ax
		shl	eax, 8
		neg	eax
		cmp	eax, [bp+var_22]
		jge	short loc_B18E8
		mov	al, [bx+92h]
		shr	ax, 2
		and	ax, 1
		or	al, al
		jz	short loc_B18E8
		mov	al, [bx+92h]
		shr	ax, 5
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jnz	short loc_B18E8
		mov	[bp+var_2F], 1
		mov	bx, [bx]
		mov	al, [bp+var_2F]
		mov	[bx+20h], al
		jmp	short loc_B18F7

loc_B18E8:
		mov	[bp+var_30], 0
		mov	bx, [bp+var_E]
		mov	bx, [bx]
		mov	al, [bp+var_30]
		mov	[bx+20h], al

loc_B18F7:
		mov	bx, [bp+var_E]
		mov	bx, [bx]
		mov	al, [bx+20h]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_B1916
		or	byte ptr [di+77h], 1
		push	si
		push	di
		call	sub_7418F
		add	sp, 4
		jmp	loc_B1B07

loc_B1916:
		mov	al, byte_78EB8
		mov	ah, 0
		or	ax, ax
		jz	short loc_B1922
		jmp	loc_B19C2

loc_B1922:
		mov	eax, dword_7CDEE
		mov	[bp+var_60], eax
		mov	eax, dword_7CDF2
		mov	[bp+var_5C], eax
		mov	eax, dword_7CDF6
		mov	[bp+var_58], eax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		lea	ax, word ptr [bp+var_60]
		push	ax
		call	sub_5A629
		add	sp, 4
		add	si, 12h
		mov	eax, [si]
		add	[bp+var_60], eax
		mov	eax, [si+4]
		add	[bp+var_5C], eax
		mov	eax, [si+8]
		add	[bp+var_58], eax
		mov	si, di
		add	si, 12h
		mov	eax, [si]
		sub	[bp+var_60], eax
		mov	eax, [si+4]
		sub	[bp+var_5C], eax
		mov	eax, [si+8]
		sub	[bp+var_58], eax
		push	large [bp+var_58]
		push	large [bp+var_5C]
		push	large [bp+var_60]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_20], eax
		mov	[bp+var_1C], eax
		mov	[bp+var_24], 1400h
		cmp	eax, [bp+var_24]
		jge	short loc_B19B7
		mov	ax, 1
		jmp	short loc_B19B9

loc_B19B7:
		xor	ax, ax

loc_B19B9:
		or	al, al
		jz	short loc_B19C2
		or	byte_78EB9, 2

loc_B19C2:
		mov	al, byte_78EB8
		mov	ah, 0
		or	ax, ax
		jz	short loc_B19CE
		jmp	loc_B1B02

loc_B19CE:
		cmp	byte_78EB9, 3
		jz	short loc_B19D8
		jmp	loc_B1B02

loc_B19D8:
		mov	[bp+var_1C], 0
		mov	eax, [bp+var_1C]
		mov	[bp+var_4], eax
		cmp	eax, [bp+var_8]
		jg	short loc_B19F3
		mov	ax, 1
		jmp	short loc_B19F5

loc_B19F3:
		xor	ax, ax

loc_B19F5:
		or	al, al
		jz	short loc_B1A10
		mov	byte_78EB8, 1
		mov	byte_78EB6, 1
		mov	eax, [bp+var_8]
		mov	[bp+var_4], eax
		mov	byte_78EB9, 0

loc_B1A10:
		mov	eax, [bp+var_4]
		mov	[bp+var_20], eax
		push	di
		mov	bx, [di]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		mov	si, ax
		mov	eax, [si]
		mov	[bp+var_60], eax
		mov	eax, [si+4]
		mov	[bp+var_5C], eax
		mov	eax, [si+8]
		mov	[bp+var_58], eax
		mov	eax, [bp+var_20]
		mov	edx, dword_79774
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_20], eax
		mov	eax, [bp+var_60]
		mov	edx, [bp+var_20]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_60], eax
		mov	eax, [bp+var_5C]
		mov	edx, [bp+var_20]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_5C], eax
		mov	eax, [bp+var_58]
		mov	edx, [bp+var_20]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_58], eax
		lea	ax, word ptr [bp+var_60]
		push	ax
		push	di
		mov	bx, [di]
		call	dword ptr [bx+4Ch]
		add	sp, 4
		mov	si, di
		add	si, 12h
		mov	eax, [si]
		mov	[bp+var_6C], eax
		mov	eax, [si+4]
		mov	[bp+var_68], eax
		mov	eax, [si+8]
		mov	[bp+var_64], eax
		push	di
		mov	bx, [di]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		mov	si, ax
		mov	eax, [si]
		mov	[bp+var_78], eax
		mov	eax, [si+4]
		mov	[bp+var_74], eax
		mov	eax, [si+8]
		mov	[bp+var_70], eax
		lea	ax, word ptr [bp+var_78]
		push	ax
		call	Vector_NormalizeInPlace_57715
		pop	cx
		sub	sp, 4
		mov	eax, [bp+var_4]
		mov	[bp+var_80], eax
		lea	ax, word ptr [bp+var_78]
		push	ax
		lea	ax, word ptr [bp+var_6C]
		push	ax
		push	[bp+var_E]
		call	sub_4936E
		add	sp, 0Ah
		jmp	short loc_B1B07

loc_B1B02:
		mov	byte_78EB7, 0

loc_B1B07:
		pop	di
		pop	si
		leave
		retf
sub_B1790		endp
ovr322		ends
