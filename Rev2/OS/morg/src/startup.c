#include "startup.h"
#include "main.h"

extern long _estack;
extern long* _etext;
extern long* _sdata;
extern long* _edata;
extern long* _sbss;
extern long* _ebss;
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
    src = _etext;
    dst =  _sdata;
    while (dst < _edata)
    {
        *dst++ = *src++;
    }

    // Zero initialize .bss section in RAM
    dst = _sbss;
    while (dst < _ebss)
    {
        *dst++ = 0;
    }


#ifdef HARDWARE
    // Initialize DUART
#endif

    // Call the main function
    __main();

#ifdef HARDWARE
    // infinite loop until reset
    // when main returns
    while(1);
#endif

    return;
}

void Default_Handler(void) {
    // while (1);
    return;
}

// Provide weak definitions for the interrupt handlers
void Bus_Error_Handler(void)__attribute__((weak));
void Bus_Error_Handler(void) {
    Default_Handler();
}

void Address_Error_Handler(void)__attribute__((weak));
void Address_Error_Handler(void) {
    Default_Handler();
}

void Illegal_Instruction_Handler(void)__attribute__((weak));
void Illegal_Instruction_Handler(void) {
    Default_Handler();
}

void Zero_Divide_Handler(void)__attribute__((weak));
void Zero_Divide_Handler(void) {
    Default_Handler();
}

void CHK_Instruction_Handler(void) __attribute__((weak));
void CHK_Instruction_Handler(void) {
    Default_Handler();
}

void TRAPV_Instruction_Handler(void) __attribute__((weak));
void TRAPV_Instruction_Handler(void) {
    Default_Handler();
}

void Privilege_Violation_Handler(void) __attribute__((weak));
void Privilege_Violation_Handler(void) {
    Default_Handler();
}

void Trace_Handler(void) __attribute__((weak));
void Trace_Handler(void) {
    Default_Handler();
}

void Line_1010_Emulator_Handler(void) __attribute__((weak));
void Line_1010_Emulator_Handler(void) {
    Default_Handler();
}

void Line_1111_Emulator_Handler(void) __attribute__((weak));
void Line_1111_Emulator_Handler(void) {
    Default_Handler();
}

void Level1_Interrupt_Autovector_Handler(void) __attribute__((weak));
void Level1_Interrupt_Autovector_Handler(void) {
    Default_Handler();
}

void Level2_Interrupt_Autovector_Handler(void) __attribute__((weak));
void Level2_Interrupt_Autovector_Handler(void) {
    Default_Handler();
}

void Level3_Interrupt_Autovector_Handler(void) __attribute__((weak));
void Level3_Interrupt_Autovector_Handler(void) {
    Default_Handler();
}

void Level4_Interrupt_Autovector_Handler(void) __attribute__((weak));
void Level4_Interrupt_Autovector_Handler(void) {
    Default_Handler();
}

void Level5_Interrupt_Autovector_Handler(void) __attribute__((weak));
void Level5_Interrupt_Autovector_Handler(void) {
    Default_Handler();
}

void Level6_Interrupt_Autovector_Handler(void) __attribute__((weak));
void Level6_Interrupt_Autovector_Handler(void) {
    Default_Handler();
}

void Level7_Interrupt_Autovector_Handler(void) __attribute__((weak));
void Level7_Interrupt_Autovector_Handler(void) {
    Default_Handler();
}




