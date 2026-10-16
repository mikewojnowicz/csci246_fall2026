"""
Render animation frames comparing a discrete-time linear recurrence with its
continuous-time analogue (a linear ODE), for the 10/16 Recurrence slides.

Discrete:   x_n = M x_{n-1},  M = [[0.8, -0.4], [0.4, 0.8]]  (shrink by sqrt(0.8), rotate ~26.6 deg)
            M has characteristic polynomial r^2 - 1.6 r + 0.8, so (Cayley-Hamilton) each
            coordinate of x_n satisfies the scalar recurrence a_n = 1.6 a_{n-1} - 0.8 a_{n-2}.
Continuous: x'(t) = A x(t),  with A = log(M), so that e^{A} = M.
            Hence the discrete solution x_n = M^n x_0 is exactly the continuous
            solution x(t) = e^{tA} x_0 sampled at t = 0, 1, 2, ...

Output: images/vector_field/frame_XX.png (one PNG per beamer overlay).
Run from this directory:  python3 make_vector_field_animation.py
"""

import os

import matplotlib.pyplot as plt
import numpy as np
from scipy.linalg import expm, logm

M = np.array([[0.8, -0.4], [0.4, 0.8]])  # each coordinate obeys a_n = 1.6 a_{n-1} - 0.8 a_{n-2}
A = np.real(logm(M))                    # continuous-time generator: expm(A) == M

N_STEPS = 12                            # discrete steps shown
SUBSTEPS = 2                            # animation frames per discrete step
LIM = 3.2
INITIAL_CONDITIONS = [(2.8 * np.cos(a), 2.8 * np.sin(a)) for a in np.deg2rad([0, 72, 144, 216, 288])]
COLORS = ["#1f77b4", "#d62728", "#2ca02c", "#9467bd", "#ff7f0e"]

OUT_DIR = os.path.join("images", "vector_field")


def draw_vector_field(ax, field):
    g = np.linspace(-LIM + 0.4, LIM - 0.4, 9)
    X, Y = np.meshgrid(g, g)
    U, V = field(X, Y)
    ax.quiver(X, Y, U, V, color="0.7", angles="xy", scale_units="xy", scale=3.0,
              width=0.004, headwidth=4)


def style_axes(ax, title):
    ax.set_xlim(-LIM, LIM)
    ax.set_ylim(-LIM, LIM)
    ax.set_aspect("equal")
    ax.axhline(0, color="0.85", lw=0.8, zorder=0)
    ax.axvline(0, color="0.85", lw=0.8, zorder=0)
    discrete = "Discrete" in title
    ax.set_xlabel(r"first coordinate of $x_n$" if discrete else r"first coordinate of $x(t)$", fontsize=11)
    ax.set_ylabel(r"second coordinate of $x_n$" if discrete else r"second coordinate of $x(t)$", fontsize=11)
    ax.set_title(title, fontsize=13)
    ax.set_xticks([])
    ax.set_yticks([])


def continuous_field(X, Y):
    return A[0, 0] * X + A[0, 1] * Y, A[1, 0] * X + A[1, 1] * Y


def discrete_field(X, Y):
    # displacement from a state to the next state: M x - x
    return (M[0, 0] - 1) * X + M[0, 1] * Y, M[1, 0] * X + (M[1, 1] - 1) * Y


def main():
    os.makedirs(OUT_DIR, exist_ok=True)
    fine_t = np.linspace(0, N_STEPS, N_STEPS * 40 + 1)
    continuous_paths = [np.array([expm(t * A) @ np.array(x0) for t in fine_t]) for x0 in INITIAL_CONDITIONS]
    discrete_paths = [np.array([np.linalg.matrix_power(M, n) @ np.array(x0) for n in range(N_STEPS + 1)])
                      for x0 in INITIAL_CONDITIONS]

    n_frames = N_STEPS * SUBSTEPS + 1
    for k in range(n_frames):
        t = k / SUBSTEPS
        n = int(np.floor(t))
        fig, (ax_c, ax_d) = plt.subplots(1, 2, figsize=(9, 4.6))

        draw_vector_field(ax_c, continuous_field)
        draw_vector_field(ax_d, discrete_field)

        for path, color in zip(continuous_paths, COLORS):
            upto = fine_t <= t + 1e-9
            ax_c.plot(path[upto, 0], path[upto, 1], color=color, lw=2)
            ax_c.plot(*path[0], "o", color=color, ms=5, mfc="white")
            ax_c.plot(*path[upto][-1], "o", color=color, ms=7)

        for path, color in zip(discrete_paths, COLORS):
            pts = path[: n + 1]
            ax_d.plot(pts[:, 0], pts[:, 1], color=color, lw=1, ls=":", alpha=0.8)
            ax_d.plot(pts[:, 0], pts[:, 1], "o", color=color, ms=4, alpha=0.6)
            ax_d.plot(*path[0], "o", color=color, ms=5, mfc="white")
            ax_d.plot(*pts[-1], "o", color=color, ms=7)

        style_axes(ax_c, f"Continuous time  ($t = {t:.1f}$)")
        style_axes(ax_d, f"Discrete time  ($n = {n}$)")
        fig.tight_layout()
        fig.savefig(os.path.join(OUT_DIR, f"frame_{k:02d}.png"), dpi=100)
        plt.close(fig)

    print(f"wrote {n_frames} frames to {OUT_DIR}/")
    print("A =", np.round(A, 3).tolist(), " check expm(A) == M:", np.allclose(expm(A), M))


if __name__ == "__main__":
    main()
