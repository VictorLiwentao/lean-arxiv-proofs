# Sources and credits

- **W. T. Gowers and J. Long** prove the square-size lower bound in
  [Proposition 1.4 of arXiv:1609.08688](https://arxiv.org/html/1609.08688v2#S1.SS1).
  A coordinate permutation gives the lexicographic construction used here.
- **weiyangzen/awesome_theorems** provides the prior
  [Lean construction and block lemmas](https://github.com/weiyangzen/awesome_theorems/blob/32e5f75412a804463a0b0c6fff1362d4ab5275b3/Formalizations/Lean/AwesomeTheorems/Stage5/Theorems/S5_CLM_00003491/Proof.lean).
  Wentao Li's formalization adapts that structure to the pinned Formal
  Conjectures definitions and uses `List.pairwise_flatMap` for the list argument.
- **Chakshu Gupta** (`ChakshuGupta13`) proves the supporting pigeonhole lemma in
  [PR #4207](https://github.com/google-deepmind/formal-conjectures/pull/4207).
- **MiskinAleksandr23** supplies the quadratic boundedness proof pattern in
  [PR #4616](https://github.com/google-deepmind/formal-conjectures/pull/4616).
- **The Formal Conjectures Authors** provide the original statement and definitions
  in the [pinned source](https://github.com/google-deepmind/formal-conjectures/blob/817d8a74e6bcd505ac8407388cc12ac3cfda3d0d/FormalConjectures/Arxiv/1609.08688/sIncreasingrTuples.lean).
- **Wentao Li**: formalization and write-up in this repository.
- AI assistance: OpenAI Codex, GPT-6.1 Sol with Max reasoning.

## Earlier submissions

The duplicate search was refreshed on 2026-10-13 using the paper identifier,
the exact theorem name, and Gowers–Long lower-bound terms.
[PR #2751](https://github.com/google-deepmind/formal-conjectures/pull/2751)
and [PR #3272](https://github.com/google-deepmind/formal-conjectures/pull/3272)
were closed unmerged and left the theorem as `by sorry`.
PRs #4207 and #4616 prove supporting results; neither proves this lower bound.
No open or merged proof PR for this exact target appeared in these searches.
