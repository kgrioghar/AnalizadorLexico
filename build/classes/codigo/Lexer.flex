package codigo;
import static codigo.Tokens.*;
%%
%class Lexer
%type Tokens
%x str
L=[a-zA-Z_]+
D=[0-9]+
O=[0-7]+
H=[0-9a-fA-F]+
espacio=[ ,\t,\r,\n]+
%{
    public String lexeme;
%}
%%
auto |
break |
case |
char |
const |
continue |
default |
do |
double |
else |
enum |
extern |
float |
for |
goto |
if |
int |
long |
register |
return |
short |
signed |
sizeof |
static |
struct |
switch |
typedef |
union |
unsigned |
void |
volatile |
while {lexeme=yytext(); return Reservadas;}
{espacio} {/*Ignore*/}
"//".* {/*Ignore*/}
"=" |
"+" |
"-" |
"*" |
"/" |
"," |
";" |
"++" |
"--" |
"==" |
">=" |
">" |
"?" |
"<=" |
"<" |
"!=" |
"||" |
"&&" |
"!" |
"%" |
"(" |
")" |
"[" |
"]" |
"{" |
"}" |
":" |
"." |
"+=" |
"-=" |
"*=" |
"/=" |
"&" |
"^" |
"|" |
">>" |
"<<" |
"~" |
"%=" |
"&=" |
"^=" |
"|=" |
"<<=" |
">>=" |
"->" |
"#" {lexeme=yytext(); return Operador;}
{L}({L}|{D})* {lexeme=yytext(); return Identificador;}
("(-"{D}+")")|{D}+ {lexeme=yytext(); return Literal;}
"\""+([a-zA-z0-9])+ [a-zA-z0-9]*"\"" {lexeme=yytext(); return Literal;}
 . {return ERROR;}
