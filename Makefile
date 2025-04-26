
TARGET = files1

all: ${TARGET}

files1: ${TARGET}.cbl
	gcobol -o ${TARGET} ${TARGET}.cbl

run: ${TARGET}
	./${TARGET}

clean:
	rm -rf ${TARGET}
