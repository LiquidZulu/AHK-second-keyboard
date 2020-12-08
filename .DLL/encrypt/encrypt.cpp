// encrypt.cpp : Defines the exported functions for the DLL.
//

#include "pch.h"
#include "framework.h"
#include "encrypt.h"


// This is an example of an exported function.
ENCRYPT_API int crypt(std::string s, char k[1024], int FLAGS){
    {
        
    }
    return 0;
}

// This is the constructor of a class that has been exported.
Cencrypt::Cencrypt()
{
    return;
}



#include "cryptopp/aes.h"
#include "cryptopp/modes.h"
#include "cryptopp/filters.h"

QString Foo::decrypt(const QString& password)
{
    string plain;
    string encrypted = password.toStdString();
    // Hex decode symmetric key:
    HexDecoder decoder;
    decoder.Put((byte*)PRIVATE_KEY, 32 * 2);
    decoder.MessageEnd();
    word64 size = decoder.MaxRetrievable();
    char* decodedKey = new char[size];
    decoder.Get((byte*)decodedKey, size);
    // Generate Cipher, Key, and CBC
    byte key[AES::MAX_KEYLENGTH], iv[AES::BLOCKSIZE];
    StringSource(reinterpret_cast<const char*>(decodedKey), true,
        new HashFilter(*(new SHA256), new ArraySink(key, AES::MAX_KEYLENGTH)));
    memset(iv, 0x00, AES::BLOCKSIZE);
    try {
        CBC_Mode<AES>::Decryption Decryptor
        (key, sizeof(key), iv);
        StringSource(encrypted, true,
            new HexDecoder(new StreamTransformationFilter(Decryptor,
                new StringSink(plain))));
    }
    catch (Exception& e) { // ...
    }
    catch (...) { // ...
    }
    return QString::fromStdString(plain);
}

QString Foo::encrypt(const QString& password)
{
    string plain = password.toStdString();
    string ciphertext;
    // Hex decode symmetric key:
    HexDecoder decoder;
    decoder.Put((byte*)PRIVATE_KEY, 32 * 2);
    decoder.MessageEnd();
    word64 size = decoder.MaxRetrievable();
    char* decodedKey = new char[size];
    decoder.Get((byte*)decodedKey, size);
    // Generate Cipher, Key, and CBC
    byte key[AES::MAX_KEYLENGTH], iv[AES::BLOCKSIZE];
    StringSource(reinterpret_cast<const char*>(decodedKey), true,
        new HashFilter(*(new SHA256), new ArraySink(key, AES::MAX_KEYLENGTH)));
    memset(iv, 0x00, AES::BLOCKSIZE);
    CBC_Mode<AES>::Encryption Encryptor(key, sizeof(key), iv);
    StringSource(plain, true, new StreamTransformationFilter(Encryptor,
        new HexEncoder(new StringSink(ciphertext))));
    return QString::fromStdString(ciphertext);
}