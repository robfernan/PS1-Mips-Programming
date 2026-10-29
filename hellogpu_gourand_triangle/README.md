

# Hello GPU Gouraud Triangle (PS1 MIPS Assembly)

This project is a step-by-step recreation of Pikuma's PS1 GPU Gouraud-shaded triangle demo. It includes the source, a prebuilt PS-EXE, and build instructions for the Makefile in this folder.

---

## What is this?
A minimal PlayStation 1 homebrew example that draws:
- A yellow flat-shaded triangle (top left)
- A magenta (pink) flat-shaded quad (bottom right)
- A Gouraud-shaded triangle (bottom left) with a different color at each vertex (magenta `0xFF31FF`, teal `0xA88332`, and green `0x00FF00` in BBGGRR)

This demonstrates both flat and Gouraud shading on the PS1 GPU using MIPS assembly.

---

## How to Build (Linux and macOS)

1. **Install prerequisites:**
   - [`armips`](https://github.com/Kingcom/armips) on your `PATH`, and Python 3.
   - The Makefile defaults `ARMIPS` to `/home/mungdaal321/armips/build/armips`. Override it on the command line.

2. **Build the project:**
   ```bash
   make ARMIPS=armips
   ```
   This writes `hellogpu.ps-exe`. A prebuilt copy is already in this folder. `make clean` removes `hellogpu.bin` and `hellogpu.ps-exe`.

3. **Run in an emulator:**
   - Open `hellogpu.ps-exe` in a PS1 emulator (e.g., DuckStation).
   - You should see the following result:

   ![Flat Shaded Triangle and Magenta Quad and Gouraud Triangle Demo](images/Screenshot_20250913_142449.png)

---

## Files
- `hellogpu.s` — MIPS assembly source
- `Makefile` — Build instructions
- `bin2exe.py` — Converts binary to PS-EXE format
- `images/Screenshot_20250913_142449.png` — Demo output screenshot

---

## Why?
This folder follows Pikuma's PS1 GPU Gouraud lesson in MIPS. The build is armips plus `bin2exe.py`.

---

*Happy hacking!*
