FROM coqorg/coq

RUN opam repo add coq-extra-dev https://coq.inria.fr/opam/extra-dev
RUN opam install coq-metalib
RUN git clone https://github.com/juniorxxue/aplas2022-artifact.git
WORKDIR aplas2022-artifact

RUN make