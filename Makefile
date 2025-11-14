
TARGET = files1
COBOL_FLAGS = -free -Wall -Wextra -Wno-unused-variable -Wno-unused-function

all: ${TARGET}

files1: ${TARGET}.cbl
	gcobol -o ${TARGET} ${TARGET}.cbl

run: ${TARGET}
	./${TARGET}

clean:
	rm -rf ${TARGET}
