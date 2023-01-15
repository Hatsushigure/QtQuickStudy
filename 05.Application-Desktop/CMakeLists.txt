cmake_minimum_required(VERSION 3.16)

project(Application-Desktop VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.2 COMPONENTS Quick REQUIRED)

qt_add_executable(appApplication-Desktop
    main.cpp
)

qt_add_qml_module(appApplication-Desktop
    URI Application-Desktop
    VERSION 1.0
    QML_FILES main.qml 
    RESOURCES ../images/icons
)

set_target_properties(appApplication-Desktop PROPERTIES
    MACOSX_BUNDLE_GUI_IDENTIFIER my.example.com
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appApplication-Desktop
    PRIVATE Qt6::Quick)

install(TARGETS appApplication-Desktop
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR})
