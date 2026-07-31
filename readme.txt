Commands for making  compiling a.exe which is will be our Compiler for C language:

flex compiler.l
bison -d compiler.y
g++ lex.yy.c compiler.tab.c

Input:
input.txt contains the input of the compiler

Language:
You should consider the following subset of C language which has the following characteristics:
→ There can be only one function named main without any parameter and return type.
→ Statements can be either declaration of a single variable of basic data type or arithmetic expression
which ends with a semicolon.
→ Arithmetic expression can be any assignment using all types of operator for arithmetic expression
you have seen so far. Precedence and associativity rules should be maintained as per standard.
Note:
→ There will be no pre-processing directives like #include or #define.
→ No need to handle initialization of variable in the declaration statement.
→ No return, break statement, switch-case statement, loop and conditional statement will be used


Partial Grammar:
prog → MAIN(){ stmt }
stmt → stmt unit | unit
unit → var_decl NEWLINE
| expr_decl NEWLINE
var_decl → type_spec decl_list SEMICOLON
type_spec→ INT
decl_list→ term
expr→ NUM
| expr ADDOP expr
| expr MULOP expr
| <add other grammar for other arithmetic and logical operator>
| <add grammar rule for expression with parentheses>
|term
term→ ID
expr_decl-> term ASSOP expr SEMICOLON

Outputs:

→ For each production of the grammar directly print in the output file “code.ir” as soon as three
address code needs be generated.

→ When parser reduce to the start symbol, it will print in the output file
“code.asm”

→ To check the generated “code.asm” file add initialization part in assembly program like initializing
the data segment register in the main procedure of the generated assembly code. Some instuction may not be same for all proccesosr.
