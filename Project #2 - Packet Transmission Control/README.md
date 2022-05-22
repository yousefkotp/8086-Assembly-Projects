# Packet Transmission Control EMU 8086  
## Table of Content
- [Classroom-Grading-emu-8086](#classroom-grading-emu-8086)
  * [Abstract](#abstract)
  * [Sample Run](#sample-run)
  * [Author](#author)

## Abstract
Consider the maximum capacity of a network is 128 packets. The user starts his packets
transmission by 1 packet. Then he/she increases the number of packets according to the
following rules:

If the number of transmitted packets < 64 packets, the number will be doubled.

If the number of transmitted packets ≥ 64 packets, the number will be increased by 1.

If the number of transmitted packets = 128 packets, the user will start over and transmit 1
packets and repeat the previous rules.

The input is the size of the transmitted file.

The output is the number of Transmissions used to transmit this file.
## Sample Run
![image](https://user-images.githubusercontent.com/41492875/169708314-d157b7f6-33ce-42ef-b29c-c65ccb7afdf7.png)

## Author
[Yousef Kotp](https://github.com/yousefkotp)
