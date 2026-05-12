# PS1 MIPS Assembly Programming

A modern collection of PlayStation 1 (PS1) MIPS assembly examples, tools, and guides. This repository is built for **modern 64-bit operating systems** using the `armips` assembler.

By using this setup, you can skip the headache of setting up legacy 16-bit VirtualBox environments or the original PsyQ SDK, while still learning the core fundamentals of the PS1 hardware. Whether you're on a modern machine or an older device, this workflow is designed to be accessible and fast.

---

## 📦 Project Gallery

| Project | Feature | Preview |
| :--- | :--- | :--- |
| **Gouraud Triangle** | Multi-color interpolation across a triangle, a magenta quad, and a flat yellow triangle. | ![Gouraud Triangle](https://github.com/robfernan/PS1-Mips-Programming/raw/main/hellogpu_gourand_triangle/images/Screenshot_20250913_142449.png) |
| **Hello Quad** | Rendering a yellow triangle and a magenta quadrilateral using GP0 commands. | ![Hello Quad](https://github.com/robfernan/PS1-Mips-Programming/raw/main/hellogpu_quad/images/Screenshot_20250913_140819.png) |
| **Hello Triangle** | Basic GPU primitive entry—the "Hello World" of PS1 graphics. | ![Hello Triangle](https://github.com/robfernan/PS1-Mips-Programming/raw/main/hellogpu_triangle/images/Screenshot_20250913_133531.png) |
---

## 🚀 OS-Specific Setup

Choose the method that best fits your current environment.

### **1. Linux (Native)**

Choose the commands for your specific distribution:

#### **Debian / Ubuntu / Pop!_OS / Mint**

```bash
sudo apt update
sudo apt install build-essential cmake python3 git
# Build armips
git clone --recursive https://github.com/Kingcom/armips.git
mkdir armips/build && cd armips/build
cmake .. && make
sudo cp armips /usr/local/bin/

```

#### **Fedora / Nobara**

```bash
sudo dnf groupinstall "Development Tools"
sudo dnf install cmake python3
# Build armips
git clone --recursive https://github.com/Kingcom/armips.git
mkdir armips/build && cd armips/build
cmake .. && make
sudo cp armips /usr/local/bin/

```

#### **Arch / Manjaro**

```bash
sudo pacman -S base-devel cmake python git
# Alternatively, install armips-git from the AUR
yay -S armips-git 

```

---

### **2. Windows 10 / 11**

1. **Compiler:** Download [w64devkit](https://github.com/skeeto/w64devkit/releases) (portable C/C++ development suite) and add the `bin` folder to your Path.
2. **Assembler:** Download the `armips.exe` binary from the [Orphis Buildbot](https://www.google.com/search?q=https://buildbot.orphis.net/armips/) and place it in your project folder or Path.
3. **Python:** Ensure Python 3 is installed via the Microsoft Store or Python.org.

---

### **3. macOS (Apple Silicon & Intel)**

```bash
brew install cmake make python
git clone --recursive https://github.com/Kingcom/armips.git
mkdir armips/build && cd armips/build
cmake .. && make
sudo cp armips /usr/local/bin/

```

---

## 💻 Modern Developer Experience

### **VS Code Setup**

To turn VS Code into a PS1 IDE, install:

* **[MIPS Support](https://marketplace.visualstudio.com/items?itemName=kmarina.mips):** For syntax highlighting.
* **[Hex Editor](https://marketplace.visualstudio.com/items?itemName=ms-vscode.hexeditor):** To view your `.bin` and `.ps-exe` files.

### **GitHub Copilot Tips**

* **Register Context:** Copilot is great at MIPS, but remind it of the PS1 register map.
* **Example Prompt:** `// Write MIPS to load the GPU rendering register (0x1f801810) into register t0`
* **Branch Delay Slots:** Always check Copilot's work. If it generates a branch (`beq`, `bne`, `j`), ensure there is a `nop` or a useful instruction immediately following it.

---

## 🛠️ Build Workflow

1. **Navigate** to a project folder (e.g., `cd hellogpu_triangle`).
2. **Compile:**
```bash
make clean
make

```


3. **Run:** Open the resulting `hellogpu.ps-exe` in **DuckStation**.
* *Tip: In DuckStation, go to "Tools" > "VRAM Viewer" to see exactly how your shapes are being drawn in real-time!*



---

## 📑 PS1 Technical Reference (Cheatsheet)

* **CPU:** R3000A 32-bit RISC (33.868 MHz).
* **Memory Map:** * `0x00000000`: Main RAM (2MB).
* `0x1F801810`: GP0 (Rendering / Command Port).
* `0x1F801814`: GP1 (Display Control / Status Port).


* **GP0 Commands:**
* `0x20`: Flat Triangle.
* `0x28`: Flat Quad.
* `0x30`: Gouraud Triangle.



---

## ❓ Why This Project?

Setting up PS1 homebrew on modern hardware can be tricky. This repository aims to make it easy for anyone to follow along with **Pikuma's tutorials** and learn PS1 programming without the hassle of legacy 16-bit SDKs or virtual machines. 

My goal is to help anyone else who might be struggling with the setup process, providing a path to learn low-level console development using the modern tools we use every day.

---

**Happy Hacking!**
*Created by [Robert Fernandez](https://github.com/robfernan)*

---

