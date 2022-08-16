all:
	make -C core/Proof
	make -C core+disjoint/Proof
	make -C subtyping/normal/Proof
	make -C subtyping/normal+distri/Proof
	make -C subtyping/normal+distri+toplike/Proof

clean:
	make clean -C core/Proof
	make clean -C core+disjoint/Proof
	make clean -C subtyping/normal/Proof
	make clean -C subtyping/normal+distri/Proof
	make clean -C subtyping/normal+distri+toplike/Proof