# Pipelined RISC Processor

This repository contains the design and implementation of a **cycle-accurate, 5-stage pipelined RISC processor** written in VHDL. The processor follows a MIPS-style architecture and is built entirely at the RTL level using structural design principles.

---

## Table of Contents
- [Overview](#overview)
- [Features](#features)
- [Architecture](#architecture)
- [Pipeline Hazards](#pipeline-hazards)
- [Verification](#verification)
- [Timing Analysis](#timing-analysis)
- [Directory Structure](#directory-structure)
- [Usage](#usage)
- [References](#references)

---

## Overview
The processor is designed to execute instructions across five stages:
1. **Instruction Fetch (IF)**  
2. **Instruction Decode (ID)**  
3. **Execution / Address Calculation (EX)**  
4. **Memory Access (MEM)**  
5. **Write Back (WB)**  

Pipeline registers carry both **data and control signals** between stages, allowing instruction-level parallelism.

---

## Features
- Full 5-stage MIPS-style pipeline
- Instruction decode and control logic supporting:
  - R-type instructions
  - Load / store
  - Branch and jump
- **Hazard detection unit** to handle load-use stalls
- **Forwarding unit** for RAW dependency resolution
- Modular, RTL-level design for easy extension
- Cycle-level simulation and verification with benchmark programs
- Timing analysis for critical path and maximum safe clock frequency

---

## Architecture
![image](https://github.com/Abilaash01/Pipelined-RISC-Processor/blob/main/Single%20Cycle%20RISC%20Processor.png)
*Figure 1: High-level 5-stage pipelined processor datapath.*

### Components
- Register file (8 registers, 8-bit)
- ALU with control signals
- Pipeline registers storing data and control between stages
- Multiplexers for data selection
- Hazard detection and forwarding logic

---

## Pipeline Hazards

Three main types of hazards are addressed:

### Data Hazards
- Detected using the **hazard detection unit**
- Forwarded via the **forwarding unit** to prevent stalls where possible

### Control Hazards
- Managed using stalling or branch resolution mechanisms

### Structural Hazards
- Not present due to single shared datapath

---

## Verification
Benchmark programs were run to validate correct instruction execution:
- Load-use dependencies
- Branch instructions
- Arithmetic operations (add, sub, or)

Simulations show that instructions execute correctly in a pipelined manner while resolving hazards.

---

## Timing Analysis
- Critical path determined using gate-level timing analysis
- Maximum clock frequency calculated and verified
- Comparison made against single-cycle processor design to show throughput improvements

---

## Directory Structure
