# x86-Assembly-Monoalphabetic-Substitution-Encryption-System
Monoalphabetic encryption/decryption system written in 8086 assembly language

## Table of Content
- [8086-Assembly-Monoalphabetic-Substitution-Encryption-System](#x86-assembly-monoalphabetic-substitution-encryption-system)
  * [Abstract](#abstract)
  * [Functionality](#functionality)
  * [Tools](#tools)
  * [Remarks](#remarks)
  * [Author](#author)
  * [Sample Run Using emu8086](#sample-run)
  

## Abstract
 Encryption can be done in various ways. One of the simplest methods is [**monoalphabetic cipher**](https://www.101computing.net/mono-alphabetic-substitution-cipher/). A monoalphabetic cipher is a substitution cipher where each letter of the plain text is replaced with another letter of the alphabet. It uses a fixed key which consist of the 26 letters of a “shuffled alphabet”.

 This program implements this method to encrypt/decrypt a string of characters.

 ## Functionality
**1. This program uses the following table as the reference for character substitution**
![table](https://user-images.githubusercontent.com/90573502/168689119-19c527fd-0ec6-4235-9358-ff8b50976086.jpg)

 **2. The program handles lowercase and uppercase characters**

 **3. This program omits all spaces in the result, however, I've clearly indicated the location of the part that does that in the code with comments so you can remove it at will.**

## Tools
1. emu8086 (IDE)
2. x86 Assembly

## Remarks
This assembly program was run and tested on the x86 emulator [emu8086](https://emu8086.en.lo4d.com/windows#:~:text=Tutorial....-,Emu8086%20is%20a%20Microprocessor%20Emulator%20with%20an%20integrated%208086%20Assembler,memory%20and%20input%2Foutput%20devices.).

## Author
[Adham Mohamed](https://github.com/adhammohamed1)

## Sample Run Using emu8086:

**The program lets the user choose whether to enter a string or use the hard-coded one**

This is the harcoded string:
![harcoded-string](https://user-images.githubusercontent.com/90573502/169605022-c2afbaba-cc8a-4a95-9a01-2f73ba2f491a.jpg)


**Main Menu**
![mainmenu](https://user-images.githubusercontent.com/90573502/169605037-9e5f0e06-e05c-4159-93fe-a56eb1b86fca.jpg)


**Entered '2' to use the hard-coded string**
![used-hardcoded](https://user-images.githubusercontent.com/90573502/169605063-d87085b4-c512-4dbb-aff2-af0a08ee338b.jpg)


**And done!**
![done-hardcoded](https://user-images.githubusercontent.com/90573502/169605079-7d2059ff-8184-49fe-819d-c3fb442dfd00.jpg)


**Entered 'y' to try again and '1' to input string**
![entering-input](https://user-images.githubusercontent.com/90573502/169605105-d9c69581-2fa4-4120-83b9-036d9e25edc9.jpg)


**Processing the given string**
![used-input](https://user-images.githubusercontent.com/90573502/169605121-7b83a252-f8fb-46ec-bc4c-93f0e57608aa.jpg)


**And done!**
![done](https://user-images.githubusercontent.com/90573502/169605129-8e9ad35b-9311-4823-bac2-cab9e9f3a6bf.jpg)

