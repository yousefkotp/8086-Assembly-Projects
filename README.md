# 8086-Assembly-Projects
A list of 8086 assembly projects and their answers for **Microprocessors course** (CC421N) at Faculty of Engineering, Alexandria University.
## Table of Content
- [8086-Assembly-Projects](#8086-assembly-projects)
  * [Project#0: Classroom grading](#project-0-classroom-grading)
  * [Project #1: Car waiting meter](#project--1--car-waiting-meter)
  * [Project #2: Packet transmission control](#project--2--packet-transmission-control)
  * [Project#3: Security Lock](#project-3--security-lock)
  * [Project#4: Monoalphabetic Substitution Encryption:](#project-4--monoalphabetic-substitution-encryption-)
  * [Project#5: Marathon results:](#project-5--marathon-results-)
  * [Project#6: Traffic light control](#project-6--traffic-light-control)
  * [Project#7: Heater Alarm](#project-7--heater-alarm)
  * [Project#8: ATM Machine](#project-8--atm-machine)
  * [Project#9: Mononumeric substitution encryption:](#project-9--mononumeric-substitution-encryption-)
  * [Contributors](#contributors)

## Project #0: Classroom grading
A classroom has 25 students. It is required to rearrange them in descending order according
to their grades in the microprocessor course.

The inputs are two tables. The first table contains the student number and the second one
contains their grades.

The outputs are two tables. The first one contains the student number arranged according to
their grades and the second table shows these grades.

## Project #1: Car waiting meter
In the car parking, a car waiting meter is used. The driver puts a certain amount of money and
this meter will allow him to park his car for a specific time.

The price list is as follows:

1 pound → 5 sec, 5 pound → 30 sec, 10 pound → 60 sec.

If the time is expired, a red led will turn on.

The input is the amount of money.

The output is LED turned red if time is expired.
## Project #2: Packet transmission control
Consider the maximum capacity of a network is 128 packets. The user starts his packets
transmission by 1 packet. Then he/she increases the number of packets according to the
following rules:

If the number of transmitted packets < 64 packets, the number will be doubled.

If the number of transmitted packets ≥ 64 packets, the number will be increased by 1.

If the number of transmitted packets = 128 packets, the user will start over and transmit 1
packets and repeat the previous rules.

The input is the size of the transmitted file.

The output is the number of Transmissions used to transmit this file.
## Project#3: Security Lock
In the bank, a security lock is used to access some rooms. This lock accepts two inputs: the
employee identification number (16 bits) and his/her password (4 bits). If the bank has 20
employees, construct their database and store it in the memory. Then write a program to
access these rooms.

The inputs of the program are the employee identification and the password.

The output is one bit (0/1) that means (denied/allowed).

## Project#4: Monoalphabetic Substitution Encryption:
In the monoalphabetic substitution encryption, each alphabetic letter is substituted by another
letter according to the following table:
Plain Text

a b c d e f g h i j k l m n o p q r s t u v w x y z

Cipher Text

q w e r t y u i o p a s d f g h j k l z x c v b n m

Construct this table and store it in the memory.

Write a program that allowed you to enter a plain text message, encrypt this message using
the stored table, then decrypt the cipher text to obtain the original text message.

Omit any space between words in your message.

## Project#5: Marathon results:
25 players are participated in a marathon. Their numbers and time in which they completed
the marathon are stored in the memory. It is required to rearrange them in ascending order to
find the winner.

The inputs are two tables. The first table contains the player number and the second one
contains their recorded time.

The outputs are two tables. The first one contains the player number arranged according to
their times and the second table shows these times.

## Project#6: Traffic light control
Write a program to control the time of the traffic lights. The red and green signals should be
on for 3 minutes. The yellow signal should be on for 1 minute. 
## Project#7: Heater Alarm
Consider a boiler in a petrochemical factory. Its temperature is measured every 3 minutes.
If the temperature <= 200ºC, a green led will turn on.

If the 200 < temperature < 500ºC, a yellow led will turn on.

If the temperature >= 500ºC, a red led will turn on.

Write a program that reads the temperature every 3 minutes and shows the LED condition.
## Project#8: ATM Machine
In ATM machine, an electronic lock circuit is used to authorize the card. This circuit has two
input codes: The card number that consists of 16 bits and the password that consists of 4 bits.
If the bank has 20 customers only uses the cards. 

Construct their database and store it in the memory. Then write a program for card authorization.
The inputs of the program are the card number and the password.

The output is one bit (0/1) that means (denied/allowed).
## Project#9: Mononumeric substitution encryption:
In the monoalphabetic substitution encryption, each alphabetic letter is substituted by another
letter according to the following table:

Plain text

a b c d e f g h i j k l m
Cipher text

1 2 3 4 5 6 7 8 9 10 11 12 13

Plain text

n O p q r s t u v w x y z

Cipher text

14 15 16 17 18 19 20 21 22 23 24 25 26

Construct this table and store it in the memory.

Write a program that allowed you to enter a text message, encrypt this message using the
stored table, then decrypt the cipher text to obtain the original text message.

Omit any space between words in your message.

## Contributors

