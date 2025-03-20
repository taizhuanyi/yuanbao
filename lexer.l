%{
#include <stdio.h>
#include <stdlib.h>
#include "parser.tab.h"
%}

%%
[0-9]+  { yylval.INT_ = atoi(yytext); return INT; }
"+"     { return ADD; }
"*"     { return MUL; }
\n      { return EOL; }
[ \t]   { /* 忽略空白字符 */ }
.       { printf("Mystery character %c\n", *yytext); }

%%
int main(int argc, char **argv)
{
    yyparse();
}
void yyerror(char *msg){
    printf("%s\n",msg);
}
int yywrap(){
    return 1;
}