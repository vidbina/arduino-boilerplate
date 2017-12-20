ARDUINO-BUILDER=arduino-builder
AVRDUDE=avrdude
STTY=stty

MKDIR=mkdir -p
RM=rm -rf

BUILD_DIR=${PWD}/out

ARDUINO_BOARD?=arduino:avr:mega:cpu=atmega2560

build:
	${MKDIR} ${BUILD_DIR}
	${ARDUINO-BUILDER} \
		-build-path ${BUILD_DIR} \
		-debug-level 10 \
		-fqbn ${ARDUINO_BOARD} \
		-hardware ${ARDUINO_PATH}/share/arduino/hardware/ \
		-libraries ${ARDUINO_PATH}/share/arduino/libraries/ \
		-tools ${ARDUINO_PATH}/share/arduino/tools/ \
		-tools ${ARDUINO_PATH}/share/arduino/tools-builder/ \
		-tools ${ARDUINO_PATH}/share/arduino/hardware/tools/ \
		-verbose \
		-warnings all \
		Blink.cpp

clean:
	${RM} ${BUILD_DIR}

preflash:
	${STTY} -F ${PORT} ispeed 1200 ospeed 1200

flash:
	${AVRDUDE} \
		-C${ARDUINO_PATH}/share/arduino/hardware/tools/avr/etc/avrdude.conf \
		-patmega32u4 \
		-cavr109 \
		-v -v -v -v \
		-P${PORT} \
		-b57600 \
		-D \
		-Uflash:w:${PWD}/out/Blink.cpp.hex:i

.PHONY: build clean flash
