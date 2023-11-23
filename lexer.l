%{
    // Header section for C code and definitions
    #include <stdio.h>
    #include <string.h>
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
باطل      { return NULL; } 

"%"       { return MODULUS; }
"//"      { return FLOOR_DIVISION; }
"+"       { return ADD; }
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

 // Add more mappings for other Arabic words and tokens


[\t\n]     ;  // Ignore tabs and newlines
.          ;  // Ignore other characters
%%

int main() {
    yylex();
    return 0;
}
