TEMPLATE = app
CONFIG -= console
CONFIG -= app_bundle
CONFIG -= qt qml

CONFIG(debug, debug|release) {
DESTDIR = bin/debug/
}

CONFIG(release, debug|release) {
DESTDIR = bin/release/
DEFINES += NDEBUG
}

SOURCES += main.cpp \
	../Classes/AppDelegate.cpp	\
	../Classes/HelloWorldScene.cpp

HEADERS += main.h \
	../Classes/AppDelegate.h \
	../Classes/HelloWorldScene.h

# set a variable for config cocos2dx modules
# --------------------------------------------
# the simple audio engine
COCOS2D-X_MODULES += CocosDenshion
# some extensions eg: CCTableView
# COCOS2D-X_MODULES += extensions
# the box2d physics engine
# COCOS2D-X_MODULES += box2d
# the chipmunk physics engine
# COCOS2D-X_MODULES += chipmunk
# --------------------------------------------

include(cocos_lqt.pri)

