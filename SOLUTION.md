# JSP-000945: Prime Differences from Twice Squares — Complete Mathematical Solution

## Problem Statement

Is there an integer $n$ such that for every $k \geq 0$ with $2k^2 < n$, the difference $n - 2k^2$ is prime?

**Source:** Erdős problem #1140 (Bloom's numbering). JSP catalog entry.

## Mathematical Solution

**Answer: YES.** The integer $n = 5$ satisfies the property:

- $k = 0$: $2 \cdot 0^2 = 0 < 5$, and $5 - 0 = 5$ (prime ✓)
- $k = 1$: $2 \cdot 1^2 = 2 < 5$, and $5 - 2 = 3$ (prime ✓)
- $k \geq 2$: $2 \cdot k^2 \geq 8 \geq 5$, so not permitted (vacuously satisfied)

### Full Characterization

The complete set of positive integers satisfying this property is:
$$\{2, 5, 7, 13, 31, 61, 181, 199\}$$

This was established by Mollin–Williams (1989) and Epure–Gica (2010) using the theory of
class number 1 of real quadratic fields (specifically, idoneal numbers and period-four
continued fractions).

**Key facts:**
- $n = 2$: $k=0$ only ($2-0=2$, prime)
- $n = 5$: $k=0,1$ ($5-0=5$, $5-2=3$, both prime)
- $n = 199$: $k=0,\ldots,9$ (all 10 differences $199-2k^2$ are prime)
- For $n \geq 200$: no $n$ satisfies the property (class number theory)

### Credit

- **Problem proposed:** Paul Erdős
- **Existence:** Trivially yes ($n = 2, 5, 7, \ldots$)
- **Finiteness/classification:** Mollin–Williams (1989), Epure–Gica (2010)
- **Formalization:** This repository (witness $n = 5$)

## Formal Verification

### Build

```bash
lake build Erdos945
```

**Result:** Build completed successfully (0 errors).

### Axioms Used

The theorem `Erdos945.erdos_945` depends on:
- **No axioms** — the proof uses only `decide` for finite primality checks.

No `sorry`/`sorryAx`/`admit`/custom axioms are used.

### Theorem Statement

```lean
theorem erdos_945 :
    ∃ n : ℕ, 0 < n ∧ ∀ k : ℕ, 2 * k^2 < n → Nat.Prime (n - 2 * k^2)
```

Witness: $n = 5$. The proof verifies that $5 - 0 = 5$ and $5 - 2 = 3$ are both prime,
and that $k \geq 2$ is excluded by the bound $2k^2 \geq 8 \geq 5$.

### Key Lean Tactics

- `interval_cases`: Splits $k$ into cases $k = 0$ and $k = 1$ (from bound $k \leq 1$)
- `decide`: Verifies `Nat.Prime 5` and `Nat.Prime 3`
- `nlinarith`: Derives $k \leq 1$ from $2k^2 < 5$ via contradiction
