QT       += core gui xml

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

CONFIG += c++11
#CONFIG += qscintilla2_qt5
#CONFIG += plugin qscintilla2

# The following define makes your compiler emit warnings if you use
# any Qt feature that has been marked deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS
#-------Windows-----------
win32 {
LIBS += -L$$PWD -lqscintilla2_qt5
#Debug: LIBS += -L$$PWD -lqscintilla2_qt5d
}
#-------Macos-------------
macx {
LIBS+= "$$PWD/../libs/macos/libqscintilla2_qt6.15.1.0.dylib"
}
#-------Linux-------------
unix {
contains(QT_ARCH, arm64){#arm64
LIBS+= "$$PWD/../libs/arm64/libqscintilla2_qt5_arm64.so"
target.path = /usr/bin
lib.files = $$PWD/../libs/arm64/*
lib.path = $$PREFIX/usr/lib
desktop.files = $$PWD/vfeda.desktop
desktop.path = $$PREFIX/usr/share/applications
icon.files = $$PWD/icon.ico
icon.path = $$PREFIX/usr/share/icons
translations.files = $$PWD/../lang
translations.path = $$PREFIX/usr/bin/

INSTALLS += target desktop icon lib translations
}else{#x86
LIBS+= "$$PWD/../libs/linux/libqscintilla2_qt5.so"
target.path = /usr/bin
lib.files = $$PWD/../libs/linux/*
lib.path = $$PREFIX/usr/lib
desktop.files = $$PWD/vfeda.desktop
desktop.path = $$PREFIX/usr/share/applications
icon.files = $$PWD/icon.ico
icon.path = $$PREFIX/usr/share/icons
translations.files = $$PWD/../lang
translations.path = $$PREFIX/usr/bin/

INSTALLS += target desktop icon lib translations
}
}
RC_ICONS = icon.ico
# You can also make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0
TRANSLATIONS += English.ts\
                Chinese.ts

SOURCES += \
    about_dialog.cpp \
    code_editor_dialog.cpp \
    main.cpp \
    mainwindow.cpp \
    moduleqwidget.cpp \
    new_constrain.cpp \
    module.cpp \
    constrain.cpp \
    new_module.cpp \
    port.cpp \
    tabs.cpp \
    testbench.cpp \
    new_testbench.cpp

HEADERS += \
    about_dialog.h \
    code_editor_dialog.h \
    mainwindow.h \
    moduleqwidget.h \
    new_constrain.h \
    module.h \
    constrain.h \
    new_module.h \
    port.h \
    project_head.h \
    tabs.h \
    testbench.h \
    new_testbench.h \
    ./Qsci/qscilexerverilog.h \
    ./Qsci/qsciglobal.h \
    ./Qsci/qsciscintilla.h \
    ./Qsci/qsciscintillabase.h \
    ./Qsci/qsciabstractapis.h \
    ./Qsci/qsciapis.h \
    ./Qsci/qscicommand.h \
    ./Qsci/qscicommandset.h \
    ./Qsci/qscidocument.h \
    ./Qsci/qscilexer.h

FORMS += \
    about_dialog.ui \
    code_editor_dialog.ui \
    mainwindow.ui \
    new_constrain.ui \
    new_module.ui \
    new_testbench.ui

# Default rules for deployment.
#qnx: target.path = /tmp/$${TARGET}/bin
#else: unix:!android: target.path = /opt/$${TARGET}/bin
#!isEmpty(target.path): INSTALLS += target

DISTFILES += \
    icon.ico \
    矩形.png
