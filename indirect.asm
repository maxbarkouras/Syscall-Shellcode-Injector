.code

NtCreateTimer PROC
	mov rax, gs:[60h]                   ; Load PEB into RAX.
NtCreateTimer_Check_X_X_XXXX:               ; Check major version.
	cmp dword ptr [rax+118h], 10
	je  NtCreateTimer_Check_10_0_XXXX
	jmp NtCreateTimer_SystemCall_Unknown
NtCreateTimer_Check_10_0_XXXX:              ; Check build number for Windows 10.
	cmp word ptr [rax+120h], 10240
	je  NtCreateTimer_SystemCall_10_0_10240
	cmp word ptr [rax+120h], 10586
	je  NtCreateTimer_SystemCall_10_0_10586
	cmp word ptr [rax+120h], 14393
	je  NtCreateTimer_SystemCall_10_0_14393
	cmp word ptr [rax+120h], 15063
	je  NtCreateTimer_SystemCall_10_0_15063
	cmp word ptr [rax+120h], 16299
	je  NtCreateTimer_SystemCall_10_0_16299
	cmp word ptr [rax+120h], 17134
	je  NtCreateTimer_SystemCall_10_0_17134
	cmp word ptr [rax+120h], 17763
	je  NtCreateTimer_SystemCall_10_0_17763
	cmp word ptr [rax+120h], 18362
	je  NtCreateTimer_SystemCall_10_0_18362
	cmp word ptr [rax+120h], 18363
	je  NtCreateTimer_SystemCall_10_0_18363
	cmp word ptr [rax+120h], 19041
	je  NtCreateTimer_SystemCall_10_0_19041
	cmp word ptr [rax+120h], 19042
	je  NtCreateTimer_SystemCall_10_0_19042
	cmp word ptr [rax+120h], 19043
	je  NtCreateTimer_SystemCall_10_0_19043
	cmp word ptr [rax+120h], 19044
	je  NtCreateTimer_SystemCall_10_0_19044
	cmp word ptr [rax+120h], 19045
	je  NtCreateTimer_SystemCall_10_0_19045
	cmp word ptr [rax+120h], 22000			; START OF WINODWS 11
	je  NtCreateTimer_SystemCall_10_0_22000
	cmp word ptr [rax+120h], 22621
	je  NtCreateTimer_SystemCall_10_0_22621
	cmp word ptr [rax+120h], 22631
	je  NtCreateTimer_SystemCall_10_0_22631
	jmp NtCreateTimer_SystemCall_Unknown
NtCreateTimer_SystemCall_10_0_10240:        ; Windows 10.0.10240 (1507)
	mov eax, 00b4h
	jmp NtCreateTimer_Epilogue
NtCreateTimer_SystemCall_10_0_10586:        ; Windows 10.0.10586 (1511)
	mov eax, 00b5h
	jmp NtCreateTimer_Epilogue
NtCreateTimer_SystemCall_10_0_14393:        ; Windows 10.0.14393 (1607)
	mov eax, 00b7h
	jmp NtCreateTimer_Epilogue
NtCreateTimer_SystemCall_10_0_15063:        ; Windows 10.0.15063 (1703)
	mov eax, 00bah
	jmp NtCreateTimer_Epilogue
NtCreateTimer_SystemCall_10_0_16299:        ; Windows 10.0.16299 (1709)
	mov eax, 00bbh
	jmp NtCreateTimer_Epilogue
NtCreateTimer_SystemCall_10_0_17134:        ; Windows 10.0.17134 (1803)
	mov eax, 00bch
	jmp NtCreateTimer_Epilogue
NtCreateTimer_SystemCall_10_0_17763:        ; Windows 10.0.17763 (1809)
	mov eax, 00bdh
	jmp NtCreateTimer_Epilogue
NtCreateTimer_SystemCall_10_0_18362:        ; Windows 10.0.18362 (1903)
	mov eax, 00beh
	jmp NtCreateTimer_Epilogue
NtCreateTimer_SystemCall_10_0_18363:        ; Windows 10.0.18363 (1909)
	mov eax, 00beh
	jmp NtCreateTimer_Epilogue
NtCreateTimer_SystemCall_10_0_19041:        ; Windows 10.0.19041 (2004)
	mov eax, 00c2h
	jmp NtCreateTimer_Epilogue
NtCreateTimer_SystemCall_10_0_19042:        ; Windows 10.0.19042 (20H2)
	mov eax, 00c2h
	jmp NtCreateTimer_Epilogue
NtCreateTimer_SystemCall_10_0_19043:        ; Windows 10.0.19043 (21H1)
	mov eax, 00c2h
	jmp NtCreateTimer_Epilogue
NtCreateTimer_SystemCall_10_0_19044:        ; Windows 10.0.19044 (21H2)
	mov eax, 00c3h
	jmp NtCreateTimer_Epilogue
NtCreateTimer_SystemCall_10_0_19045:        ; Windows 10.0.19045 (22H2)
	mov eax, 00c3h
	jmp NtCreateTimer_Epilogue
NtCreateTimer_SystemCall_10_0_22000:        ; Windows 10.0.22000 (21H2 WIN 11)
	mov eax, 00c8h
	jmp NtCreateTimer_Epilogue
NtCreateTimer_SystemCall_10_0_22621:        ; Windows 10.0.22621 (22H2 WIN 11) 
	mov eax, 00c9h
	jmp NtCreateTimer_Epilogue
NtCreateTimer_SystemCall_10_0_22631:        ; Windows 10.0.22631 (23H2 WIN 11)
	mov eax, 00c9h
	jmp NtCreateTimer_Epilogue
NtCreateTimer_SystemCall_Unknown:           ; Unknown/unsupported version.
	ret
NtCreateTimer_Epilogue:
	mov r10, rcx
	syscall
	ret
NtCreateTimer ENDP

NtSetTimer PROC
	mov rax, gs:[60h]                ; Load PEB into RAX.
NtSetTimer_Check_X_X_XXXX:               ; Check major version.
	cmp dword ptr [rax+118h], 10
	je  NtSetTimer_Check_10_0_XXXX
	jmp NtSetTimer_SystemCall_Unknown
NtSetTimer_Check_10_0_XXXX:              ; Check build number for Windows 10.
	cmp word ptr [rax+120h], 10240
	je  NtSetTimer_SystemCall_10_0_10240
	cmp word ptr [rax+120h], 10586
	je  NtSetTimer_SystemCall_10_0_10586
	cmp word ptr [rax+120h], 14393
	je  NtSetTimer_SystemCall_10_0_14393
	cmp word ptr [rax+120h], 15063
	je  NtSetTimer_SystemCall_10_0_15063
	cmp word ptr [rax+120h], 16299
	je  NtSetTimer_SystemCall_10_0_16299
	cmp word ptr [rax+120h], 17134
	je  NtSetTimer_SystemCall_10_0_17134
	cmp word ptr [rax+120h], 17763
	je  NtSetTimer_SystemCall_10_0_17763
	cmp word ptr [rax+120h], 18362
	je  NtSetTimer_SystemCall_10_0_18362
	cmp word ptr [rax+120h], 18363
	je  NtSetTimer_SystemCall_10_0_18363
	cmp word ptr [rax+120h], 19041
	je  NtSetTimer_SystemCall_10_0_19041
	cmp word ptr [rax+120h], 19042
	je  NtSetTimer_SystemCall_10_0_19042
	cmp word ptr [rax+120h], 19043
	je  NtSetTimer_SystemCall_10_0_19043
	cmp word ptr [rax+120h], 19044
	je  NtSetTimer_SystemCall_10_0_19044
	cmp word ptr [rax+120h], 19045
	je  NtSetTimer_SystemCall_10_0_19045
	cmp word ptr [rax+120h], 22000		 ; START OF WINODWS 11
	je  NtSetTimer_SystemCall_10_0_22000
	cmp word ptr [rax+120h], 22621
	je  NtSetTimer_SystemCall_10_0_22621
	cmp word ptr [rax+120h], 22631
	je  NtSetTimer_SystemCall_10_0_22631
	jmp NtSetTimer_SystemCall_Unknown
NtSetTimer_SystemCall_10_0_10240:        ; Windows 10.0.10240 (1507)
	mov eax, 0062h
	jmp NtSetTimer_Epilogue
NtSetTimer_SystemCall_10_0_10586:        ; Windows 10.0.10586 (1511)
	mov eax, 0062h
	jmp NtSetTimer_Epilogue
NtSetTimer_SystemCall_10_0_14393:        ; Windows 10.0.14393 (1607)
	mov eax, 0062h
	jmp NtSetTimer_Epilogue
NtSetTimer_SystemCall_10_0_15063:        ; Windows 10.0.15063 (1703)
	mov eax, 0062h
	jmp NtSetTimer_Epilogue
NtSetTimer_SystemCall_10_0_16299:        ; Windows 10.0.16299 (1709)
	mov eax, 0062h
	jmp NtSetTimer_Epilogue
NtSetTimer_SystemCall_10_0_17134:        ; Windows 10.0.17134 (1803)
	mov eax, 0062h
	jmp NtSetTimer_Epilogue
NtSetTimer_SystemCall_10_0_17763:        ; Windows 10.0.17763 (1809)
	mov eax, 0062h
	jmp NtSetTimer_Epilogue
NtSetTimer_SystemCall_10_0_18362:        ; Windows 10.0.18362 (1903)
	mov eax, 0062h
	jmp NtSetTimer_Epilogue
NtSetTimer_SystemCall_10_0_18363:        ; Windows 10.0.18363 (1909)
	mov eax, 0062h
	jmp NtSetTimer_Epilogue
NtSetTimer_SystemCall_10_0_19041:        ; Windows 10.0.19041 (2004)
	mov eax, 0062h
	jmp NtSetTimer_Epilogue
NtSetTimer_SystemCall_10_0_19042:        ; Windows 10.0.19042 (20H2)
	mov eax, 0062h
	jmp NtSetTimer_Epilogue
NtSetTimer_SystemCall_10_0_19043:        ; Windows 10.0.19043 (21H1)
	mov eax, 0062h
	jmp NtSetTimer_Epilogue
NtSetTimer_SystemCall_10_0_19044:        ; Windows 10.0.19043 (21H1)
	mov eax, 0062h
	jmp NtSetTimer_Epilogue
NtSetTimer_SystemCall_10_0_19045:        ; Windows 10.0.19043 (21H1)
	mov eax, 0062h
	jmp NtSetTimer_Epilogue
NtSetTimer_SystemCall_10_0_22000:        ; Windows 10.0.22000 (21H2 WIN 11)
	mov eax, 0062h
	jmp NtSetTimer_Epilogue
NtSetTimer_SystemCall_10_0_22621:        ; Windows 10.0.22621 (22H2 WIN 11) 
	mov eax, 0062h
	jmp NtSetTimer_Epilogue
NtSetTimer_SystemCall_10_0_22631:        ; Windows 10.0.22631 (23H2 WIN 11)
	mov eax, 0062h
	jmp NtSetTimer_Epilogue
NtSetTimer_SystemCall_Unknown:           ; Unknown/unsupported version.
	ret
NtSetTimer_Epilogue:
	mov r10, rcx
	syscall
	ret
NtSetTimer ENDP

NtOpenTimer PROC
	mov rax, gs:[60h]                 ; Load PEB into RAX.
NtOpenTimer_Check_X_X_XXXX:               ; Check major version.
	cmp dword ptr [rax+118h], 10
	je  NtOpenTimer_Check_10_0_XXXX
	jmp NtOpenTimer_SystemCall_Unknown
NtOpenTimer_Check_10_0_XXXX:              ; Check build number for Windows 10.
	cmp word ptr [rax+120h], 10240
	je  NtOpenTimer_SystemCall_10_0_10240
	cmp word ptr [rax+120h], 10586
	je  NtOpenTimer_SystemCall_10_0_10586
	cmp word ptr [rax+120h], 14393
	je  NtOpenTimer_SystemCall_10_0_14393
	cmp word ptr [rax+120h], 15063
	je  NtOpenTimer_SystemCall_10_0_15063
	cmp word ptr [rax+120h], 16299
	je  NtOpenTimer_SystemCall_10_0_16299
	cmp word ptr [rax+120h], 17134
	je  NtOpenTimer_SystemCall_10_0_17134
	cmp word ptr [rax+120h], 17763
	je  NtOpenTimer_SystemCall_10_0_17763
	cmp word ptr [rax+120h], 18362
	je  NtOpenTimer_SystemCall_10_0_18362
	cmp word ptr [rax+120h], 18363
	je  NtOpenTimer_SystemCall_10_0_18363
	cmp word ptr [rax+120h], 19041
	je  NtOpenTimer_SystemCall_10_0_19041
	cmp word ptr [rax+120h], 19042
	je  NtOpenTimer_SystemCall_10_0_19042
	cmp word ptr [rax+120h], 19043
	je  NtOpenTimer_SystemCall_10_0_19043
	cmp word ptr [rax+120h], 19044
	je  NtOpenTimer_SystemCall_10_0_19044
	cmp word ptr [rax+120h], 19045
	je  NtOpenTimer_SystemCall_10_0_19045
	cmp word ptr [rax+120h], 22000		  ; START OF WINODWS 11
	je  NtOpenTimer_SystemCall_10_0_22000
	cmp word ptr [rax+120h], 22621
	je  NtOpenTimer_SystemCall_10_0_22621
	cmp word ptr [rax+120h], 22631
	je  NtOpenTimer_SystemCall_10_0_22631
	jmp NtOpenTimer_SystemCall_Unknown
NtOpenTimer_SystemCall_10_0_10240:        ; Windows 10.0.10240 (1507)
	mov eax, 011ah
	jmp NtOpenTimer_Epilogue
NtOpenTimer_SystemCall_10_0_10586:        ; Windows 10.0.10586 (1511)
	mov eax, 011dh
	jmp NtOpenTimer_Epilogue
NtOpenTimer_SystemCall_10_0_14393:        ; Windows 10.0.14393 (1607)
	mov eax, 0120h
	jmp NtOpenTimer_Epilogue
NtOpenTimer_SystemCall_10_0_15063:        ; Windows 10.0.15063 (1703)
	mov eax, 0124h
	jmp NtOpenTimer_Epilogue
NtOpenTimer_SystemCall_10_0_16299:        ; Windows 10.0.16299 (1709)
	mov eax, 0126h
	jmp NtOpenTimer_Epilogue
NtOpenTimer_SystemCall_10_0_17134:        ; Windows 10.0.17134 (1803)
	mov eax, 0128h
	jmp NtOpenTimer_Epilogue
NtOpenTimer_SystemCall_10_0_17763:        ; Windows 10.0.17763 (1809)
	mov eax, 0129h
	jmp NtOpenTimer_Epilogue
NtOpenTimer_SystemCall_10_0_18362:        ; Windows 10.0.18362 (1903)
	mov eax, 012ah
	jmp NtOpenTimer_Epilogue
NtOpenTimer_SystemCall_10_0_18363:        ; Windows 10.0.18363 (1909)
	mov eax, 012ah
	jmp NtOpenTimer_Epilogue
NtOpenTimer_SystemCall_10_0_19041:        ; Windows 10.0.19041 (2004)
	mov eax, 012fh
	jmp NtOpenTimer_Epilogue
NtOpenTimer_SystemCall_10_0_19042:        ; Windows 10.0.19042 (20H2)
	mov eax, 012fh
	jmp NtOpenTimer_Epilogue
NtOpenTimer_SystemCall_10_0_19043:        ; Windows 10.0.19043 (21H1)
	mov eax, 012fh
	jmp NtOpenTimer_Epilogue
NtOpenTimer_SystemCall_10_0_19044:        ; Windows 10.0.19043 (21H1)
	mov eax, 0130h
	jmp NtOpenTimer_Epilogue
NtOpenTimer_SystemCall_10_0_19045:        ; Windows 10.0.19043 (21H1)
	mov eax, 0130h
	jmp NtOpenTimer_Epilogue
NtOpenTimer_SystemCall_10_0_22000:        ; Windows 10.0.22000 (21H2 WIN 11)
	mov eax, 0136h
	jmp NtOpenTimer_Epilogue
NtOpenTimer_SystemCall_10_0_22621:        ; Windows 10.0.22621 (22H2 WIN 11) 
	mov eax, 0138h
	jmp NtOpenTimer_Epilogue
NtOpenTimer_SystemCall_10_0_22631:        ; Windows 10.0.22631 (23H2 WIN 11)
	mov eax, 0138h
	jmp NtOpenTimer_Epilogue
NtOpenTimer_SystemCall_Unknown:           ; Unknown/unsupported version.
	ret
NtOpenTimer_Epilogue:
	mov r10, rcx
	syscall
	ret
NtOpenTimer ENDP

NtQueryTimer PROC
	mov rax, gs:[60h]                  ; Load PEB into RAX.
NtQueryTimer_Check_X_X_XXXX:               ; Check major version.
	cmp dword ptr [rax+118h], 10
	je  NtQueryTimer_Check_10_0_XXXX
	jmp NtQueryTimer_SystemCall_Unknown
NtQueryTimer_Check_10_0_XXXX:              ; Check build number for Windows 10.
	cmp word ptr [rax+120h], 10240
	je  NtQueryTimer_SystemCall_10_0_10240
	cmp word ptr [rax+120h], 10586
	je  NtQueryTimer_SystemCall_10_0_10586
	cmp word ptr [rax+120h], 14393
	je  NtQueryTimer_SystemCall_10_0_14393
	cmp word ptr [rax+120h], 15063
	je  NtQueryTimer_SystemCall_10_0_15063
	cmp word ptr [rax+120h], 16299
	je  NtQueryTimer_SystemCall_10_0_16299
	cmp word ptr [rax+120h], 17134
	je  NtQueryTimer_SystemCall_10_0_17134
	cmp word ptr [rax+120h], 17763
	je  NtQueryTimer_SystemCall_10_0_17763
	cmp word ptr [rax+120h], 18362
	je  NtQueryTimer_SystemCall_10_0_18362
	cmp word ptr [rax+120h], 18363
	je  NtQueryTimer_SystemCall_10_0_18363
	cmp word ptr [rax+120h], 19041
	je  NtQueryTimer_SystemCall_10_0_19041
	cmp word ptr [rax+120h], 19042
	je  NtQueryTimer_SystemCall_10_0_19042
	cmp word ptr [rax+120h], 19043
	je  NtQueryTimer_SystemCall_10_0_19043
	cmp word ptr [rax+120h], 19044
	je  NtQueryTimer_SystemCall_10_0_19044
	cmp word ptr [rax+120h], 19045
	je  NtQueryTimer_SystemCall_10_0_19045
	cmp word ptr [rax+120h], 22000		   ; START OF WINODWS 11
	je  NtQueryTimer_SystemCall_10_0_22000
	cmp word ptr [rax+120h], 22621
	je  NtQueryTimer_SystemCall_10_0_22621
	cmp word ptr [rax+120h], 22631
	je  NtQueryTimer_SystemCall_10_0_22631
	jmp NtQueryTimer_SystemCall_Unknown
NtQueryTimer_SystemCall_10_0_10240:        ; Windows 10.0.10240 (1507)
	mov eax, 0038h
	jmp NtQueryTimer_Epilogue
NtQueryTimer_SystemCall_10_0_10586:        ; Windows 10.0.10586 (1511)
	mov eax, 0038h
	jmp NtQueryTimer_Epilogue
NtQueryTimer_SystemCall_10_0_14393:        ; Windows 10.0.14393 (1607)
	mov eax, 0038h
	jmp NtQueryTimer_Epilogue
NtQueryTimer_SystemCall_10_0_15063:        ; Windows 10.0.15063 (1703)
	mov eax, 0038h
	jmp NtQueryTimer_Epilogue
NtQueryTimer_SystemCall_10_0_16299:        ; Windows 10.0.16299 (1709)
	mov eax, 0038h
	jmp NtQueryTimer_Epilogue
NtQueryTimer_SystemCall_10_0_17134:        ; Windows 10.0.17134 (1803)
	mov eax, 0038h
	jmp NtQueryTimer_Epilogue
NtQueryTimer_SystemCall_10_0_17763:        ; Windows 10.0.17763 (1809)
	mov eax, 0038h
	jmp NtQueryTimer_Epilogue
NtQueryTimer_SystemCall_10_0_18362:        ; Windows 10.0.18362 (1903)
	mov eax, 0038h
	jmp NtQueryTimer_Epilogue
NtQueryTimer_SystemCall_10_0_18363:        ; Windows 10.0.18363 (1909)
	mov eax, 0038h
	jmp NtQueryTimer_Epilogue
NtQueryTimer_SystemCall_10_0_19041:        ; Windows 10.0.19041 (2004)
	mov eax, 0038h
	jmp NtQueryTimer_Epilogue
NtQueryTimer_SystemCall_10_0_19042:        ; Windows 10.0.19042 (20H2)
	mov eax, 0038h
	jmp NtQueryTimer_Epilogue
NtQueryTimer_SystemCall_10_0_19043:        ; Windows 10.0.19043 (21H1)
	mov eax, 0038h
	jmp NtQueryTimer_Epilogue
NtQueryTimer_SystemCall_10_0_19044:        ; Windows 10.0.19043 (21H1)
	mov eax, 0038h
	jmp NtQueryTimer_Epilogue
NtQueryTimer_SystemCall_10_0_19045:        ; Windows 10.0.19043 (21H1)
	mov eax, 0038h
	jmp NtQueryTimer_Epilogue
NtQueryTimer_SystemCall_10_0_22000:        ; Windows 10.0.22000 (21H2 WIN 11)
	mov eax, 0038h
	jmp NtQueryTimer_Epilogue
NtQueryTimer_SystemCall_10_0_22621:        ; Windows 10.0.22621 (22H2 WIN 11) 
	mov eax, 0038h
	jmp NtQueryTimer_Epilogue
NtQueryTimer_SystemCall_10_0_22631:        ; Windows 10.0.22631 (23H2 WIN 11)
	mov eax, 0038h
	jmp NtQueryTimer_Epilogue
NtQueryTimer_SystemCall_Unknown:           ; Unknown/unsupported version.
	ret
NtQueryTimer_Epilogue:
	mov r10, rcx
	syscall
	ret
NtQueryTimer ENDP

NtCancelTimer PROC
	mov rax, gs:[60h]                   ; Load PEB into RAX.
NtCancelTimer_Check_X_X_XXXX:               ; Check major version.
	cmp dword ptr [rax+118h], 10
	je  NtCancelTimer_Check_10_0_XXXX
	jmp NtCancelTimer_SystemCall_Unknown
NtCancelTimer_Check_10_0_XXXX:              ; Check build number for Windows 10.
	cmp word ptr [rax+120h], 10240
	je  NtCancelTimer_SystemCall_10_0_10240
	cmp word ptr [rax+120h], 10586
	je  NtCancelTimer_SystemCall_10_0_10586
	cmp word ptr [rax+120h], 14393
	je  NtCancelTimer_SystemCall_10_0_14393
	cmp word ptr [rax+120h], 15063
	je  NtCancelTimer_SystemCall_10_0_15063
	cmp word ptr [rax+120h], 16299
	je  NtCancelTimer_SystemCall_10_0_16299
	cmp word ptr [rax+120h], 17134
	je  NtCancelTimer_SystemCall_10_0_17134
	cmp word ptr [rax+120h], 17763
	je  NtCancelTimer_SystemCall_10_0_17763
	cmp word ptr [rax+120h], 18362
	je  NtCancelTimer_SystemCall_10_0_18362
	cmp word ptr [rax+120h], 18363
	je  NtCancelTimer_SystemCall_10_0_18363
	cmp word ptr [rax+120h], 19041
	je  NtCancelTimer_SystemCall_10_0_19041
	cmp word ptr [rax+120h], 19042
	je  NtCancelTimer_SystemCall_10_0_19042
	cmp word ptr [rax+120h], 19043
	je  NtCancelTimer_SystemCall_10_0_19043
	cmp word ptr [rax+120h], 19044
	je  NtCancelTimer_SystemCall_10_0_19044
	cmp word ptr [rax+120h], 19045
	je  NtCancelTimer_SystemCall_10_0_19045
	cmp word ptr [rax+120h], 22000			; START OF WINODWS 11
	je  NtCancelTimer_SystemCall_10_0_22000
	cmp word ptr [rax+120h], 22621
	je  NtCancelTimer_SystemCall_10_0_22621
	cmp word ptr [rax+120h], 22631
	je  NtCancelTimer_SystemCall_10_0_22631
	jmp NtCancelTimer_SystemCall_Unknown
NtCancelTimer_SystemCall_10_0_10240:        ; Windows 10.0.10240 (1507)
	mov eax, 0061h
	jmp NtCancelTimer_Epilogue
NtCancelTimer_SystemCall_10_0_10586:        ; Windows 10.0.10586 (1511)
	mov eax, 0061h
	jmp NtCancelTimer_Epilogue
NtCancelTimer_SystemCall_10_0_14393:        ; Windows 10.0.14393 (1607)
	mov eax, 0061h
	jmp NtCancelTimer_Epilogue
NtCancelTimer_SystemCall_10_0_15063:        ; Windows 10.0.15063 (1703)
	mov eax, 0061h
	jmp NtCancelTimer_Epilogue
NtCancelTimer_SystemCall_10_0_16299:        ; Windows 10.0.16299 (1709)
	mov eax, 0061h
	jmp NtCancelTimer_Epilogue
NtCancelTimer_SystemCall_10_0_17134:        ; Windows 10.0.17134 (1803)
	mov eax, 0061h
	jmp NtCancelTimer_Epilogue
NtCancelTimer_SystemCall_10_0_17763:        ; Windows 10.0.17763 (1809)
	mov eax, 0061h
	jmp NtCancelTimer_Epilogue
NtCancelTimer_SystemCall_10_0_18362:        ; Windows 10.0.18362 (1903)
	mov eax, 0061h
	jmp NtCancelTimer_Epilogue
NtCancelTimer_SystemCall_10_0_18363:        ; Windows 10.0.18363 (1909)
	mov eax, 0061h
	jmp NtCancelTimer_Epilogue
NtCancelTimer_SystemCall_10_0_19041:        ; Windows 10.0.19041 (2004)
	mov eax, 0061h
	jmp NtCancelTimer_Epilogue
NtCancelTimer_SystemCall_10_0_19042:        ; Windows 10.0.19042 (20H2)
	mov eax, 0061h
	jmp NtCancelTimer_Epilogue
NtCancelTimer_SystemCall_10_0_19043:        ; Windows 10.0.19043 (21H1)
	mov eax, 0061h
	jmp NtCancelTimer_Epilogue
NtCancelTimer_SystemCall_10_0_19044:        ; Windows 10.0.19043 (21H1)
	mov eax, 0061h
	jmp NtCancelTimer_Epilogue
NtCancelTimer_SystemCall_10_0_19045:        ; Windows 10.0.19043 (21H1)
	mov eax, 0061h
	jmp NtCancelTimer_Epilogue
NtCancelTimer_SystemCall_10_0_22000:        ; Windows 10.0.22000 (21H2 WIN 11)
	mov eax, 0061h
	jmp NtCancelTimer_Epilogue
NtCancelTimer_SystemCall_10_0_22621:        ; Windows 10.0.22621 (22H2 WIN 11) 
	mov eax, 0061h
	jmp NtCancelTimer_Epilogue
NtCancelTimer_SystemCall_10_0_22631:        ; Windows 10.0.22631 (23H2 WIN 11)
	mov eax, 0061h
	jmp NtCancelTimer_Epilogue
NtCancelTimer_SystemCall_Unknown:           ; Unknown/unsupported version.
	ret
NtCancelTimer_Epilogue:
	mov r10, rcx
	syscall
	ret
NtCancelTimer ENDP

WVM PROC
	mov rax, gs:[60h]                          ; Load PEB into RAX.
WVM_Check_X_X_XXXX:               ; Check major version.
	cmp dword ptr [rax+118h], 10
	je  WVM_Check_10_0_XXXX
	jmp WVM_SystemCall_Unknown
WVM_Check_10_0_XXXX:              ; Check build number for Windows 10.
	cmp word ptr [rax+120h], 10240
	je  WVM_SystemCall_10_0_10240
	cmp word ptr [rax+120h], 10586
	je  WVM_SystemCall_10_0_10586
	cmp word ptr [rax+120h], 14393
	je  WVM_SystemCall_10_0_14393
	cmp word ptr [rax+120h], 15063
	je  WVM_SystemCall_10_0_15063
	cmp word ptr [rax+120h], 16299
	je  WVM_SystemCall_10_0_16299
	cmp word ptr [rax+120h], 17134
	je  WVM_SystemCall_10_0_17134
	cmp word ptr [rax+120h], 17763
	je  WVM_SystemCall_10_0_17763
	cmp word ptr [rax+120h], 18362
	je  WVM_SystemCall_10_0_18362
	cmp word ptr [rax+120h], 18363
	je  WVM_SystemCall_10_0_18363
	cmp word ptr [rax+120h], 19041
	je  WVM_SystemCall_10_0_19041
	cmp word ptr [rax+120h], 19042
	je  WVM_SystemCall_10_0_19042
	cmp word ptr [rax+120h], 19043
	je  WVM_SystemCall_10_0_19043
	cmp word ptr [rax+120h], 19044
	je  WVM_SystemCall_10_0_19044
	cmp word ptr [rax+120h], 19045
	je  WVM_SystemCall_10_0_19045
	cmp word ptr [rax+120h], 22000 ; START OF WINODWS 11
	je  WVM_SystemCall_10_0_22000
	cmp word ptr [rax+120h], 22621
	je  WVM_SystemCall_10_0_22621
	cmp word ptr [rax+120h], 22631
	je  WVM_SystemCall_10_0_22631
	jmp WVM_SystemCall_Unknown
WVM_SystemCall_10_0_10240:        ; Windows 10.0.10240 (1507)
	mov eax, 003ah
	jmp WVM_Epilogue
WVM_SystemCall_10_0_10586:        ; Windows 10.0.10586 (1511)
	mov eax, 003ah
	jmp WVM_Epilogue
WVM_SystemCall_10_0_14393:        ; Windows 10.0.14393 (1607)
	mov eax, 003ah
	jmp WVM_Epilogue
WVM_SystemCall_10_0_15063:        ; Windows 10.0.15063 (1703)
	mov eax, 003ah
	jmp WVM_Epilogue
WVM_SystemCall_10_0_16299:        ; Windows 10.0.16299 (1709)
	mov eax, 003ah
	jmp WVM_Epilogue
WVM_SystemCall_10_0_17134:        ; Windows 10.0.17134 (1803)
	mov eax, 003ah
	jmp WVM_Epilogue
WVM_SystemCall_10_0_17763:        ; Windows 10.0.17763 (1809)
	mov eax, 003ah
	jmp WVM_Epilogue
WVM_SystemCall_10_0_18362:        ; Windows 10.0.18362 (1903)
	mov eax, 003ah
	jmp WVM_Epilogue
WVM_SystemCall_10_0_18363:        ; Windows 10.0.18363 (1909)
	mov eax, 003ah
	jmp WVM_Epilogue
WVM_SystemCall_10_0_19041:        ; Windows 10.0.19041 (2004)
	mov eax, 003ah
	jmp WVM_Epilogue
WVM_SystemCall_10_0_19042:        ; Windows 10.0.19042 (20H2)
	mov eax, 003ah
	jmp WVM_Epilogue
WVM_SystemCall_10_0_19043:        ; Windows 10.0.19043 (21H1)
	mov eax, 003ah
	jmp WVM_Epilogue
WVM_SystemCall_10_0_19044:        ; Windows 10.0.19043 (21H1)
	mov eax, 003ah
	jmp WVM_Epilogue
WVM_SystemCall_10_0_19045:        ; Windows 10.0.19043 (21H1)
	mov eax, 003ah
	jmp WVM_Epilogue
WVM_SystemCall_10_0_22000:        ; Windows 10.0.22000 (21H2 WIN 11)
	mov eax, 003ah
	jmp WVM_Epilogue
WVM_SystemCall_10_0_22621:        ; Windows 10.0.22621 (22H2 WIN 11) 
	mov eax, 003ah
	jmp WVM_Epilogue
WVM_SystemCall_10_0_22631:        ; Windows 10.0.22631 (23H2 WIN 11)
	mov eax, 003ah
	jmp WVM_Epilogue
WVM_SystemCall_Unknown:           ; Unknown/unsupported version.
	ret
WVM_Epilogue:
	mov r10, rcx
	syscall
	ret
WVM ENDP

AVM PROC
	mov rax, gs:[60h]                             ; Load PEB into RAX.
AVM_Check_X_X_XXXX:               ; Check major version.
	cmp dword ptr [rax+118h], 10
	je  AVM_Check_10_0_XXXX
	jmp AVM_SystemCall_Unknown
AVM_Check_10_0_XXXX:              ; Check build number for Windows 10.
	cmp word ptr [rax+120h], 10240
	je  AVM_SystemCall_10_0_10240
	cmp word ptr [rax+120h], 10586
	je  AVM_SystemCall_10_0_10586
	cmp word ptr [rax+120h], 14393
	je  AVM_SystemCall_10_0_14393
	cmp word ptr [rax+120h], 15063
	je  AVM_SystemCall_10_0_15063
	cmp word ptr [rax+120h], 16299
	je  AVM_SystemCall_10_0_16299
	cmp word ptr [rax+120h], 17134
	je  AVM_SystemCall_10_0_17134
	cmp word ptr [rax+120h], 17763
	je  AVM_SystemCall_10_0_17763
	cmp word ptr [rax+120h], 18362
	je  AVM_SystemCall_10_0_18362
	cmp word ptr [rax+120h], 18363
	je  AVM_SystemCall_10_0_18363
	cmp word ptr [rax+120h], 19041
	je  AVM_SystemCall_10_0_19041
	cmp word ptr [rax+120h], 19042
	je  AVM_SystemCall_10_0_19042
	cmp word ptr [rax+120h], 19043
	je  AVM_SystemCall_10_0_19043
	cmp word ptr [rax+120h], 19044
	je  AVM_SystemCall_10_0_19044
	cmp word ptr [rax+120h], 19045
	je  AVM_SystemCall_10_0_19045
	cmp word ptr [rax+120h], 22000 ; START OF WINODWS 11
	je  AVM_SystemCall_10_0_22000
	cmp word ptr [rax+120h], 22621
	je  AVM_SystemCall_10_0_22621
	cmp word ptr [rax+120h], 22631
	je  AVM_SystemCall_10_0_22631
	jmp AVM_SystemCall_Unknown
AVM_SystemCall_10_0_10240:        ; Windows 10.0.10240 (1507)
	mov eax, 0018h
	jmp AVM_Epilogue
AVM_SystemCall_10_0_10586:        ; Windows 10.0.10586 (1511)
	mov eax, 0018h
	jmp AVM_Epilogue
AVM_SystemCall_10_0_14393:        ; Windows 10.0.14393 (1607)
	mov eax, 0018h
	jmp AVM_Epilogue
AVM_SystemCall_10_0_15063:        ; Windows 10.0.15063 (1703)
	mov eax, 0018h
	jmp AVM_Epilogue
AVM_SystemCall_10_0_16299:        ; Windows 10.0.16299 (1709)
	mov eax, 0018h
	jmp AVM_Epilogue
AVM_SystemCall_10_0_17134:        ; Windows 10.0.17134 (1803)
	mov eax, 0018h
	jmp AVM_Epilogue
AVM_SystemCall_10_0_17763:        ; Windows 10.0.17763 (1809)
	mov eax, 0018h
	jmp AVM_Epilogue
AVM_SystemCall_10_0_18362:        ; Windows 10.0.18362 (1903)
	mov eax, 0018h
	jmp AVM_Epilogue
AVM_SystemCall_10_0_18363:        ; Windows 10.0.18363 (1909)
	mov eax, 0018h
	jmp AVM_Epilogue
AVM_SystemCall_10_0_19041:        ; Windows 10.0.19041 (2004)
	mov eax, 0018h
	jmp AVM_Epilogue
AVM_SystemCall_10_0_19042:        ; Windows 10.0.19042 (20H2)
	mov eax, 0018h
	jmp AVM_Epilogue
AVM_SystemCall_10_0_19043:        ; Windows 10.0.19043 (21H1)
	mov eax, 0018h
	jmp AVM_Epilogue
AVM_SystemCall_10_0_19044:        ; Windows 10.0.19043 (21H1)
	mov eax, 0018h
	jmp AVM_Epilogue
AVM_SystemCall_10_0_19045:        ; Windows 10.0.19043 (21H1)
	mov eax, 0018h
	jmp AVM_Epilogue
AVM_SystemCall_10_0_22000:        ; Windows 10.0.22000 (21H2 WIN 11)
	mov eax, 0018h
	jmp AVM_Epilogue
AVM_SystemCall_10_0_22621:        ; Windows 10.0.22621 (22H2 WIN 11) 
	mov eax, 0018h
	jmp AVM_Epilogue
AVM_SystemCall_10_0_22631:        ; Windows 10.0.22631 (23H2 WIN 11)
	mov eax, 0018h
	jmp AVM_Epilogue
AVM_SystemCall_Unknown:           ; Unknown/unsupported version.
	ret
AVM_Epilogue:
	mov r10, rcx
	syscall
	ret
AVM ENDP

CT PROC
	mov rax, gs:[60h]                      ; Load PEB into RAX.
CT_Check_X_X_XXXX:               ; Check major version.
	cmp dword ptr [rax+118h], 10
	je  CT_Check_10_0_XXXX
	jmp CT_SystemCall_Unknown
CT_Check_10_0_XXXX:              ; Check build number for Windows 10.
	cmp word ptr [rax+120h], 10240
	je  CT_SystemCall_10_0_10240
	cmp word ptr [rax+120h], 10586
	je  CT_SystemCall_10_0_10586
	cmp word ptr [rax+120h], 14393
	je  CT_SystemCall_10_0_14393
	cmp word ptr [rax+120h], 15063
	je  CT_SystemCall_10_0_15063
	cmp word ptr [rax+120h], 16299
	je  CT_SystemCall_10_0_16299
	cmp word ptr [rax+120h], 17134
	je  CT_SystemCall_10_0_17134
	cmp word ptr [rax+120h], 17763
	je  CT_SystemCall_10_0_17763
	cmp word ptr [rax+120h], 18362
	je  CT_SystemCall_10_0_18362
	cmp word ptr [rax+120h], 18363
	je  CT_SystemCall_10_0_18363
	cmp word ptr [rax+120h], 19041
	je  CT_SystemCall_10_0_19041
	cmp word ptr [rax+120h], 19042
	je  CT_SystemCall_10_0_19042
	cmp word ptr [rax+120h], 19043
	je  CT_SystemCall_10_0_19043
	cmp word ptr [rax+120h], 19044
	je  CT_SystemCall_10_0_19044
	cmp word ptr [rax+120h], 19045
	je  CT_SystemCall_10_0_19045
	cmp word ptr [rax+120h], 22000 ; START OF WINODWS 11
	je  CT_SystemCall_10_0_22000
	cmp word ptr [rax+120h], 22621
	je  CT_SystemCall_10_0_22621
	cmp word ptr [rax+120h], 22631
	je  CT_SystemCall_10_0_22631
	jmp CT_SystemCall_Unknown
CT_SystemCall_10_0_10240:        ; Windows 10.0.10240 (1507)
	mov eax, 00b3h
	jmp CT_Epilogue
CT_SystemCall_10_0_10586:        ; Windows 10.0.10586 (1511)
	mov eax, 00b4h
	jmp CT_Epilogue
CT_SystemCall_10_0_14393:        ; Windows 10.0.14393 (1607)
	mov eax, 00b6h
	jmp CT_Epilogue
CT_SystemCall_10_0_15063:        ; Windows 10.0.15063 (1703)
	mov eax, 00b9h
	jmp CT_Epilogue
CT_SystemCall_10_0_16299:        ; Windows 10.0.16299 (1709)
	mov eax, 00bah
	jmp CT_Epilogue
CT_SystemCall_10_0_17134:        ; Windows 10.0.17134 (1803)
	mov eax, 00bbh
	jmp CT_Epilogue
CT_SystemCall_10_0_17763:        ; Windows 10.0.17763 (1809)
	mov eax, 00bch
	jmp CT_Epilogue
CT_SystemCall_10_0_18362:        ; Windows 10.0.18362 (1903)
	mov eax, 00bdh
	jmp CT_Epilogue
CT_SystemCall_10_0_18363:        ; Windows 10.0.18363 (1909)
	mov eax, 00bdh
	jmp CT_Epilogue
CT_SystemCall_10_0_19041:        ; Windows 10.0.19041 (2004)
	mov eax, 00c1h
	jmp CT_Epilogue
CT_SystemCall_10_0_19042:        ; Windows 10.0.19042 (20H2)
	mov eax, 00c1h
	jmp CT_Epilogue
CT_SystemCall_10_0_19043:        ; Windows 10.0.19043 (21H1)
	mov eax, 00c1h
	jmp CT_Epilogue
CT_SystemCall_10_0_19044:        ; Windows 10.0.19043 (21H1)
	mov eax, 00c2h
	jmp CT_Epilogue
CT_SystemCall_10_0_19045:        ; Windows 10.0.19043 (21H1)
	mov eax, 00c2h
	jmp CT_Epilogue
CT_SystemCall_10_0_22000:        ; Windows 10.0.22000 (21H2 WIN 11)
	mov eax, 00c6h
	jmp CT_Epilogue
CT_SystemCall_10_0_22621:        ; Windows 10.0.22621 (22H2 WIN 11) 
	mov eax, 00c7h
	jmp CT_Epilogue
CT_SystemCall_10_0_22631:        ; Windows 10.0.22631 (23H2 WIN 11)
	mov eax, 00c7h
	jmp CT_Epilogue
CT_SystemCall_Unknown:           ; Unknown/unsupported version.
	ret
CT_Epilogue:
	mov r10, rcx
	syscall
	ret
CT ENDP

WFSO PROC
	mov rax, gs:[60h]                           ; Load PEB into RAX.
WFSO_Check_X_X_XXXX:               ; Check major version.
	cmp dword ptr [rax+118h], 10
	je  WFSO_Check_10_0_XXXX
	jmp WFSO_SystemCall_Unknown
WFSO_Check_10_0_XXXX:              ; Check build number for Windows 10.
	cmp word ptr [rax+120h], 10240
	je  WFSO_SystemCall_10_0_10240
	cmp word ptr [rax+120h], 10586
	je  WFSO_SystemCall_10_0_10586
	cmp word ptr [rax+120h], 14393
	je  WFSO_SystemCall_10_0_14393
	cmp word ptr [rax+120h], 15063
	je  WFSO_SystemCall_10_0_15063
	cmp word ptr [rax+120h], 16299
	je  WFSO_SystemCall_10_0_16299
	cmp word ptr [rax+120h], 17134
	je  WFSO_SystemCall_10_0_17134
	cmp word ptr [rax+120h], 17763
	je  WFSO_SystemCall_10_0_17763
	cmp word ptr [rax+120h], 18362
	je  WFSO_SystemCall_10_0_18362
	cmp word ptr [rax+120h], 18363
	je  WFSO_SystemCall_10_0_18363
	cmp word ptr [rax+120h], 19041
	je  WFSO_SystemCall_10_0_19041
	cmp word ptr [rax+120h], 19042
	je  WFSO_SystemCall_10_0_19042
	cmp word ptr [rax+120h], 19043
	je  WFSO_SystemCall_10_0_19043
	cmp word ptr [rax+120h], 19044
	je  WFSO_SystemCall_10_0_19044
	cmp word ptr [rax+120h], 19045
	je  WFSO_SystemCall_10_0_19045
	cmp word ptr [rax+120h], 22000 ; START OF WINODWS 11
	je  WFSO_SystemCall_10_0_22000
	cmp word ptr [rax+120h], 22621
	je  WFSO_SystemCall_10_0_22621
	cmp word ptr [rax+120h], 22631
	je  WFSO_SystemCall_10_0_22631
	jmp WFSO_SystemCall_Unknown
WFSO_SystemCall_10_0_10240:        ; Windows 10.0.10240 (1507)
	mov eax, 0004h
	jmp WFSO_Epilogue
WFSO_SystemCall_10_0_10586:        ; Windows 10.0.10586 (1511)
	mov eax, 0004h
	jmp WFSO_Epilogue
WFSO_SystemCall_10_0_14393:        ; Windows 10.0.14393 (1607)
	mov eax, 0004h
	jmp WFSO_Epilogue
WFSO_SystemCall_10_0_15063:        ; Windows 10.0.15063 (1703)
	mov eax, 0004h
	jmp WFSO_Epilogue
WFSO_SystemCall_10_0_16299:        ; Windows 10.0.16299 (1709)
	mov eax, 0004h
	jmp WFSO_Epilogue
WFSO_SystemCall_10_0_17134:        ; Windows 10.0.17134 (1803)
	mov eax, 0004h
	jmp WFSO_Epilogue
WFSO_SystemCall_10_0_17763:        ; Windows 10.0.17763 (1809)
	mov eax, 0004h
	jmp WFSO_Epilogue
WFSO_SystemCall_10_0_18362:        ; Windows 10.0.18362 (1903)
	mov eax, 0004h
	jmp WFSO_Epilogue
WFSO_SystemCall_10_0_18363:        ; Windows 10.0.18363 (1909)
	mov eax, 0004h
	jmp WFSO_Epilogue
WFSO_SystemCall_10_0_19041:        ; Windows 10.0.19041 (2004)
	mov eax, 0004h
	jmp WFSO_Epilogue
WFSO_SystemCall_10_0_19042:        ; Windows 10.0.19042 (20H2)
	mov eax, 0004h
	jmp WFSO_Epilogue
WFSO_SystemCall_10_0_19043:        ; Windows 10.0.19043 (21H1)
	mov eax, 0004h
	jmp WFSO_Epilogue
WFSO_SystemCall_10_0_19044:        ; Windows 10.0.19043 (21H1)
	mov eax, 0004h
	jmp WFSO_Epilogue
WFSO_SystemCall_10_0_19045:        ; Windows 10.0.19043 (21H1)
	mov eax, 0004h
	jmp WFSO_Epilogue
WFSO_SystemCall_10_0_22000:        ; Windows 10.0.22000 (21H2 WIN 11)
	mov eax, 0004h
	jmp WFSO_Epilogue
WFSO_SystemCall_10_0_22621:        ; Windows 10.0.22621 (22H2 WIN 11) 
	mov eax, 0004h
	jmp WFSO_Epilogue
WFSO_SystemCall_10_0_22631:        ; Windows 10.0.22631 (23H2 WIN 11)
	mov eax, 0004h
	jmp WFSO_Epilogue
WFSO_SystemCall_Unknown:           ; Unknown/unsupported version.
	ret
WFSO_Epilogue:
	mov r10, rcx
	syscall
	ret
WFSO ENDP

C PROC
	mov rax, gs:[60h]             ; Load PEB into RAX.
C_Check_X_X_XXXX:               ; Check major version.
	cmp dword ptr [rax+118h], 10
	je  C_Check_10_0_XXXX
	jmp C_SystemCall_Unknown
C_Check_10_0_XXXX:              ; Check build number for Windows 10.
	cmp word ptr [rax+120h], 10240
	je  C_SystemCall_10_0_10240
	cmp word ptr [rax+120h], 10586
	je  C_SystemCall_10_0_10586
	cmp word ptr [rax+120h], 14393
	je  C_SystemCall_10_0_14393
	cmp word ptr [rax+120h], 15063
	je  C_SystemCall_10_0_15063
	cmp word ptr [rax+120h], 16299
	je  C_SystemCall_10_0_16299
	cmp word ptr [rax+120h], 17134
	je  C_SystemCall_10_0_17134
	cmp word ptr [rax+120h], 17763
	je  C_SystemCall_10_0_17763
	cmp word ptr [rax+120h], 18362
	je  C_SystemCall_10_0_18362
	cmp word ptr [rax+120h], 18363
	je  C_SystemCall_10_0_18363
	cmp word ptr [rax+120h], 19041
	je  C_SystemCall_10_0_19041
	cmp word ptr [rax+120h], 19042
	je  C_SystemCall_10_0_19042
	cmp word ptr [rax+120h], 19043
	je  C_SystemCall_10_0_19043
	cmp word ptr [rax+120h], 19044
	je  C_SystemCall_10_0_19044
	cmp word ptr [rax+120h], 19045
	je  C_SystemCall_10_0_19045
	cmp word ptr [rax+120h], 22000 ; START OF WINODWS 11
	je  C_SystemCall_10_0_22000
	cmp word ptr [rax+120h], 22621
	je  C_SystemCall_10_0_22621
	cmp word ptr [rax+120h], 22631
	je  C_SystemCall_10_0_22631
	jmp C_SystemCall_Unknown
C_SystemCall_10_0_10240:        ; Windows 10.0.10240 (1507)
	mov eax, 000fh
	jmp C_Epilogue
C_SystemCall_10_0_10586:        ; Windows 10.0.10586 (1511)
	mov eax, 000fh
	jmp C_Epilogue
C_SystemCall_10_0_14393:        ; Windows 10.0.14393 (1607)
	mov eax, 000fh
	jmp C_Epilogue
C_SystemCall_10_0_15063:        ; Windows 10.0.15063 (1703)
	mov eax, 000fh
	jmp C_Epilogue
C_SystemCall_10_0_16299:        ; Windows 10.0.16299 (1709)
	mov eax, 000fh
	jmp C_Epilogue
C_SystemCall_10_0_17134:        ; Windows 10.0.17134 (1803)
	mov eax, 000fh
	jmp C_Epilogue
C_SystemCall_10_0_17763:        ; Windows 10.0.17763 (1809)
	mov eax, 000fh
	jmp C_Epilogue
C_SystemCall_10_0_18362:        ; Windows 10.0.18362 (1903)
	mov eax, 000fh
	jmp C_Epilogue
C_SystemCall_10_0_18363:        ; Windows 10.0.18363 (1909)
	mov eax, 000fh
	jmp C_Epilogue
C_SystemCall_10_0_19041:        ; Windows 10.0.19041 (2004)
	mov eax, 000fh
	jmp C_Epilogue
C_SystemCall_10_0_19042:        ; Windows 10.0.19042 (20H2)
	mov eax, 000fh
	jmp C_Epilogue
C_SystemCall_10_0_19043:        ; Windows 10.0.19043 (21H1)
	mov eax, 000fh
	jmp C_Epilogue
C_SystemCall_10_0_19044:        ; Windows 10.0.19043 (21H1)
	mov eax, 000fh
	jmp C_Epilogue
C_SystemCall_10_0_19045:        ; Windows 10.0.19043 (21H1)
	mov eax, 000fh
	jmp C_Epilogue
C_SystemCall_10_0_22000:        ; Windows 10.0.22000 (21H2 WIN 11)
	mov eax, 000fh
	jmp C_Epilogue
C_SystemCall_10_0_22621:        ; Windows 10.0.22621 (22H2 WIN 11) 
	mov eax, 000fh
	jmp C_Epilogue
C_SystemCall_10_0_22631:        ; Windows 10.0.22631 (23H2 WIN 11)
	mov eax, 000fh
	jmp C_Epilogue
C_SystemCall_Unknown:           ; Unknown/unsupported version.
	ret
C_Epilogue:
	mov r10, rcx
	syscall
	ret
C ENDP

OP PROC
	mov rax, gs:[60h]                   ; Load PEB into RAX.
OP_Check_X_X_XXXX:               ; Check major version.
	cmp dword ptr [rax+118h], 10
	je  OP_Check_10_0_XXXX
	jmp OP_SystemCall_Unknown
OP_Check_10_0_XXXX:              ; Check build number for Windows 10.
	cmp word ptr [rax+120h], 10240
	je  OP_SystemCall_10_0_10240
	cmp word ptr [rax+120h], 10586
	je  OP_SystemCall_10_0_10586
	cmp word ptr [rax+120h], 14393
	je  OP_SystemCall_10_0_14393
	cmp word ptr [rax+120h], 15063
	je  OP_SystemCall_10_0_15063
	cmp word ptr [rax+120h], 16299
	je  OP_SystemCall_10_0_16299
	cmp word ptr [rax+120h], 17134
	je  OP_SystemCall_10_0_17134
	cmp word ptr [rax+120h], 17763
	je  OP_SystemCall_10_0_17763
	cmp word ptr [rax+120h], 18362
	je  OP_SystemCall_10_0_18362
	cmp word ptr [rax+120h], 18363
	je  OP_SystemCall_10_0_18363
	cmp word ptr [rax+120h], 19041
	je  OP_SystemCall_10_0_19041
	cmp word ptr [rax+120h], 19042
	je  OP_SystemCall_10_0_19042
	cmp word ptr [rax+120h], 19043
	je  OP_SystemCall_10_0_19043
	cmp word ptr [rax+120h], 19044
	je  OP_SystemCall_10_0_19044
	cmp word ptr [rax+120h], 19045
	je  OP_SystemCall_10_0_19045
	cmp word ptr [rax+120h], 22000 ; START OF WINODWS 11
	je  OP_SystemCall_10_0_22000
	cmp word ptr [rax+120h], 22621
	je  OP_SystemCall_10_0_22621
	cmp word ptr [rax+120h], 22631
	je  OP_SystemCall_10_0_22631
	jmp OP_SystemCall_Unknown
OP_SystemCall_10_0_10240:        ; Windows 10.0.10240 (1507)
	mov eax, 0026h
	jmp OP_Epilogue
OP_SystemCall_10_0_10586:        ; Windows 10.0.10586 (1511)
	mov eax, 0026h
	jmp OP_Epilogue
OP_SystemCall_10_0_14393:        ; Windows 10.0.14393 (1607)
	mov eax, 0026h
	jmp OP_Epilogue
OP_SystemCall_10_0_15063:        ; Windows 10.0.15063 (1703)
	mov eax, 0026h
	jmp OP_Epilogue
OP_SystemCall_10_0_16299:        ; Windows 10.0.16299 (1709)
	mov eax, 0026h
	jmp OP_Epilogue
OP_SystemCall_10_0_17134:        ; Windows 10.0.17134 (1803)
	mov eax, 0026h
	jmp OP_Epilogue
OP_SystemCall_10_0_17763:        ; Windows 10.0.17763 (1809)
	mov eax, 0026h
	jmp OP_Epilogue
OP_SystemCall_10_0_18362:        ; Windows 10.0.18362 (1903)
	mov eax, 0026h
	jmp OP_Epilogue
OP_SystemCall_10_0_18363:        ; Windows 10.0.18363 (1909)
	mov eax, 0026h
	jmp OP_Epilogue
OP_SystemCall_10_0_19041:        ; Windows 10.0.19041 (2004)
	mov eax, 0026h
	jmp OP_Epilogue
OP_SystemCall_10_0_19042:        ; Windows 10.0.19042 (20H2)
	mov eax, 0026h
	jmp OP_Epilogue
OP_SystemCall_10_0_19043:        ; Windows 10.0.19043 (21H1)
	mov eax, 0026h
	jmp OP_Epilogue
OP_SystemCall_10_0_19044:        ; Windows 10.0.19043 (21H1)
	mov eax, 0026h
	jmp OP_Epilogue
OP_SystemCall_10_0_19045:        ; Windows 10.0.19043 (21H1)
	mov eax, 0026h
	jmp OP_Epilogue
OP_SystemCall_10_0_22000:        ; Windows 10.0.22000 (21H2 WIN 11)
	mov eax, 0026h
	jmp OP_Epilogue
OP_SystemCall_10_0_22621:        ; Windows 10.0.22621 (22H2 WIN 11) 
	mov eax, 0026h
	jmp OP_Epilogue
OP_SystemCall_10_0_22631:        ; Windows 10.0.22631 (23H2 WIN 11)
	mov eax, 0026h
	jmp OP_Epilogue
OP_SystemCall_Unknown:           ; Unknown/unsupported version.
	ret
OP_Epilogue:
	mov r10, rcx
	syscall
	ret
OP ENDP

end
