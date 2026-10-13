# Sources and credits

- **Mikko Fischer** constructs the counterexample in
  [arXiv:2607.23664v1](https://arxiv.org/html/2607.23664v1), §§2–3.
  The published [H24.g6](https://arxiv.org/src/2607.23664v1/anc/H24.g6)
  has SHA256 `464a3729ad019299c1e0ad392be5d98b77ee624de6492ebf230e94fe63ef66ec`.
  The independent audit matched it to the Lean graph under
  `(j,0) → j` and `(j,k) → 2+7j+k` for `k>0`.
- **Randy Davila, Boris Brimkov and Ryan Pepper / TxGraffiti** state Conjecture 2
  in [arXiv:2507.17780v1](https://arxiv.org/html/2507.17780v1).
  The target is the subcubic formulation in the paper's main text.
- **Chakshu Gupta** introduces the Lean statement in
  [PR #4278](https://github.com/google-deepmind/formal-conjectures/pull/4278).
- **Srijan Roy** records Fischer's counterexample and the false answer in
  [PR #6783](https://github.com/google-deepmind/formal-conjectures/pull/6783).
- **Auguste Poiroux** adds module exposure headers in
  [PR #6625](https://github.com/google-deepmind/formal-conjectures/pull/6625).
- **The Formal Conjectures Authors** provide the original statement and definitions
  in the [pinned source](https://github.com/google-deepmind/formal-conjectures/blob/817d8a74e6bcd505ac8407388cc12ac3cfda3d0d/FormalConjectures/Arxiv/2507.17780/2.lean).
- **Wentao Li**: Lean certificate and write-up in this repository.
- AI assistance: OpenAI Codex, GPT-6.1 Sol with Max reasoning.

## Earlier submissions

The duplicate search was refreshed on 2026-10-13 using both paper identifiers,
the exact theorem name, and zero forcing/independence terms.
The merged PR #6783 records the mathematical result and leaves `by sorry`.
PR #4278 proves the different Conjecture 4.
No open or merged proof PR for this exact target appeared in these searches.
