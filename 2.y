%{
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

void yyerror(const char *msg);
int yylex();

%}

%union {
    int num;        // 用于存储整数
    double fnum;    // 用于存储浮点数
}

%token <num> INT    // 整数
%token <fnum> FLOAT // 浮点数
%token ADD SUB MUL DIV LP RP EOL // 运算符和符号

%left ADD SUB       // 加减法优先级
%left MUL DIV       // 乘除法优先级
%left UMINUS        // 一元负号优先级

%type <fnum> exp    // 表达式类型为浮点数

%%

calclist:
    calclist exp EOL { printf("=%.3f\n", $2); } // 输出结果，保留三位小数
    | // 空规则
    ;

exp:
    exp ADD exp      { $$ = $1 + $3; }          // 加法
    | exp SUB exp    { $$ = $1 - $3; }          // 减法
    | exp MUL exp    { $$ = $1 * $3; }          // 乘法
    | exp DIV exp    { $$ = $1 / $3; }          // 除法
    | LP exp RP      { $$ = $2; }               // 括号
    | SUB exp %prec UMINUS { $$ = -$2; }        // 一元负号
    | INT            { $$ = (double)$1; }       // 整数转浮点数
    | FLOAT          { $$ = $1; }               // 浮点数
    ;

%%

void yyerror(const char *msg) {
    printf("%s\n", msg);
    exit(1);
}

int main(int argc, char **argv) {
    yyparse();
    return 0;
}