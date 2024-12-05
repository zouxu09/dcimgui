[![Build](https://github.com/floooh/dcimgui/actions/workflows/build.yml/badge.svg)](https://github.com/floooh/dcimgui/actions/workflows/build.yml)

A wrapper repository with code-generated C bindings for Dear ImGui using
the new dear_bindings approach (https://github.com/dearimgui/dear_bindings).

Uses the `ig` prefix and cimgui.h/cimgui.cpp filenames to be as compatible
as possible with the 'legacy' cimgui bindings (but please be aware that
there are still significant differences to the legacy cimgui bindings).

Includes a matching copy of Dear ImGui, versions are marked via git tags.

The CMakeLists.txt file can be used both from regular cmake projects and
from fips projects (https://floooh.github.io/fips/).

The CMakeLists.txt file builds a single static link library called 'imgui'
which exposes both the original C++ Dear ImGui API and the the C bindings
API.

To use the C API:

- include 'cimgui.h' and link with 'imgui'
- NOTE: the cimgui.h header contains duplicate symbol definitions and
  must be compiled in C11 mode.

To use the C++ API:

- include 'imgui.h' and link with 'imgui'
