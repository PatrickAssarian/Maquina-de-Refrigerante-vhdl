# 🥤 Máquina de Refrigerante VHDL / VHDL Soda Vending Machine

<div align="center">
  <a href="#-português">🇧🇷 Português</a> | <a href="#-english">🇺🇸 English</a>
</div>

---

## 🇧🇷 Português

![VHDL](https://img.shields.io/badge/VHDL-005C84?style=for-the-badge)
![Quartus II](https://img.shields.io/badge/Quartus_II-0054A6?style=for-the-badge)
![Status](https://img.shields.io/badge/Status-Concluído-success?style=for-the-badge)

Um projeto estrutural robusto desenvolvido em VHDL implementando uma máquina de venda de refrigerantes digital. O sistema foi projetado para a placa FPGA Altera DE-2, apresentando arquitetura modular, travas de segurança em hardware e divisão precisa de frequência.

---

### 📋 Índice
* [Sobre o Projeto](#-sobre-o-projeto)
* [Principais Funcionalidades](#-principais-funcionalidades)
* [Arquitetura de Hardware](#-arquitetura-de-hardware)
* [Mapeamento de Pinos](#-mapeamento-de-pinos)
* [Como Simular e Executar](#-como-simular-e-executar)
* [Autor](#-autor)

---

### 📖 Sobre o Projeto

Este projeto traduz conceitos de circuitos lógicos digitais em um sistema físico interativo. Ele utiliza a modelagem estrutural em VHDL para conectar componentes isolados (como somadores, contadores e decodificadores) através de uma entidade Top-Level, dispensando o uso de processadores externos e rodando puramente a nível de hardware na placa Altera DE-2.

---

### 🚀 Principais Funcionalidades

* **Arquitetura Estrutural:** O projeto é dividido em 5 componentes distintos gerenciados de forma centralizada, facilitando a manutenção e a realização de testes unitários.
* **Proteção contra Overflow:** O gerenciador de estoque utiliza uma variável temporária de 5 bits e concatenação de zeros para evitar estouro de memória ao adicionar novos itens ao barramento de 4 bits.
* **Trava Inteligente de Pagamento:** O acumulador de fichas verifica continuamente a disponibilidade de estoque real. A máquina só libera o produto se houver refrigerante armazenado.
* **Decodificação Segura (Fog of War visual):** Lógica combinacional rigorosa que traduz os vetores de estado para os displays de 7 segmentos. Um estado de contingência (`when others`) garante que os displays se apaguem caso ocorra qualquer anomalia ou sinal binário inválido.
* **Divisor de Clock Customizado:** Um componente dedicado que reduz os milhões de ciclos nativos do oscilador da placa para um pulso visual legível de 1Hz.

---

### 🧠 Arquitetura de Hardware

A estrutura do código foi dividida nos seguintes módulos VHDL:

| Módulo | Aplicação no Projeto |
| :--- | :--- |
| **`MaquinaRefrigerante.vhd`** | Entidade **Top-Level** (Placa-Mãe). Instancia todos os outros componentes e roteia os fios internos (`signals`) para os pinos físicos de entrada e saída. |
| **`Divfreq_1Hz.vhd`** | O coração do circuito. Conta os pulsos de alta frequência (27MHz ou 50MHz) e gera um sinal de clock reduzido de 1Hz. |
| **`EstoqueLatinhas.vhd`** | Almoxarifado digital. Computa a adição de novas latas no modo administrador e reage subtraindo 1 unidade a cada pulso de venda validado. |
| **`AcumuladorFichas.vhd`** | O caixa da máquina. Conta os pulsos de pagamento até o teto de 5 fichas e emite os sinais físicos de liberação do produto. |
| **`Decodificadores.vhd`** | Conjunto de arquivos puramente combinacionais que formatam os números binários da máquina para acender os displays Anodo Comum da placa. |

---

### 🎮 Mapeamento de Pinos

Configuração esperada na Altera DE-2 via Pin Planner:
* `clk`: Pino do oscilador nativo (ex: `PIN_D13` ou `PIN_N2`).
* `rst` / `I_Mode` / `I_ticket`: Chaves Alavanca (`SW`).
* `HEX_Num_Dez` / `HEX_Num_Uni` / `HEX_Val_Uni`: Displays de 7 Segmentos vermelhos.
* `testeLED1`: LED verde (`LEDG`) operando como *heartbeat* para conferência visual do clock de 1Hz.

---

### ⚙️ Como Simular e Executar

#### Simulação Temporal no Quartus II
Para testar a lógica através dos arquivos `.vwf`:
1. Abra o arquivo `Divfreq_1Hz.vhd`.
2. Altere o limite do contador para um valor de teste (ex: `if count = x"000002" then`).
3. Vá em **Processing > Start > Start Analysis & Synthesis** para compilar as alterações.
4. Abra o arquivo `.vwf` e clique em **Run Functional Simulation**.

#### Gravação Física (Hardware)
Antes de compilar para injetar na placa FPGA:
1. Certifique-se de que a constante do clock em `Divfreq_1Hz.vhd` foi retornada para o valor limite real do hardware (ex: `x"CDFE5F"`).
2. Faça a compilação completa.
3. Utilize o **Programmer** do Quartus para enviar o arquivo `.sof` à placa.

---

## 👨‍💻 Autor
* Patrick Assarian da Luz
* Acadêmico de Engenharia de Computação (5º Semestre)
* Universidade Federal de Pelotas (UFPel)

---

## 🇺🇸 English

![VHDL](https://img.shields.io/badge/VHDL-005C84?style=for-the-badge)
![Quartus II](https://img.shields.io/badge/Quartus_II-0054A6?style=for-the-badge)
![Status](https://img.shields.io/badge/Status-Completed-success?style=for-the-badge)

A robust structural project developed in VHDL implementing a digital soda vending machine. Designed for the Altera DE-2 FPGA board, featuring a modular architecture, hardware safety locks, and precise frequency division.

---

### 📋 Table of Contents
* [About the Project](#-about-the-project-1)
* [Key Features](#-key-features-1)
* [Hardware Architecture](#-hardware-architecture-1)
* [Pin Mapping](#-pin-mapping-1)
* [How to Simulate and Run](#-how-to-simulate-and-run-1)
* [Author](#-author-1)

---

### 📖 About the Project

This project translates digital logic circuit concepts into an interactive physical system. It utilizes structural VHDL modeling to connect isolated components (such as adders, counters, and decoders) through a Top-Level entity, bypassing external processors to run purely at the hardware level on the Altera DE-2 board.

---

### 🚀 Key Features

* **Structural Architecture:** Divided into 5 centrally managed components, enabling straightforward maintenance and unit testing.
* **Overflow Protection:** The stock manager uses a 5-bit temporary variable and zero-concatenation to prevent memory overflow when adding items to the 4-bit bus.
* **Smart Payment Lock:** The coin accumulator continuously checks real-time stock availability. The machine only dispenses a product if a soda is stored.
* **Safe Decoding:** Strict combinational logic translating state vectors to 7-segment displays. A fallback state (`when others`) ensures displays go blank to alert the user if any binary anomaly occurs.
* **Custom Clock Divider:** A dedicated module that steps down the board's native high-frequency oscillator cycles to a readable 1Hz visual pulse.

---

### 🧠 Hardware Architecture

The code structure is divided into the following VHDL modules:

| Module | Application in Project |
| :--- | :--- |
| **`MaquinaRefrigerante.vhd`** | **Top-Level** entity (Motherboard). Instantiates all other components and routes internal wires (`signals`) to physical input/output pins. |
| **`Divfreq_1Hz.vhd`** | The heart of the circuit. Counts high-frequency pulses (27MHz or 50MHz) to generate a stepped-down 1Hz clock signal. |
| **`EstoqueLatinhas.vhd`** | Digital inventory. Computes the addition of new cans in admin mode and subtracts 1 unit for every validated purchase pulse. |
| **`AcumuladorFichas.vhd`** | The cash register. Counts payment pulses up to a 5-coin ceiling and triggers the physical release signals. |
| **`Decodificadores.vhd`** | Purely combinational files formatting binary numbers to light up the board's Common Anode displays. |

---

### 🎮 Pin Mapping

Expected Altera DE-2 configuration via Pin Planner:
* `clk`: Native oscillator pin (e.g., `PIN_D13` or `PIN_N2`).
* `rst` / `I_Mode` / `I_ticket`: Toggle Switches (`SW`).
* `HEX_Num_Dez` / `HEX_Num_Uni` / `HEX_Val_Uni`: Red 7-Segment Displays.
* `testeLED1`: Green LED (`LEDG`) acting as a heartbeat for visual 1Hz clock confirmation.

---

### ⚙️ How to Simulate and Run

#### Temporal Simulation in Quartus II
To test the logic using `.vwf` files:
1. Open `Divfreq_1Hz.vhd`.
2. Change the counter threshold to a small test value (e.g., `if count = x"000002" then`).
3. Navigate to **Processing > Start > Start Analysis & Synthesis** to compile the changes.
4. Open the `.vwf` file and click **Run Functional Simulation**.

#### Hardware Deployment
Before compiling for the FPGA board:
1. Ensure the clock constant in `Divfreq_1Hz.vhd` is reverted to its actual hardware threshold (e.g., `x"CDFE5F"`).
2. Run the full compilation.
3. Use the Quartus **Programmer** to send the `.sof` file to the board.

---

## 👨‍💻 Author
* Patrick Assarian da Luz
* Computer Engineering Undergraduate (5th Semester)
* Federal University of Pelotas (UFPel)
