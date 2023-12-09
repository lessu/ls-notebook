add_definitions(-DFOO -DBAR ...)



set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -O0 -ggdb")


MESSAGE(STATUS “HOME dir: $ENV{HOME}”)

设置环境变量的方式是：

SET(ENV{变量名} 值)

