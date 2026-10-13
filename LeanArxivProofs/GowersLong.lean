/-
Copyright 2026 Wentao Li.
Released under Apache 2.0 license.

New formalization: Wentao Li.
Mathematical construction: W. T. Gowers and J. Long.
Prior Lean construction and block lemmas: weiyangzen/awesome_theorems.
Original statement: The Formal Conjectures Authors.
AI assistance: OpenAI Codex, GPT-6.1 Sol with Max reasoning.
-/

import FormalConjectures.Arxiv.«1609.08688».sIncreasingrTuples

/-!
# Gowers–Long square-size lower bound

This file proves the frozen lower bound from Proposition 1.4 of
[Gowers and Long](https://arxiv.org/html/1609.08688v2#S1.SS1).
The prior Lean proof structure and block inequalities are credited to
[weiyangzen/awesome_theorems](https://github.com/weiyangzen/awesome_theorems/blob/32e5f75412a804463a0b0c6fff1362d4ab5275b3/Formalizations/Lean/AwesomeTheorems/Stage5/Theorems/S5_CLM_00003491/Proof.lean).
The boundedness argument uses `ChakshuGupta13`'s pigeonhole lemma, DeepMind PR 4207,
and the quadratic-bound proof pattern of `MiskinAleksandr23`, DeepMind PR 4616.
-/

namespace GowersLongLowerBound

open Arxiv.«1609.08688»

private theorem block_lt {m a a' b b' : ℕ} (hb : b < m) (ha : a < a') :
    a * m + b + 1 < a' * m + b' + 1 := by
  have h₁ : a * m + b + 1 ≤ (a + 1) * m := by
    rw [Nat.add_mul]
    omega
  have h₂ : (a + 1) * m ≤ a' * m :=
    Nat.mul_le_mul_right m (Nat.succ_le_of_lt ha)
  omega

private theorem block_le_square {m a b : ℕ} (ha : a < m) (hb : b < m) :
    a * m + b + 1 ≤ m ^ 2 := by
  have h₁ : a * m + b + 1 ≤ (a + 1) * m := by
    rw [Nat.add_mul]
    omega
  have h₂ : (a + 1) * m ≤ m * m :=
    Nat.mul_le_mul_right m (Nat.succ_le_of_lt ha)
  simpa [pow_two] using h₁.trans h₂

private theorem pairwise_range_flatMap {α : Type*} {R : α → α → Prop}
    (f : ℕ → List α) (m : ℕ)
    (hwithin : ∀ i < m, (f i).Pairwise R)
    (hcross : ∀ i < m, ∀ j < m, i < j → ∀ x ∈ f i, ∀ y ∈ f j, R x y) :
    ((List.range m).flatMap f).Pairwise R := by
  apply List.pairwise_flatMap.mpr
  refine ⟨fun i hi => hwithin i (List.mem_range.mp hi), ?_⟩
  rw [List.pairwise_iff_getElem]
  intro i j hi hj hij
  simp only [List.length_range] at hi hj
  simpa only [List.getElem_range] using hcross i hi j hj hij

/-- The $m^3$ triples are listed in lexicographic order of their three indices. -/
def squareSequence (m : ℕ) : List (Fin 3 → ℕ) :=
  (List.range m).flatMap fun a =>
    (List.range m).flatMap fun b =>
      (List.range m).flatMap fun c =>
        [![a * m + b + 1, a * m + c + 1, b * m + c + 1]]

theorem squareSequence_length (m : ℕ) : (squareSequence m).length = m ^ 3 := by
  simp [squareSequence, List.length_flatMap, pow_succ, Nat.mul_assoc]

theorem squareSequence_range (m : ℕ) :
    ∀ x ∈ squareSequence m, Set.range x ⊆ Set.Icc 1 (m ^ 2) := by
  intro x hx
  simp only [squareSequence, List.mem_flatMap, List.mem_range, List.mem_singleton] at hx
  obtain ⟨a, ha, b, hb, c, hc, rfl⟩ := hx
  rintro z ⟨i, rfl⟩
  rw [Set.mem_Icc]
  fin_cases i
  · exact ⟨Nat.succ_pos _, block_le_square ha hb⟩
  · exact ⟨Nat.succ_pos _, block_le_square ha hc⟩
  · exact ⟨Nat.succ_pos _, block_le_square hb hc⟩

theorem squareSequence_isIncreasing₂ (m : ℕ) : IsIncreasing₂ (squareSequence m) := by
  unfold IsIncreasing₂ squareSequence
  apply pairwise_range_flatMap
  · intro a _
    apply pairwise_range_flatMap
    · intro b _
      apply pairwise_range_flatMap
      · intro c _
        simp
      · intro c _ d _ hcd x hx y hy
        simp only [List.mem_singleton] at hx hy
        subst x
        subst y
        refine ⟨1, 2, by decide, ?_, ?_⟩ <;> simp <;> omega
    · intro b _ d _ hbd x hx y hy
      simp only [List.mem_flatMap, List.mem_range, List.mem_singleton] at hx hy
      obtain ⟨c, hc, rfl⟩ := hx
      obtain ⟨e, _, rfl⟩ := hy
      refine ⟨0, 2, by decide, ?_, ?_⟩
      · simp
        omega
      · simpa using block_lt (m := m) (b' := e) hc hbd
  · intro a _ d _ had x hx y hy
    simp only [List.mem_flatMap, List.mem_range, List.mem_singleton] at hx hy
    obtain ⟨b, hb, c, hc, rfl⟩ := hx
    obtain ⟨e, _, f, _, rfl⟩ := hy
    refine ⟨0, 1, by decide, ?_, ?_⟩
    · simpa using block_lt (m := m) (b' := e) hb had
    · simpa using block_lt (m := m) (b' := f) hc had

private theorem length_le_square {n : ℕ} {s : List (Fin 3 → ℕ)}
    (hs_range : ∀ a ∈ s, Set.range a ⊆ Set.Icc 1 n) (hs_inc : IsIncreasing₂ s) :
    s.length ≤ n ^ 2 := by
  by_cases hn : 2 ≤ n
  · by_contra hle
    obtain ⟨i, j, hij, h0, h1⟩ :=
      exists_pair_of_mem_Icc hn hs_range (Nat.lt_of_not_ge hle)
    rcases lt_or_gt_of_ne hij with hij | hji
    · exact (not_lt₂_of_exists 0 1 zero_ne_one h0.ge h1.ge)
        (List.pairwise_iff_get.1 hs_inc i j hij)
    · exact (not_lt₂_of_exists 0 1 zero_ne_one h0.le h1.le)
        (List.pairwise_iff_get.1 hs_inc j i hji)
  · rcases (show n = 0 ∨ n = 1 by omega) with rfl | rfl
    · have hs_nil : s = [] := by
        apply List.eq_nil_of_subset_nil
        intro a ha
        have := hs_range a ha ⟨0, rfl⟩
        simp at this
      simp [hs_nil]
    · have hs_const : ∀ a ∈ s, ∀ i, a i = 1 := by
        intro a ha i
        simpa using hs_range a ha ⟨i, rfl⟩
      have := isIncreasing₂_const_length hs_inc hs_const
      simpa using Nat.le_of_lt_succ this

/-- For each $m$, the square-size construction gives $m^3 \leq F(m^2)$. -/
theorem cube_le_maximalLength_square (m : ℕ) : m ^ 3 ≤ maximalLength (m ^ 2) := by
  unfold maximalLength
  apply le_csSup
  · refine ⟨(m ^ 2) ^ 2, ?_⟩
    rintro _ ⟨s, hs_range, hs_inc, rfl⟩
    exact length_le_square hs_range hs_inc
  · exact ⟨squareSequence m, squareSequence_range m,
      squareSequence_isIncreasing₂ m, squareSequence_length m⟩

/-- For every natural perfect square $n$, $\lfloor\sqrt n\rfloor^3 \leq F(n)$. -/
theorem maximalLength_ge_of_isSquare {n : ℕ} (h : IsSquare n) :
    n.sqrt ^ 3 ≤ maximalLength n := by
  obtain ⟨m, rfl⟩ := h
  simpa [pow_two] using cube_le_maximalLength_square m

/-- The candidate proves the exact frozen original theorem type. -/
theorem acceptance : type_of% @Arxiv.«1609.08688».maximalLength_ge_of_isSquare :=
  @maximalLength_ge_of_isSquare

end GowersLongLowerBound

#print axioms GowersLongLowerBound.maximalLength_ge_of_isSquare
#print axioms GowersLongLowerBound.acceptance
