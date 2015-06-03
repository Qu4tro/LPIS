%{

%}

%option noyywrap
%option yylineno

%%


[()]                 { return yytext[0];}
begin                { return (BEGINPRGM);}
declare              { return (DECLARE);}
statements           { return (STATEMENTS);}

int                  { return (INTEGER);}
string               { return (STRING);}
array                { return (ARRAY);}

true                 { return (TRUE_VALUE);}
false                { return (FALSE_VALUE);}

set                  { return (SET);}
while                { return (WHILE);}
cond                 { return (COND);}
"+"                  { return (PLUS);}
"-"                  { return (MINUS);}
"*"                  { return (MULT);}
"/"                  { return (DIV);}
"%"                  { return (MOD);}
"<"                  { return (LESS);}
"<="                 { return (LESSEQ);}
"=="                 { return (EQ);}
"!="                 { return (DIFF);}
">"                  { return (GREATER);}
">="                 { return (GREATEREQ);}
"&&"                 { return (AND);}
"||"                 { return (OR);}
"!"                  { return (NOT);}
get                  { return (GET);}
len                  { return (LEN);}
cat                  { return (CAT);}
print                { return (PRINT);}
prompt               { return (PROMPT);}

[0-9]+               { yylval.vali = atoi(yytext);   return(integer); }
[a-zA-Z][a-zA-Z0-9]* { yylval.vals = strdup(yytext); return(id); }
\"[^"]*\"            { yylval.vals = strdup(yytext); return(string); }

.|\n                 { ; }

%%
