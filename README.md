这份README是为你准备的，涵盖了项目的核心逻辑、文件结构以及仿真运行指南。

---

# PNAS-Flexagon-Mechanisms

This repository contains the source code, 3D models, and simulation files for the research on **Flexagon-based Metamorphic Mechanisms**. The project explores the configuration synthesis and kinematic analysis of multi-modal robots using an **Iterative Equivalence Analysis** method.

## 📂 Repository Structure

The repository is organized into three main modules:

* **`MATLAB Code/`**: Analytical solvers and visualization scripts for kinematics.
* **`Simulation/`**: Multi-body dynamics simulations (Simscape Multibody) linked with SolidWorks.
* **`Model/`**: 3D CAD models (STEP format) for various flexagon-inspired mechanisms and robots.

---

## 🚀 Getting Started

### Prerequisites
* **MATLAB**: R2025a or later (required for `.slx` compatibility).
* **SolidWorks**: 2022 or later.
* **Toolboxes**: Simscape Multibody, Symbolic Math Toolbox.

---

## 🛠 Usage Instructions

### 1. Analytical Kinematics (`MATLAB Code/`)
The analytical solutions are derived using the **Iterative Equivalence Analysis** described in the paper.
* **`Formula_solve.m`**: The core solver. You can select specific code blocks based on parameters $k$ (number of vertices) and $p$ (polygonal type) to generate analytical kinematic expressions.
* **`Allplot.m`**: Use this script to visualize the results. It loads the pre-calculated `.mat` files to plot the motion trajectories.
* **Data Mapping**: The result files correspond to specific configurations as follows:
    | File Name | Configuration |
    | :--- | :--- |
    | `60sim.mat` | $p=3, k=3$ |
    | `90sim.mat` | $p=4, k=3$ |
    | `108sim.mat`| $p=5, k=3$ |
    | `120sim.mat`| $p=6, k=3$ |
    | `128sim.mat`| $p=7, k=3$ |

### 2. Co-Simulation (`Simulation/`)
The repository provides a seamless workflow between SolidWorks and Simscape for dynamic verification.
1.  Navigate to the folder corresponding to the desired $k$ and $p$ values.
2.  **Run `x60degAssem_DataFile.m`** (example): This loads the physical parameters and inertia data of the CAD components into the workspace.
3.  **Open and Run `x60degAssem.slx`**: This executes the multi-body simulation to observe the linkage motion.

### 3. 3D Models (`Model/`)
Contains high-fidelity models for different research stages:
* **Kirigami Models**: $8R(k=2, p=2)$ and $9R(k=3, p=3)$ designs.
* **Linkage Networks**: $8R(k=2, p=3)$ networked metamorphic mechanisms.
* **Robotic Prototypes**:
    * `8R-prototype`: A functional mobile prototype.
    * `9R-Robot`: A conceptual design of a reconfigurable multi-modal robot.

---

## 📜 License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 📝 Citation
If you use this code or model in your research, please cite our PNAS paper:
> *[Insert Full Paper Citation Here]*

---

**Contact**: [Lucien / Your Email]
**Affiliation**: Southern University of Science and Technology (SUSTech)
