// The following ifdef block is the standard way of creating macros which make exporting
// from a DLL simpler. All files within this DLL are compiled with the ENCRYPT_EXPORTS
// symbol defined on the command line. This symbol should not be defined on any project
// that uses this DLL. This way any other project whose source files include this file see
// ENCRYPT_API functions as being imported from a DLL, whereas this DLL sees symbols
// defined with this macro as being exported.
#ifdef ENCRYPT_EXPORTS
#define ENCRYPT_API __declspec(dllexport)
#else
#define ENCRYPT_API __declspec(dllimport)
#endif

// This class is exported from the dll
class ENCRYPT_API Cencrypt {
public:
	Cencrypt(void);
	// TODO: add your methods here.
};

ENCRYPT_API int crypt(string s, char k[1024], int FLAGS);


#define FLAG__NONE              0x0
#define FLAG__ENCRYPT           0x1
#define FLAG__BLOCK_CIPHER_AES  0x2
#define FLAG__ALL               0xffff