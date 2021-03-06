# RUN: llvm-mc -triple i686-unknown-unknown --show-encoding %s | FileCheck %s --check-prefix=CHECK --check-prefix=CHECK-X86
# RUN: llvm-mc -triple x86_64-unknown-unknown --show-encoding %s | FileCheck %s --check-prefix=CHECK --check-prefix=CHECK-X64

llwpcb %ecx
# CHECK: llwpcb %ecx
# CHECK-X86: encoding: [0x8f,0xe9,0x78,0x12,0xc1]
# CHECK-X64: encoding: [0x8f,0xe9,0x78,0x12,0xc1]

slwpcb %eax
# CHECK: slwpcb %eax
# CHECK-X86: encoding: [0x8f,0xe9,0x78,0x12,0xc8]
# CHECK-X64: encoding: [0x8f,0xe9,0x78,0x12,0xc8]

lwpins $305419896, %ebx, %eax
# CHECK: lwpins $305419896, %ebx, %eax
# CHECK-X86: encoding: [0x8f,0xea,0x78,0x12,0xc3,0x78,0x56,0x34,0x12]
# CHECK-X64: encoding: [0x8f,0xea,0x78,0x12,0xc3,0x78,0x56,0x34,0x12]

lwpins $591751049, (%esp), %edx
# CHECK: lwpins $591751049, (%esp), %edx
# CHECK-X86: encoding: [0x8f,0xea,0x68,0x12,0x04,0x24,0x89,0x67,0x45,0x23]
# CHECK-X64: encoding: [0x67,0x8f,0xea,0x68,0x12,0x04,0x24,0x89,0x67,0x45,0x23]

lwpval $1737075661, %ebx, %eax
# CHECK: lwpval $1737075661, %ebx, %eax
# CHECK-X86: encoding: [0x8f,0xea,0x78,0x12,0xcb,0xcd,0xab,0x89,0x67]
# CHECK-X64: encoding: [0x8f,0xea,0x78,0x12,0xcb,0xcd,0xab,0x89,0x67]

lwpval $2309737967, (%esp), %edx
# CHECK: lwpval $2309737967, (%esp), %edx
# CHECK-X86: encoding: [0x8f,0xea,0x68,0x12,0x0c,0x24,0xef,0xcd,0xab,0x89]
# CHECK-X64: encoding: [0x67,0x8f,0xea,0x68,0x12,0x0c,0x24,0xef,0xcd,0xab,0x89]
