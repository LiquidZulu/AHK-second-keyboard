﻿MsgBox % bcrypt_pbkdf2_sha384("The quick brown fox jumps over the lazy dog", "Secret Salt")
; -> baad91313b631b698db4110bd28aa3b35e0cd19709ebf665e68da7f2afd89003037e162204eb91a1af7ef01e9327c7d4



bcrypt_pbkdf2_sha384(password, salt, iterations := 4096, keysize := 48, encoding := "utf-8")
{
    static BCRYPT_SHA384_ALGORITHM     := "SHA384"
    static BCRYPT_ALG_HANDLE_HMAC_FLAG := 0x00000008

	try
	{
		; loads the specified module into the address space of the calling process
		if !(hBCRYPT := DllCall("LoadLibrary", "str", "bcrypt.dll", "ptr"))
			throw Exception("Failed to load bcrypt.dll", -1)

		; open an algorithm handle
		if (NT_STATUS := DllCall("bcrypt\BCryptOpenAlgorithmProvider", "ptr*", hAlg, "ptr", &BCRYPT_SHA384_ALGORITHM, "ptr", 0, "uint", BCRYPT_ALG_HANDLE_HMAC_FLAG) != 0)
			throw Exception("BCryptOpenAlgorithmProvider: " NT_STATUS, -1)

		; allocate the derived key buffer
		VarSetCapacity(pbDKey, keysize, 0)
		;	throw Exception("Memory allocation failed", -1)

		; derives a key from a hash value
		VarSetCapacity(pbPass, (StrPut(password, encoding) - 1) * ((encoding = "utf-16" || encoding = "cp1200") ? 2 : 1), 0) && cbPass := StrPut(password, &pbPass, encoding) - 1
		VarSetCapacity(pbSalt, (StrPut(salt,     encoding) - 1) * ((encoding = "utf-16" || encoding = "cp1200") ? 2 : 1), 0) && cbSalt := StrPut(salt,     &pbSalt, encoding) - 1
		if (NT_STATUS := DllCall("bcrypt\BCryptDeriveKeyPBKDF2", "ptr", hAlg, "ptr", &pbPass, "uint", cbPass, "ptr", &pbSalt, "uint", cbSalt, "int64", iterations, "ptr", &pbDKey, "uint", keysize, "uint", 0) != 0)
			throw Exception("BCryptDeriveKeyPBKDF2: " NT_STATUS, -1)

		loop % keysize
			pbkdf2 .= Format("{:02x}", NumGet(pbDKey, A_Index - 1, "uchar"))
	}
	catch exception
	{
		; represents errors that occur during application execution
		throw Exception
	}
	finally
	{
		; cleaning up resources
		if (pbSalt)
			VarSetCapacity(pbSalt, 0)
		if (pbPass)
			VarSetCapacity(pbPass, 0)
		if (pbDKey)
			VarSetCapacity(pbDKey, 0)
		if (hAlg)
			DllCall("bcrypt\BCryptCloseAlgorithmProvider", "ptr", hAlg, "uint", 0)
		if (hBCRYPT)
			DllCall("FreeLibrary", "ptr", hBCRYPT)
	}

	return pbkdf2
}