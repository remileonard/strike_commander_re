seg094		segment	byte public 'CODE' use16
		assume cs:seg094
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������


sub_2F050	proc far		; CODE XREF: Palette_Upload_2CDE1:loc_2CE5CP
					; DATA XREF: seg170:03CEo ...
		mov	dx, word_47032

loc_2F054:				; CODE XREF: sub_2F050+7j
		in	al, dx
		test	al, 8
		jnz	short loc_2F054

loc_2F059:				; CODE XREF: sub_2F050+Cj
		in	al, dx
		test	al, 8
		jz	short loc_2F059
		retf
sub_2F050	endp

seg094		ends
