CC = g
CFLAGS = -g -Wall -Werror -pedantic -I.
DEPS = .h
OBJ = .o
BUILD = output

output: $(OBJ)
	$(CC) $(CFLAGS) -o $@ $^

%.o: %.c $(DEPS)
	$(CC) $(CFLAGS) -c -o $@ $<

.PHONY: clean
clean:
	rm -f $(BUILD) $(OBJ)

