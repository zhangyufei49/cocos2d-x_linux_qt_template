COCOS2D_ROOT = ../../..

# set include path and depend path
COCOS_INCLUDE_DEPEND_PATH += $$COCOS2D_ROOT/cocos2dx \
	$$COCOS2D_ROOT/cocos2dx/include \
	$$COCOS2D_ROOT/cocos2dx/cocoa \
	$$COCOS2D_ROOT/cocos2dx/kazmath/include \
	$$COCOS2D_ROOT/cocos2dx/platform

contains(COCOS2D-X_MODULES,CocosDenshion) {
	COCOS_INCLUDE_DEPEND_PATH += $$COCOS2D_ROOT/CocosDenshion/include
}

contains(COCOS2D-X_MODULES,extensions) {
	COCOS_INCLUDE_DEPEND_PATH += $$COCOS2D_ROOT/extensions
}

contains(COCOS2D-X_MODULES,box2d) {
	COCOS_INCLUDE_DEPEND_PATH += $$COCOS2D_ROOT/external/Box2D
}

contains(COCOS2D-X_MODULES,chipmunk) {
	COCOS_INCLUDE_DEPEND_PATH += $$COCOS2D_ROOT/external/chipmunk/include/chipmunk
}

#set the platform depended include and depend path
unix:!macx {
	DEFINES += LINUX

	COCOS_INCLUDE_DEPEND_PATH += $$COCOS2D_ROOT/cocos2dx/platform/linux

	LBITS = $$system(getconf LONG_BIT)

        contains(LBITS,64) {
		COCOS_INCLUDE_DEPEND_PATH += $$COCOS2D_ROOT/platform/third_party/linux/include64
		STATICLIBS_DIR += $$COCOS2D_ROOT/cocos2dx/platform/third_party/linux/libraries/lib64

	} else {
		COCOS_INCLUDE_DEPEND_PATH += $$COCOS2D_ROOT/platform/third_party/linux
		STATICLIBS_DIR += $$COCOS2D_ROOT/cocos2dx/platform/third_party/linux/libraries
	}

	SHAREDLIBS += -L$$COCOS2D_ROOT/lib/linux/release -Wl,-rpath,$$COCOS2D_ROOT/lib/linux/release
	SHAREDLIBS += -Llibs -Wl,-rpath,libs


	contains(COCOS2D-X_MODULES,box2d) {
		STATICLIBS += $$COCOS2D_ROOT/lib/linux/release/libbox2d.a
	}
	contains(COCOS2D-X_MODULES,chipmunk) {
		STATICLIBS += $$COCOS2D_ROOT/lib/linux/release/libchipmunk.a
	}
	contains(COCOS2D-X_MODULES,extensions) {
		STATICLIBS += $$COCOS2D_ROOT/lib/linux/release/libextension.a
	}


	SHAREDLIBS += -lcocos2d -lrt -lpthread -ldl
	SHAREDLIBS += -lfreetype -lxml2 -ljpeg -ltiff -lcurl -lpng -lGL -lGLEW -lfontconfig

	contains(COCOS2D-X_MODULES,CocosDenshion) {
		SHAREDLIBS += -lcocosdenshion
	}

	SHAREDLIBS += -Wl,-rpath,$${SHAREDLIBS_DIR}
	SHAREDLIBS += -Wl,-rpath,$$STATICLIBS_DIR

	LIBS +=	$${STATICLIBS}
	LIBS += $${SHAREDLIBS}
} 

INCLUDEPATH += $${COCOS_INCLUDE_DEPEND_PATH}
DEPENDPATH += $${COCOS_INCLUDE_DEPEND_PATH}

