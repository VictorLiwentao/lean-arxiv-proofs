# Lean arXiv proofs

Lean formalizations by **Wentao Li**, with AI assistance, of two known results
recorded in Formal Conjectures.

| Result | Lean proof | Argument and credits | DeepMind PR |
| --- | --- | --- | --- |
| Gowers–Long square-size lower bound, arXiv:1609.08688 | [GowersLong.lean](LeanArxivProofs/GowersLong.lean) | [Proof](proofs/GowersLong/PROOF.md) · [Sources](proofs/GowersLong/SOURCE.md) | [#7251](https://github.com/google-deepmind/formal-conjectures/pull/7251) |
| Fischer's counterexample to TxGraffiti Conjecture 2, arXiv:2507.17780 | [TxGraffiti2.lean](LeanArxivProofs/TxGraffiti2.lean) | [Proof](proofs/TxGraffiti2/PROOF.md) · [Sources](proofs/TxGraffiti2/SOURCE.md) | [#7252](https://github.com/google-deepmind/formal-conjectures/pull/7252) |

The square-size construction is due to **W. T. Gowers and J. Long**. The
formalization adapts the prior Lean construction and block lemmas from
**weiyangzen/awesome_theorems**. The TxGraffiti counterexample is due to
**Mikko Fischer**. The imported statements and supporting definitions are by
**The Formal Conjectures Authors**. Each source note records the additional
contributor credits.

## Build and check

The project pins Lean 4.33.1 and Formal Conjectures at
`817d8a74e6bcd505ac8407388cc12ac3cfda3d0d`, including its pinned Mathlib revision.
With [elan](https://github.com/leanprover/elan) installed:

```sh
lake exe cache get
LEAN_NUM_THREADS=2 lake --wfail build LeanArxivProofs
LEAN_NUM_THREADS=2 lake env lean -DwarningAsError=true scripts/Check.lean
```

Both proofs passed exact statement and definition comparison, transitive axiom
checks, and fresh-environment Lean kernel replay. Their axioms are
`propext`, `Classical.choice`, and `Quot.sound`.
See [verification](verification/README.md) for the audit evidence and scope.

AI assistance: OpenAI Codex, GPT-6.1 Sol with Max reasoning.
Licensed under [Apache-2.0](LICENSE).
