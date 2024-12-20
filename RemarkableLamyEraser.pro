TEMPLATE = app
CONFIG += console
CONFIG += file_copies
CONFIG -= app_bundle
CONFIG -= qt

INCLUDEPATH += \
    /opt/codex/rm11x/3.1.15/sysroots/cortexa7hf-neon-remarkable-linux-gnueabi/usr/include \
    /opt/codex/rm11x/3.1.15/sysroots/cortexa7hf-neon-remarkable-linux-gnueabi/usr/lib/arm-remarkable-linux-gnueabi/gcc/arm-remarkable-linux-gnueabi/9.3.0/include \
    headers/

HEADERS += \
    headers/configuration.h \
    headers/effects.h \
    headers/effects_data.h \
    headers/orientation.h \
    headers/triggers.h \

SOURCES += \
    sources/configuration.c \
    sources/effects.c \
    sources/orientation.c \
    sources/triggers.c \
    sources/main.c \


DISTFILES += \
    config/LamyEraser.conf \
    config/LamyEraser_TestConfig.conf \
    config/LamyEraser.service \
    scripts/LamyInstall.sh \
    scripts/LamyUninstall.sh \
    README.md \
    RemarkableLamyEraser \

conf.files += \
    config/LamyEraser.conf \
    config/LamyEraser_TestConfig.conf \

conf.path = /home/root/.config/LamyEraser

service.files = config/LamyEraser.service
service.path = /lib/systemd/system

target.path = /usr/sbin


INSTALLS += \
        conf \
        service \
        target \


