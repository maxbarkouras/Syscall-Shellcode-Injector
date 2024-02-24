# Syscall-Shellcode-injector
Proof of concept Windows shellcode injector to bypass AV and EDR

Uses indirect syscalls to appear as an application creating and interacting with a kernel timer

Currently uses syscalls for Windows 11 ONLY, plan on implementing syswhispers for compatibility

Shellcode must be XOR encrypted or you need to remove XOR decryption method