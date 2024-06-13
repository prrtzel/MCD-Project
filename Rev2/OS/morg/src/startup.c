#include "startup.h"
#include "main.c"

void Reset_Handler(void);

extern long _estack;

extern long _sidata;
extern long _sdata;
extern long _edata;
extern long _sbss;
extern long _ebss;
long* src;
long* dst;

__attribute__((section(".isr_vec")))
const long *isr_vectors[] = {
    (long *) &_estack,                              // Initial Stack Pointer
    (long *) Reset_Handler,                         // Reset handler
    (long *) Bus_Error_Handler,                     // Bus Error handler
    (long *) Address_Error_Handler,                 // Address Error handler
    (long *) Illegal_Instruction_Handler,           // Illegal Instruction handler
    (long *) Zero_Divide_Handler,                   // Zero Divide handler
    (long *) CHK_Instruction_Handler,               // CHK Instruction handler
    (long *) TRAPV_Instruction_Handler,             // TRAPV Instruction handler
    (long *) Privilege_Violation_Handler,           // Privilege Violation handler
    (long *) Trace_Handler,                         // Trace handler
    (long *) Line_1010_Emulator_Handler,            // Line 1010 Emulator handler
    (long *) Line_1111_Emulator_Handler,            // Line 1111 Emulator handler
    0,                                              // Unassigned, Reserved
    0,                                              // Unassigned, Reserved
    0,                                              // Unassigned, Reserved
    0,                                              // Unassigned, Reserved
    0,                                              // Unassigned, Reserved
    0,                                              // Unassigned, Reserved
    0,                                              // Unassigned, Reserved
    (long *) Level1_Interrupt_Autovector_Handler,   // Level 1 Interrupt Autovector handler
    (long *) Level2_Interrupt_Autovector_Handler,   // Level 2 Interrupt Autovector handler
    (long *) Level3_Interrupt_Autovector_Handler,   // Level 3 Interrupt Autovector handler
    (long *) Level4_Interrupt_Autovector_Handler,   // Level 4 Interrupt Autovector handler
    (long *) Level5_Interrupt_Autovector_Handler,   // Level 5 Interrupt Autovector handler
    (long *) Level6_Interrupt_Autovector_Handler,   // Level 6 Interrupt Autovector handler
    (long *) Level7_Interrupt_Autovector_Handler,   // Level 7 Interrupt Autovector handler
    0,                                              // Unassigned, Reserved
    0,                                              // Unassigned, Reserved
    0,                                              // Unassigned, Reserved
    0,                                              // Unassigned, Reserved
};

void Reset_Handler(void) {
    // Initialize stack pointer
    __asm__("move.l #_estack, %sp");

    // Copy .data section from ROM to RAM
    src = &_sidata;
    dst = &_sdata;
    while (dst < &_edata)
    {
        *dst++ = *src++;
    }


#ifdef HARDWARE
    // Initialize DUART
#endif

    // Call the main function
    __main();

    return;
}