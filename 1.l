%{
#include <stdio.h>
#include <stdlib.h>
#include "parser.tab.h"

void yyerror(const char *msg);
%}

%%

[0-9]+              { yylval.num = atoi(yytext); return INT; }          // 十进制整数
0[0-7]+             { yylval.num = strtol(yytext, NULL, 8); return INT; } // 八进制整数
0x[0-9a-fA-F]+      { yylval.num = strtol(yytext, NULL, 16); return INT; } // 十六进制整数
[0-9]+\.[0-9]*      { yylval.fnum = atof(yytext); return FLOAT; }       // 浮点数
[0-9]*\.[0-9]+      { yylval.fnum = atof(yytext); return FLOAT; }       // 浮点数
[0-9]+[eE][+-]?[0-9]+ { yylval.fnum = atof(yytext); return FLOAT; }     // 科学计数法浮点数
"+"                 { return ADD; }                                     // 加号
"-"                 { return SUB; }                                     // 减号
"*"                 { return MUL; }                                     // 乘号
"/"                 { return DIV; }                                     // 除号
"("                 { return LP; }                                      // 左括号
")"                 { return RP; }                                      // 右括号
\n                  { return EOL; }                                     // 换行符
[ \t]               { /* 忽略空白字符 */ }                              // 忽略空格和制表符
.                   { yyerror("Syntactical Error."); }                  // 非法字符

%%

int yywrap() {
    return 1;
}