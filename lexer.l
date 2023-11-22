%{
// Header section for C code and definitions
#include <stdio.h>
#include <string.h>

%}

%%
فارغ      { handleToken(TOKEN_VOID); }
طباعة     { handleToken(TOKEN_PRINT); }
إذا       { handleToken(TOKEN_IF); }
إذلا       { handleToken(TOKEN_IFELSE); }
وإلا       { handleToken(TOKEN_ELSE); }
بينما     { handleToken(TOKEN_WHILE); }
ل         { handleToken(TOKEN_FOR); }
صحيح      { handleToken(TOKEN_INTEGER); }
سلسلة     { handleToken(TOKEN_STRING); }
عائم      { handleToken(TOKEN_FLOAT); }
بولياني   { handleToken(TOKEN_BOOLEAN); }
إدخال     { handleToken(TOKEN_INPUT); }
إخراج     { handleToken(TOKEN_OUTPUT); }
صف        { handleToken(TOKEN_CLASS); }
إرجاع     { handleToken(TOKEN_RETURN); }
كسر       { handleToken(TOKEN_BREAK); }
افتراضي   { handleToken(TOKEN_DEFAULT); }
موديولوس  { handleToken(TOKEN_MODULUS); }
قسمة      { handleToken(TOKEN_DIVISION); }
رئيسي     { handleToken(TOKEN_MAIN); }
ملف       { handleToken(TOKEN_FILE); }
تضمين     { handleToken(TOKEN_INCLUDE); }
حرف       { handleToken(TOKEN_CHARACTER); }
باطل      { handleToken(TOKEN_NULL); }  // Add more mappings for other Arabic words and tokens


[\t\n]     ;  // Ignore tabs and newlines
.          ;  // Ignore other characters
%%

int main() {
    yylex();
    return 0;
}
