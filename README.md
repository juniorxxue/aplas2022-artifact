# Applicative Intersection Types (Artifact)

## About the Archive

This is the folder of artifact for the paper **Applicative Intersection Types**, 

There are five Coq projects in our artifact and each is documented by coqdoc.

`core`: Coq proof of the first calculus

`core+disjoint`: Coq proof of the second calculus

`subtyping/normal`: Coq proof of properties of applicative subtyping WRT subtyping without distribuitivity.

`subtyping/normal+distri`: Coq proof of properties of applicative subtyping WRT subtyping with distribuivity.

`subtyping/normal+distri+toplike`: Coq proof of properties of applicative subtyping WRT subtyping with distribuivity and top-like rule.

## Link to Research Paper

All lemmas and properties shown in the paper can be found in the artifact. Specifically, in the paper we have three technical sections.

* Applicative Subtyping: all lemmas can be found in `subtyping` folder. For three versions of subtyping, we have three separate folders.
* Calculus I: The whole calculus development can be found in `core` folder.
* Calculus II: The whole calculus development can be found in `core+disjoint` folder.

## Getting Started Guide

We encourage readers to **use the generated coqdoc files** for quickly accessing our Proof.

Simply open the `coqdoc/toc.html` in each folder.

Alternatively we provide two build options below.

### Build Guide (Docker)

We provide a Dockerfile and a docker image.

You can build from Dockerfile `docker build -t artifactapp .` then enter into the image,

or load the docker image locally (If you downloaded the image from zenodo and put it in this folder).

````shell
$ docker load < appinter.tar
$ docker run -it juniorxxue/applicative-intersection
$ make clean
$ make
````

### Build Guide (Local)

The recommended Coq version is **8.15.0**. The newer one should also be fine. We use the `metalib` to formalize our calculi.

Metalib can be installed from https://github.com/plclub/metalib or opam

```
opam repo add coq-extra-dev https://coq.inria.fr/opam/extra-dev
opam install coq-metalib
```

Then run `make` in the project root, which will run `make` in different Coq projects.

## Step-by-Step Instructions

Our Coq formalization is readable and easy to locate.

We provide the connection between lemmas shown in the paper and Coq file.

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

## Misc

### Interact with Proof (Locally)

To interact with the Coq proof, often we use the code editor with plugins installed.

* Emacs with ProofGeneral plugins (https://proofgeneral.github.io/)
* VSCode with VSCoq plugins (https://github.com/coq-community/vscoq)

After ensuring the `metalib` and `coqtop` is installed, open the Coq file and run commands listed in the tool references.

### Extendibility

Our development of metatheory has two directions:

* The metatheory of application subtyping with regard to subtyping. The desirable property is soundness and completeness.
* The formalization of the calculi. The usual property proved is type soundness. In 2nd, we also prove a determinism theorem.

#### Extendibility of Subtyping

We show three variants of the development in subtyping, their differences lie in

* The main proof is subtyping with distributivity of intersection types included, our novel judgement/algorithm applicative subtyping has the standard soundness/completeness lemma.

* The second is subtyping without distributivity, we slightly modify our applicative subtyping to possibly derive a `Amb` type error. Our soundness/completeness is also adapted accordingly.

* The third is subtyping with toplike types, the soundness/completeness lemma is adapted according to the toplike types.

In this flow to illustrate the possibility of further experiments and building new proofs, the potential direction is to extend the subtyping rules, carefully adapt the applicative subtyping algorithm, and then find and prove the lemma statement of the soundness/completeness between them.

#### Extendibility of Calculi

We show two variants of the calculi, their differences lie in

* A calculus with intersection types and an unrestricted merge operator, our novel judgment is the applicative subtyping (Appsub.v) and applicative dispatching (Application.v). Type soundness is proved in this calculus.

* A calculus with intersection types and a **disjoint** merge operator. The type soundness and determinism are proved in this calculus. Disjointness ensure the deterministic evaluation. The major differences in the proof, are (1) interaction between disjointness and our newly applicative subtyping and dispatching judgment (2) determinism theorem

To extend this artifact for further experiments and new proofs, we encourage the follow-up work is to build upon the first calculus, which is concise and powerful enough to encode many features (see the paper). The potential directions are (1) A different version of the typing strategy (2) a versatile disjointness condition (the 2nd calculus prevents some cases) while retaining the deterministic property.

The above point is more or less related to the extendibility of metatheory. Specifically in the artifact, our formalization is modular and the lemma related to specific judgments is isolated in different files. For instance in the first calculus (`core` folder),

* `Language.v` contains the formalization of types, terms and substitution
* `Typing.v` contains the typing judgment and its properties
* `Subtyping/` contains the formalization of subtyping and its properties.
* `Appsub.v` contains the applicative subtyping and its properties.
* `Casting` contains the lemmas related to casting judgment.
* `Application.v` contains the lemmas related to function application/record projection, and properties of our applicative dispatching.
* `Value.v` contains the canonical form of the term and its properties.
* `Reduction.v` contains the theorems related to our operational semantics: preservation, progress and type soundness.
* Other files are auxiliary files and can be safely ignored.