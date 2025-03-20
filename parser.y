%{
#include<stdio.h>
void yyerror(char *msg);
int yylex();
%}

%union{
    int INT_;
    int exp_;
}

%token <INT_> INT
%left ADD
%left MUL
%token EOL

%type <exp_> exp;

%%
calclist:
   calclist exp EOL { printf("=%d\n", $2); YYACCEPT; }
 | 
 ;

exp: 
   exp ADD exp      { $$ = $1 + $3; }
 | exp MUL exp      { $$ = $1 * $3; }
 | INT              { $$ = $1; }
 ;

%%