BUILDER=arduino-builder
MKDIR=mkdir -p
RM=rm -rf

build:
	${MKDIR} out
	${BUILDER} \
		-build-path ${PWD}/out \
		-debug-level 10 \
		-fqbn arduino:avr:leonardo \
		-hardware ${ARDUINO_PATH}/share/arduino/hardware/ \
		-libraries ${ARDUINO_PATH}/share/arduino/libraries/ \
		-tools ${ARDUINO_PATH}/share/arduino/tools/ \
		-tools ${ARDUINO_PATH}/share/arduino/tools-builder/ \
		-tools ${ARDUINO_PATH}/share/arduino/hardware/tools/ \
		-verbose \
		-warnings all \
		Blink.cpp

clean:
	${RM} out

.PHONY: build clean
