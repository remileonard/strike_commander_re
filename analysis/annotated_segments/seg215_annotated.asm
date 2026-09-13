seg215		segment	byte public 'UNK' use16
		assume cs:seg215
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
a_iff		db '.IFF',0             ; DATA XREF: seg009:0347o
					; IFF_LoadModelMain+9Eo ...
seg215		ends
