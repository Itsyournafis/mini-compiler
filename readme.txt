 Mini Compiler 

## Overview
This project is a Mini Compiler developed using Flex, Bison, and C++.

## Features
- Lexical Analysis
- Syntax Analysis
- Symbol Table Generation
- Three Address Code Generation
- Assembly Code Generation
- AI-style Compilation Report
- AI-style Error Messages

## Technologies
- C++
- Flex
- Bison
- GCC

## Compile

```bash
win_flex compiler.l
win_bison -d compiler.y
g++ lex.yy.c compiler.tab.c -o compiler.exe
compiler.exe
```

## Output Files
- code.ir
- code.asm
- Table.txt
- log.txt
