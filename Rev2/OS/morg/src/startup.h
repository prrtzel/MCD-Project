#ifndef STARTUP_H
#define STARTUP_H

//#define HW
#define SIM

#pragma region weak handlers
void Bus_Error_Handler(void)__attribute__((weak));
void Address_Error_Handler(void)__attribute__((weak));
void Illegal_Instruction_Handler(void)__attribute__((weak));
void Zero_Divide_Handler(void)__attribute__((weak));
void CHK_Instruction_Handler(void)__attribute__((weak));
void TRAPV_Instruction_Handler(void)__attribute__((weak));
void Privilege_Violation_Handler(void)__attribute__((weak));
void Trace_Handler(void)__attribute__((weak));
void Line_1010_Emulator_Handler(void)__attribute__((weak));
void Line_1111_Emulator_Handler(void)__attribute__((weak));
void Level1_Interrupt_Autovector_Handler(void)__attribute__((weak));
void Level2_Interrupt_Autovector_Handler(void)__attribute__((weak));
void Level3_Interrupt_Autovector_Handler(void)__attribute__((weak));
void Level4_Interrupt_Autovector_Handler(void)__attribute__((weak));
void Level5_Interrupt_Autovector_Handler(void)__attribute__((weak));
void Level6_Interrupt_Autovector_Handler(void)__attribute__((weak));
void Level7_Interrupt_Autovector_Handler(void)__attribute__((weak));

void Default_Handler(void) {
    while (1);
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
#pragma endregion
#endif