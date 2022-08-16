Require Import Metalib.Metatheory.
Require Import Coq.Program.Equality.
Require Import Strings.String.
Require Import Program.Tactics.
Require Import Language Tactical.
Require Import Toplike.
Require Import Splitable.
Require Import Subtyping.

Set Printing Parentheses.

(** * Definitions *)

(** ** Arguments *)

Inductive arg :=
| T : type -> arg
| L : label -> arg.

Axiom dec_sub : forall A B, sumbool (sub A B) (not (sub A B)).

Fixpoint psub (A : type) (S : arg) : option type :=
  match A, S with
  | Arr A1 A2, (T B) => if dec_sub B A1 then Some A2 else None
  | Rcd l1 A1, (L l2) => if eq_nat_dec l1 l2 then Some A1 else None
  | And A1 A2, _ =>
    match psub A1 S, psub A2 S with
    | Some C1, Some C2 => Some (And C1 C2)
    | Some C1, _       => Some C1
    | _, Some C2       => Some C2
    | _,_              => None
    end
  | _, _ => None
  end.

(** * Soundness *)

Require Import FunInd FMapInterface.
Functional Scheme psub_ind := Induction for psub Sort Prop.

(** ** Function *)
Lemma sound1 : forall A S B C, psub A S = Some C -> S = T B -> sub A (Arr B C).
  intros A S.
  functional induction psub A S; intros; try (inversion H); subst; eauto.
  - dependent induction H0.
    eapply sub_arrow; eauto.
  - eapply Sub_And; eauto.
  - inversion H0.
Qed.

(** ** Record *)
Lemma sound2 : forall A S l B, psub A S = Some B -> S = L l -> sub A (Rcd l B).
  intros A S.
  functional induction psub A S; intros; try (inversion H); subst; eauto.
  - inversion H0.
  - eapply Sub_And; eauto.
  - dependent destruction H0.
    eapply sub_record; eauto.
Qed.

(** * Completeness *)

(** ** Function *)
Lemma complete1 : forall A B C S,
    S = T B ->
    sub A (Arr B C) -> (exists D, psub A S = Some D /\ sub D C) \/ sub Top C.
  intros.
  dependent induction H0.
  - right. dependent destruction H0.
    now eapply sub_toplike_super.
  - left. exists B0.
    split; eauto. simpl.
    destruct (dec_sub B A); eauto.
    contradiction.
  - dependent destruction H.
    destruct (sub_splitable _ _ _ H) as [SS1 SS2].
    destruct (IHsub1 _ _ eq_refl eq_refl); destruct (IHsub2 _ _ eq_refl eq_refl).
    + left.
      destruct H0. destruct H1. destruct H0. destruct H1.
      assert (Eq: Some x = Some x0). rewrite <- H0. rewrite H1. reflexivity.
      dependent destruction Eq.
      assert (sub x0 (And B1 B2)). eapply Sub_And; eauto.
      exists x0. split; eauto.
    + left.
      destruct H0. destruct H0.
      exists x. split; eauto.
      assert (sub x B2). eapply sub_toplike_super; eauto. eauto.
    + left.
      destruct H1. destruct H1.
      exists x. split; eauto.
      assert (sub x B1). eapply sub_toplike_super; eauto. eauto.
    + right.
      eauto.
  - destruct (IHsub _ _ eq_refl eq_refl).
    + left. destruct H1. destruct H1.
      assert (exists r, psub B0 (T B) = r).
      exists (psub B0 (T B)); eauto.
      destruct H3. destruct x0.
      * exists (And x t). split; eauto. simpl. rewrite H3. rewrite H1. eauto.
      * exists x. split; eauto. simpl. rewrite H1. rewrite H3. eauto.
    + right. eauto.
  - destruct (IHsub _ _ eq_refl eq_refl).
    + left. destruct H1. destruct H1.
      assert (exists r, psub A (T B) = r).
      exists (psub A (T B)); eauto.
      destruct H3. destruct x0.
      * exists (And t x). split; eauto. simpl. rewrite H3. rewrite H1. eauto.
      * exists x. split; eauto. simpl. rewrite H1. rewrite H3. eauto.
    + right. eauto.
Qed.

(** ** Record *)
Lemma complete2 : forall A l C S,
    S = L l ->
    sub A (Rcd l C) -> (exists D, psub A S = Some D /\ sub D C) \/ sub Top C.
  intros.
  dependent induction H0.
  - right. dependent destruction H0.
    now eapply sub_toplike_super.
  - left. exists A.
    split; eauto. simpl.
    destruct (eq_nat_dec l l); eauto.
    contradiction.
  - dependent destruction H.
    destruct (sub_splitable _ _ _ H) as [SS1 SS2].
    destruct (IHsub1 _ _ eq_refl eq_refl); destruct (IHsub2 _ _ eq_refl eq_refl).
    + left.
      destruct H0. destruct H1. destruct H0. destruct H1.
      assert (Eq: Some x = Some x0). rewrite <- H0. rewrite H1. reflexivity.
      dependent destruction Eq.
      assert (sub x0 (And A1 A2)). eapply Sub_And; eauto.
      exists x0. split; eauto.
    + left.
      destruct H0. destruct H0.
      exists x. split; eauto.
      assert (sub x A2). eapply sub_toplike_super; eauto. eauto.
    + left.
      destruct H1. destruct H1.
      exists x. split; eauto.
      assert (sub x A1). eapply sub_toplike_super; eauto. eauto.
    + right.
      eauto.
  - destruct (IHsub _ _ eq_refl eq_refl).
    + left. destruct H1. destruct H1.
      assert (exists r, psub B (L l) = r).
      exists (psub B (L l)); eauto.
      destruct H3. destruct x0.
      * exists (And x t). split; eauto. simpl. rewrite H3. rewrite H1. eauto.
      * exists x. split; eauto. simpl. rewrite H1. rewrite H3. eauto.
    + right. eauto.
  - destruct (IHsub _ _ eq_refl eq_refl).
    + left. destruct H1. destruct H1.
      assert (exists r, psub A (L l) = r).
      exists (psub A (L l)); eauto.
      destruct H3. destruct x0.
      * exists (And t x). split; eauto. simpl. rewrite H3. rewrite H1. eauto.
      * exists x. split; eauto. simpl. rewrite H1. rewrite H3. eauto.
    + right. eauto.
Qed.
