cmake_minimum_required(VERSION 3.2)

project(assembly_laboratories_0)

set(CMAKE_INSTALL_PREFIX ${PROJECT_SOURCE_DIR})
set(ASSEMBLY_FILES
	${PROJECT_SOURCE_DIR}/src/main.asm	
)

enable_language(ASM_NASM)
set(CMAKE_ASM_NASM_COMPILE_OBJECT "<CMAKE_ASM_NASM_COMPILER> <INCLUDES> <FLAGS> -o <OBJECT> <SOURCE>")
set(CMAKE_ASM_NASM_LINK_EXECUTABLE "ld <CMAKE_ASM_NASM_LINK_FLAGS> <LINK_FLAGS> <OBJECTS>  -o <TARGET> <LINK_LIBRARIES>")
set_source_files_properties(${ASSEMBLY_FILES} PROPERTIES LANGUAGE ASM_NASM)

add_executable(assembly_laboratories_0 ${ASSEMBLY_FILES})
set_target_properties(assembly_laboratories_0 PROPERTIES NASM_OBJ_FORMAT elf64)
target_link_libraries(assembly_laboratories_0)