CC = cc
AS = as

CFLAGS  = -std=gnu2x
CFLAGS += -march=native
CFLAGS += -O3
CFLAGS += -flto
CFLAGS += -Wall
CFLAGS += -Wextra
CFLAGS += -Wpedantic
CFLAGS += -Wstrict-prototypes
CFLAGS += -Werror
CFLAGS += `pkg-config --cflags --static libalx-robot-ur`
CFLAGS += `pkg-config --cflags --static libalx-base`

LDFLAGS  = -fuse-linker-plugin
LDFLAGS += `pkg-config --libs --static libalx-base`
LDFLAGS += `pkg-config --libs --static libalx-robot-ur`

all: love

love.s: love.c
	@echo "	CC	$@";
	$(CC) $(CFLAGS) -S $< -o $@;

love.o: love.s
	@echo "	AS	$@";
	$(AS) $< -o $@;

love: love.o
	@echo "	CC	$@";
	$(CC) $(CFLAGS) $^ -o $@ $(LDFLAGS);
