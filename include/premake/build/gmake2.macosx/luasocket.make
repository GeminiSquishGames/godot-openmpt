# Alternative GNU Make project makefile autogenerated by Premake

ifndef config
  config=release
endif

ifndef verbose
  SILENT = @
endif

.PHONY: clean prebuild

SHELLTYPE := posix
ifeq (.exe,$(findstring .exe,$(ComSpec)))
	SHELLTYPE := msdos
endif

# Configurations
# #############################################

ifeq ($(origin CC), default)
  CC = clang
endif
ifeq ($(origin CXX), default)
  CXX = clang++
endif
ifeq ($(origin AR), default)
  AR = ar
endif
INCLUDES += -I../../contrib/lua/src -I../../contrib/luashim
FORCE_INCLUDE +=
ALL_CPPFLAGS += $(CPPFLAGS) -MD -MP $(DEFINES) $(INCLUDES)
ALL_RESFLAGS += $(RESFLAGS) $(DEFINES) $(INCLUDES)
ALL_LDFLAGS += $(LDFLAGS) -dynamiclib -Wl,-install_name,@rpath/libluasocket.dylib
LINKCMD = $(CC) -o "$@" $(OBJECTS) $(RESOURCES) $(ALL_LDFLAGS) $(LIBS)
define PREBUILDCMDS
endef
define PRELINKCMDS
endef
define POSTBUILDCMDS
endef

ifeq ($(config),release)
TARGETDIR = ../../bin/release
TARGET = $(TARGETDIR)/libluasocket.dylib
OBJDIR = obj/Release/luasocket
DEFINES += -DPREMAKE_COMPRESSION -DCURL_STATICLIB -DPREMAKE_CURL -DNDEBUG -DLUASOCKET_API=__attribute__\(\(visibility\(\"default\"\)\)\)
ALL_CFLAGS += $(CFLAGS) $(ALL_CPPFLAGS) -O3 -fPIC -Wall -Wextra
ALL_CXXFLAGS += $(CXXFLAGS) $(ALL_CPPFLAGS) -O3 -fPIC -Wall -Wextra -fno-stack-protector
LIBS += bin/Release/libluashim-lib.a
LDDEPS += bin/Release/libluashim-lib.a

else ifeq ($(config),debug)
TARGETDIR = ../../bin/debug
TARGET = $(TARGETDIR)/libluasocket.dylib
OBJDIR = obj/Debug/luasocket
DEFINES += -DPREMAKE_COMPRESSION -DCURL_STATICLIB -DPREMAKE_CURL -D_DEBUG -DLUASOCKET_API=__attribute__\(\(visibility\(\"default\"\)\)\)
ALL_CFLAGS += $(CFLAGS) $(ALL_CPPFLAGS) -fPIC -g -Wall -Wextra
ALL_CXXFLAGS += $(CXXFLAGS) $(ALL_CPPFLAGS) -fPIC -g -Wall -Wextra
LIBS += bin/Debug/libluashim-lib.a
LDDEPS += bin/Debug/libluashim-lib.a

endif

# Per File Configurations
# #############################################


# File sets
# #############################################

GENERATED :=
OBJECTS :=

GENERATED += $(OBJDIR)/auxiliar.o
GENERATED += $(OBJDIR)/buffer.o
GENERATED += $(OBJDIR)/compat.o
GENERATED += $(OBJDIR)/except.o
GENERATED += $(OBJDIR)/inet.o
GENERATED += $(OBJDIR)/io.o
GENERATED += $(OBJDIR)/luasocket.o
GENERATED += $(OBJDIR)/main.o
GENERATED += $(OBJDIR)/mime.o
GENERATED += $(OBJDIR)/options.o
GENERATED += $(OBJDIR)/select.o
GENERATED += $(OBJDIR)/serial.o
GENERATED += $(OBJDIR)/tcp.o
GENERATED += $(OBJDIR)/timeout.o
GENERATED += $(OBJDIR)/udp.o
GENERATED += $(OBJDIR)/unix.o
GENERATED += $(OBJDIR)/unixdgram.o
GENERATED += $(OBJDIR)/unixstream.o
GENERATED += $(OBJDIR)/usocket.o
OBJECTS += $(OBJDIR)/auxiliar.o
OBJECTS += $(OBJDIR)/buffer.o
OBJECTS += $(OBJDIR)/compat.o
OBJECTS += $(OBJDIR)/except.o
OBJECTS += $(OBJDIR)/inet.o
OBJECTS += $(OBJDIR)/io.o
OBJECTS += $(OBJDIR)/luasocket.o
OBJECTS += $(OBJDIR)/main.o
OBJECTS += $(OBJDIR)/mime.o
OBJECTS += $(OBJDIR)/options.o
OBJECTS += $(OBJDIR)/select.o
OBJECTS += $(OBJDIR)/serial.o
OBJECTS += $(OBJDIR)/tcp.o
OBJECTS += $(OBJDIR)/timeout.o
OBJECTS += $(OBJDIR)/udp.o
OBJECTS += $(OBJDIR)/unix.o
OBJECTS += $(OBJDIR)/unixdgram.o
OBJECTS += $(OBJDIR)/unixstream.o
OBJECTS += $(OBJDIR)/usocket.o

# Rules
# #############################################

all: $(TARGET)
	@:

$(TARGET): $(GENERATED) $(OBJECTS) $(LDDEPS) | $(TARGETDIR)
	$(PRELINKCMDS)
	@echo Linking luasocket
	$(SILENT) $(LINKCMD)
	$(POSTBUILDCMDS)

$(TARGETDIR):
	@echo Creating $(TARGETDIR)
ifeq (posix,$(SHELLTYPE))
	$(SILENT) mkdir -p $(TARGETDIR)
else
	$(SILENT) mkdir $(subst /,\\,$(TARGETDIR))
endif

$(OBJDIR):
	@echo Creating $(OBJDIR)
ifeq (posix,$(SHELLTYPE))
	$(SILENT) mkdir -p $(OBJDIR)
else
	$(SILENT) mkdir $(subst /,\\,$(OBJDIR))
endif

clean:
	@echo Cleaning luasocket
ifeq (posix,$(SHELLTYPE))
	$(SILENT) rm -f  $(TARGET)
	$(SILENT) rm -rf $(GENERATED)
	$(SILENT) rm -rf $(OBJDIR)
else
	$(SILENT) if exist $(subst /,\\,$(TARGET)) del $(subst /,\\,$(TARGET))
	$(SILENT) if exist $(subst /,\\,$(GENERATED)) del /s /q $(subst /,\\,$(GENERATED))
	$(SILENT) if exist $(subst /,\\,$(OBJDIR)) rmdir /s /q $(subst /,\\,$(OBJDIR))
endif

prebuild: | $(OBJDIR)
	$(PREBUILDCMDS)

ifneq (,$(PCH))
$(OBJECTS): $(GCH) | $(PCH_PLACEHOLDER)
$(GCH): $(PCH) | prebuild
	@echo $(notdir $<)
	$(SILENT) $(CC) -x c-header $(ALL_CFLAGS) -o "$@" -MF "$(@:%.gch=%.d)" -c "$<"
$(PCH_PLACEHOLDER): $(GCH) | $(OBJDIR)
ifeq (posix,$(SHELLTYPE))
	$(SILENT) touch "$@"
else
	$(SILENT) echo $null >> "$@"
endif
else
$(OBJECTS): | prebuild
endif


# File Rules
# #############################################

$(OBJDIR)/main.o: ../../binmodules/luasocket/main.c
	@echo "$(notdir $<)"
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/auxiliar.o: ../../binmodules/luasocket/src/auxiliar.c
	@echo "$(notdir $<)"
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/buffer.o: ../../binmodules/luasocket/src/buffer.c
	@echo "$(notdir $<)"
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/compat.o: ../../binmodules/luasocket/src/compat.c
	@echo "$(notdir $<)"
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/except.o: ../../binmodules/luasocket/src/except.c
	@echo "$(notdir $<)"
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/inet.o: ../../binmodules/luasocket/src/inet.c
	@echo "$(notdir $<)"
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/io.o: ../../binmodules/luasocket/src/io.c
	@echo "$(notdir $<)"
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/luasocket.o: ../../binmodules/luasocket/src/luasocket.c
	@echo "$(notdir $<)"
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/mime.o: ../../binmodules/luasocket/src/mime.c
	@echo "$(notdir $<)"
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/options.o: ../../binmodules/luasocket/src/options.c
	@echo "$(notdir $<)"
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/select.o: ../../binmodules/luasocket/src/select.c
	@echo "$(notdir $<)"
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/serial.o: ../../binmodules/luasocket/src/serial.c
	@echo "$(notdir $<)"
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/tcp.o: ../../binmodules/luasocket/src/tcp.c
	@echo "$(notdir $<)"
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/timeout.o: ../../binmodules/luasocket/src/timeout.c
	@echo "$(notdir $<)"
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/udp.o: ../../binmodules/luasocket/src/udp.c
	@echo "$(notdir $<)"
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/unix.o: ../../binmodules/luasocket/src/unix.c
	@echo "$(notdir $<)"
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/unixdgram.o: ../../binmodules/luasocket/src/unixdgram.c
	@echo "$(notdir $<)"
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/unixstream.o: ../../binmodules/luasocket/src/unixstream.c
	@echo "$(notdir $<)"
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/usocket.o: ../../binmodules/luasocket/src/usocket.c
	@echo "$(notdir $<)"
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"

-include $(OBJECTS:%.o=%.d)
ifneq (,$(PCH))
  -include $(PCH_PLACEHOLDER).d
endif