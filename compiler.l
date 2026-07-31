%option noyywrap
%{
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "SymbolTable.h"
#define YYSTYPE SymbolInfo
#include "compiler.tab.h"

void yyerror(const char* msg);

extern int keywordCount;
extern int identifierCount;
extern int numberCount;
extern int operatorCount;

%}
DIGITS  [0-9]+
NUM	{DIGITS}
ID	[a-zA-Z_]
%%

[ \t]+ 	 { }
"int"
{
    keywordCount++;
    printf("🤖 [AI] Keyword Detected : int\n");
    return INT;
}
  
 "main"
{
    printf("🤖 [AI] Main Function Found\n");
    return MAIN;
}
 {NUM}
{
    numberCount++;
    printf("🤖 [AI] Number : %s\n", yytext);

    SymbolInfo ob(string(yytext), "NUM");
    yylval = (YYSTYPE) ob;
    return NUM;
}
 "="
{
    operatorCount++;
    printf("🤖 [AI] Assignment Operator (=)\n");
    return ASSOP;
}
 "&&"
{
    operatorCount++;
    printf("🤖 [AI] Logical AND (&&)\n");
    return LAND;
}
"||"
{
    operatorCount++;
    printf("🤖 [AI] Logical OR (||)\n");
    return LOR;
}
"!"
{
    operatorCount++;
    printf("🤖 [AI] Logical NOT (!)\n");
    return LNOT;
}
 "*"
{
    operatorCount++;
    printf("🤖 [AI] Multiplication Operator (*)\n");
    return MULOP;
}
 "/"
{
    operatorCount++;
    printf("🤖 [AI] Division Operator (/)\n");
    return DIVOP;
}
 "+"
{
    operatorCount++;
    printf("🤖 [AI] Addition Operator (+)\n");
    return ADDOP;
}
 "-"
{
    operatorCount++;
    printf("🤖 [AI] Subtraction Operator (-)\n");
    return SUBOP;
}

 "("
{
    printf("🤖 [AI] Left Parenthesis (\n");
    return LPARAN;
}
 ")"
{
    printf("🤖 [AI] Right Parenthesis )\n");
    return RPARAN;
}
"{" 	 {
			return *yytext;
		 }
"}" 	 {
			return *yytext;
		 }		 
";"      {return SEMICOLON;}
  {ID}
{
    identifierCount++;
    printf("🤖 [AI] Identifier : %s\n", yytext);

    SymbolInfo ob(string(yytext), "ID");
    yylval = (YYSTYPE) ob;
    return ID;
}
\n 	     {
			return NEWLINE;
		 }	 

exit     {
			return 0;
		 }

.        {
			char msg[25];
			sprintf(msg," <%s>","invalid character",yytext);
			yyerror(msg);
		 }
%%