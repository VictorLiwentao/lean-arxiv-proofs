# Gowers–Long square-size lower bound

Formalization and write-up: **Wentao Li**.
Mathematical construction: **W. T. Gowers and J. Long**, Proposition 1.4.
Prior Lean construction and block lemmas: **weiyangzen/awesome_theorems**.
See [sources](SOURCE.md) for the supporting Lean credits.

The theorem proves the exact Formal Conjectures statement
`Arxiv.«1609.08688».maximalLength_ge_of_isSquare`:
for each natural square `n`, `n.sqrt ^ 3 ≤ maximalLength n`.

## Construction

For each natural `m`, list

\[
(am+b+1,\;am+c+1,\;bm+c+1),\qquad 0\le a,b,c<m,
\]

in lexicographic order of `(a,b,c)`. This gives `m³` entries, all in `[1,m²]³`.
For example, `am+b+1 ≤ (a+1)m ≤ m²`.

Compare two distinct entries in list order. If their `a` indices first differ,
the first two coordinates increase. If only `b` first differs, the first and
third increase. If only `c` differs, the second and third increase. The block
inequality `am+b+1 < a'm+b'+1` for `a<a'` and `b<m` proves the first two cases.
Thus every earlier/later pair increases in at least two coordinates.

## Supremum and boundary cases

The definition of `maximalLength` takes a natural supremum of admissible list
lengths. The existing pigeonhole lemma bounds every length by `n²` for `n≥2`.
At `n=0` only the empty list is admissible. At `n=1` every triple is constant,
so a pairwise increasing list has at most one entry. This proves boundedness
for all `n`.

The constructed list gives `m³ ≤ maximalLength (m²)` by `le_csSup`.
An `IsSquare n` witness and `Nat.sqrt_eq` give the required statement, including
the zero square.

## Verification

The complete proof and `acceptance` declaration passed Comparator comparison
against the frozen original theorem, including its definitions, and fresh Lean
kernel replay. Both use only `propext`, `Classical.choice`, and `Quot.sound`.
The published Lean source is byte-identical to the reviewed candidate.
See [the audit](../../verification/GowersLong/result.json).

AI assistance: OpenAI Codex, GPT-6.1 Sol with Max reasoning.
