# C-Project: System Architecture

## 1. Introduction
C-Project aims to build a blockchain network that incentivizes renewable energy generation through a Proof-of-Generation (PoG) consensus mechanism. The project is designed to achieve a sustainable, decentralized, and energy-efficient network by combining a robust software architecture with a network of physically autonomous nodes.

## 2. Software Architecture
### 2.1. Blockchain Framework
The C-Project blockchain will be built as a fork of Substrate, a modular and extensible framework developed by Parity Technologies. Substrate allows for high flexibility in customizing the consensus layer, governance mechanisms, and runtime modules, aligning well with C-Project's unique PoG requirements.
#### 2.1.1. PoG (Proof-of-Generation) Validation Mechanism

The integrity of the Proof-of-Generation consensus is fundamental to C-Project. To ensure that the energy reported by nodes originates from verified renewable sources and corresponds to actual generation, we implement a robust multi-layer validation mechanism:

1.  **Layer 1: Secure Direct Measurement (Hardware-Software)**
    * A sensor module, physically coupled to the generation equipment, measures the net energy produced (`E_measured`) at defined intervals.
    * This measurement is digitally signed by the sensor module and securely transmitted (e.g., via encrypted and authenticated Power Line Communication - PLC - or another secure dedicated channel) to an auditor device associated with the node.
    * The auditor device verifies the cryptographic signature, the authenticity of the origin, and the timestamp freshness of the received measurement.

2.  **Layer 2: Contextual Estimation Based on Models and Oracles (Software)**
    * The auditor device uses the generator's technical specifications (previously registered on the blockchain, including model, certified efficiency curve, and degradation history) and its precise, verified GPS location.
    * It queries trusted external oracles (or, in future phases, data from C-Project's internal network of weather stations) to obtain relevant environmental data (incident solar radiation, local wind speed, temperature, etc.) corresponding to the location and time of the measurement.
    * It calculates the estimated energy (`E_estimated`) that the generator *should* theoretically have produced under those specific conditions and according to its technical profile.

3.  **Layer 3: Reconciliation and Final Validation (Software)**
    * The directly measured energy (`E_measured`) is compared with the estimated energy (`E_estimated`).
    * If the difference (`|E_measured - E_estimated| / E_estimated`) falls within a dynamic tolerance threshold (`PoG_Tolerance`), adjustable by governance and potentially dependent on generator type and conditions, the measurement is considered **Valid**. The final value registered for rewards (`E_reported`) is based on `E_measured`.
    * If the difference exceeds the threshold, the measurement is flagged as **Suspicious**. A null or minimal value (`E_reported = 0` or near-zero) is registered, and an alert may potentially be generated for review or further analysis. This prevents rewards for anomalous data while preserving it for auditing purposes.

4.  **On-Chain Transparency and Auditability:**
    * The node consolidates and reports key process information to the blockchain (timestamp, `E_measured`, `E_estimated`, environmental data source identifiers, `E_reported`, validation status). This ensures full transparency and allows for independent auditing of the PoG validation process.

This multi-layer approach guarantees high fidelity and reliability in the reported energy, underpinning the rewards, security, and ecological value proposition of the C-Project network.
- **Key Runtime Modules (Pallets)**
  - `pallet-consensus-pog`: Implements the PoG consensus logic.
  - `pallet-energy-oracle`: Manages the integration of off-chain energy data with the blockchain.
  - `pallet-tokenomics`: Controls reward distribution, token issuance, and burning mechanisms.
  - `pallet-governance`: Supports the decentralized governance of the network through a DAO model.

### 2.2. Data Flow and Interactions
- **On-Chain Logic**
  - Smart contracts handle validation, transaction processing, and token management.
  - Runtime modules enforce consensus rules and manage state transitions.

- **Off-Chain Workers**
  - Fetch and validate real-world energy data from physical nodes.
  - Perform complex computations to minimize on-chain resource usage.

- **API and Middleware**
  - GraphQL and RESTful APIs for external applications to interact with the network.
  - Middleware services to facilitate integration with energy monitoring systems.

## 3. Hardware Architecture
### 3.1. Physical Node Design
C-Project nodes will be physically autonomous units that generate renewable energy and participate in the network. Each node is equipped with the following components:

- **Computing Unit**
  - Raspberry Pi or NVIDIA Jetson devices with ARM architecture.
  - 4-8 GB RAM, 32-64 GB SSD for local blockchain data storage.
  - Low power consumption (<15W) to maintain energy efficiency.

- **Energy Generation**
  - Solar panels (100W to 300W capacity) with MPPT charge controllers.
  - Wind turbines (50W to 200W) for complementary energy generation.

- **Energy Storage and Management**
  - Lithium-ion battery packs (500Wh to 2000Wh capacity).
  - Battery management systems (BMS) to optimize charge cycles and longevity.
  - Inverters and voltage regulators to ensure stable power supply to the computing unit.

- **Connectivity and Communication**
  - Wi-Fi and Ethernet for network connectivity.
  - LoRaWAN modules for low-power, long-range communication in rural areas.

### 3.2. Autonomy and Sustainability
- **Energy Autonomy**
  - Nodes are designed to operate independently, harnessing and storing renewable energy locally.
  - Energy-efficient hardware selection ensures prolonged operation even in low-energy conditions.

- **Failover Mechanisms**
  - Nodes automatically switch to battery power during periods of low renewable energy generation.
  - Software-based energy management to prioritize essential operations during low battery states.

## 4. Security and Governance
### 4.1. Network Security
- End-to-end encryption for data transmitted between nodes.
- Automated vulnerability scanning and dependency checks during software updates.
- Hardware security modules (HSM) for private key storage in physical nodes.

### 4.2. Governance Model
- The network employs a DAO structure where node operators and token holders vote on proposals.
- Governance is integrated into the blockchain using the `pallet-governance` module, enabling transparent and democratic decision-making.

## 5. Conclusion
C-Project's architecture combines advanced blockchain technology with physical infrastructure to create a decentralized and sustainable energy network. By utilizing a PoG consensus and energy-autonomous nodes, the project aims to drive real-world impact in reducing carbon emissions and promoting renewable energy generation.


