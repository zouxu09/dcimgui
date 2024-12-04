if (FIPS_IMPORT)
    fips_begin_lib(cimgui)
        fips_src(src)
    fips_end_lib()
else()
    cmake_minimum_required(VERSION 3.20)
    set(CMAKE_CXX_STANDARD 14)
    project(cimgui)
    add_library(cimgui
        src/cimgui.cpp
        src/imgui_demo.cpp
        src/imgui_draw.cpp
        src/imgui_tables.cpp
        src/imgui_widgets.cpp
        src/imgui.cpp
    )
endif()
target_include_directories(cimgui PUBLIC src)
if (FIPS_CLANG OR FIPS_GCC)
    target_compile_options(cimgui PUBLIC -Wno-return-type-c-linkage)
elseif (FIPS_MSVC)
    target_compile_options(cimgui PUBLIC /wd4190)
endif()