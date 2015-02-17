#############################################################################
# Makefile for building: dumper
# Generated by qmake (3.0) (Qt 5.2.1)
# Project:  ../dumper/dumper.pro
# Template: app
# Command: /opt/Qt/5.2.1/gcc_64/bin/qmake -spec linux-g++ CONFIG+=debug -o Makefile ../dumper/dumper.pro
#############################################################################

MAKEFILE      = Makefile

####### Compiler, tools and options

CC            = gcc
CXX           = g++
DEFINES       = 
CFLAGS        = -pipe -g -Wall -W -fPIE $(DEFINES)
CXXFLAGS      = -pipe -std=c++0x -pthread -g -Wall -W -fPIE $(DEFINES)
INCPATH       = -I/opt/Qt/5.2.1/gcc_64/mkspecs/linux-g++ -I../dumper -I.
LINK          = g++
LFLAGS        = -Wl,-rpath,/opt/Qt/5.2.1/gcc_64
LIBS          = $(SUBLIBS) -pthread 
AR            = ar cqs
RANLIB        = 
QMAKE         = /opt/Qt/5.2.1/gcc_64/bin/qmake
TAR           = tar -cf
COMPRESS      = gzip -9f
COPY          = cp -f
SED           = sed
COPY_FILE     = cp -f
COPY_DIR      = cp -f -R
STRIP         = strip
INSTALL_FILE  = install -m 644 -p
INSTALL_DIR   = $(COPY_DIR)
INSTALL_PROGRAM = install -m 755 -p
DEL_FILE      = rm -f
SYMLINK       = ln -f -s
DEL_DIR       = rmdir
MOVE          = mv -f
CHK_DIR_EXISTS= test -d
MKDIR         = mkdir -p

####### Output directory

OBJECTS_DIR   = ./

####### Files

SOURCES       = ../dumper/main.cpp 
OBJECTS       = main.o
DIST          = /opt/Qt/5.2.1/gcc_64/mkspecs/features/spec_pre.prf \
		/opt/Qt/5.2.1/gcc_64/mkspecs/common/shell-unix.conf \
		/opt/Qt/5.2.1/gcc_64/mkspecs/common/unix.conf \
		/opt/Qt/5.2.1/gcc_64/mkspecs/common/linux.conf \
		/opt/Qt/5.2.1/gcc_64/mkspecs/common/gcc-base.conf \
		/opt/Qt/5.2.1/gcc_64/mkspecs/common/gcc-base-unix.conf \
		/opt/Qt/5.2.1/gcc_64/mkspecs/common/g++-base.conf \
		/opt/Qt/5.2.1/gcc_64/mkspecs/common/g++-unix.conf \
		/opt/Qt/5.2.1/gcc_64/mkspecs/qconfig.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_bluetooth.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_bluetooth_private.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_bootstrap_private.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_clucene_private.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_concurrent.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_concurrent_private.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_core.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_core_private.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_dbus.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_dbus_private.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_declarative.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_declarative_private.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_designer.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_designer_private.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_designercomponents_private.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_gui.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_gui_private.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_help.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_help_private.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_multimedia.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_multimedia_private.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_multimediawidgets.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_multimediawidgets_private.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_network.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_network_private.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_nfc.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_nfc_private.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_opengl.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_opengl_private.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_openglextensions.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_openglextensions_private.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_platformsupport_private.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_positioning.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_positioning_private.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_printsupport.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_printsupport_private.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_qml.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_qml_private.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_qmldevtools_private.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_qmltest.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_qmltest_private.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_qtmultimediaquicktools_private.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_quick.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_quick_private.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_quickparticles_private.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_script.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_script_private.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_scripttools.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_scripttools_private.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_sensors.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_sensors_private.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_serialport.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_serialport_private.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_sql.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_sql_private.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_svg.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_svg_private.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_testlib.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_testlib_private.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_uitools.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_uitools_private.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_webkit.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_webkit_private.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_webkitwidgets.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_webkitwidgets_private.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_widgets.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_widgets_private.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_x11extras.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_x11extras_private.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_xml.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_xml_private.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_xmlpatterns.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_xmlpatterns_private.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/features/qt_functions.prf \
		/opt/Qt/5.2.1/gcc_64/mkspecs/features/qt_config.prf \
		/opt/Qt/5.2.1/gcc_64/mkspecs/linux-g++/qmake.conf \
		/opt/Qt/5.2.1/gcc_64/mkspecs/features/spec_post.prf \
		/opt/Qt/5.2.1/gcc_64/mkspecs/features/exclusive_builds.prf \
		/opt/Qt/5.2.1/gcc_64/mkspecs/features/default_pre.prf \
		/opt/Qt/5.2.1/gcc_64/mkspecs/features/resolve_config.prf \
		/opt/Qt/5.2.1/gcc_64/mkspecs/features/default_post.prf \
		/opt/Qt/5.2.1/gcc_64/mkspecs/features/unix/gdb_dwarf_index.prf \
		/opt/Qt/5.2.1/gcc_64/mkspecs/features/warn_on.prf \
		/opt/Qt/5.2.1/gcc_64/mkspecs/features/testcase_targets.prf \
		/opt/Qt/5.2.1/gcc_64/mkspecs/features/exceptions.prf \
		/opt/Qt/5.2.1/gcc_64/mkspecs/features/yacc.prf \
		/opt/Qt/5.2.1/gcc_64/mkspecs/features/lex.prf \
		../dumper/dumper.pro \
		../dumper/dumper.pro
QMAKE_TARGET  = dumper
DESTDIR       = #avoid trailing-slash linebreak
TARGET        = dumper


first: all
####### Implicit rules

.SUFFIXES: .o .c .cpp .cc .cxx .C

.cpp.o:
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o "$@" "$<"

.cc.o:
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o "$@" "$<"

.cxx.o:
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o "$@" "$<"

.C.o:
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o "$@" "$<"

.c.o:
	$(CC) -c $(CFLAGS) $(INCPATH) -o "$@" "$<"

####### Build rules

all: Makefile $(TARGET)

$(TARGET):  $(OBJECTS)  
	$(LINK) $(LFLAGS) -o $(TARGET) $(OBJECTS) $(OBJCOMP) $(LIBS)
	{ test -n "$(DESTDIR)" && DESTDIR="$(DESTDIR)" || DESTDIR=.; } && test $$(gdb --version | sed -e 's,[^0-9][^0-9]*\([0-9]\)\.\([0-9]\).*,\1\2,;q') -gt 72 && gdb --nx --batch --quiet -ex 'set confirm off' -ex "save gdb-index $$DESTDIR" -ex quit '$(TARGET)' && test -f $(TARGET).gdb-index && objcopy --add-section '.gdb_index=$(TARGET).gdb-index' --set-section-flags '.gdb_index=readonly' '$(TARGET)' '$(TARGET)' && rm -f $(TARGET).gdb-index || true

Makefile: ../dumper/dumper.pro /opt/Qt/5.2.1/gcc_64/mkspecs/linux-g++/qmake.conf /opt/Qt/5.2.1/gcc_64/mkspecs/features/spec_pre.prf \
		/opt/Qt/5.2.1/gcc_64/mkspecs/common/shell-unix.conf \
		/opt/Qt/5.2.1/gcc_64/mkspecs/common/unix.conf \
		/opt/Qt/5.2.1/gcc_64/mkspecs/common/linux.conf \
		/opt/Qt/5.2.1/gcc_64/mkspecs/common/gcc-base.conf \
		/opt/Qt/5.2.1/gcc_64/mkspecs/common/gcc-base-unix.conf \
		/opt/Qt/5.2.1/gcc_64/mkspecs/common/g++-base.conf \
		/opt/Qt/5.2.1/gcc_64/mkspecs/common/g++-unix.conf \
		/opt/Qt/5.2.1/gcc_64/mkspecs/qconfig.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_bluetooth.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_bluetooth_private.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_bootstrap_private.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_clucene_private.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_concurrent.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_concurrent_private.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_core.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_core_private.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_dbus.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_dbus_private.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_declarative.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_declarative_private.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_designer.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_designer_private.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_designercomponents_private.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_gui.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_gui_private.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_help.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_help_private.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_multimedia.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_multimedia_private.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_multimediawidgets.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_multimediawidgets_private.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_network.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_network_private.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_nfc.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_nfc_private.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_opengl.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_opengl_private.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_openglextensions.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_openglextensions_private.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_platformsupport_private.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_positioning.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_positioning_private.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_printsupport.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_printsupport_private.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_qml.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_qml_private.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_qmldevtools_private.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_qmltest.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_qmltest_private.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_qtmultimediaquicktools_private.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_quick.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_quick_private.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_quickparticles_private.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_script.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_script_private.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_scripttools.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_scripttools_private.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_sensors.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_sensors_private.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_serialport.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_serialport_private.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_sql.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_sql_private.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_svg.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_svg_private.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_testlib.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_testlib_private.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_uitools.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_uitools_private.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_webkit.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_webkit_private.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_webkitwidgets.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_webkitwidgets_private.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_widgets.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_widgets_private.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_x11extras.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_x11extras_private.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_xml.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_xml_private.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_xmlpatterns.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_xmlpatterns_private.pri \
		/opt/Qt/5.2.1/gcc_64/mkspecs/features/qt_functions.prf \
		/opt/Qt/5.2.1/gcc_64/mkspecs/features/qt_config.prf \
		/opt/Qt/5.2.1/gcc_64/mkspecs/linux-g++/qmake.conf \
		/opt/Qt/5.2.1/gcc_64/mkspecs/features/spec_post.prf \
		/opt/Qt/5.2.1/gcc_64/mkspecs/features/exclusive_builds.prf \
		/opt/Qt/5.2.1/gcc_64/mkspecs/features/default_pre.prf \
		/opt/Qt/5.2.1/gcc_64/mkspecs/features/resolve_config.prf \
		/opt/Qt/5.2.1/gcc_64/mkspecs/features/default_post.prf \
		/opt/Qt/5.2.1/gcc_64/mkspecs/features/unix/gdb_dwarf_index.prf \
		/opt/Qt/5.2.1/gcc_64/mkspecs/features/warn_on.prf \
		/opt/Qt/5.2.1/gcc_64/mkspecs/features/testcase_targets.prf \
		/opt/Qt/5.2.1/gcc_64/mkspecs/features/exceptions.prf \
		/opt/Qt/5.2.1/gcc_64/mkspecs/features/yacc.prf \
		/opt/Qt/5.2.1/gcc_64/mkspecs/features/lex.prf \
		../dumper/dumper.pro
	$(QMAKE) -spec linux-g++ CONFIG+=debug -o Makefile ../dumper/dumper.pro
/opt/Qt/5.2.1/gcc_64/mkspecs/features/spec_pre.prf:
/opt/Qt/5.2.1/gcc_64/mkspecs/common/shell-unix.conf:
/opt/Qt/5.2.1/gcc_64/mkspecs/common/unix.conf:
/opt/Qt/5.2.1/gcc_64/mkspecs/common/linux.conf:
/opt/Qt/5.2.1/gcc_64/mkspecs/common/gcc-base.conf:
/opt/Qt/5.2.1/gcc_64/mkspecs/common/gcc-base-unix.conf:
/opt/Qt/5.2.1/gcc_64/mkspecs/common/g++-base.conf:
/opt/Qt/5.2.1/gcc_64/mkspecs/common/g++-unix.conf:
/opt/Qt/5.2.1/gcc_64/mkspecs/qconfig.pri:
/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_bluetooth.pri:
/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_bluetooth_private.pri:
/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_bootstrap_private.pri:
/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_clucene_private.pri:
/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_concurrent.pri:
/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_concurrent_private.pri:
/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_core.pri:
/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_core_private.pri:
/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_dbus.pri:
/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_dbus_private.pri:
/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_declarative.pri:
/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_declarative_private.pri:
/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_designer.pri:
/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_designer_private.pri:
/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_designercomponents_private.pri:
/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_gui.pri:
/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_gui_private.pri:
/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_help.pri:
/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_help_private.pri:
/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_multimedia.pri:
/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_multimedia_private.pri:
/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_multimediawidgets.pri:
/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_multimediawidgets_private.pri:
/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_network.pri:
/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_network_private.pri:
/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_nfc.pri:
/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_nfc_private.pri:
/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_opengl.pri:
/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_opengl_private.pri:
/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_openglextensions.pri:
/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_openglextensions_private.pri:
/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_platformsupport_private.pri:
/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_positioning.pri:
/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_positioning_private.pri:
/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_printsupport.pri:
/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_printsupport_private.pri:
/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_qml.pri:
/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_qml_private.pri:
/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_qmldevtools_private.pri:
/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_qmltest.pri:
/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_qmltest_private.pri:
/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_qtmultimediaquicktools_private.pri:
/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_quick.pri:
/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_quick_private.pri:
/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_quickparticles_private.pri:
/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_script.pri:
/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_script_private.pri:
/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_scripttools.pri:
/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_scripttools_private.pri:
/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_sensors.pri:
/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_sensors_private.pri:
/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_serialport.pri:
/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_serialport_private.pri:
/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_sql.pri:
/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_sql_private.pri:
/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_svg.pri:
/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_svg_private.pri:
/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_testlib.pri:
/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_testlib_private.pri:
/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_uitools.pri:
/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_uitools_private.pri:
/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_webkit.pri:
/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_webkit_private.pri:
/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_webkitwidgets.pri:
/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_webkitwidgets_private.pri:
/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_widgets.pri:
/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_widgets_private.pri:
/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_x11extras.pri:
/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_x11extras_private.pri:
/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_xml.pri:
/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_xml_private.pri:
/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_xmlpatterns.pri:
/opt/Qt/5.2.1/gcc_64/mkspecs/modules/qt_lib_xmlpatterns_private.pri:
/opt/Qt/5.2.1/gcc_64/mkspecs/features/qt_functions.prf:
/opt/Qt/5.2.1/gcc_64/mkspecs/features/qt_config.prf:
/opt/Qt/5.2.1/gcc_64/mkspecs/linux-g++/qmake.conf:
/opt/Qt/5.2.1/gcc_64/mkspecs/features/spec_post.prf:
/opt/Qt/5.2.1/gcc_64/mkspecs/features/exclusive_builds.prf:
/opt/Qt/5.2.1/gcc_64/mkspecs/features/default_pre.prf:
/opt/Qt/5.2.1/gcc_64/mkspecs/features/resolve_config.prf:
/opt/Qt/5.2.1/gcc_64/mkspecs/features/default_post.prf:
/opt/Qt/5.2.1/gcc_64/mkspecs/features/unix/gdb_dwarf_index.prf:
/opt/Qt/5.2.1/gcc_64/mkspecs/features/warn_on.prf:
/opt/Qt/5.2.1/gcc_64/mkspecs/features/testcase_targets.prf:
/opt/Qt/5.2.1/gcc_64/mkspecs/features/exceptions.prf:
/opt/Qt/5.2.1/gcc_64/mkspecs/features/yacc.prf:
/opt/Qt/5.2.1/gcc_64/mkspecs/features/lex.prf:
../dumper/dumper.pro:
qmake: FORCE
	@$(QMAKE) -spec linux-g++ CONFIG+=debug -o Makefile ../dumper/dumper.pro

qmake_all: FORCE

dist: 
	@test -d .tmp/dumper1.0.0 || mkdir -p .tmp/dumper1.0.0
	$(COPY_FILE) --parents $(SOURCES) $(DIST) .tmp/dumper1.0.0/ && (cd `dirname .tmp/dumper1.0.0` && $(TAR) dumper1.0.0.tar dumper1.0.0 && $(COMPRESS) dumper1.0.0.tar) && $(MOVE) `dirname .tmp/dumper1.0.0`/dumper1.0.0.tar.gz . && $(DEL_FILE) -r .tmp/dumper1.0.0


clean:compiler_clean 
	-$(DEL_FILE) $(OBJECTS)
	-$(DEL_FILE) *~ core *.core


####### Sub-libraries

distclean: clean
	-$(DEL_FILE) $(TARGET) 
	-$(DEL_FILE) Makefile


check: first

compiler_yacc_decl_make_all:
compiler_yacc_decl_clean:
compiler_yacc_impl_make_all:
compiler_yacc_impl_clean:
compiler_lex_make_all:
compiler_lex_clean:
compiler_clean: 

####### Compile

main.o: ../dumper/main.cpp ../dumper/main.h
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o main.o ../dumper/main.cpp

####### Install

install:   FORCE

uninstall:   FORCE

FORCE:
