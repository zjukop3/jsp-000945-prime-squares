/-
  JSP-000945: Is there an integer whose differences from twice every
  permitted smaller square are all prime?

  Answer: YES. The integer n = 5 satisfies: for every k ≥ 0 with 2*k² < 5,
  the difference 5 - 2*k² is prime.

  - k = 0: 5 - 0 = 5 (prime)
  - k = 1: 5 - 2 = 3 (prime)
  - k ≥ 2: 2*k² ≥ 8 ≥ 5, so not permitted

  Credit: Problem proposed by Erdős. Existence witness n = 5.
  Full characterization {2,5,7,13,31,61,181,199}: Mollin–Williams (1989), Epure–Gica (2010).
-/

import Mathlib.Data.Nat.Prime.Basic
import Mathlib.Tactic.IntervalCases

namespace Erdos945

/-- JSP-000945: There exists a positive integer n such that for every k ≥ 0
    with 2*k² < n, the difference n - 2*k² is prime. Witness: n = 5. -/
theorem erdos_945 :
    ∃ n : ℕ, 0 < n ∧ ∀ k : ℕ, 2 * k^2 < n → Nat.Prime (n - 2 * k^2) := by
  use 5
  refine ⟨by decide, ?_⟩
  intro k hk
  -- From 2 * k^2 < 5, we get k ≤ 1 (since k ≥ 2 implies k^2 ≥ 4, so 2*k^2 ≥ 8 ≥ 5)
  have hk_le : k ≤ 1 := by
    by_contra h
    have hk2 : 2 ≤ k := by omega
    -- k ≥ 2 → k^2 ≥ 4 → 2*k^2 ≥ 8 ≥ 5, contradiction with hk
    have hk_sq : k^2 = k * k := by simp [pow_two]
    rw [hk_sq] at hk
    have h4 : 4 ≤ k * k := Nat.mul_le_mul hk2 hk2
    omega
  -- Check k = 0 and k = 1
  interval_cases k
  · -- k = 0: 5 - 0 = 5, which is prime
    decide
  · -- k = 1: 5 - 2 = 3, which is prime
    decide

end Erdos945

#print axioms Erdos945.erdos_945
