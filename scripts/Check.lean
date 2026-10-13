import LeanArxivProofs

/-! Consumer checks against the unchanged Formal Conjectures theorem types. -/

example : type_of% @Arxiv.«1609.08688».maximalLength_ge_of_isSquare :=
  @GowersLongLowerBound.maximalLength_ge_of_isSquare
example : type_of% @Arxiv.«2507.17780».tx_graffiti_conjecture_2 :=
  TxGraffitiC2.conjecture

#print axioms GowersLongLowerBound.maximalLength_ge_of_isSquare
#print axioms GowersLongLowerBound.acceptance
#print axioms TxGraffitiC2.conjecture
#print axioms TxGraffitiC2.acceptance
