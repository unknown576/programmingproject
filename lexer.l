%{
    // Header section for C code and definitions
    #include <stdio.h>
    #include <string.h>
%}

%%
فارغ      { handleToken(VOID); }
طباعة     { handleToken(PRINT); }
إذا       { handleToken(IF); }
إذلا       { handleToken(IFELSE); }
وإلا       { handleToken(ELSE); }
بينما     { handleToken(WHILE); }
ل         { handleToken(FOR); }

صحيح      { handleToken(INTEGER); }
عائم      { handleToken(FLOAT); }
حرف       { handleToken(CHARACTER); }
بولياني   { handleToken(BOOLEAN); }
صف        { handleToken(CLASS); }
عائم*     { handleToken(FLOAT_STAR); }
صحيح*     { handleToken(INTEGER_STAR); }
حرف*      { handleToken(CHARACTER_STAR); }
STRUCT    { handleToken(STRUCT); }
STRUCT_STAR { handleToken(STRUCT_STAR); }

إرجاع     { handleToken(RETURN); }
افتراضي   { handleToken(DEFAULT); }
تضمين     { handleToken(INCLUDE); }
باطل      { handleToken(NULL); } 

موديولوس  { handleToken(MODULUS); }
قسمة      { handleToken(DIVISION); }
"+"       { handleToken(ADD); }
"-"       { handleToken(MINUS); }
"*"       { handleToken(MULTIPLY); }
"/"       { handleToken(DIVIDE); }  

"("       { handleToken(LEFT_PAREN); }
")"       { handleToken(RIGHT_PAREN); }
","       { handleToken(COMMA); }
";"       { handleToken(SEMICOLON); }
"."       { handleToken(PERIOD); }
":"       { handleToken(COLON); }
"?"       { handleToken(QUESTION_MARK); }
"!"       { handleToken(EXCLAMATION_MARK); }
"["       { handleToken(LEFT_BRACKET); }
"]"       { handleToken(RIGHT_BRACKET); }
"{"       { handleToken(LEFT_BRACE); }
"}"       { handleToken(RIGHT_BRACE); }

"="       { handleToken(EQUALS); }
"<"       { handleToken(LESS_THAN); }
">"       { handleToken(GREATER_THAN); }
"&&"      { handleToken(AMPERSAND); }
"||"      { handleToken(PIPE); }
"^"       { handleToken(CARET); }
"%"       { handleToken(PERCENT); }
"\\"      { handleToken(BACKSLASH); }
"'"       { handleToken(SINGLE_QUOTE); }
"+="      { handleToken(INCREMENT_BY); }
"-="      { handleToken(DECREASE_BY); }
"/="      { handleToken(DIVIDE_BY); }
"%="      { handleToken(MOD_BY); }
"!="      { handleToken(NOT_EQUAL_TO); }
"<="      { handleToken(LESS_THAN_OR_EQUAL_TO); }
">="      { handleToken(GREATER_THAN_OR_EQUAL_TO); }
"\\"      { handleToken(BACKSLASH); }

 // Add more mappings for other Arabic words and tokens


[\t\n]     ;  // Ignore tabs and newlines
.          ;  // Ignore other characters
%%

int main() {
    yylex();
    return 0;
}
