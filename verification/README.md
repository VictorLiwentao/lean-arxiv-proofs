# Verification

Both candidates passed an independent local review on 2026-10-13 against
Formal Conjectures commit `817d8a74e6bcd505ac8407388cc12ac3cfda3d0d`.
The published proof files are byte-identical to those reviewed inputs.

| Proof | Candidate SHA256 | Evidence |
| --- | --- | --- |
| Gowers–Long | `a73c390fdc601a7bdd05198f1503c73beada89b56cb70cf0dc3f9ef3b18eb41f` | [Result](GowersLong/result.json) · [Comparator log](GowersLong/compare.log) |
| TxGraffiti 2 | `d4e0efaeff581e29cd838f0e7d9e5b52b05ce882dd0b3818dba3546de01be1bc` | [Result](TxGraffiti2/result.json) · [Comparator log](TxGraffiti2/compare.log) |

The review freshly compiled the candidates, their original source modules,
and changed supporting modules using Lean 4.33.1. Comparator matched both the
main theorem and its acceptance theorem to aliases of the exact frozen
original type. It compared the registered definitions and recursively
referenced definitions and inspected all transitive proof axioms.

The exported solution was replayed into a fresh empty Lean environment,
including quotient post-checks. Both replays passed. The only proof axioms are
`propext`, `Classical.choice`, and `Quot.sound`; the exported closures contain
no `sorryAx`, `Lean.ofReduceBool`, or `Lean.trustCompiler`.

The audit used the macOS adapter for Comparator revision
`ca04cfc72b550331658ec314bf47685281bfd4bf` and lean4export revision
`cacf989bd75f608700820f6afc595f32e7a99a4d`, with Lean's default kernel.
Positive controls passed; changed statement, changed definition, and extra
axiom controls were rejected. This records a local Comparator and Lean kernel
audit; it does not claim an official Linux sandbox run or a separate kernel.

## Reproduce the proof and type checks

Run the build commands in the [README](../README.md).
[`scripts/Check.lean`](../scripts/Check.lean) checks the exact imported theorem
types and prints the axioms of all four verified declarations. It obtains the
original theorem's type with `type_of%`; the completed proofs supply the terms.

The package's final compilation and axiom output are recorded in
[`publication-build.log`](publication-build.log) and
[`publication-check.log`](publication-check.log).
