# Syscall-Shellcode-Injector

Proof of concept Windows shellcode injector to bypass AV and EDR by indirectly calling syscalls. Attempts to appear as a clock-like application creating and interacting with kernel timer syscall stubs, while writing and executing your shellcode. Currently uses hardcoded syscalls for Windows 11 23H2 ONLY, plan on implementing syswhispers for compatibility in the future.


## Features

- Decrypts XOR shellcodes and injects into running process with passed PID
- Finds timer interaction call locations through NtDLL and makes syscalls through them (NtCreateTimer, NtOpenTimer, NtSetTimer, NtQueryTimer, NtCancelTimer)
- Built with Windows API and standard C++ libraries

## Getting Started

Follow these simple steps to setup your environment and compile the injector:

### Prerequisites

1. As of right now, syscalls are hardcoded and the end user must be running Windows 11 23H2.
2. Shellcode must be XOR encrypted BEFORE you paste into code, or comment out decryption call
3. Visual Studio or another way to compile C++ link with assembly (see compiling below for more details)

### Installation

1. Clone or download the repository to your local machine:

2. Create a new C++ Visual Studio project in the directory

3. Open main.cpp and syscalls.asm as source files and wonka.h as a header file
   
4. Compile!

### Compiling

1. Right click on project name in Solution Explorer and click Build Dependencies --> Build Customizations
  
2. Check "masm" box and click Okay (see below)

![image](https://github.com/maxbarkouras/Syscall-Shellcode-Injector/assets/40187297/50cb96f4-3304-4d5f-ba76-9c5f592eace0)

4. Right click Syscalls.asm file in Solutions Explorer and click Properties
   
5. Set "Excluded From Build" to No, "Content" to Yes, and "Item Type" to Microsoft Macro Assembler (see below)

![image](https://github.com/maxbarkouras/Syscall-Shellcode-Injector/assets/40187297/bb34f9d9-1187-46c2-8e1a-2f38479b1435)

7. Done!

---

Happy hacking!!!
