cmake_minimum_required(VERSION 3.16)

project(Application-Mobile VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.2 COMPONENTS Quick REQUIRED)
find_package(Qt6 REQUIRED COMPONENTS QuickControls2)

qt_add_executable(appApplication-Mobile
    main.cpp
)

qt_add_qml_module(appApplication-Mobile
    URI Application-Mobile
    VERSION 1.0
    QML_FILES main.qml
    RESOURCES ../images/icons/menu-144.png
)

set_target_properties(appApplication-Mobile PROPERTIES
    MACOSX_BUNDLE_GUI_IDENTIFIER my.example.com
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appApplication-Mobile
    PRIVATE Qt6::Quick)
target_link_libraries(appApplication-Mobile PRIVATE Qt6::QuickControls2)

install(TARGETS appApplication-Mobile
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR})
