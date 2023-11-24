%{
    // Header section for C code and definitions
    #include <stdio.h>
    #include <string.h>
%}

%option noyywrap

%option yylineno

%{
#define PRINT 1
#define IF 2
#define IFELSE 3
#define ELSE 4
#define WHILE 5
#define FOR 6

#define INTEGER 7
#define FLOAT 8
#define CHARACTER 9
#define FLOAT_PTR 10
#define INTEGER_PTR 11
#define CHARACTER_PTR 12

#define RETURN 13
#define DEFAULT 14
#define INCLUDE 15

#define MODULUS 16
#define FLOOR_DIVISION 17
#define PLUS 18
#define MINUS 19
#define MULTIPLY 20
#define DIVIDE 21
#define EXPONENT 22

#define LEFT_PAREN 23
#define RIGHT_PAREN 24
#define COMMA 25
#define SEMICOLON 26
#define PERIOD 27
#define COLON 28
#define QUESTION_MARK 29
#define EXCLAMATION_MARK 30
#define LEFT_BRACKET 31
#define RIGHT_BRACKET 32
#define LEFT_BRACE 33
#define RIGHT_BRACE 34

#define EQUAL_TO 35
#define LESS_THAN 36
#define GREATER_THAN 37
#define AND 38
#define OR 39
#define XOR 40


#define SINGLE_QUOTE 41
#define INCREMENT_BY 42
#define DECREASE_BY 43
#define DIVIDE_BY 44
#define MOD_BY 45
#define NOT_EQUAL_TO 46
#define LESS_THAN_OR_EQUAL_TO 47
#define GREATER_THAN_OR_EQUAL_TO 48
#define BACKSLASH 49

%}



%%
طباعة     { return PRINT; }
إذا       { return IF; }
إذلا       { return IFELSE; }
وإلا       { return ELSE; }
بينما     { return WHILE; }
ل         { return FOR; }

صحيح      { return INTEGER; }
عائم      { return FLOAT; }
حرف       { return CHARACTER; }

عائم*     { return FLOAT_PTR; }
صحيح*     { return INTEGER_PTR; }
حرف*      { return CHARACTER_PTR; }

إرجاع     { return RETURN; }
افتراضي   { return DEFAULT; }
تضمين     { return INCLUDE; } 

"%"       { return MODULUS; }
"//"      { return FLOOR_DIVISION; }
"+"       { return PLUS; }
"-"       { return MINUS; }
"*"       { return MULTIPLY; }
"/"       { return DIVIDE; }  
"**"      { return EXPONENT; } 


"("       { return LEFT_PAREN; }
")"       { return RIGHT_PAREN; }
","       { return COMMA; }
";"       { return SEMICOLON; }
"."       { return PERIOD; }
":"       { return COLON; }
"?"       { return QUESTION_MARK; }
"!"       { return EXCLAMATION_MARK; }
"["       { return LEFT_BRACKET; }
"]"       { return RIGHT_BRACKET; }
"{"       { return LEFT_BRACE; }
"}"       { return RIGHT_BRACE; }

"="       { return EQUAL_TO; }
"<"       { return LESS_THAN; }
">"       { return GREATER_THAN; }
"&&"      { return AND; } 
"||"      { return OR; }
"^"       { return XOR; }  

"'"       { return SINGLE_QUOTE; }
"+="      { return INCREMENT_BY; }
"-="      { return DECREASE_BY; }
"/="      { return DIVIDE_BY; }
"%="      { return MOD_BY; }
"!="      { return NOT_EQUAL_TO; }
"<="      { return LESS_THAN_OR_EQUAL_TO; }
">="      { return GREATER_THAN_OR_EQUAL_TO; }
"\\"      { return BACKSLASH; }



[\t\n]     ;  // Ignore tabs and newlines
.          ;  // Ignore other characters
%%

int main() {
    yylex();
    return 0;
}
