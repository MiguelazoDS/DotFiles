cmake_minimum_required(VERSION 3.16.3)

project(test)

include_directories(src/)

file(GLOB PROJECT_SRC src/*.cpp)

add_executable(${PROJECT_NAME} ${PROJECT_SRC})
