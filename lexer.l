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
بولياني   { handleToken(BOOLEAN); }
إدخال     { handleToken(INPUT); }
إخراج     { handleToken(OUTPUT); }
صف        { handleToken(CLASS); }
إرجاع     { handleToken(RETURN); }
كسر       { handleToken(BREAK); }
افتراضي   { handleToken(DEFAULT); }
موديولوس  { handleToken(MODULUS); }
قسمة      { handleToken(DIVISION); }
رئيسي     { handleToken(MAIN); }
ملف       { handleToken(FILE); }
تضمين     { handleToken(INCLUDE); }
حرف       { handleToken(CHARACTER); }
باطل      { handleToken(NULL); }  
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
"?"       { handleToken(QUESTION_MARK\); }
"!"       { handleToken(EXCLAMATION_MARK); }
"="       { handleToken(EQUALS); }
"<"       { handleToken(LESS_THAN); }
">"       { handleToken(GREATER_THAN); }
"["       { handleToken(LEFT_BRACKET); }
"]"       { handleToken(RIGHT_BRACKET); }
"{"       { handleToken(LEFT_BRACE); }
"}"       { handleToken(RIGHT_BRACE); }
"&&"       { handleToken(AMPERSAND); }
"||"       { handleToken(PIPE); }
"^"       { handleToken(CARET); }
"~"       { handleToken(TILDE); }
"%"       { handleToken(PERCENT); }
"\\"      { handleToken(BACKSLASH); }
"'"       { handleToken(SINGLE_QUOTE); }
"""      { handleToken(DOUBLE_QUOTE); } // Add more mappings for other Arabic words and tokens


[\t\n]     ;  // Ignore tabs and newlines
.          ;  // Ignore other characters
%%

int main() {
    yylex();
    return 0;
}
