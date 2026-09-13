seg055		segment	byte public 'CODE' use16
		assume cs:seg055
		;org 2
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,104L — recherche la médiane de 3 valeurs (offsets +0xE/+0x24/+0x3A, pas de 0x16=22
; octets, 3 sommets de triangle), calcule un point de subdivision pondéré (~9/16) et se
; rappelle récursivement : subdivision adaptative de courbe/mesh (tessellation récursive),
; même famille que le rasterizer seg037.
; ==============================================================================================
Mesh_SubdivideRecursive	proc far		; CODE XREF: seg068:loc_2F99EP
					; seg075:02A2P

var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= dword	ptr  0Ah
arg_8		= word ptr  0Eh
arg_A		= dword	ptr  10h

		push	bp
		mov	bp, sp
		sub	sp, 14h
		push	si
		push	di
		mov	cx, [bp+arg_0]

loc_291ED:				; DATA XREF: seg216:off_6A056o
		mov	si, [bp+arg_2]
		mov	di, [bp+arg_8]
		mov	eax, [si+0Eh]
		mov	[bp+var_4], eax
		mov	eax, [si+24h]
		mov	[bp+var_8], eax
		mov	eax, [si+3Ah]
		mov	[bp+var_C], eax
		cmp	eax, [bp+var_8]
		jle	short loc_29229
		mov	eax, [bp+var_8]
		mov	[bp+var_10], eax
		mov	eax, [bp+var_C]
		mov	[bp+var_8], eax

loc_29221:
		mov	eax, [bp+var_10]
		mov	[bp+var_C], eax

loc_29229:				; CODE XREF: Mesh_SubdivideRecursive+2Dj
		mov	eax, [bp+var_8]
		cmp	eax, [bp+var_4]
		jle	short loc_2924B
		mov	eax, [bp+var_4]
		mov	[bp+var_10], eax
		mov	eax, [bp+var_8]
		mov	[bp+var_4], eax
		mov	eax, [bp+var_10]
		mov	[bp+var_8], eax

loc_2924B:				; CODE XREF: Mesh_SubdivideRecursive+4Fj
		mov	eax, [bp+var_C]
		cmp	eax, [bp+var_8]
		jle	short loc_29261
		mov	eax, [bp+var_8]
		mov	[bp+var_10], eax
		mov	[bp+var_C], eax

loc_29261:				; CODE XREF: Mesh_SubdivideRecursive+71j
		mov	eax, [bp+var_4]
		add	eax, [bp+var_C]
		mov	[bp+var_14], eax
		sar	eax, 1
		mov	edx, [bp+var_14]
		sar	edx, 4
		add	eax, edx
		cmp	eax, [bp+var_4]
		jge	short loc_292A4
		push	large [bp+arg_A]
		push	0
		push	di
		push	large [bp+arg_4]
		mov	ax, si
		add	ax, 2Ch	; ','
		push	ax
		mov	ax, si
		add	ax, 16h
		push	ax
		push	si
		push	cx
		call	Render_TriangleRasterizer
		add	sp, 14h
		jmp	short loc_292BA
; ���������������������������������������������������������������������������

loc_292A4:				; CODE XREF: Mesh_SubdivideRecursive+9Dj
		push	large [bp+arg_A]
		push	di
		push	large [bp+arg_4]
		push	ds
		push	si
		push	3
		push	cx
		call	Render_MeshPrimitive_216F6
		add	sp, 12h

loc_292BA:				; CODE XREF: Mesh_SubdivideRecursive+C0j
		pop	di
		pop	si
		leave
		retf
Mesh_SubdivideRecursive	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,47L — appelle 3 fois sub_61960 (tracé de segment) entre les 3 paires de sommets : tracé
; du contour (wireframe) d'un triangle.
; ==============================================================================================
Mesh_DrawTriangleWireframe	proc far		; CODE XREF: seg055:0706p seg055:081Ep ...

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_2]
		mov	di, [bp+arg_4]
		mov	al, [si+4]
		push	ax
		push	word ptr [di+2]
		push	word ptr [di]
		push	word ptr [si+2]
		push	word ptr [si]
		push	[bp+arg_0]
		call	Render_FillClippedRect_61960
		add	sp, 0Ch
		mov	al, [di+4]
		push	ax
		mov	bx, [bp+arg_6]
		push	word ptr [bx+2]
		push	word ptr [bx]
		push	word ptr [di+2]
		push	word ptr [di]
		push	[bp+arg_0]
		call	Render_FillClippedRect_61960
		add	sp, 0Ch
		mov	bx, [bp+arg_6]
		mov	al, [bx+4]
		push	ax
		push	word ptr [bx+2]
		push	word ptr [bx]
		push	word ptr [si+2]
		push	word ptr [si]
		push	[bp+arg_0]
		call	Render_FillClippedRect_61960
		add	sp, 0Ch
		pop	di
		pop	si
		pop	bp
		retf
Mesh_DrawTriangleWireframe	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,100L — calcule deux vecteurs d'arête (V2-V1, V3-V1) à partir de 3 pointeurs de sommets
; (+0x19/+0x1D/+0x21, structures 3D 12 octets) : calcul des vecteurs d'arête d'une face
; triangulaire (base du calcul de normale).
; ==============================================================================================
Mesh_ComputeEdgeVectors	proc far		; CODE XREF: Mesh_FaceSetup+54p

var_30		= dword	ptr -30h
var_2C		= dword	ptr -2Ch
var_28		= dword	ptr -28h
var_24		= dword	ptr -24h
var_20		= dword	ptr -20h
var_1C		= dword	ptr -1Ch
var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 30h
		les	bx, [bp+arg_0]

loc_29327:
		les	bx, es:[bx+19h]
		mov	eax, es:[bx]
		les	bx, [bp+arg_0]
		les	bx, es:[bx+21h]
		sub	eax, es:[bx]
		mov	[bp+var_C], eax
		les	bx, [bp+arg_0]

loc_29341:
		les	bx, es:[bx+19h]

loc_29345:
		mov	eax, es:[bx+4]
		les	bx, [bp+arg_0]

loc_2934D:
		les	bx, es:[bx+21h]

loc_29351:
		sub	eax, es:[bx+4]
		mov	[bp+var_8], eax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+19h]
		mov	eax, es:[bx+8]
		les	bx, [bp+arg_0]
		les	bx, es:[bx+21h]
		sub	eax, es:[bx+8]
		mov	[bp+var_4], eax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+19h]
		mov	eax, es:[bx]
		les	bx, [bp+arg_0]
		les	bx, es:[bx+1Dh]
		sub	eax, es:[bx]
		mov	[bp+var_18], eax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+19h]
		mov	eax, es:[bx+4]
		les	bx, [bp+arg_0]
		les	bx, es:[bx+1Dh]
		sub	eax, es:[bx+4]
		mov	[bp+var_14], eax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+19h]
		mov	eax, es:[bx+8]
		les	bx, [bp+arg_0]
		les	bx, es:[bx+1Dh]
		sub	eax, es:[bx+8]
		mov	[bp+var_10], eax
		lea	ax, [bp+var_18]
		push	ax
		lea	ax, [bp+var_C]
		push	ax
		push	ss
		lea	ax, [bp+var_30]
		push	ax
		call	Vector_TransformHelperA_550B7
		add	sp, 8
		mov	eax, [bp+var_30]
		mov	[bp+var_24], eax
		mov	eax, [bp+var_2C]
		mov	[bp+var_20], eax
		mov	eax, [bp+var_28]
		mov	[bp+var_1C], eax
		lea	ax, [bp+var_24]
		push	ax
		call	Vector_Normalize3D_559BB
		pop	cx
		les	bx, [bp+arg_0]
		mov	eax, [bp+var_24]
		mov	es:[bx+1], eax
		mov	eax, [bp+var_20]
		mov	es:[bx+5], eax
		mov	eax, [bp+var_1C]
		mov	es:[bx+9], eax
		leave
		retf
Mesh_ComputeEdgeVectors	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,61L — calcule le centroïde (moyenne /3) des 3 sommets d'un triangle sur les 3 axes :
; calcul du barycentre d'une face triangulaire (tri de profondeur/culling).
; ==============================================================================================
Mesh_ComputeCentroid	proc far		; CODE XREF: Mesh_FaceSetup:loc_2951Fp

arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp

loc_29422:
		les	bx, [bp+arg_0]

loc_29425:
		les	bx, es:[bx+19h]

loc_29429:
		mov	eax, es:[bx]
		les	bx, [bp+arg_0]

loc_29430:
		les	bx, es:[bx+1Dh]

loc_29434:
		add	eax, es:[bx]
		les	bx, [bp+arg_0]
		les	bx, es:[bx+21h]

loc_2943F:
		add	eax, es:[bx]
		mov	ebx, 3
		cdq
		idiv	ebx
		les	bx, [bp+arg_0]
		mov	es:[bx+0Dh], eax
		les	bx, es:[bx+19h]
		mov	eax, es:[bx+4]
		les	bx, [bp+arg_0]
		les	bx, es:[bx+1Dh]
		add	eax, es:[bx+4]
		les	bx, [bp+arg_0]
		les	bx, es:[bx+21h]
		add	eax, es:[bx+4]
		mov	ebx, 3
		cdq
		idiv	ebx
		les	bx, [bp+arg_0]
		mov	es:[bx+11h], eax
		les	bx, es:[bx+19h]
		mov	eax, es:[bx+8]
		les	bx, [bp+arg_0]
		les	bx, es:[bx+1Dh]
		add	eax, es:[bx+8]
		les	bx, [bp+arg_0]
		les	bx, es:[bx+21h]
		add	eax, es:[bx+8]
		mov	ebx, 3
		cdq
		idiv	ebx
		les	bx, [bp+arg_0]
		mov	es:[bx+15h], eax
		pop	bp
		retf
Mesh_ComputeCentroid	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,87L — stocke 3 pointeurs de sommets (+0x19/+0x1D/+0x21), copie 2 bits de flags depuis un
; matériau (+0x25), appelle sub_2931E (arêtes) et sub_2941F (centroïde) : constructeur/setup
; de face triangulaire pour le rasterizer (init géométrie + matériau).
; ==============================================================================================
Mesh_FaceSetup	proc far		; CODE XREF: Mesh_FaceSetupSolidColor+18p
					; Mesh_FaceSetupTexturedColor+19p ...

arg_0		= dword	ptr  6
arg_4		= dword	ptr  0Ah
arg_8		= dword	ptr  0Eh
arg_C		= dword	ptr  12h
arg_10		= dword	ptr  16h

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		mov	eax, [bp+arg_4]
		mov	es:[bx+19h], eax
		mov	eax, [bp+arg_8]
		mov	es:[bx+1Dh], eax
		mov	eax, [bp+arg_C]
		mov	es:[bx+21h], eax
		les	bx, [bp+arg_10]
		mov	al, es:[bx+7]
		and	ax, 1
		les	bx, [bp+arg_0]
		and	byte ptr es:[bx+25h], 0FEh
		or	es:[bx+25h], al
		les	bx, [bp+arg_10]
		mov	al, es:[bx+5]
		and	ax, 1
		les	bx, [bp+arg_0]
		and	byte ptr es:[bx+25h], 0FDh
		shl	al, 1
		or	es:[bx+25h], al
		push	word ptr [bp+arg_0+2]
		push	bx
		push	cs
		call	near ptr Mesh_ComputeEdgeVectors
		add	sp, 4
		push	large [bp+arg_0]
		push	cs

loc_2951F:
		call	near ptr Mesh_ComputeCentroid
		add	sp, 4

loc_29525:
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+1]
		les	bx, es:[bx+19h]
		add	es:[bx+0Ch], eax
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+5]

loc_2953E:
		les	bx, es:[bx+19h]
		add	es:[bx+10h], eax
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+9]
		les	bx, es:[bx+19h]

loc_29553:
		add	es:[bx+14h], eax
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+1]
		les	bx, es:[bx+1Dh]
		add	es:[bx+0Ch], eax
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+5]
		les	bx, es:[bx+1Dh]
		add	es:[bx+10h], eax
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+9]
		les	bx, es:[bx+1Dh]
		add	es:[bx+14h], eax
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+1]
		les	bx, es:[bx+21h]
		add	es:[bx+0Ch], eax
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+5]
		les	bx, es:[bx+21h]
		add	es:[bx+10h], eax
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+9]
		les	bx, es:[bx+21h]
		add	es:[bx+14h], eax
		pop	bp
		retf
Mesh_FaceSetup	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,23L — stocke 4 valeurs 32-bit consécutives (+6/+0xA/+0xE/+0x12) : initialisation de
; paramètres de shading (probable couleurs de sommets Gouraud).
; ==============================================================================================
Mesh_GouraudParamsInit	proc far		; CODE XREF: Mesh_GouraudSetupFlag:loc_29C2Ep
					; Mesh_GouraudCopyChannels+1Bp ...

arg_0		= dword	ptr  6
arg_4		= dword	ptr  0Ah
arg_8		= dword	ptr  0Eh
arg_C		= dword	ptr  12h
arg_10		= dword	ptr  16h

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		mov	eax, [bp+arg_4]
		mov	es:[bx+6], eax
		mov	eax, [bp+arg_8]
		mov	es:[bx+0Ah], eax
		mov	eax, [bp+arg_C]
		mov	es:[bx+0Eh], eax
		mov	eax, [bp+arg_10]
		mov	es:[bx+12h], eax
		pop	bp
		retf
Mesh_GouraudParamsInit	endp

; ���������������������������������������������������������������������������

loc_295EC:				; DATA XREF: seg339:1601o seg339:164Do ...
		push	bp
		mov	bp, sp
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_295F1:				; DATA XREF: seg339:15DDo seg339:1605o ...
		push	bp
		mov	bp, sp
		les	bx, [bp+6]
		les	bx, es:[bx+0Ah]
		mov	al, es:[bx+11h]
		shr	ax, 3
		and	ax, 1
		les	bx, [bp+6]
		les	bx, es:[bx+0Eh]
		mov	dl, es:[bx+11h]
		shr	dx, 3
		and	dx, 1
		and	al, dl
		les	bx, [bp+6]
		les	bx, es:[bx+12h]

loc_2961F:
		mov	dl, es:[bx+11h]
		shr	dx, 3
		and	dx, 1
		and	al, dl
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_2962D:				; DATA XREF: seg339:15E1o seg339:1609o ...
		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		les	bx, [bp+6]
		les	bx, es:[bx+0Ah]
		mov	eax, es:[bx+9]
		mov	[bp-4],	eax

loc_29643:
		les	bx, [bp+6]

loc_29646:
		les	bx, es:[bx+0Eh]

loc_2964A:
		mov	eax, es:[bx+9]
		mov	[bp-8],	eax

loc_29653:
		cmp	eax, [bp-4]
		jle	short loc_2965F
		mov	[bp-4],	eax
		jmp	short $+2

loc_2965F:				; CODE XREF: seg055:0477j
		les	bx, [bp+6]
		les	bx, es:[bx+12h]
		mov	eax, es:[bx+9]
		mov	[bp-0Ch], eax
		cmp	eax, [bp-4]
		jle	short loc_2967B
		mov	[bp-4],	eax
		jmp	short $+2

loc_2967B:				; CODE XREF: seg055:0493j
		les	bx, [bp+6]
		mov	eax, [bp-4]
		mov	es:[bx+2], eax
		leave
		retf
; ���������������������������������������������������������������������������

loc_29689:				; DATA XREF: seg339:1669o seg339:1725o
		push	bp
		mov	bp, sp
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_2968E:				; DATA XREF: seg339:15E5o seg339:160Do ...
		push	bp
		mov	bp, sp
		mov	al, 0
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_29695:				; DATA XREF: seg339:15F1o seg339:1619o ...
		push	bp
		mov	bp, sp
		push	si
		les	bx, [bp+6]
		mov	ax, es:[bx+0Ah]
		xor	dx, dx
		sub	ax, [bp+0Ah]
		sbb	dx, 0
		push	dx
		push	ax
		pop	eax
		mov	ebx, 12h
		cdq
		idiv	ebx
		imul	ax, 12h
		mov	dx, [bp+10h]
		mov	bx, [bp+0Eh]
		add	bx, ax
		mov	si, [bp+6]
		mov	es:[si+0Ch], dx
		mov	es:[si+0Ah], bx
		mov	bx, [bp+6]
		mov	ax, es:[bx+0Eh]
		xor	dx, dx
		sub	ax, [bp+0Ah]
		sbb	dx, 0
		push	dx
		push	ax
		pop	eax
		mov	ebx, 12h
		cdq
		idiv	ebx
		imul	ax, 12h
		mov	dx, [bp+10h]
		mov	bx, [bp+0Eh]
		add	bx, ax
		mov	es:[si+10h], dx
		mov	es:[si+0Eh], bx
		mov	bx, [bp+6]
		mov	ax, es:[bx+12h]
		xor	dx, dx
		sub	ax, [bp+0Ah]
		sbb	dx, 0
		push	dx
		push	ax
		pop	eax
		mov	ebx, 12h
		cdq
		idiv	ebx
		imul	ax, 12h
		mov	dx, [bp+10h]

loc_29722:
		mov	bx, [bp+0Eh]
		add	bx, ax
		mov	es:[si+14h], dx
		mov	es:[si+12h], bx
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,28L — appelle sub_294C0 (setup face) puis copie un champ couleur/matériau (+4→+0x26) :
; setup de face triangulaire avec couleur unie.
; ==============================================================================================
Mesh_FaceSetupSolidColor	proc far		; CODE XREF: Mesh_FaceSetupSolidColorWrap+18p
					; AircraftComponent_LoadWithDwordFields_94D40+1D1P

arg_0		= dword	ptr  6
arg_4		= dword	ptr  0Ah
arg_8		= dword	ptr  0Eh
arg_C		= dword	ptr  12h
arg_10		= dword	ptr  16h

		push	bp

loc_29733:
		mov	bp, sp
		push	large [bp+arg_10]
		push	large [bp+arg_C]
		push	large [bp+arg_8]
		push	large [bp+arg_4]
		push	large [bp+arg_0]
		push	cs
		call	near ptr Mesh_FaceSetup
		add	sp, 14h
		les	bx, [bp+arg_10]
		mov	al, es:[bx+4]
		les	bx, [bp+arg_0]
		mov	es:[bx+26h], al
		pop	bp
		retf
Mesh_FaceSetupSolidColor	endp

; ���������������������������������������������������������������������������

loc_29760:				; DATA XREF: seg339:16DDo seg339:1749o
		push	bp
		mov	bp, sp
		sub	sp, 4
		les	bx, [bp+6]
		mov	eax, es:[bx+6]
		mov	[bp-4],	eax
		les	bx, [bp-4]
		mov	al, es:[bx+26h]
		push	ax
		push	large dword ptr	[bp+6]
		call	Keyframe_ResolveEasingValue
		add	sp, 6
		les	bx, [bp+6]
		mov	es:[bx+16h], al
		leave
		retf
; ���������������������������������������������������������������������������

loc_2978F:				; DATA XREF: seg339:1729o
		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		les	bx, [bp+6]
		mov	eax, es:[bx+0Ah]
		mov	[bp-4],	eax
		mov	eax, es:[bx+0Eh]
		mov	[bp-8],	eax
		mov	eax, es:[bx+12h]
		mov	[bp-0Ch], eax
		mov	al, es:[bx+16h]
		push	ax
		les	bx, [bp-8]
		push	word ptr es:[bx+3]
		push	word ptr es:[bx+1]
		les	bx, [bp-4]
		push	word ptr es:[bx+3]
		push	word ptr es:[bx+1]
		push	word_70E60
		call	Render_FillClippedRect_61960
		add	sp, 0Ch
		les	bx, [bp+6]
		mov	al, es:[bx+16h]
		push	ax
		les	bx, [bp-0Ch]
		push	word ptr es:[bx+3]
		push	word ptr es:[bx+1]
		les	bx, [bp-8]
		push	word ptr es:[bx+3]
		push	word ptr es:[bx+1]
		push	word_70E60
		call	Render_FillClippedRect_61960
		add	sp, 0Ch
		les	bx, [bp+6]
		mov	al, es:[bx+16h]
		push	ax
		les	bx, [bp-0Ch]
		push	word ptr es:[bx+3]
		push	word ptr es:[bx+1]
		les	bx, [bp-4]
		push	word ptr es:[bx+3]
		push	word ptr es:[bx+1]

loc_29822:
		push	word_70E60

loc_29826:
		call	Render_FillClippedRect_61960

loc_2982B:
		add	sp, 0Ch
		leave
		retf
; ���������������������������������������������������������������������������

loc_29830:				; DATA XREF: seg339:173Do
		push	bp
		mov	bp, sp
		mov	al, 0
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,23L — wrapper trivial vers sub_29732.
; ==============================================================================================
Mesh_FaceSetupSolidColorWrap	proc far		; CODE XREF: AircraftComponent_LoadWithDwordFields_94D40:loc_94F6CP

arg_0		= dword	ptr  6
arg_4		= dword	ptr  0Ah
arg_8		= dword	ptr  0Eh
arg_C		= dword	ptr  12h
arg_10		= dword	ptr  16h

		push	bp
		mov	bp, sp
		push	large [bp+arg_10]
		push	large [bp+arg_C]
		push	large [bp+arg_8]
		push	large [bp+arg_4]
		push	large [bp+arg_0]
		push	cs
		call	near ptr Mesh_FaceSetupSolidColor

loc_29852:
		add	sp, 14h
		pop	bp
		retf
Mesh_FaceSetupSolidColorWrap	endp

; ���������������������������������������������������������������������������

loc_29857:				; DATA XREF: seg339:16BDo
		push	bp
		mov	bp, sp
		sub	sp, 42h
		les	bx, [bp+6]
		les	bx, es:[bx+0Ah]
		mov	ax, es:[bx+1]
		mov	[bp-42h], ax
		mov	ax, es:[bx+3]
		mov	[bp-40h], ax
		les	bx, [bp+6]
		mov	al, es:[bx+16h]
		mov	ah, 0
		mov	[bp-3Eh], ax
		les	bx, es:[bx+0Eh]
		mov	ax, es:[bx+1]
		mov	[bp-2Ch], ax
		mov	ax, es:[bx+3]
		mov	[bp-2Ah], ax
		les	bx, [bp+6]
		mov	al, es:[bx+16h]
		mov	ah, 0
		mov	[bp-28h], ax
		les	bx, es:[bx+12h]
		mov	ax, es:[bx+1]
		mov	[bp-16h], ax
		mov	ax, es:[bx+3]
		mov	[bp-14h], ax
		les	bx, [bp+6]
		mov	al, es:[bx+16h]
		mov	ah, 0
		mov	[bp-12h], ax
		mov	al, byte_6E684
		mov	ah, 0
		or	ax, ax
		jnz	short loc_298D5
		push	ss
		lea	ax, [bp-42h]
		push	ax
		push	3
		push	word_70E60
		call	Render_PolygonPrimitive_20848
		jmp	short loc_298E9
; ���������������������������������������������������������������������������

loc_298D5:				; CODE XREF: seg055:06E1j
		lea	ax, [bp-16h]
		push	ax
		lea	ax, [bp-2Ch]
		push	ax
		lea	ax, [bp-42h]
		push	ax
		push	word_70E60
		push	cs
		call	near ptr Mesh_DrawTriangleWireframe

loc_298E9:				; CODE XREF: seg055:06F3j
		add	sp, 8
		leave
		retf
; ���������������������������������������������������������������������������

loc_298EE:				; DATA XREF: seg339:16D1o
		push	bp
		mov	bp, sp
		mov	al, 1
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,50L — appelle sub_294C0 puis résout une couleur via une table de police/texture
; (sub_5C832 sur 0x72528h) si un index est négatif : setup de face avec résolution de
; texture/couleur spéciale (probable texte 3D ou icône dans le monde).
; ==============================================================================================
Mesh_FaceSetupTexturedColor	proc far		; CODE XREF: AircraftComponent_LoadWithDwordFields_94D40+287P

arg_0		= dword	ptr  6
arg_4		= dword	ptr  0Ah
arg_8		= dword	ptr  0Eh
arg_C		= dword	ptr  12h
arg_10		= dword	ptr  16h

		push	bp
		mov	bp, sp
		push	si
		push	large [bp+arg_10]
		push	large [bp+arg_C]
		push	large [bp+arg_8]
		push	large [bp+arg_4]
		push	large [bp+arg_0]
		push	cs
		call	near ptr Mesh_FaceSetup
		add	sp, 14h
		les	bx, [bp+arg_10]
		mov	al, es:[bx+4]
		cbw
		mov	si, ax
		or	si, si
		jge	short loc_29928
		xor	dx, dx
		xor	ax, ax
		jmp	short loc_29945
; ���������������������������������������������������������������������������

loc_29928:				; CODE XREF: Mesh_FaceSetupTexturedColor+2Bj
		push	0
		mov	al, byte_7252C
		push	ax
		push	large [dword_72528]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		mov	bx, si
		shl	bx, 8
		add	ax, bx

loc_29945:				; CODE XREF: Mesh_FaceSetupTexturedColor+31j
		les	bx, [bp+arg_0]
		mov	es:[bx+28h], dx
		mov	es:[bx+26h], ax
		pop	si
		pop	bp
		retf
Mesh_FaceSetupTexturedColor	endp

; ���������������������������������������������������������������������������

loc_29953:				; DATA XREF: seg339:1701o
		push	bp
		mov	bp, sp
		sub	sp, 4
		les	bx, [bp+6]
		mov	eax, es:[bx+6]
		mov	[bp-4],	eax
		les	bx, [bp-4]
		mov	eax, es:[bx+26h]
		les	bx, [bp+6]
		mov	es:[bx+16h], eax
		leave
		retf
; ���������������������������������������������������������������������������

loc_29977:				; DATA XREF: seg339:16E1o
		push	bp
		mov	bp, sp
		sub	sp, 42h
		les	bx, [bp+6]
		les	bx, es:[bx+0Ah]
		mov	ax, es:[bx+1]
		mov	[bp-42h], ax
		mov	ax, es:[bx+3]
		mov	[bp-40h], ax
		les	bx, [bp+6]
		les	bx, es:[bx+0Eh]
		mov	ax, es:[bx+1]
		mov	[bp-2Ch], ax
		mov	ax, es:[bx+3]
		mov	[bp-2Ah], ax
		les	bx, [bp+6]
		les	bx, es:[bx+12h]
		mov	ax, es:[bx+1]
		mov	[bp-16h], ax
		mov	ax, es:[bx+3]
		mov	[bp-14h], ax
		xor	ax, ax
		mov	[bp-12h], ax
		mov	[bp-28h], ax
		mov	[bp-3Eh], ax
		mov	al, byte_6E684
		mov	ah, 0
		or	ax, ax
		jnz	short loc_299ED
		les	bx, [bp+6]
		push	large dword ptr	es:[bx+16h]
		push	ss
		lea	ax, [bp-42h]
		push	ax
		push	3
		push	word_70E60

loc_299E3:
		call	Render_PolygonPrimitive_20C58
		add	sp, 0Ch

loc_299EB:
		jmp	short locret_29A04
; ���������������������������������������������������������������������������

loc_299ED:				; CODE XREF: seg055:07EEj
		lea	ax, [bp-16h]

loc_299F0:
		push	ax

loc_299F1:
		lea	ax, [bp-2Ch]

loc_299F4:
		push	ax

loc_299F5:
		lea	ax, [bp-42h]
		push	ax
		push	word_70E60
		push	cs
		call	near ptr Mesh_DrawTriangleWireframe
		add	sp, 8

locret_29A04:				; CODE XREF: seg055:loc_299EBj
		leave
		retf
; ���������������������������������������������������������������������������

loc_29A06:				; DATA XREF: seg339:16F5o
		push	bp
		mov	bp, sp
		mov	al, 2
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,61L — recherche une teinte de dégât dans une table (sub_2E975, 0x541Ah, pas de 0xF
; octets/entrée, base word_72524) et soustrait un décalage : résolution de couleur avec effet
; de dommage/usure (damage tint).
; ==============================================================================================
Render_DamageTintResolve	proc far		; CODE XREF: Mesh_FaceSetupDamageTint+31p
					; Mesh_FaceSetupVariant+31p

var_6		= dword	ptr -6
var_2		= word ptr -2
arg_0		= dword	ptr  6
arg_4		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 6
		mov	al, [bp+arg_4]
		mov	ah, 0
		mov	[bp+var_2], ax
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		inc	dx
		mov	word ptr [bp+var_6+2], ax
		mov	word ptr [bp+var_6], dx
		push	[bp+var_2]
		push	541Ah
		call	Table_LookupByRange
		add	sp, 4
		mov	dx, ax
		cmp	dx, 0FFFFh
		jz	short loc_29A54
		imul	ax, 0Fh
		mov	bx, word_72524

loc_29A44:
		add	bx, ax
		mov	al, byte ptr [bp+var_2]
		sub	al, [bx+6]
		les	bx, [bp+var_6]
		mov	es:[bx], al
		jmp	short loc_29A5B
; ���������������������������������������������������������������������������

loc_29A54:				; CODE XREF: Render_DamageTintResolve+2Ej
		les	bx, [bp+var_6]
		mov	byte ptr es:[bx], 0

loc_29A5B:				; CODE XREF: Render_DamageTintResolve+45j
		cmp	dx, 0FFFFh
		jnz	short loc_29A70
		les	bx, [bp+arg_0]
		mov	al, [bp+arg_4]
		mov	es:[bx], al
		mov	byte ptr es:[bx+2], 0
		jmp	short locret_29A7B
; ���������������������������������������������������������������������������

loc_29A70:				; CODE XREF: Render_DamageTintResolve+51j
		les	bx, [bp+arg_0]
		mov	es:[bx], dl
		mov	byte ptr es:[bx+2], 1

locret_29A7B:				; CODE XREF: Render_DamageTintResolve+61j
		leave
		retf
Render_DamageTintResolve	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,163L — traite une face avec flag actif (+0x25 bit0), calcule des deltas géométriques à
; partir de 3 sommets référencés indirectement (+0xA/+0xE/+0x12) : préparation géométrique
; d'une face avant rendu (variante avec sommets indirects).
; ==============================================================================================
Mesh_FacePrepareIndirect	proc far		; CODE XREF: seg055:0BCBp seg055:1215p ...

var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= dword	ptr  0Ah
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 10h
		push	si
		mov	si, [bp+arg_8]
		les	bx, [bp+arg_4]
		mov	eax, es:[bx+6]
		mov	[bp+var_4], eax
		les	bx, [bp+var_4]
		mov	eax, es:[bx+1]
		mov	[bp+var_10], eax
		mov	eax, es:[bx+5]
		mov	[bp+var_C], eax
		mov	eax, es:[bx+9]
		mov	[bp+var_8], eax
		mov	al, es:[bx+25h]
		and	ax, 1
		or	al, al
		jnz	short loc_29ABF
		jmp	loc_29BA9
; ���������������������������������������������������������������������������

loc_29ABF:				; CODE XREF: Mesh_FacePrepareIndirect+3Dj
		les	bx, [bp+arg_4]
		les	bx, es:[bx+0Eh]
		mov	ax, es:[bx+1]
		les	bx, [bp+arg_4]
		les	bx, es:[bx+0Ah]
		sub	ax, es:[bx+1]
		les	bx, [bp+arg_4]
		les	bx, es:[bx+12h]
		mov	dx, es:[bx+3]
		les	bx, [bp+arg_4]
		les	bx, es:[bx+0Eh]

loc_29AE7:
		sub	dx, es:[bx+3]
		imul	dx
		push	ax

loc_29AEE:
		mov	ax, es:[bx+3]
		les	bx, [bp+arg_4]
		les	bx, es:[bx+0Ah]
		sub	ax, es:[bx+3]
		les	bx, [bp+arg_4]
		les	bx, es:[bx+12h]
		mov	dx, es:[bx+1]
		les	bx, [bp+arg_4]
		les	bx, es:[bx+0Eh]
		sub	dx, es:[bx+1]
		imul	dx
		pop	dx
		sub	dx, ax
		jge	short loc_29B1E
		mov	al, 1
		jmp	short loc_29B20
; ���������������������������������������������������������������������������

loc_29B1E:				; CODE XREF: Mesh_FacePrepareIndirect+9Bj
		mov	al, 0

loc_29B20:				; CODE XREF: Mesh_FacePrepareIndirect+9Fj
		mov	dl, al

loc_29B22:
		or	dl, dl
		jz	short loc_29B75

loc_29B26:
		les	bx, [bp+arg_0]
		mov	al, es:[bx+5]
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jz	short loc_29B45
		mov	al, es:[bx+5]
		shr	ax, 1
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jnz	short loc_29B75

loc_29B45:				; CODE XREF: Mesh_FacePrepareIndirect+B7j
		les	bx, [bp+arg_0]
		or	byte ptr es:[bx+5], 1
		or	byte ptr es:[bx+5], 2
		lea	ax, [bp+var_10]
		push	ax
		call	Utility_Helper_55A37
		pop	cx

loc_29B5C:				; CODE XREF: Mesh_FacePrepareIndirect+12Aj
		lea	ax, [bp+var_10]
		push	ax
		push	si
		push	5A9Ah
		call	Render_FaceDotProductTest
		add	sp, 6
		les	bx, [bp+arg_0]
		mov	es:[bx+4], al
		jmp	short loc_29BD7
; ���������������������������������������������������������������������������

loc_29B75:				; CODE XREF: Mesh_FacePrepareIndirect+A7j
					; Mesh_FacePrepareIndirect+C6j
		mov	al, dl
		mov	ah, 0
		or	ax, ax
		jnz	short loc_29BD7
		les	bx, [bp+arg_0]
		mov	al, es:[bx+5]
		and	ax, 1
		or	al, al
		jnz	short loc_29B9A
		mov	al, es:[bx+5]
		shr	ax, 1
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jnz	short loc_29BD7

loc_29B9A:				; CODE XREF: Mesh_FacePrepareIndirect+10Cj
		les	bx, [bp+arg_0]
		and	byte ptr es:[bx+5], 0FEh
		or	byte ptr es:[bx+5], 2
		jmp	short loc_29B5C
; ���������������������������������������������������������������������������

loc_29BA9:				; CODE XREF: Mesh_FacePrepareIndirect+3Fj
		les	bx, [bp+arg_0]
		mov	al, es:[bx+5]
		shr	ax, 1
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jnz	short loc_29BD7
		lea	ax, [bp+var_10]
		push	ax
		push	si
		push	5A9Ah
		call	Render_FaceDotProductTest
		add	sp, 6
		les	bx, [bp+arg_0]
		mov	es:[bx+4], al
		or	byte ptr es:[bx+5], 2

loc_29BD7:				; CODE XREF: Mesh_FacePrepareIndirect+F6j
					; Mesh_FacePrepareIndirect+FEj ...
		pop	si
		leave
		retf
Mesh_FacePrepareIndirect	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,35L — appelle sub_294C0 puis sub_29A0D (teinte dommage) sur le champ couleur (+0x26) :
; setup de face avec couleur teintée par les dommages.
; ==============================================================================================
Mesh_FaceSetupDamageTint	proc far		; CODE XREF: AircraftComponent_LoadWithDwordFields_94D40+2E2P

arg_0		= dword	ptr  6
arg_4		= dword	ptr  0Ah
arg_8		= dword	ptr  0Eh
arg_C		= dword	ptr  12h
arg_10		= dword	ptr  16h

		push	bp
		mov	bp, sp
		push	large [bp+arg_10]

loc_29BE1:
		push	large [bp+arg_C]
		push	large [bp+arg_8]

loc_29BE9:
		push	large [bp+arg_4]
		push	large [bp+arg_0]
		push	cs
		call	near ptr Mesh_FaceSetup
		add	sp, 14h
		les	bx, [bp+arg_10]
		mov	al, es:[bx+4]
		push	ax
		mov	ax, word ptr [bp+arg_0]
		add	ax, 26h	; '&'
		push	word ptr [bp+arg_0+2]
		push	ax
		push	cs
		call	near ptr Render_DamageTintResolve
		add	sp, 6
		pop	bp
		retf
Mesh_FaceSetupDamageTint	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,46L — appelle sub_295C0 (shading Gouraud) puis copie un bit de flag matériau
; (+0x28→+0x1B bit2) : setup de shading Gouraud avec flag matériau.
; ==============================================================================================
Mesh_GouraudSetupFlag	proc far		; CODE XREF: AircraftComponent_LoadWithDwordFields_94D40+313P

var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= dword	ptr  0Ah
arg_8		= dword	ptr  0Eh
arg_C		= dword	ptr  12h
arg_10		= dword	ptr  16h

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	large [bp+arg_10]
		push	large [bp+arg_C]
		push	large [bp+arg_8]
		push	large [bp+arg_4]
		push	large [bp+arg_0]
		push	cs

loc_29C2E:
		call	near ptr Mesh_GouraudParamsInit

loc_29C31:
		add	sp, 14h
		mov	eax, [bp+arg_4]

loc_29C38:
		mov	[bp+var_4], eax
		les	bx, [bp+var_4]
		mov	al, es:[bx+28h]
		and	ax, 1
		les	bx, [bp+arg_0]
		and	byte ptr es:[bx+1Bh], 0FBh
		shl	al, 2
		or	es:[bx+1Bh], al
		les	bx, [bp+var_4]
		mov	al, es:[bx+26h]
		les	bx, [bp+arg_0]
		mov	es:[bx+18h], al
		les	bx, [bp+var_4]
		mov	al, es:[bx+27h]
		les	bx, [bp+arg_0]
		mov	es:[bx+19h], al
		leave
		retf
Mesh_GouraudSetupFlag	endp

; ���������������������������������������������������������������������������

loc_29C73:				; DATA XREF: seg339:1695o
		push	bp
		mov	bp, sp
		sub	sp, 46h
		les	bx, [bp+6]
		mov	al, es:[bx+1Bh]
		shr	ax, 2
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jnz	short loc_29CD2
		mov	eax, es:[bx+2]
		sar	eax, 8
		push	eax
		mov	al, es:[bx+1Ah]
		mov	ah, 0
		push	ax
		push	541Ah
		call	Gauge_ResolveAndApplyLabel
		add	sp, 8
		mov	[bp-2],	dx
		mov	[bp-4],	ax
		cmp	dword ptr [bp-4], 0
		jnz	short loc_29CBF
		les	bx, [bp+6]
		mov	dl, es:[bx+18h]
		jmp	short loc_29D02
; ���������������������������������������������������������������������������

loc_29CBF:				; CODE XREF: seg055:0AD4j
		les	bx, [bp+6]
		mov	al, es:[bx+18h]
		mov	ah, 0
		les	bx, [bp-4]
		add	bx, ax
		mov	dl, es:[bx]
		jmp	short loc_29D02
; ���������������������������������������������������������������������������

loc_29CD2:				; CODE XREF: seg055:0AAAj
		les	bx, [bp+6]
		mov	al, es:[bx+19h]
		mov	ah, 0
		push	ax
		mov	eax, es:[bx+2]

loc_29CE1:
		sar	eax, 8

loc_29CE5:
		push	eax

loc_29CE7:
		mov	al, es:[bx+1Ah]

loc_29CEB:
		mov	ah, 0

loc_29CED:
		push	ax

loc_29CEE:
		mov	al, es:[bx+18h]

loc_29CF2:
		mov	ah, 0

loc_29CF4:
		push	ax

loc_29CF5:
		push	541Ah
		call	Interp_ResolveCachedGuarded
		add	sp, 0Ch
		mov	dl, al

loc_29D02:				; CODE XREF: seg055:0ADDj seg055:0AF0j
		les	bx, [bp+6]
		les	bx, es:[bx+0Ah]
		mov	ax, es:[bx+1]
		mov	[bp-46h], ax
		mov	ax, es:[bx+3]
		mov	[bp-44h], ax
		les	bx, [bp+6]
		les	bx, es:[bx+0Eh]
		mov	ax, es:[bx+1]
		mov	[bp-30h], ax
		mov	ax, es:[bx+3]

loc_29D29:
		mov	[bp-2Eh], ax

loc_29D2C:
		les	bx, [bp+6]

loc_29D2F:
		les	bx, es:[bx+12h]
		mov	ax, es:[bx+1]
		mov	[bp-1Ah], ax
		mov	ax, es:[bx+3]
		mov	[bp-18h], ax
		mov	al, dl
		mov	ah, 0
		mov	[bp-16h], ax
		mov	[bp-2Ch], ax
		mov	[bp-42h], ax
		mov	al, byte_6E684
		mov	ah, 0
		or	ax, ax
		jnz	short loc_29D69
		push	ss
		lea	ax, [bp-46h]
		push	ax
		push	3
		push	word_70E60
		call	Render_PolygonPrimitive_20848
		jmp	short loc_29D7D
; ���������������������������������������������������������������������������

loc_29D69:				; CODE XREF: seg055:0B75j
		lea	ax, [bp-1Ah]
		push	ax
		lea	ax, [bp-30h]
		push	ax
		lea	ax, [bp-46h]
		push	ax
		push	word_70E60
		push	cs
		call	near ptr Mesh_DrawTriangleWireframe

loc_29D7D:				; CODE XREF: seg055:0B87j
		add	sp, 8
		leave
		retf
; ���������������������������������������������������������������������������

loc_29D82:				; DATA XREF: seg339:1699o
		push	bp
		mov	bp, sp
		les	bx, [bp+6]
		and	byte ptr es:[bx+1Bh], 0FDh
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_29D8F:				; DATA XREF: seg339:16A9o
		push	bp
		mov	bp, sp
		mov	al, 4
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_29D96:				; DATA XREF: seg339:16B5o
		push	bp
		mov	bp, sp
		push	word ptr [bp+0Ah]
		push	large dword ptr	[bp+6]
		mov	ax, [bp+6]
		add	ax, 16h
		push	word ptr [bp+8]
		push	ax
		push	cs
		call	near ptr Mesh_FacePrepareIndirect
		add	sp, 0Ah
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,69L — variante de sub_29A0D sur un offset différent (+0x27) : résolution de couleur
; teintée dommage, second canal.
; ==============================================================================================
Render_DamageTintResolveAlt	proc far		; CODE XREF: Mesh_FaceSetupDamageTintAlt+2Bp

var_6		= dword	ptr -6
var_2		= word ptr -2
arg_0		= dword	ptr  6
arg_4		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 6
		mov	al, [bp+arg_4]
		mov	ah, 0
		mov	[bp+var_2], ax
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 27h	; '''
		mov	word ptr [bp+var_6+2], ax
		mov	word ptr [bp+var_6], dx
		push	[bp+var_2]
		push	541Ah
		call	Table_LookupByRange
		add	sp, 4
		mov	dx, ax
		cmp	dx, 0FFFFh

loc_29DE3:
		jz	short loc_29DFC

loc_29DE5:
		imul	ax, 0Fh

loc_29DE8:
		mov	bx, word_72524
		add	bx, ax

loc_29DEE:
		mov	al, byte ptr [bp+var_2]

loc_29DF1:
		sub	al, [bx+6]

loc_29DF4:
		les	bx, [bp+var_6]

loc_29DF7:
		mov	es:[bx], al
		jmp	short loc_29E03
; ���������������������������������������������������������������������������

loc_29DFC:				; CODE XREF: Render_DamageTintResolveAlt:loc_29DE3j
		les	bx, [bp+var_6]
		mov	byte ptr es:[bx], 0

loc_29E03:				; CODE XREF: Render_DamageTintResolveAlt+47j
		cmp	dx, 0FFFFh
		jnz	short loc_29E12
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+26h], 0
		jmp	short locret_29E19
; ���������������������������������������������������������������������������

loc_29E12:				; CODE XREF: Render_DamageTintResolveAlt+53j
		les	bx, [bp+arg_0]
		mov	es:[bx+26h], dl

locret_29E19:				; CODE XREF: Render_DamageTintResolveAlt+5Dj
		leave
		retf
Render_DamageTintResolveAlt	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,36L — appelle sub_294C0 puis sub_29DB3 : setup de face avec couleur teintée dommage,
; second canal.
; ==============================================================================================
Mesh_FaceSetupDamageTintAlt	proc far		; CODE XREF: AircraftComponent_LoadWithDwordFields_94D40+38CP

arg_0		= dword	ptr  6
arg_4		= dword	ptr  0Ah
arg_8		= dword	ptr  0Eh
arg_C		= dword	ptr  12h
arg_10		= dword	ptr  16h

		push	bp
		mov	bp, sp
		push	large [bp+arg_10]

loc_29E22:
		push	large [bp+arg_C]
		push	large [bp+arg_8]

loc_29E2A:
		push	large [bp+arg_4]

loc_29E2E:
		push	large [bp+arg_0]
		push	cs

loc_29E33:
		call	near ptr Mesh_FaceSetup
		add	sp, 14h
		les	bx, [bp+arg_10]
		mov	al, es:[bx+4]
		push	ax
		push	large [bp+arg_0]
		push	cs
		call	near ptr Render_DamageTintResolveAlt
		add	sp, 6
		pop	bp
		retf
Mesh_FaceSetupDamageTintAlt	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,33L — appelle sub_295C0 puis copie 2 champs couleur (+0x26/+0x27→+0x16/+0x17) : setup de
; shading avec copie de 2 canaux couleur.
; ==============================================================================================
Mesh_GouraudCopyChannels	proc far		; CODE XREF: AircraftComponent_LoadWithDwordFields_94D40+3BDP

var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= dword	ptr  0Ah
arg_8		= dword	ptr  0Eh
arg_C		= dword	ptr  12h
arg_10		= dword	ptr  16h

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	large [bp+arg_10]
		push	large [bp+arg_C]
		push	large [bp+arg_8]
		push	large [bp+arg_4]
		push	large [bp+arg_0]
		push	cs
		call	near ptr Mesh_GouraudParamsInit
		add	sp, 14h
		mov	eax, [bp+arg_4]
		mov	[bp+var_4], eax
		les	bx, [bp+var_4]
		mov	al, es:[bx+26h]
		les	bx, [bp+arg_0]
		mov	es:[bx+16h], al
		les	bx, [bp+var_4]
		mov	al, es:[bx+27h]
		les	bx, [bp+arg_0]
		mov	es:[bx+17h], al
		leave
		retf
Mesh_GouraudCopyChannels	endp

; ���������������������������������������������������������������������������

loc_29E95:				; DATA XREF: seg339:168Do
		push	bp
		mov	bp, sp
		sub	sp, 46h
		push	si
		push	di
		mov	di, [bp+0Ah]
		les	bx, [bp+6]
		mov	eax, es:[bx+6]
		mov	[bp-4],	eax
		mov	[bp-6],	di
		les	bx, [bp-4]
		mov	eax, es:[bx+19h]
		mov	[bp-0Ah], eax
		les	bx, [bp+6]
		les	bx, es:[bx+0Ah]
		mov	al, es:[bx+11h]
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jnz	short loc_29F1E
		mov	ax, [bp-8]
		mov	dx, [bp-0Ah]
		add	dx, 0Ch
		mov	[bp-0Ch], ax
		mov	[bp-0Eh], dx
		les	si, [bp-0Eh]

loc_29EE1:
		mov	eax, es:[si]

loc_29EE5:
		mov	[bp-2Eh], eax

loc_29EE9:
		mov	eax, es:[si+4]
		mov	[bp-2Ah], eax
		mov	eax, es:[si+8]
		mov	[bp-26h], eax
		lea	ax, [bp-2Eh]
		push	ax
		push	word ptr [bp-6]
		push	5A9Ah
		call	Render_FaceDotProductTest
		add	sp, 6
		les	bx, [bp+6]
		les	bx, es:[bx+0Ah]
		mov	es:[bx], al
		or	byte ptr es:[bx+11h], 1
		jmp	short $+2

loc_29F1E:				; CODE XREF: seg055:0CEDj
		mov	[bp-10h], di
		les	bx, [bp-4]
		mov	eax, es:[bx+1Dh]
		mov	[bp-14h], eax
		les	bx, [bp+6]

loc_29F30:
		les	bx, es:[bx+0Eh]

loc_29F34:
		mov	al, es:[bx+11h]
		and	ax, 1

loc_29F3B:
		mov	ah, 0

loc_29F3D:
		or	ax, ax

loc_29F3F:
		jnz	short loc_29F90

loc_29F41:
		mov	ax, [bp-12h]

loc_29F44:
		mov	dx, [bp-14h]

loc_29F47:
		add	dx, 0Ch
		mov	[bp-16h], ax
		mov	[bp-18h], dx
		les	si, [bp-18h]
		mov	eax, es:[si]
		mov	[bp-3Ah], eax
		mov	eax, es:[si+4]
		mov	[bp-36h], eax
		mov	eax, es:[si+8]
		mov	[bp-32h], eax
		lea	ax, [bp-3Ah]
		push	ax
		push	word ptr [bp-10h]
		push	5A9Ah
		call	Render_FaceDotProductTest
		add	sp, 6
		les	bx, [bp+6]
		les	bx, es:[bx+0Eh]
		mov	es:[bx], al
		or	byte ptr es:[bx+11h], 1
		jmp	short $+2

loc_29F90:				; CODE XREF: seg055:loc_29F3Fj
		mov	[bp-1Ah], di
		les	bx, [bp-4]
		mov	eax, es:[bx+21h]
		mov	[bp-1Eh], eax
		les	bx, [bp+6]
		les	bx, es:[bx+12h]
		mov	al, es:[bx+11h]
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jnz	short loc_2A002
		mov	ax, [bp-1Ch]
		mov	dx, [bp-1Eh]
		add	dx, 0Ch
		mov	[bp-20h], ax
		mov	[bp-22h], dx
		les	si, [bp-22h]
		mov	eax, es:[si]
		mov	[bp-46h], eax
		mov	eax, es:[si+4]
		mov	[bp-42h], eax
		mov	eax, es:[si+8]
		mov	[bp-3Eh], eax

loc_29FDF:
		lea	ax, [bp-46h]
		push	ax
		push	word ptr [bp-1Ah]
		push	5A9Ah

loc_29FE9:
		call	Render_FaceDotProductTest
		add	sp, 6
		les	bx, [bp+6]
		les	bx, es:[bx+12h]
		mov	es:[bx], al
		or	byte ptr es:[bx+11h], 1
		jmp	short $+2

loc_2A002:				; CODE XREF: seg055:0DD1j
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_2A006:				; DATA XREF: seg339:off_6E71Do
		push	bp
		mov	bp, sp
		sub	sp, 5Ah
		les	bx, [bp+6]
		les	bx, es:[bx+0Ah]
		mov	ax, es:[bx+1]
		mov	[bp-5Ah], ax
		mov	ax, es:[bx+3]
		mov	[bp-58h], ax
		les	bx, [bp+6]
		mov	al, es:[bx+17h]
		mov	ah, 0
		push	ax
		mov	ax, es:[bx+0Ch]
		mov	dx, es:[bx+0Ah]
		add	dx, 9

loc_2A036:
		mov	[bp-2],	ax
		mov	[bp-4],	dx
		les	bx, [bp-4]

loc_2A03F:
		mov	eax, es:[bx]
		mov	[bp-8],	eax
		sar	eax, 8
		push	eax
		les	bx, [bp+6]
		les	bx, es:[bx+0Ah]
		mov	al, es:[bx]
		mov	ah, 0
		push	ax
		les	bx, [bp+6]
		mov	al, es:[bx+16h]
		mov	ah, 0
		push	ax
		push	541Ah
		call	Interp_ResolveCachedGuarded
		add	sp, 0Ch
		mov	[bp-56h], ax
		les	bx, [bp+6]
		les	bx, es:[bx+0Eh]
		mov	ax, es:[bx+1]
		mov	[bp-44h], ax
		mov	ax, es:[bx+3]
		mov	[bp-42h], ax
		les	bx, [bp+6]
		mov	al, es:[bx+17h]
		mov	ah, 0
		push	ax
		mov	ax, es:[bx+10h]
		mov	dx, es:[bx+0Eh]
		add	dx, 9
		mov	[bp-0Ah], ax
		mov	[bp-0Ch], dx
		les	bx, [bp-0Ch]
		mov	eax, es:[bx]
		mov	[bp-10h], eax
		sar	eax, 8
		push	eax
		les	bx, [bp+6]
		les	bx, es:[bx+0Eh]
		mov	al, es:[bx]
		mov	ah, 0
		push	ax
		les	bx, [bp+6]
		mov	al, es:[bx+16h]
		mov	ah, 0
		push	ax
		push	541Ah
		call	Interp_ResolveCachedGuarded
		add	sp, 0Ch
		mov	[bp-40h], ax
		les	bx, [bp+6]
		les	bx, es:[bx+12h]
		mov	ax, es:[bx+1]

loc_2A0E3:
		mov	[bp-2Eh], ax

loc_2A0E6:
		mov	ax, es:[bx+3]

loc_2A0EA:
		mov	[bp-2Ch], ax
		les	bx, [bp+6]

loc_2A0F0:
		mov	al, es:[bx+17h]

loc_2A0F4:
		mov	ah, 0

loc_2A0F6:
		push	ax

loc_2A0F7:
		mov	ax, es:[bx+14h]
		mov	dx, es:[bx+12h]
		add	dx, 9
		mov	[bp-12h], ax
		mov	[bp-14h], dx
		les	bx, [bp-14h]
		mov	eax, es:[bx]
		mov	[bp-18h], eax
		sar	eax, 8
		push	eax
		les	bx, [bp+6]
		les	bx, es:[bx+12h]

loc_2A120:
		mov	al, es:[bx]

loc_2A123:
		mov	ah, 0
		push	ax

loc_2A126:
		les	bx, [bp+6]

loc_2A129:
		mov	al, es:[bx+16h]
		mov	ah, 0

loc_2A12F:
		push	ax
		push	541Ah

loc_2A133:
		call	Interp_ResolveCachedGuarded
		add	sp, 0Ch

loc_2A13B:
		mov	[bp-2Ah], ax
		cmp	byte_6E682, 0
		jz	short loc_2A170
		mov	ax, [bp-56h]
		cmp	ax, [bp-40h]
		jnz	short loc_2A152
		cmp	ax, [bp-2Ah]
		jz	short loc_2A1A6

loc_2A152:				; CODE XREF: seg055:0F6Bj
		shl	word ptr [bp-56h], 8
		shl	word ptr [bp-40h], 8
		shl	word ptr [bp-2Ah], 8
		push	ss
		lea	ax, [bp-5Ah]
		push	ax
		push	3
		push	word_70E60
		call	Render_MeshPrimitive_21085
		jmp	short loc_2A1B6
; ���������������������������������������������������������������������������

loc_2A170:				; CODE XREF: seg055:0F63j
		cmp	byte_6E684, 0
		jz	short loc_2A18D
		lea	ax, [bp-2Eh]
		push	ax
		lea	ax, [bp-44h]
		push	ax
		lea	ax, [bp-5Ah]
		push	ax
		push	word_70E60
		push	cs
		call	near ptr Mesh_DrawTriangleWireframe
		jmp	short loc_2A1B6
; ���������������������������������������������������������������������������

loc_2A18D:				; CODE XREF: seg055:0F95j
		mov	ax, [bp-56h]
		add	ax, [bp-40h]
		add	ax, [bp-2Ah]
		mov	bx, 3
		xor	dx, dx
		div	bx
		mov	[bp-2Ah], ax
		mov	[bp-40h], ax
		mov	[bp-56h], ax

loc_2A1A6:				; CODE XREF: seg055:0F70j
		push	ss
		lea	ax, [bp-5Ah]
		push	ax
		push	3
		push	word_70E60
		call	Render_PolygonPrimitive_20848

loc_2A1B6:				; CODE XREF: seg055:0F8Ej seg055:0FABj
		add	sp, 8
		leave
		retf
; ���������������������������������������������������������������������������

loc_2A1BB:				; DATA XREF: seg339:1681o
		push	bp
		mov	bp, sp
		mov	al, 5
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_2A1C2:				; DATA XREF: seg339:1649o
		push	bp
		mov	bp, sp
		sub	sp, 46h
		les	bx, [bp+6]
		les	bx, es:[bx+0Ah]
		mov	ax, es:[bx+1]
		mov	[bp-46h], ax
		mov	ax, es:[bx+3]
		mov	[bp-44h], ax
		les	bx, [bp+6]

loc_2A1E0:
		mov	al, es:[bx+18h]
		mov	ah, 0

loc_2A1E6:
		mov	[bp-40h], ax
		mov	al, es:[bx+19h]

loc_2A1ED:
		mov	ah, 0
		mov	[bp-3Eh], ax
		les	bx, es:[bx+0Eh]
		mov	ax, es:[bx+1]
		mov	[bp-30h], ax
		mov	ax, es:[bx+3]
		mov	[bp-2Eh], ax
		les	bx, [bp+6]
		mov	al, es:[bx+1Ah]
		mov	ah, 0
		mov	[bp-2Ah], ax
		mov	al, es:[bx+1Bh]
		mov	ah, 0
		mov	[bp-28h], ax
		les	bx, es:[bx+12h]
		mov	ax, es:[bx+1]

loc_2A221:
		mov	[bp-1Ah], ax
		mov	ax, es:[bx+3]
		mov	[bp-18h], ax
		les	bx, [bp+6]
		mov	al, es:[bx+1Ch]
		mov	ah, 0
		mov	[bp-14h], ax

loc_2A237:
		mov	al, es:[bx+1Dh]
		mov	ah, 0
		mov	[bp-12h], ax
		cmp	byte_6E683, 0
		jnz	short loc_2A24A
		jmp	loc_2A2DA
; ���������������������������������������������������������������������������

loc_2A24A:				; CODE XREF: seg055:1065j
		cmp	word ptr es:[bx+16h], 0
		jnz	short loc_2A254
		jmp	locret_2A33E
; ���������������������������������������������������������������������������

loc_2A254:				; CODE XREF: seg055:106Fj
		shl	word ptr [bp-3Eh], 8
		shl	word ptr [bp-40h], 8
		shl	word ptr [bp-28h], 8
		shl	word ptr [bp-2Ah], 8
		shl	word ptr [bp-12h], 8
		shl	word ptr [bp-14h], 8
		mov	eax, es:[bx+2]
		sar	eax, 8
		mov	[bp-4],	eax
		push	eax
		push	541Ah
		call	Interp_ResolveCached
		add	sp, 6
		push	ax
		push	541Ah
		call	Text_ResolveTruncated
		add	sp, 4
		push	dx
		push	ax
		les	bx, [bp+6]
		mov	bx, es:[bx+16h]
		mov	al, [bx+5]
		mov	ah, 0
		push	ax
		push	0
		mov	bx, [bp+6]
		mov	bx, es:[bx+16h]
		mov	al, [bx+4]
		push	ax
		mov	bx, [bp+6]
		mov	bx, es:[bx+16h]
		push	large dword ptr	[bx]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	ss
		lea	ax, [bp-46h]
		push	ax
		push	3
		push	word_70E60
		call	Render_MeshPrimitive_216F6
		add	sp, 12h
		jmp	short locret_2A33E
; ���������������������������������������������������������������������������

loc_2A2DA:				; CODE XREF: seg055:1067j
		cmp	byte_6E684, 0
		jz	short loc_2A2F7

loc_2A2E1:
		lea	ax, [bp-1Ah]
		push	ax
		lea	ax, [bp-30h]
		push	ax
		lea	ax, [bp-46h]
		push	ax
		push	word_70E60
		push	cs
		call	near ptr Mesh_DrawTriangleWireframe
		jmp	short loc_2A33B
; ���������������������������������������������������������������������������

loc_2A2F7:				; CODE XREF: seg055:10FFj
		push	0
		les	bx, [bp+6]
		mov	bx, es:[bx+16h]
		mov	al, [bx+4]
		push	ax
		mov	bx, [bp+6]
		mov	bx, es:[bx+16h]
		push	large dword ptr	[bx]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		mov	bx, ax
		mov	es, dx
		mov	al, es:[bx]

loc_2A320:
		mov	ah, 0
		mov	[bp-16h], ax
		mov	[bp-2Ch], ax
		mov	[bp-42h], ax
		push	ss
		lea	ax, [bp-46h]
		push	ax
		push	3

loc_2A332:
		push	word_70E60

loc_2A336:
		call	Render_PolygonPrimitive_20848

loc_2A33B:				; CODE XREF: seg055:1115j
		add	sp, 8

locret_2A33E:				; CODE XREF: seg055:1071j seg055:10F8j
		leave
		retf
; ���������������������������������������������������������������������������

loc_2A340:				; DATA XREF: seg339:165Do
		push	bp

loc_2A341:
		mov	bp, sp
		mov	al, 6
		pop	bp

locret_2A346:
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,31L — variante de sub_29732/sub_29BDA (setup face + couleur) : setup de face
; triangulaire, variante additionnelle.
; ==============================================================================================
Mesh_FaceSetupVariant	proc far		; CODE XREF: AircraftComponent_LoadWithDwordFields_94D40+43DP

arg_0		= dword	ptr  6
arg_4		= dword	ptr  0Ah
arg_8		= dword	ptr  0Eh
arg_C		= dword	ptr  12h
arg_10		= dword	ptr  16h

		push	bp
		mov	bp, sp
		push	large [bp+arg_10]
		push	large [bp+arg_C]
		push	large [bp+arg_8]
		push	large [bp+arg_4]
		push	large [bp+arg_0]
		push	cs
		call	near ptr Mesh_FaceSetup
		add	sp, 14h
		les	bx, [bp+arg_10]
		mov	al, es:[bx+4]
		push	ax
		mov	ax, word ptr [bp+arg_0]
		add	ax, 26h	; '&'
		push	word ptr [bp+arg_0+2]
		push	ax
		push	cs
		call	near ptr Render_DamageTintResolve
		add	sp, 6
		pop	bp
		retf
Mesh_FaceSetupVariant	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,40L — variante de sub_29C13 (shading Gouraud + flag matériau) sur offset différent :
; setup de shading Gouraud, variante.
; ==============================================================================================
Mesh_GouraudSetupVariant	proc far		; CODE XREF: AircraftComponent_LoadWithDwordFields_94D40+46EP

var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= dword	ptr  0Ah
arg_8		= dword	ptr  0Eh
arg_C		= dword	ptr  12h
arg_10		= dword	ptr  16h

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	large [bp+arg_10]
		push	large [bp+arg_C]
		push	large [bp+arg_8]
		push	large [bp+arg_4]
		push	large [bp+arg_0]
		push	cs
		call	near ptr Mesh_GouraudParamsInit
		add	sp, 14h
		mov	eax, [bp+arg_4]
		mov	[bp+var_4], eax
		les	bx, [bp+var_4]
		mov	al, es:[bx+28h]
		and	ax, 1
		les	bx, [bp+arg_0]
		and	byte ptr es:[bx+23h], 0FBh
		shl	al, 2
		or	es:[bx+23h], al
		les	bx, [bp+var_4]
		mov	al, es:[bx+26h]
		les	bx, [bp+arg_0]
		mov	es:[bx+20h], al
		les	bx, [bp+var_4]
		mov	al, es:[bx+27h]
		les	bx, [bp+arg_0]
		mov	es:[bx+21h], al
		leave
		retf
Mesh_GouraudSetupVariant	endp

; ���������������������������������������������������������������������������

loc_2A3E0:				; DATA XREF: seg339:1641o
		push	bp
		mov	bp, sp

loc_2A3E3:
		push	word ptr [bp+0Ah]
		push	large dword ptr	[bp+6]
		mov	ax, [bp+6]
		add	ax, 1Eh
		push	word ptr [bp+8]
		push	ax

loc_2A3F4:
		push	cs
		call	near ptr Mesh_FacePrepareIndirect
		add	sp, 0Ah
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_2A3FD:				; DATA XREF: seg339:1621o
		push	bp
		mov	bp, sp
		sub	sp, 46h
		les	bx, [bp+6]
		mov	eax, es:[bx+2]
		sar	eax, 8
		push	eax
		mov	al, es:[bx+22h]
		mov	ah, 0
		push	ax
		push	541Ah
		call	Gauge_ResolveAndApplyLabel
		add	sp, 8

loc_2A423:
		mov	[bp-2],	dx

loc_2A426:
		mov	[bp-4],	ax
		les	bx, [bp+6]

loc_2A42C:
		mov	al, es:[bx+23h]

loc_2A430:
		shr	ax, 2

loc_2A433:
		and	ax, 1

loc_2A436:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_2A45C
		cmp	dword ptr [bp-4], 0
		jnz	short loc_2A449
		mov	dl, es:[bx+20h]
		jmp	short loc_2A48C
; ���������������������������������������������������������������������������

loc_2A449:				; CODE XREF: seg055:1261j
		les	bx, [bp+6]
		mov	al, es:[bx+20h]
		mov	ah, 0
		les	bx, [bp-4]
		add	bx, ax
		mov	dl, es:[bx]
		jmp	short loc_2A48C
; ���������������������������������������������������������������������������

loc_2A45C:				; CODE XREF: seg055:125Aj
		les	bx, [bp+6]
		mov	al, es:[bx+21h]
		mov	ah, 0
		push	ax
		mov	eax, es:[bx+2]
		sar	eax, 8
		push	eax
		mov	al, es:[bx+22h]
		mov	ah, 0
		push	ax
		mov	al, es:[bx+20h]
		mov	ah, 0
		push	ax
		push	541Ah
		call	Interp_ResolveCachedGuarded
		add	sp, 0Ch
		mov	dl, al

loc_2A48C:				; CODE XREF: seg055:1267j seg055:127Aj
		les	bx, [bp+6]
		les	bx, es:[bx+0Ah]
		mov	ax, es:[bx+1]
		mov	[bp-46h], ax
		mov	ax, es:[bx+3]
		mov	[bp-44h], ax
		les	bx, [bp+6]
		mov	al, es:[bx+18h]
		mov	ah, 0
		mov	[bp-40h], ax
		mov	al, es:[bx+19h]
		mov	ah, 0
		mov	[bp-3Eh], ax
		les	bx, es:[bx+0Eh]
		mov	ax, es:[bx+1]
		mov	[bp-30h], ax
		mov	ax, es:[bx+3]
		mov	[bp-2Eh], ax
		les	bx, [bp+6]
		mov	al, es:[bx+1Ah]
		mov	ah, 0
		mov	[bp-2Ah], ax
		mov	al, es:[bx+1Bh]
		mov	ah, 0
		mov	[bp-28h], ax
		les	bx, es:[bx+12h]

loc_2A4E1:
		mov	ax, es:[bx+1]

loc_2A4E5:
		mov	[bp-1Ah], ax

loc_2A4E8:
		mov	ax, es:[bx+3]

loc_2A4EC:
		mov	[bp-18h], ax
		les	bx, [bp+6]
		mov	al, es:[bx+1Ch]
		mov	ah, 0
		mov	[bp-14h], ax
		mov	al, es:[bx+1Dh]
		mov	ah, 0
		mov	[bp-12h], ax
		mov	al, dl
		mov	ah, 0
		mov	[bp-16h], ax
		mov	[bp-2Ch], ax
		mov	[bp-42h], ax
		mov	al, byte_6E684
		mov	ah, 0
		or	ax, ax
		jnz	short loc_2A52C
		push	ss
		lea	ax, [bp-46h]
		push	ax
		push	3
		push	word_70E60
		call	Render_PolygonPrimitive_20848
		jmp	short loc_2A540
; ���������������������������������������������������������������������������

loc_2A52C:				; CODE XREF: seg055:1338j
		lea	ax, [bp-1Ah]
		push	ax

loc_2A530:
		lea	ax, [bp-30h]
		push	ax
		lea	ax, [bp-46h]
		push	ax
		push	word_70E60
		push	cs
		call	near ptr Mesh_DrawTriangleWireframe

loc_2A540:				; CODE XREF: seg055:134Aj
		add	sp, 8
		cmp	byte_6E683, 0
		jz	short locret_2A5B1
		les	bx, [bp+6]
		cmp	word ptr es:[bx+16h], 0
		jz	short locret_2A5B1
		shl	word ptr [bp-3Eh], 8
		shl	word ptr [bp-40h], 8
		shl	word ptr [bp-28h], 8
		shl	word ptr [bp-2Ah], 8
		shl	word ptr [bp-12h], 8
		shl	word ptr [bp-14h], 8
		push	large dword ptr	[bp-4]
		mov	bx, es:[bx+16h]
		mov	al, [bx+5]
		mov	ah, 0
		push	ax
		push	0
		mov	bx, [bp+6]
		mov	bx, es:[bx+16h]
		mov	al, [bx+4]
		push	ax
		mov	bx, [bp+6]
		mov	bx, es:[bx+16h]
		push	large dword ptr	[bx]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	ss
		lea	ax, [bp-46h]
		push	ax
		push	3
		push	word_70E60
		call	Render_MeshPrimitive_216F6
		add	sp, 12h

locret_2A5B1:				; CODE XREF: seg055:1368j seg055:1372j
		leave
		retf
; ���������������������������������������������������������������������������

loc_2A5B3:				; DATA XREF: seg339:1625o
		push	bp
		mov	bp, sp
		les	bx, [bp+6]
		and	byte ptr es:[bx+23h], 0FDh
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_2A5C0:				; DATA XREF: seg339:1635o
		push	bp
		mov	bp, sp
		mov	al, 7
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,61L — variante de sub_29A0D/sub_29DB3 (résolution teinte dommage) sur offset +0x27 :
; résolution de couleur teintée dommage, troisième variante.
; ==============================================================================================
Render_DamageTintResolveAlt2	proc far		; CODE XREF: Mesh_FaceSetupDamageTintAlt2+2Bp

var_6		= dword	ptr -6
var_2		= word ptr -2
arg_0		= dword	ptr  6
arg_4		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 6
		mov	al, [bp+arg_4]
		mov	ah, 0
		mov	[bp+var_2], ax
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 27h	; '''
		mov	word ptr [bp+var_6+2], ax
		mov	word ptr [bp+var_6], dx
		push	[bp+var_2]
		push	541Ah
		call	Table_LookupByRange

loc_2A5EF:
		add	sp, 4

loc_2A5F2:
		mov	dx, ax
		cmp	dx, 0FFFFh

loc_2A5F7:
		jz	short loc_2A610
		imul	ax, 0Fh
		mov	bx, word_72524
		add	bx, ax
		mov	al, byte ptr [bp+var_2]
		sub	al, [bx+6]
		les	bx, [bp+var_6]
		mov	es:[bx], al
		jmp	short loc_2A617
; ���������������������������������������������������������������������������

loc_2A610:				; CODE XREF: Render_DamageTintResolveAlt2:loc_2A5F7j
		les	bx, [bp+var_6]
		mov	byte ptr es:[bx], 0

loc_2A617:				; CODE XREF: Render_DamageTintResolveAlt2+47j
		cmp	dx, 0FFFFh
		jnz	short loc_2A626
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+26h], 0
		jmp	short locret_2A62D
; ���������������������������������������������������������������������������

loc_2A626:				; CODE XREF: Render_DamageTintResolveAlt2+53j
		les	bx, [bp+arg_0]
		mov	es:[bx+26h], dl

locret_2A62D:				; CODE XREF: Render_DamageTintResolveAlt2+5Dj
		leave
		retf
Render_DamageTintResolveAlt2	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,32L — appelle sub_294C0 puis sub_2A5C7 : setup de face avec couleur teintée dommage
; (variante).
; ==============================================================================================
Mesh_FaceSetupDamageTintAlt2	proc far		; CODE XREF: AircraftComponent_LoadWithDwordFields_94D40+498P

arg_0		= dword	ptr  6
arg_4		= dword	ptr  0Ah
arg_8		= dword	ptr  0Eh
arg_C		= dword	ptr  12h
arg_10		= dword	ptr  16h

		push	bp
		mov	bp, sp

loc_2A632:
		push	large [bp+arg_10]
		push	large [bp+arg_C]
		push	large [bp+arg_8]
		push	large [bp+arg_4]

loc_2A642:
		push	large [bp+arg_0]
		push	cs
		call	near ptr Mesh_FaceSetup
		add	sp, 14h
		les	bx, [bp+arg_10]
		mov	al, es:[bx+4]
		push	ax
		push	large [bp+arg_0]
		push	cs
		call	near ptr Render_DamageTintResolveAlt2
		add	sp, 6
		pop	bp
		retf
Mesh_FaceSetupDamageTintAlt2	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,33L — variante finale du cluster shading/couleur (copie de 2 champs couleur) : setup de
; shading, variante finale du cluster.
; ==============================================================================================
Mesh_GouraudCopyChannelsFinal	proc far		; CODE XREF: AircraftComponent_LoadWithDwordFields_94D40+4C9P

var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= dword	ptr  0Ah
arg_8		= dword	ptr  0Eh
arg_C		= dword	ptr  12h
arg_10		= dword	ptr  16h

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	large [bp+arg_10]
		push	large [bp+arg_C]
		push	large [bp+arg_8]
		push	large [bp+arg_4]
		push	large [bp+arg_0]
		push	cs
		call	near ptr Mesh_GouraudParamsInit
		add	sp, 14h
		mov	eax, [bp+arg_4]
		mov	[bp+var_4], eax
		les	bx, [bp+var_4]
		mov	al, es:[bx+26h]
		les	bx, [bp+arg_0]
		mov	es:[bx+1Eh], al
		les	bx, [bp+var_4]
		mov	al, es:[bx+27h]
		les	bx, [bp+arg_0]
		mov	es:[bx+1Fh], al
		leave
		retf
Mesh_GouraudCopyChannelsFinal	endp

; ���������������������������������������������������������������������������

loc_2A6A9:				; DATA XREF: seg339:161Do
		push	bp
		mov	bp, sp
		sub	sp, 46h
		push	si
		push	di
		mov	di, [bp+0Ah]
		les	bx, [bp+6]
		mov	eax, es:[bx+6]
		mov	[bp-4],	eax
		mov	[bp-6],	di
		les	bx, [bp-4]
		mov	eax, es:[bx+19h]
		mov	[bp-0Ah], eax
		les	bx, [bp+6]
		les	bx, es:[bx+0Ah]
		mov	al, es:[bx+11h]
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jnz	short loc_2A732
		mov	ax, [bp-8]
		mov	dx, [bp-0Ah]

loc_2A6E9:
		add	dx, 0Ch

loc_2A6EC:
		mov	[bp-0Ch], ax
		mov	[bp-0Eh], dx

loc_2A6F2:
		les	si, [bp-0Eh]
		mov	eax, es:[si]
		mov	[bp-2Eh], eax
		mov	eax, es:[si+4]
		mov	[bp-2Ah], eax
		mov	eax, es:[si+8]
		mov	[bp-26h], eax
		lea	ax, [bp-2Eh]
		push	ax
		push	word ptr [bp-6]
		push	5A9Ah
		call	Render_FaceDotProductTest
		add	sp, 6
		les	bx, [bp+6]

loc_2A724:
		les	bx, es:[bx+0Ah]
		mov	es:[bx], al
		or	byte ptr es:[bx+11h], 1
		jmp	short $+2

loc_2A732:				; CODE XREF: seg055:1501j
		mov	[bp-10h], di
		les	bx, [bp-4]

loc_2A738:
		mov	eax, es:[bx+1Dh]

loc_2A73D:
		mov	[bp-14h], eax
		les	bx, [bp+6]
		les	bx, es:[bx+0Eh]
		mov	al, es:[bx+11h]
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jnz	short loc_2A7A4
		mov	ax, [bp-12h]
		mov	dx, [bp-14h]
		add	dx, 0Ch
		mov	[bp-16h], ax
		mov	[bp-18h], dx
		les	si, [bp-18h]
		mov	eax, es:[si]
		mov	[bp-3Ah], eax
		mov	eax, es:[si+4]
		mov	[bp-36h], eax
		mov	eax, es:[si+8]
		mov	[bp-32h], eax
		lea	ax, [bp-3Ah]
		push	ax
		push	word ptr [bp-10h]
		push	5A9Ah
		call	Render_FaceDotProductTest
		add	sp, 6
		les	bx, [bp+6]
		les	bx, es:[bx+0Eh]
		mov	es:[bx], al
		or	byte ptr es:[bx+11h], 1
		jmp	short $+2

loc_2A7A4:				; CODE XREF: seg055:1573j
		mov	[bp-1Ah], di
		les	bx, [bp-4]
		mov	eax, es:[bx+21h]
		mov	[bp-1Eh], eax
		les	bx, [bp+6]
		les	bx, es:[bx+12h]
		mov	al, es:[bx+11h]
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jnz	short loc_2A816
		mov	ax, [bp-1Ch]
		mov	dx, [bp-1Eh]
		add	dx, 0Ch
		mov	[bp-20h], ax
		mov	[bp-22h], dx
		les	si, [bp-22h]
		mov	eax, es:[si]
		mov	[bp-46h], eax

loc_2A7E1:
		mov	eax, es:[si+4]

loc_2A7E6:
		mov	[bp-42h], eax

loc_2A7EA:
		mov	eax, es:[si+8]

loc_2A7EF:
		mov	[bp-3Eh], eax

loc_2A7F3:
		lea	ax, [bp-46h]
		push	ax
		push	word ptr [bp-1Ah]
		push	5A9Ah
		call	Render_FaceDotProductTest
		add	sp, 6
		les	bx, [bp+6]
		les	bx, es:[bx+12h]
		mov	es:[bx], al
		or	byte ptr es:[bx+11h], 1
		jmp	short $+2

loc_2A816:				; CODE XREF: seg055:15E5j
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_2A81A:				; DATA XREF: seg339:15FDo
		push	bp
		mov	bp, sp
		sub	sp, 60h
		push	si
		push	di

loc_2A822:
		les	bx, [bp+6]
		les	bx, es:[bx+0Ah]
		mov	ax, es:[bx+1]
		mov	[bp-60h], ax
		mov	ax, es:[bx+3]
		mov	[bp-5Eh], ax
		les	bx, [bp+6]
		mov	al, es:[bx+18h]
		mov	ah, 0
		shl	ax, 8
		mov	[bp-5Ah], ax
		mov	al, es:[bx+19h]
		mov	ah, 0
		shl	ax, 8
		mov	[bp-58h], ax
		les	bx, es:[bx+0Ah]
		mov	al, es:[bx]
		mov	ah, 0
		mov	si, ax
		les	bx, [bp+6]
		mov	al, es:[bx+1Fh]
		mov	ah, 0
		push	ax
		mov	ax, es:[bx+0Ch]
		mov	dx, es:[bx+0Ah]
		add	dx, 9
		mov	[bp-2],	ax
		mov	[bp-4],	dx
		les	bx, [bp-4]
		mov	eax, es:[bx]
		mov	[bp-8],	eax
		sar	eax, 8
		push	eax
		push	si
		les	bx, [bp+6]
		mov	al, es:[bx+1Eh]
		mov	ah, 0
		push	ax
		push	541Ah
		call	Interp_ResolveCachedGuarded
		add	sp, 0Ch
		mov	[bp-5Ch], ax
		les	bx, [bp+6]
		les	bx, es:[bx+0Eh]
		mov	ax, es:[bx+1]
		mov	[bp-4Ah], ax
		mov	ax, es:[bx+3]
		mov	[bp-48h], ax
		les	bx, [bp+6]
		mov	al, es:[bx+1Ah]
		mov	ah, 0
		shl	ax, 8
		mov	[bp-44h], ax
		mov	al, es:[bx+1Bh]
		mov	ah, 0
		shl	ax, 8
		mov	[bp-42h], ax
		les	bx, es:[bx+0Eh]
		mov	al, es:[bx]
		mov	ah, 0
		mov	di, ax
		les	bx, [bp+6]
		mov	al, es:[bx+1Fh]
		mov	ah, 0
		push	ax
		mov	ax, es:[bx+10h]
		mov	dx, es:[bx+0Eh]

loc_2A8EF:
		add	dx, 9

loc_2A8F2:
		mov	[bp-0Ah], ax
		mov	[bp-0Ch], dx

loc_2A8F8:
		les	bx, [bp-0Ch]
		mov	eax, es:[bx]
		mov	[bp-10h], eax
		sar	eax, 8
		push	eax
		push	di
		les	bx, [bp+6]
		mov	al, es:[bx+1Eh]
		mov	ah, 0
		push	ax
		push	541Ah
		call	Interp_ResolveCachedGuarded
		add	sp, 0Ch
		mov	[bp-46h], ax
		les	bx, [bp+6]
		les	bx, es:[bx+12h]
		mov	ax, es:[bx+1]
		mov	[bp-34h], ax
		mov	ax, es:[bx+3]
		mov	[bp-32h], ax
		les	bx, [bp+6]
		mov	al, es:[bx+1Ch]
		mov	ah, 0
		shl	ax, 8
		mov	[bp-2Eh], ax
		mov	al, es:[bx+1Dh]
		mov	ah, 0
		shl	ax, 8
		mov	[bp-2Ch], ax
		les	bx, es:[bx+12h]
		mov	al, es:[bx]
		mov	ah, 0
		mov	[bp-12h], ax
		les	bx, [bp+6]
		mov	al, es:[bx+1Fh]
		mov	ah, 0
		push	ax
		mov	ax, es:[bx+14h]
		mov	dx, es:[bx+12h]
		add	dx, 9
		mov	[bp-14h], ax
		mov	[bp-16h], dx
		les	bx, [bp-16h]
		mov	eax, es:[bx]
		mov	[bp-1Ah], eax
		sar	eax, 8
		push	eax
		push	word ptr [bp-12h]
		les	bx, [bp+6]
		mov	al, es:[bx+1Eh]
		mov	ah, 0
		push	ax
		push	541Ah
		call	Interp_ResolveCachedGuarded
		add	sp, 0Ch
		mov	[bp-30h], ax
		cmp	byte_6E682, 0
		jz	short loc_2A9D7
		mov	ax, [bp-5Ch]
		cmp	ax, [bp-46h]
		jnz	short loc_2A9B9
		cmp	ax, [bp-30h]
		jz	short loc_2AA0D

loc_2A9B9:				; CODE XREF: seg055:17D2j
		shl	word ptr [bp-5Ch], 8
		shl	word ptr [bp-46h], 8
		shl	word ptr [bp-30h], 8
		push	ss
		lea	ax, [bp-60h]
		push	ax
		push	3
		push	word_70E60
		call	Render_MeshPrimitive_21085
		jmp	short loc_2AA1D
; ���������������������������������������������������������������������������

loc_2A9D7:				; CODE XREF: seg055:17CAj
		cmp	byte_6E684, 0
		jz	short loc_2A9F4
		lea	ax, [bp-34h]
		push	ax
		lea	ax, [bp-4Ah]
		push	ax
		lea	ax, [bp-60h]

loc_2A9E9:
		push	ax

loc_2A9EA:
		push	word_70E60
		push	cs
		call	near ptr Mesh_DrawTriangleWireframe

loc_2A9F2:
		jmp	short loc_2AA1D
; ���������������������������������������������������������������������������

loc_2A9F4:				; CODE XREF: seg055:17FCj
		mov	ax, [bp-5Ch]
		add	ax, [bp-46h]
		add	ax, [bp-30h]
		mov	bx, 3
		xor	dx, dx
		div	bx
		mov	[bp-30h], ax
		mov	[bp-46h], ax
		mov	[bp-5Ch], ax

loc_2AA0D:				; CODE XREF: seg055:17D7j
		push	ss
		lea	ax, [bp-60h]
		push	ax
		push	3
		push	word_70E60
		call	Render_PolygonPrimitive_20848

loc_2AA1D:				; CODE XREF: seg055:17F5j
					; seg055:loc_2A9F2j
		add	sp, 8
		cmp	byte_6E683, 0
		jz	short loc_2AAA1
		les	bx, [bp+6]
		cmp	word ptr es:[bx+16h], 0
		jz	short loc_2AAA1

loc_2AA31:
		mov	eax, es:[bx+2]

loc_2AA36:
		sar	eax, 8
		push	eax
		mov	ax, si
		add	ax, di
		add	ax, [bp-12h]
		mov	bx, 3
		cwd
		idiv	bx
		push	ax
		push	541Ah
		call	Gauge_ResolveAndApplyLabel
		add	sp, 8
		mov	[bp-1Ch], dx
		mov	[bp-1Eh], ax
		push	dx
		push	ax
		les	bx, [bp+6]
		mov	bx, es:[bx+16h]
		mov	al, [bx+5]
		mov	ah, 0
		push	ax
		push	0
		mov	bx, [bp+6]
		mov	bx, es:[bx+16h]
		mov	al, [bx+4]
		push	ax
		mov	bx, [bp+6]
		mov	bx, es:[bx+16h]
		push	large dword ptr	[bx]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	ss
		lea	ax, [bp-60h]
		push	ax
		push	3
		push	word_70E60
		call	Render_MeshPrimitive_216F6
		add	sp, 12h

loc_2AAA1:				; CODE XREF: seg055:1845j seg055:184Fj
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_2AAA5:				; DATA XREF: seg339:1611o
		push	bp
		mov	bp, sp
		mov	al, 8
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_2AAAC:				; DATA XREF: seg339:15F5o
		push	bp
		mov	bp, sp
		push	word ptr [bp+0Ah]
		push	large dword ptr	[bp+6]
		mov	ax, [bp+6]
		add	ax, 1Eh
		push	word ptr [bp+8]
		push	ax
		push	cs
		call	near ptr Mesh_FacePrepareIndirect
		add	sp, 0Ah
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_2AAC9:				; DATA XREF: seg339:15D5o
		push	bp
		mov	bp, sp
		sub	sp, 42h
		les	bx, [bp+6]
		les	bx, es:[bx+0Ah]
		mov	ax, es:[bx+1]
		mov	[bp-42h], ax
		mov	ax, es:[bx+3]

loc_2AAE1:
		mov	[bp-40h], ax
		les	bx, [bp+6]

loc_2AAE7:
		mov	al, es:[bx+18h]
		mov	ah, 0

loc_2AAED:
		shl	ax, 8

loc_2AAF0:
		mov	[bp-3Ch], ax

loc_2AAF3:
		mov	al, es:[bx+19h]
		mov	ah, 0
		shl	ax, 8
		mov	[bp-3Ah], ax
		les	bx, es:[bx+0Eh]
		mov	ax, es:[bx+1]
		mov	[bp-2Ch], ax
		mov	ax, es:[bx+3]
		mov	[bp-2Ah], ax
		les	bx, [bp+6]
		mov	al, es:[bx+1Ah]
		mov	ah, 0
		shl	ax, 8
		mov	[bp-26h], ax
		mov	al, es:[bx+1Bh]
		mov	ah, 0
		shl	ax, 8
		mov	[bp-24h], ax
		les	bx, es:[bx+12h]
		mov	ax, es:[bx+1]
		mov	[bp-16h], ax
		mov	ax, es:[bx+3]
		mov	[bp-14h], ax

loc_2AB3E:
		les	bx, [bp+6]

loc_2AB41:
		mov	al, es:[bx+1Ch]
		mov	ah, 0

loc_2AB47:
		shl	ax, 8
		mov	[bp-10h], ax
		mov	al, es:[bx+1Dh]
		mov	ah, 0
		shl	ax, 8
		mov	[bp-0Eh], ax
		xor	ax, ax
		mov	[bp-12h], ax
		mov	[bp-28h], ax
		mov	[bp-3Eh], ax
		cmp	byte_6E683, 0
		jz	short loc_2ABD0
		mov	eax, es:[bx+2]
		sar	eax, 8
		push	eax
		mov	al, es:[bx+22h]
		mov	ah, 0
		push	ax
		push	541Ah
		call	Gauge_ResolveAndApplyLabel
		add	sp, 8
		push	dx
		push	ax
		les	bx, [bp+6]
		mov	bx, es:[bx+16h]
		mov	al, [bx+5]
		mov	ah, 0
		push	ax
		push	0
		mov	bx, [bp+6]
		mov	bx, es:[bx+16h]
		mov	al, [bx+4]
		push	ax
		mov	bx, [bp+6]
		mov	bx, es:[bx+16h]
		push	large dword ptr	[bx]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	ss
		lea	ax, [bp-42h]
		push	ax
		push	3
		push	word_70E60
		call	Render_MeshPrimitive_216F6
		add	sp, 12h
		jmp	short locret_2AC00
; ���������������������������������������������������������������������������

loc_2ABD0:				; CODE XREF: seg055:1989j
		cmp	byte_6E684, 0
		jz	short loc_2ABED
		lea	ax, [bp-16h]
		push	ax
		lea	ax, [bp-2Ch]
		push	ax

loc_2ABDF:
		lea	ax, [bp-42h]
		push	ax
		push	word_70E60
		push	cs
		call	near ptr Mesh_DrawTriangleWireframe
		jmp	short loc_2ABFD
; ���������������������������������������������������������������������������

loc_2ABED:				; CODE XREF: seg055:19F5j
		push	ss
		lea	ax, [bp-42h]
		push	ax

loc_2ABF2:
		push	3
		push	word_70E60
		call	Render_PolygonPrimitive_20848

loc_2ABFD:				; CODE XREF: seg055:1A0Bj
		add	sp, 8

locret_2AC00:				; CODE XREF: seg055:19EEj
		leave
		retf
; ���������������������������������������������������������������������������

loc_2AC02:				; DATA XREF: seg339:15D9o
		push	bp
		mov	bp, sp
		les	bx, [bp+6]
		and	byte ptr es:[bx+23h], 0FDh
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_2AC0F:				; DATA XREF: seg339:15E9o
		push	bp
		mov	bp, sp
		mov	al, 9
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_2AC16:				; DATA XREF: seg339:4DDAo
		push	bp
		mov	bp, sp
		mov	word_72372, 11E8h
		mov	word_72372, 11ECh
		mov	word_72372, 1705h
		mov	word_72372, 1729h
		mov	word_72389, 11E8h

loc_2AC37:
		mov	word_72389, 11ECh

loc_2AC3D:
		mov	word_72389, 1705h
		mov	word_72389, 16E1h
		mov	word_723A3, 11E8h
		mov	word_723A3, 11ECh
		mov	word_723A3, 1705h
		mov	word_723A3, 1729h
		mov	word_723A3, 16BDh
		mov	word_723BA, 11E8h
		mov	word_723BA, 11ECh
		mov	word_723BA, 1705h
		mov	word_723D0, 1691h
		and	byte_723D5, 0FDh
		and	byte_723D5, 0FEh
		mov	word_723BA, 1695h
		mov	word_723D0, 16B9h
		mov	word_723D6, 11E8h
		mov	word_723D6, 11ECh
		mov	word_723D6, 1705h
		mov	word_723D6, 166Dh
		mov	word_723EE, 11E8h
		mov	word_723EE, 11ECh
		mov	word_723EE, 1705h
		mov	word_723EE, 1649h
		mov	word_72404, 0
		mov	word_7240C, 11E8h
		mov	word_7240C, 11ECh
		mov	word_7240C, 1705h

loc_2ACDD:
		mov	word_7240C, 1649h
		mov	word_72422, 0
		mov	word_7242A, 1691h

loc_2ACEF:
		and	byte_7242F, 0FDh

loc_2ACF4:
		and	byte_7242F, 0FEh
		mov	word_7240C, 1621h
		mov	word_7242A, 1645h
		mov	word_72430, 11E8h
		mov	word_72430, 11ECh
		mov	word_72430, 1705h
		mov	word_72430, 1649h
		mov	word_72446, 0
		mov	word_72430, 15FDh
		mov	word_72450, 11E8h

loc_2AD2F:
		mov	word_72450, 11ECh
		mov	word_72450, 1705h

loc_2AD3B:
		mov	word_72450, 1649h

loc_2AD41:
		mov	word_72466, 0
		mov	word_7246E, 1691h
		and	byte_72473, 0FDh
		and	byte_72473, 0FEh
		mov	word_72450, 15D5h

loc_2AD5D:
		mov	word_7246E, 15F9h
		pop	bp
		retf
seg055		ends
