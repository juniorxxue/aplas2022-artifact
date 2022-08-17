# Applicative Intersection Types (Artifact)

This is the folder of artifact for the paper **Applicative Intersection Types**

## Overview

There are five Coq projects in our artifact and each is documented by coqdoc.

`core`: Coq proof of the first calculus

`core+disjoint`: Coq proof of the second calculus

`subtyping/normal`: Coq proof of properties of applicative subtyping WRT subtyping without distribuitivity.

`subtyping/normal+distri`: Coq proof of properties of applicative subtyping WRT subtyping with distribuivity.

`subtyping/normal+distri+toplike`: Coq proof of properties of applicative subtyping WRT subtyping with distribuivity and top-like rule.

## Warm Reminder

We encourage reviewers to **use the generated coqdoc files** for quickly accessing our Proof.

Simply open the `coqdoc/toc.html` in each folder.

## Build Guide (Docker)

We provide a Dockerfile and a docker image.

You can build from Dockerfile `docker build -t artifactapp .` then enter into the image,

or directly pull the image `docker pull juniorxxue/applicative-intersection:latest`

## Build Guide (Local)

The recommended Coq version is **8.15.0**. The newer one should also be fine. We use the `metalib` to formalize our calculi.

Metalib can be installed from https://github.com/plclub/metalib or opam

```
RUN opam repo add coq-extra-dev https://coq.inria.fr/opam/extra-dev
RUN opam install coq-metalib
```

Then run `make` in the project root, which will run `make` in different Coq projects.

## Lemmas in the Paper

Our Coq formalization is readable and easy to locate.

We provide the basic information on lemmas shown in the paper.

| Lemma No.               | File Location                                  | Generated Coqdoc Files                                   |
| ----------------------- | ---------------------------------------------- | -------------------------------------------------------- |
| Lemma 1 (Soundness)     | subtyping/normal+distri/Proof/Appsub.v         | subtyping/normal+distri/coqdoc/Proof.Appsub.html         |
| Lemma 2 (Completeness)  | subtyping/normal+distri/Proof/Appsub.v         | subtyping/normal+distri/coqdoc/Proof.Appsub.html         |
| Lemma 3 (Soundness)     | subtyping/normal+distri/Proof/Appsub.v         | subtyping/normal+distri/coqdoc/Proof.Appsub.html         |
| Lemma 4 (Completeness)  | subtyping/normal+distri/Proof/Appsub.v         | subtyping/normal+distri/coqdoc/Proof.Appsub.html         |
| Lemma 5 (Soundness)     | subtyping/normal+distri/Proof/Appsub.v         | subtyping/normal+distri/coqdoc/Proof.Appsub.html         |
| Lemma 6 (Completeness)  | subtyping/normal+distri/Proof/Appsub.v         | subtyping/normal+distri/coqdoc/Proof.Appsub.html         |
| Lemma 7 (Completeness)  | subtyping/normal/Proof/Appsub.v                | subtyping/normal/coqdoc/Proof.Appsub.html                |
| Lemma 8 (Preservation)  | core/Proof/Application.v                       | core/coqdoc/Proof.Application.html                       |
| Lemma 9 (Progress)      | core/Proof/Application.v                       | core/coqdoc/Proof.Application.html                       |
| Theorem 1(Preservation) | core/Proof/Reduction.v                         | core/coqdoc/Proof.Reduction.html                         |
| Theorem 2 (Progress)    | core/Proof/Reduction.v                         | core/coqdoc/Proof.Reduction.html                         |
| Lemma 10 (Disjoint)     | core+disjoint/Proof/Disjoint.v                 | core+disjoint/coqdoc/Proof.Disjoint.html                 |
| Lemma 11 (Completeness) | subtyping/normal+distri+toplike/Proof/Appsub.v | subtyipng/normal+distri+toplike/coqdoc/Proof.Appsub.html |
| Theorem 3 (Determinism) | core+disjoint/Proof/Reduction.v                | core+disjoint/coqdoc/Proof.Reduction.html                |

