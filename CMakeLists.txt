# set minimum cmake version
cmake_minimum_required(VERSION 3.5 FATAL_ERROR)

# project name and language
project(useFFI LANGUAGES C)

add_executable(useMessage ${PROJECT_SOURCE_DIR}/src/useMessage.c)
