SCHEMATICS := powersup.sch

.PHONY: all clean

all: $(SCHEMATICS:.sch=.bom) $(SCHEMATICS:.sch=.png)

clean:
	-rm -f *.bak *.bak0 *.bak1 *.pcb\- *.sch\~

%.bom: %.sch
	gnetlist -g partslist3 -o $@ -- $<
	column -t -s'	' $@ > $@.tmp
	mv $@.tmp $@

%.png: %.sch
	gaf export -c -s auto -o $@ -- $<
