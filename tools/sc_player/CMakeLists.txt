cmake_minimum_required(VERSION 3.16)
project(sc_player C CXX)
set(CMAKE_C_STANDARD 11)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
if(NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE Release)
endif()

find_package(SDL2 REQUIRED)

set(IMGUI_DIR ${CMAKE_SOURCE_DIR}/third_party/imgui)
set(NUKED_DIR ${CMAKE_SOURCE_DIR}/third_party/Nuked-OPL3)

add_library(imgui STATIC
    ${IMGUI_DIR}/imgui.cpp ${IMGUI_DIR}/imgui_draw.cpp ${IMGUI_DIR}/imgui_widgets.cpp
    ${IMGUI_DIR}/imgui_tables.cpp
    ${IMGUI_DIR}/backends/imgui_impl_sdl2.cpp ${IMGUI_DIR}/backends/imgui_impl_sdlrenderer2.cpp)
target_include_directories(imgui PUBLIC ${IMGUI_DIR} ${IMGUI_DIR}/backends ${SDL2_INCLUDE_DIRS})
target_compile_definitions(imgui PUBLIC IMGUI_DISABLE_DEMO_WINDOWS)

add_library(nuked_opl3 STATIC ${NUKED_DIR}/opl3.c)
target_include_directories(nuked_opl3 PUBLIC ${NUKED_DIR})

# Coeur reutilisable (sans SDL ni ImGui) : c'est ce qu'il faut reprendre dans libRealSpace.
add_library(sc_music_core STATIC
    src/sc_archive.c src/sc_data.c src/ail_adlib.c src/ail_xmidi.c src/sc_music.c
    src/sc_timbre_test.c)
target_include_directories(sc_music_core PUBLIC src)
if(NOT MSVC)
  target_compile_options(sc_music_core PRIVATE -Wall -Wextra)
endif()

add_executable(sc_player src/main.cpp)
target_include_directories(sc_player PRIVATE ${SDL2_INCLUDE_DIRS})
target_link_libraries(sc_player PRIVATE sc_music_core nuked_opl3 imgui ${SDL2_LIBRARIES})
