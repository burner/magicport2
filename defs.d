
public import core.stdc.stdarg;
public import core.stdc.stdio;
public import core.stdc.stdlib;
import core.stdc.string : strcmp, strlen, strncmp, strchr, memcmp, memset, memmove, strdup, strcpy, strcat;
public import core.stdc.ctype;
public import core.stdc.errno;
public import core.stdc.limits;
public import core.sys.windows.windows;
public import core.stdc.math;
public import core.stdc.time;

alias GetModuleFileNameA GetModuleFileName;

int memcmp(const char*, const char*, size_t len) { assert(0); }
int memcmp(void*, void*, size_t len) { assert(0); }
int stricmp(const char*, const char*) { assert(0); }
int ld_sprint(const char*, ...) { assert(0); }
void __locale_decpoint(const char*) { assert(0); }
char* __locale_decpoint() { assert(0); }
int putenv(const char*) { assert(0); }
int spawnlp(int, const char*, const char*, const char*, const char*) { assert(0); }
int spawnl(int, const char*, const char*, const char*, const char*) { assert(0); }
int spawnv(int, const char*, const char**) { assert(0); }

enum NULL = null;

class _Object
{
    int dyncast() { assert(0); }
    int equals(_Object) { assert(0); }
    int compare(_Object) { assert(0); }
    char *toChars() { assert(0); }
    void print() { assert(0); }
}

struct ArrayBase(U)
{
    static if (!is(U == class))
        alias U* T;
    else
        alias U T;

    size_t dim;
    T* data;

    size_t allocdim;

    void push(T ptr)
    {
        reserve(1);
        data[dim++] = ptr;
    }
    void append(typeof(this)*) { assert(0); }
    void reserve(size_t) { assert(0); }
    void remove(size_t) { assert(0); }
    void insert(size_t, typeof(this)*) { assert(0); }
    void insert(size_t, T) { assert(0); }
    void setDim(size_t) { assert(0); }
    ref T opIndex(size_t) { assert(0); }
    T* tdata() { assert(0); }
    typeof(this)* copy() { assert(0); }
    void shift(T) { assert(0); }
    void zero() { assert(0); }
    void pop() { assert(0); }
    int apply(apply_fp_t, void*) { assert(0); }
};

struct Mem
{
    void _init() {}
    void* malloc(size_t) { assert(0); }
    void free(void*) { assert(0); }
    char* strdup(const char*) { assert(0); }
    void setStackBottom(void*) {}
    void addroots(void*, void*) {}
    void* calloc(size_t, size_t) { assert(0); }
    void* realloc(void*, size_t) { assert(0); }
}
extern extern(C) uint _xi_a;
extern extern(C) uint _end;

Mem mem;

int response_expand(size_t*, const(char)***)
{
    return 0;
}
void browse(const char*) { assert(0); }

struct OutBuffer
{
    int vprintf(const char* format, va_list) { assert(0); }
    int printf(const char* format, ...) { assert(0); }
    void writebyte(int) { assert(0); }
    void writeByte(int) { assert(0); }
    void writestring(const char*) { assert(0); }
    void prependstring(const char*) { assert(0); }
    char *toChars() { assert(0); }
    char *extractData() { assert(0); }
    ubyte *data;
    size_t offset;
    void reset() { assert(0); }
    void write(OutBuffer*) { assert(0); }
    void write(const char*, size_t) { assert(0); }
    void write(const ubyte*, size_t) { assert(0); }
    void remove(size_t, size_t) { assert(0); }
    void reserve(size_t) { assert(0); }
    void setsize(size_t) { assert(0); }
    size_t insert(size_t, const ubyte*, size_t) { assert(0); }
    size_t insert(size_t, const char*, size_t) { assert(0); }
    size_t bracket(size_t, const char *, size_t, const char *) { assert(0); }
    void writenl() { assert(0); }
    size_t level;
    void writeUTF8(uint) { assert(0); }
    void writeUTF16(uint) { assert(0); }
    void write4(uint) { assert(0); }
    void writeword(uint) { assert(0); }
    bool doindent;
    void spread(size_t, size_t) { assert(0); }
    void fill0(size_t) { assert(0); }
}

struct Port
{
    static bool isNan(real) { assert(0); }
    static real fmodl(real, real) { assert(0); }
    static double nan;
    static int memicmp(const char*, const char*, size_t) { assert(0); }
    static char* strupr(const char*) { assert(0); }
    enum ldbl_max = real.max;
    enum infinity = real.infinity;
}

enum FLT_MAX = float.max;
enum FLT_MIN = float.min;
enum FLT_DIG = float.dig;
enum FLT_EPSILON = float.epsilon;
enum FLT_MANT_DIG = float.mant_dig;
enum FLT_MAX_10_EXP = float.max_10_exp;
enum FLT_MAX_EXP = float.max_exp;
enum FLT_MIN_10_EXP = float.min_10_exp;
enum FLT_MIN_EXP = float.min_exp;
enum DBL_MAX = double.max;
enum DBL_MIN = double.min;
enum DBL_DIG = double.dig;
enum DBL_EPSILON = double.epsilon;
enum DBL_MANT_DIG = double.mant_dig;
enum DBL_MAX_10_EXP = double.max_10_exp;
enum DBL_MAX_EXP = double.max_exp;
enum DBL_MIN_10_EXP = double.min_10_exp;
enum DBL_MIN_EXP = double.min_exp;
enum LDBL_MIN = real.min;
enum LDBL_DIG = real.dig;
enum LDBL_EPSILON = real.epsilon;
enum LDBL_MANT_DIG = real.mant_dig;
enum LDBL_MAX_10_EXP = real.max_10_exp;
enum LDBL_MAX_EXP = real.max_exp;
enum LDBL_MIN_10_EXP = real.min_10_exp;
enum LDBL_MIN_EXP = real.min_exp;

struct StringValue
{
    char *ptrvalue;
    void* toDchars() { assert(0); }
}

struct File
{
    uint _ref;
    this(const char*) { assert(0); }
    this(FileName*) { assert(0); }
    FileName name() { assert(0); }
    void setbuffer(void*, size_t) { assert(0); }
    void writev() { assert(0); }
    char* toChars() { assert(0); }
    bool write() { assert(0); }
    bool read() { assert(0); }
    bool readv() { assert(0); }
    size_t len;
    char* buffer;
    void remove() { assert(0); }
}

struct FileName
{
    this(const char*) { assert(0); }
    const(char)* str() { assert(0); }
    static void free(const char *) { assert(0); }
    static const(char)* ext(const char *) { assert(0); }
    static const(char)* path(const char *) { assert(0); }
    static const(char)* removeExt(const char *) { assert(0); }
    static const(char)* name(const char *) { assert(0); }
    static void ensurePathToNameExists(const char *) { assert(0); }
    static int equals(const char*, const char*) { assert(0); }
    static int compare(const char*, const char*) { assert(0); }
    static const(char)* forceExt(const char*, const char*) { assert(0); }
    static const(char)* defaultExt(const char*, const char*) { assert(0); }
    static int equalsExt(const char*, const char*) { assert(0); }
    static const(char)* combine(const char*, const char*) { assert(0); }
    static const(char)* replaceName(const char*, const char*) { assert(0); }
    static const(char)* safeSearchPath(Strings*, const char*) { assert(0); }
    static ArrayBase!(const(char))* splitPath(const char*) { assert(0); }
    static int absolute(const char*) { assert(0); }
    static int exists(const char*) { assert(0); }
    const char* toChars() { assert(0); }
}
struct StringTable
{
    StringValue* lookup(const char*, size_t) { assert(0); }
    void _init(size_t = 0) { assert(0); }
    StringValue* update(const char*, size_t) { assert(0); }
    StringValue* insert(const char*, size_t) { assert(0); }
}

struct Symbol;
struct Classsym;
struct TYPE;
struct elem;
alias Symbol symbol;
struct Outbuffer {}
struct jmp_buf {}
struct code;
struct block;
struct Blockx;
alias uint opflag_t;
struct PTRNTAB;
struct OP;
struct dt_t;
struct Config {};
struct Configv {};

struct SignExtendedNumber
{
    ulong value;
    bool negative;
    SignExtendedNumber opNeg() { assert(0); }
    SignExtendedNumber opAdd(SignExtendedNumber) { assert(0); }
    SignExtendedNumber opSub(SignExtendedNumber) { assert(0); }
    SignExtendedNumber opMul(SignExtendedNumber) { assert(0); }
    SignExtendedNumber opDiv(SignExtendedNumber) { assert(0); }
    ref SignExtendedNumber opAddAssign(ulong) { assert(0); }
    int opCmp(SignExtendedNumber) { assert(0); }
    SignExtendedNumber opShl(SignExtendedNumber) { assert(0); }
    SignExtendedNumber opShr(SignExtendedNumber) { assert(0); }
}

struct IntRange
{
    SignExtendedNumber imin, imax;
    this(dinteger_t) { assert(0); }
    this(SignExtendedNumber, SignExtendedNumber) { assert(0); }
    static IntRange fromType(Type, bool = false) { assert(0); }
    bool contains(IntRange) { assert(0); }
    IntRange _cast(Type) { assert(0); }
    static IntRange fromNumbers4(SignExtendedNumber*) { assert(0); }
    bool containsZero() { assert(0); }
    IntRange absNeg() { assert(0); }
    IntRange castUnsigned(Type) { assert(0); }
    IntRange splitBySign(IntRange, bool, IntRange, bool) { assert(0); }
    IntRange unionOrAssign(IntRange, bool) { assert(0); }
}

alias byte int8_t;
alias ubyte uint8_t;
alias short int16_t;
alias ushort uint16_t;
alias int int32_t;
alias uint uint32_t;
alias long int64_t;
alias ulong uint64_t;

alias long longlong;
alias ulong ulonglong;

alias long targ_llong;
alias size_t targ_size_t;

alias real longdouble;
alias uint regm_t;
alias uint tym_t;
alias uint list_t;
alias uint idx_t;

enum TARGET_LINUX = 0;
enum TARGET_OSX = 0;
enum TARGET_FREEBSD = 0;
enum TARGET_OPENBSD = 0;
enum TARGET_SOLARIS = 0;
enum TARGET_WINDOS = 1;
enum _WIN32 = 1;

enum I64 = false;

real creall(creal) { assert(0); }
real cimagl(creal) { assert(0); }
real ldouble(double) { assert(0); }


void obj_start(const char*) { assert(0); }
void obj_end(void*, File*) { assert(0); }
void obj_end(Library, File*) { assert(0); }
void obj_write_deferred(void*) { assert(0); }
void obj_write_deferred(Library) { assert(0); }
void out_config_init(int, bool, bool, bool, char, bool, char, bool, bool) { assert(0); }
void backend_init() { assert(0); }
void backend_term() { assert(0); }

import dmd;

Expression createTypeInfoArray(Scope sc, Expression *args, size_t dim) { assert(0); }

struct IRState;

ushort _rotl(ushort, int) { assert(0); }
ushort _rotr(ushort, int) { assert(0); }

struct AA;
_Object _aaGetRvalue(AA*, _Object) { assert(0); }
_Object _aaGet(AA**, _Object) { assert(0); }

void util_progress() { assert(0); }

struct String
{
    static size_t calcHash(const char*) { assert(0); }
}

void* speller(const char*, void* function(void*, const(char)*), Scope, const char*) { assert(0); }
void* speller(const char*, void* function(void*, const(char)*), Dsymbol, const char*) { assert(0); }

const(char)* idchars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789_";

void* memcpy()(void* dest, const void* src, size_t size) { assert(0); }
void* memcpy(T : Type)(ref T dest, T src, size_t size) { assert(0); }
void* memcpy(T : Parameter)(ref T dest, T src, size_t size) { assert(0); }
void* memcpy(T : Expression)(ref T dest, T src, size_t size) { assert(0); }
void* memcpy(T : VarDeclaration)(ref T dest, T src, size_t size) { assert(0); }

int binary(char *, const(char)**, size_t) { assert(0); }

int os_critsecsize32() { assert(0); }
int os_critsecsize64() { assert(0); }

Library LibMSCoff_factory() { assert(0); }

void main(string[] args)
{
    int argc = cast(int)args.length;
    auto argv = (new const(char)*[](argc)).ptr;
    foreach(i, a; args)
        argv[i] = cast(const(char)*)(a ~ '\0').ptr;
    xmain(argc, argv);
}
