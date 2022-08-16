FROM coqorg/coq

RUN opam repo add coq-extra-dev https://coq.inria.fr/opam/extra-dev
    opam install coq-metalib
    git clone https://github.com/juniorxxue/aplas2022-artifact.git
    cd aplas2022-artifact
    make