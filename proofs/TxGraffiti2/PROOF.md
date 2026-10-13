# TxGraffiti Conjecture 2

Formalization and write-up: **Wentao Li**.
Counterexample: **Mikko Fischer**, arXiv:2607.23664.
Conjecture: **Randy Davila, Boris Brimkov and Ryan Pepper / TxGraffiti**.
See [sources](SOURCE.md) for the original Lean statement credits.

The Lean theorem proves the exact `answer(False)` equivalence in
`Arxiv.«2507.17780».tx_graffiti_conjecture_2`, using its unchanged zero forcing
definitions.

## Graph and independence bound

The 24-vertex graph has a central triangle with vertices `c₀,c₁,c₂`.
Each `cⱼ` has a neighbour `rⱼ`, which connects to the `z` vertex in each of
two terminal triangles `(z,a,b)`. The Lean vertex type is `Fin 3 × Fin 8`.
Each block has `c` at position 0, `r` at 1, and terminal triangles at positions
`(2,3,4)` and `(5,6,7)`.

The six terminal triangles and three edges `cⱼrⱼ` partition the vertices into
nine cliques. An independent set meets each clique at most once, so `α ≤ 9`.

## Zero forcing bound

A fort is a nonempty set `F` such that no vertex outside `F` has exactly one
neighbour in `F`. Every zero forcing set meets every fort: a set disjoint
from `F` stays disjoint after each forcing step, so its closure cannot cover
the graph.

In each terminal triangle, `{a,b}` is a fort. In each block, taking a pair
`{z,a}` or `{z,b}` from each terminal triangle also gives a fort. Together,
these force every zero forcing set to select at least three terminal vertices
per block.

Let `xⱼ` count selected vertices in the full eight-vertex block. If `xⱼ=3`,
neither `cⱼ` nor `rⱼ` is selected, and at least one terminal triangle has an
unselected pair `{z,a}` or `{z,b}`. Two distinct blocks cannot both have this
property: their two central vertices together with those two pairs form a
fort disjoint from the selected set. Hence each pair satisfies `xᵢ+xⱼ ≥ 7`.
Adding the three inequalities gives `2(x₀+x₁+x₂) ≥ 21`, so every zero forcing
set has at least 11 vertices.

The full vertex set is zero forcing. Thus `le_csInf` transfers the lower bound
to the defined zero forcing number. We obtain `Z ≥ 11 > 9+1 ≥ α+1`.
Explicit paths prove connectivity, and finite kernel computations check the
maximum degree bound. The graph has 24 vertices and satisfies the target's
`K₄` exclusion.

## Verification

The finite fort family is checked in Lean; the cardinality argument applies
symbolically to every initial set. The proof establishes the inequalities
`Z ≥ 11` and `α ≤ 9`, which suffice for the contradiction.

Comparator matched the exact theorem and definitions and checked the
transitive axioms. Fresh Lean kernel replay passed. The only axioms are
`propext`, `Classical.choice`, and `Quot.sound`.
An independent graph6 decoder matched the Lean adjacency to Fischer's graph.
The published Lean source is byte-identical to the reviewed candidate.
See [the audit](../../verification/TxGraffiti2/result.json).

AI assistance: OpenAI Codex, GPT-6.1 Sol with Max reasoning.
