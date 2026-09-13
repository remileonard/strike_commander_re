seg149		segment	byte public 'CODE' use16
		assume cs:seg149
		;org 6
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; far, référencée via vtable (DATA XREF seg216) — lit l'adresse de base du port du contrôleur
; CRT (offset 0x63 de la zone de données BIOS, segment 0x40), ajoute 6 et la stocke dans
; word_70EA0. Détection matérielle classique CGA/mono (0x3D4/0x3B4) pour accès direct au
; matériel vidéo. Référencée par TextRenderer_Main (sub_27477) et
; TextRenderer_EncodeCharB_5E2A3 (seg142).
; ==============================================================================================
Video_ReadCRTCPortBase_5E7D6	proc far		; CODE XREF: TextRenderer_Main:loc_274BBP
					; TextRenderer_EncodeCharB_5E2A3+25P
		push	es
		mov	ax, 40h	; '@'
		mov	es, ax
		assume es:nothing

loc_5E7DC:				; DATA XREF: seg216:056Eo
		mov	dx, es:63h

loc_5E7E1:
		add	dl, 6
		mov	word_70EA0, dx
		pop	es
		assume es:nothing
		retf
Video_ReadCRTCPortBase_5E7D6	endp

seg149		ends
