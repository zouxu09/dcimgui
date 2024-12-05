# builds a combined C and C++ library called 'imgui'
if (FIPS_IMPORT)
    fips_begin_lib(imgui)
        fips_src(src)
    fips_end_lib()
else()
    cmake_minimum_required(VERSION 3.20)
    set(CMAKE_CXX_STANDARD 11)
    project(dcimgui)
    add_library(imgui
        src/cimgui.cpp
        src/imgui_demo.cpp
        src/imgui_draw.cpp
        src/imgui_tables.cpp
        src/imgui_widgets.cpp
        src/imgui.cpp
    )
endif()
target_include_directories(imgui PUBLIC src)
if (FIPS_CLANG OR FIPS_GCC)
    target_compile_options(imgui PUBLIC -Wno-return-type-c-linkage -Wno-unused-function)
elseif (FIPS_MSVC)
    target_compile_options(imgui PUBLIC /wd4190)
endif()