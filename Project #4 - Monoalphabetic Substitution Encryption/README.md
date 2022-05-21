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
![string](..%5C..%5Charcoded-string.jpg)

**Main Menu**
![main menu](..%5C..%5Cmainmenu.jpg)

**Entered '2' to use the hard-coded string**
![used](..%5C..%5Cused-hardcoded.jpg)

**And done!**
![done-hardcoded](..%5C..%5Cdone-hardcoded.jpg)

**Entered 'y' to try again and '1' to input string**
![entering_input](..%5C..%5Centering-input.jpg)

**Processing the given string**
![used-input](..%5C..%5Cused-input.jpg)

**And done!**
![done](..%5C..%5Cdone.jpg)

