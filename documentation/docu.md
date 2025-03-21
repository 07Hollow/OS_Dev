We will use x86 ASM so it will work for x86 CPUs

# How does a computer starts
1. BIOS is copied from a ROM chip into the RAM

2. BIOS starts executing code
- Hardware is initialized
- POST
(logo could pop up here)

3. BIOS searches for an OS to start
3.1 How does it find the OS
3.1.1 Legacy boot
- BIOS loads first sector of each bootable device into the memory. ! The memory location is: 0x7C00 !
- BIOS checks for 0xAA55 signature
- If found -> executing code
3.1.2 EFI (irrelevant for this OS)
- BIOS looks into special EFI partitions
- OS must be compiled as an EFI program

4. BIOS loads and start OS 

5. OS runs

# Concept of x86 architecture
All processors have a number of registers (very small and fast memory)

![alt x86 architecture](img/x86_architecture.png)

## Gerneral purpose registers
### index registers

![alt index register](img/index_registers.png)

mainly used for keeping indices and pointers

## Status registers 
### Program counter

![alt Status register](img/status_register.png)

Keeps track of which memory location the curent instruction begins

### Flags register

contains special flags which are set by various instructions

## Segment registers

![alt segmemnt register](img/segment_register.png)

Are used to keep track of the currently active memory segments 
**CS:** currently running code segment
**DS:** Data segment 
**SS:** Stack segment
**ES, FS, GS:** extra (data) segments

# RAM memory
The Intel 8086 is a 16-Bit-micro-processor. It has 20-bit address bus. That means you have around 1MB of addressable memory.
Since computers had 64-128 KB of memory at the time they thought that this was a huge amount of memory.

They used a segment and offset addressing scheme for memory:

    0x1234:0x5678
    segment:offset

In this scheme you address memory by using two 16-Bit values.
1. The segment
2. The offset
each of them contains 64 KB of memory where each byte can be accessed through using the offset value.
Since segments overlap every 16 bytes you can convert a segment offset address to an absolute address by shifting the segmants 
four bits to the left and then multiply it by 16 and then adding the offset. 

In short: There are multiple ways of addressing the same memory location.

    address = segment * 16 + offset

For example the address **0x7C00** can be writen in the following combinations:
- 0x0000:0x7C00
- 0x0001:0x7BF0
- 0x0010:0x7B00
- 0x00C0:0x7C00
- 0x07C0:0x0000

