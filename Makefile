HSC = ghc
HSFLAGS = -O2
SRC = $(wildcard *.hs)
BIN = $(subst .hs,,$(SRC))

%: %.hs
	$(HSC) $(HSFLAGS) $< -o $@
	@rm -f $@.hi $@.o

all: $(BIN)

clean:
	rm -f $(BIN)
