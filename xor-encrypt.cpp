#include <iostream>
#include <cstring>

void xor_encrypt(unsigned char* data, int data_length, const char* key) {
    int key_length = strlen(key);
    for (int i = 0; i < data_length; ++i) {
        data[i] ^= key[i % key_length];
    }
}

int main() {
unsigned char shellcode[] = "SHELLCODE HERE";

    //define key for XOR encryption
    const char* key = "Zasdwes2";

    //get size of shellcode
    int shellcode_length = sizeof(shellcode);

    //run encryption function
    xor_encrypt(shellcode, shellcode_length, key);

    //print shellcode in \x format
    std::cout << "Encrypted shellcode: ";
    for (int i = 0; i < shellcode_length; ++i) {
        std::cout << "\\x" << std::hex << (int)shellcode[i];
    }
    std::cout << std::endl;

    //exit
    return 0;
}
