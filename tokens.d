
import std.ascii;
import std.array;
import std.string;
import std.algorithm;
import std.stdio;

enum
{
    TOKstring,
    TOKop,
    TOKchar,
    TOKnum,
    TOKid,
    TOKkey,
    TOKeof
};
alias int TokenType;

struct Token
{
    string file;
    size_t line;
    string text;
    TokenType type;
    bool flag;
};

struct Lexer
{
    string file;
    size_t line = 1; // files start at line number one
    string t;
    Token current;

    this(string t, string fn)
    {
        this.file = fn;
        this.t = t;
        popFront();
    }

    bool empty() { return current.type == TOKeof; }
    Token front() { return current; }
    void popFront()
    {
        auto f = t;
        while (current.type != TOKeof)
        {
            if (t.length >= 1 && isWhite(t[0])) SkipWhitespace();
            else if (t.length >= 2 && t[0..2] == "/*") SkipComment();
            else if (t.length >= 2 && t[0..2] == "//") SkipLineComment();
            else break;
        }
        if (t.empty)
        {
            current = Token(file, line, null, TOKeof);
            return;
        }

        if (0) {}
        else if (t.length >= 1 && t[0..1] == "\"") ReadStringLiteral();
        else if (t.length >= 1 && t[0..1] == "'") ReadCharLiteral();
        else if (t.length >= 1 && (isAlpha(t[0]) || t[0] == '_')) ReadIdentifier();
        else if (t.length >= 1 && isDigit(t[0])) ReadNumber();
        else ReadOperator();
        line += count(f[0..$-t.length], '\n');
        current.line = line;
        current.file = file;
        //writeln(current);
    }

    void SkipWhitespace()
    {
        assert(isWhite(t[0]));
        auto i = 0;
        while(!t.empty && isWhite(t.front))
            t.popFront();
    }

    void SkipComment()
    {
        assert(t[0..2] == "/*");
        t = t[2..$];
        bool found = false;

        while (1)
        {
            if (t.empty) break;
            if (t.length >= 2 && t[0..2] == "*/") break;
            t.popFront();
        }

        assert(t[0..2] == "*/");
        t = t[2..$];
    }

    void SkipLineComment()
    {
        assert(t[0..2] == "//");
        while(!t.empty && t.front != '\n')
            t.popFront();
    }

    void ReadStringLiteral()
    {
        assert(t[0] == '"');

        bool Escape = false;
        auto s = "\"";
        auto i = 1;

        while( i < t.length && !(t[i] == '"' && !Escape) )
        {
            if (t[i] == '\\' || Escape)
            {
                Escape = !Escape;
                if (t[i] == '\n')
                {
                    s = s[0..$-1];
                    i++;
                    continue;
                }
            }
            s ~= t[i];
            ++i;
        }

        assert(t[i] == '"');
        s ~= t[i];
        current = Token(file, line, s, TOKstring);
        t = t[i+1..$];
    }

    void ReadCharLiteral()
    {
        assert(t[0] == '\'');

        bool Escape = false;
        auto i = 1;

        while( i < t.length && !(t[i] == '\'' && !Escape) )
        {
            if (t[i] == '\\' || Escape)
                Escape = !Escape;
            ++i;
        }

        assert(t[i] == '\'');
        current = Token(file, line, t[0..i+1], TOKchar);
        t = t[i+1..$];
    }

    void ReadIdentifier()
    {
        assert(t[0] == '_' || isAlpha(t[0]));

        auto i = 1;
        while( i < t.length && (t[i] == '_' || isAlpha(t[i]) || isDigit(t[i])))
            ++i;
        current = Token(file, line, t[0..i], TOKid, t[i] == '(');
        t = t[i..$];
        if (t[0] != ' ')
            current.flag = true;
    }

    void ReadNumber()
    {
        auto i = 1;
        while (i < t.length &&
            (
                isDigit(t[i]) ||
                t[i] == '.' ||
                t[i] == 'x' ||
                t[i] == 'X' ||
                (t[i] >= 'a' && t[i] <= 'f') ||
                (t[i] >= 'A' && t[i] <= 'F') ||
                (t[i] == 'u' || t[i] == 'U') ||
                (t[i] == 'l' || t[i] == 'L')
            ))
            ++i;
        current = Token(file, line, t[0..i], TOKnum);
        t = t[i..$];
    }

    void ReadOperator()
    {
        int l;
        if (t.length >= 7 &&
            (
                t[0..7] == "#ifndef"
            )) l = 7;
        else if (t.length >= 6 &&
            (
                t[0..6] == "#endif" ||
                t[0..6] == "#ifdef"
            )) l = 6;
        else if (t.length >= 5 &&
            (
                t[0..5] == "#else" ||
                t[0..5] == "#elif"
            )) l = 5;
        else if (t.length >= 4 &&
            (
                t[0..4] == "!<>="
            )) l = 4;
        else if (t.length >= 3 &&
            (
                t[0..3] == "#if" ||
                t[0..3] == "<<=" ||
                t[0..3] == ">>=" ||
                t[0..3] == "<>=" ||
                t[0..3] == "!<>" ||
                t[0..3] == "!<=" ||
                t[0..3] == "!>=" ||
                t[0..3] == "..."
            )) l = 3;
        else if (t.length >= 2 &&
            (
                t[0..2] == "!<" ||
                t[0..2] == "!>" ||
                t[0..2] == "++" ||
                t[0..2] == "<>" ||
                t[0..2] == "--" ||
                t[0..2] == "==" ||
                t[0..2] == "!=" ||
                t[0..2] == ">=" ||
                t[0..2] == "<=" ||
                t[0..2] == "&&" ||
                t[0..2] == "||" ||
                t[0..2] == "<<" ||
                t[0..2] == ">>" ||
                t[0..2] == "+=" ||
                t[0..2] == "-=" ||
                t[0..2] == "*=" ||
                t[0..2] == "/=" ||
                t[0..2] == "%=" ||
                t[0..2] == "&=" ||
                t[0..2] == "|=" ||
                t[0..2] == "^=" ||
                t[0..2] == "->" ||
                t[0..2] == "::" ||
                t[0..2] == "##"
            )) l = 2;
        else if (t.length >= 1 &&
            (
                t[0..1] == "=" ||
                t[0..1] == "+" ||
                t[0..1] == "-" ||
                t[0..1] == "*" ||
                t[0..1] == "/" ||
                t[0..1] == "%" ||
                t[0..1] == ">" ||
                t[0..1] == "<" ||
                t[0..1] == "!" ||
                t[0..1] == "~" ||
                t[0..1] == "&" ||
                t[0..1] == "|" ||
                t[0..1] == "^" ||
                t[0..1] == "[" ||
                t[0..1] == "]" ||
                t[0..1] == "." ||
                t[0..1] == "(" ||
                t[0..1] == ")" ||
                t[0..1] == ":" ||
                t[0..1] == "?" ||
                t[0..1] == "{" ||
                t[0..1] == "}" ||
                t[0..1] == ";" ||
                t[0..1] == "," ||
                t[0..1] == "#" ||
                t[0..1] == "\\"
            )) l = 1;
        assert(l, '`' ~ t[0..min(50,$)] ~ '`');

        current = Token(file, line, t[0..l], TOKop);
        t = t[l..$];
    }
};
