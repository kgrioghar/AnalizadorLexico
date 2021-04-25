package codigo;
import static codigo.Tokens.*;
%%
%class Lexer
%type Tokens
L=[a-zA-Z_]+
D=[0-9]+
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
"=" {return Igual;}
"+" {return Suma;}
"-" {return Resta;}
"*" {return Multiplicacion;}
"/" {return Division;}
"," {return Coma;}
";" {return PuntoYComa;}
"++" {return SumaUno;}
"--" {return RestaUno;}
"==" {return Igualdad;}
">=" {return MayorIgual;}
">" {return Mayor;}
"?" {return Condicional;}
"<=" {return MenorIgual;}
"<" {return Menor;}
"!=" {return Diferente;}
"||" {return O;}
"&&" {return Y;}
"!" {return No;}
"%" {return Modulo;}
"(" {return AbreParentesis;}
")" {return CierraPArentesis;}
"[" {return AbreCorchetes;}
"]" {return CierraCorchetes;}
"{" {return AbreLlaves;}
"}" {return CierraLlaves;}
":" {return DosPuntos;}
"." {return Punto;}
"+=" {return SumaIgual;}
"-=" {return RestaIgual;}
"*=" {return MultiplicaIgual;}
"/=" {return DivideIgual;}
"&" {return Yb;}
"^" {return Potencia;}
"|" {return Ob;}
">>" {return DesplazamientoDerecha;}
"<<" {return DesplazamientoIzquierda;}
"~" {return Nob;}
"%=" {return ModuloIgual;}
"&=" {return YIgual;}
"^=" {return PotenciaIgual;}
"|=" {return OIgual;}
"<<=" {return AsignacionIzquierda;}
">>=" {return AsignacionDerecha;}
"->" {return AccesoElementoVector;}
"#" {return Gato;}
{L}({L}|{D})* {lexeme=yytext(); return Identificador;}
("(-"{D}+")")|{D}+ {lexeme=yytext(); return Numero;}
 . {return ERROR;}
