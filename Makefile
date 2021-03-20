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

.PHONY: all
all: .tmp/love

.tmp/love.s: src/love.c | .tmp
	@echo '	CC	$@';
	@$(CC) $(CFLAGS) -S $< -o $@;

.tmp/love.o: .tmp/love.s | .tmp
	@echo '	AS	$@';
	@$(AS) $< -o $@;

.tmp/love: .tmp/love.o | .tmp
	@echo '	CC	$@';
	@$(CC) $(CFLAGS) $^ -o $@ $(LDFLAGS);

.tmp:
	@mkdir -p .tmp;

.PHONY: clean
clean:
	@echo '	RM	.tmp/';
	-@rm -rf .tmp/;
