# PUC-Lua with exposed internals

This repository contains a **patched PUC-Lua exposing low-level implementation details**.
This version of Lua is used by some experimental projects including
[Pallene](https://www.github.com/pallene-lang/pallene) and
[LuaAOT](https://github.com/hugomg/lua-aot-5.4).

It installs an additional header file `luacore.h` which contains internal APIs from `lgc.h`, `lstring.h`, etc.
Use these internal APIs at your own risk!
They are unstable and may change even after a bugfix patch (e.g. 5.4.2 -> 5.4.3).
Additionally, they are unsafe.
You can easily get a segfault or worse if you don't know what you are doing.

# Compiling and installing

Compile and install using the provided Makefile,
the same way you would for upstream PUC-Lua.
Detailed instructions can be found in the doc/readme.html.
