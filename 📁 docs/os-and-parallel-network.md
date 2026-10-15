# C-Project Node OS and the Parallel Network Layer

> See [How It Works](how-it-works.md) for a diagram of the mechanisms described below, including an interactive version.

## 1. Introduction

This document fills a gap between C-Project's stated vision and its existing technical documents: it describes two components that are implied by [`architecture.md`](architecture.md) and [`network`](https://github.com/CProject-io/network) but were never written down explicitly:

1. **The C-Project Node OS** — a purpose-built Linux distribution, not a generic Raspberry Pi OS with software installed on top, that turns a piece of hardware into a C-Project node the moment it boots.
2. **The Parallel Network** — what "Layer 0" and "free access" actually mean in practice, and how a node belonging to *any* existing blockchain can route its peer-to-peer traffic through C-Project instead of through the public Internet.

Both pieces exist to serve the same goal stated in [`PoG.md`](PoG.md) and the [project landing page](https://cproject.io/project.html): a node should be a single self-contained unit where generating its own electricity is literally what gives it the right to exist on the network.

## 2. The C-Project Node OS

### 2.1. Why a custom OS instead of "an app on Raspbian"

[`architecture.md`](architecture.md) and the [`nodo`](https://github.com/CProject-io/nodo) repository describe the node's hardware (Raspberry Pi / NVIDIA Jetson, solar/wind generation, battery management) and a Substrate-based client as *software running on the device*. That framing is incomplete: it implies someone flashes a standard OS, then installs and wires together several independent services by hand. That is not operable at the scale C-Project needs (potentially thousands of unattended, physically remote nodes), and it is not secure by default.

Instead, a node should run **one purpose-built image** that already contains and pre-wires every service the node needs:

- the mesh-networking daemon that joins the Parallel Network (Section 3),
- the blockchain client that runs PoG consensus and talks to the other pallets described in `architecture.md`,
- the energy-auditor service that reads the sensor module and feeds `pallet-energy-oracle`,
- key management and the node's cryptographic identity.

A node operator's experience should be: flash the image (or buy hardware that ships with it pre-installed), connect the solar/wind generator and the sensor module, power on. There is no separate "install the blockchain software" step — the OS *is* the node.

### 2.2. What the OS is built from

- **Base layer:** a minimal, hardened Linux build (e.g. Yocto/Buildroot, or a stripped Debian/Alpine derivative), ARM-first to match the recommended hardware (Raspberry Pi 4, Jetson Nano). No desktop environment, no unnecessary daemons, minimal attack surface.
- **Immutable/atomic updates:** a read-only root filesystem with A/B partitions (the same pattern used by Fedora IoT / rpm-ostree, balenaOS, or ChromeOS), so that:
  - a failed update automatically rolls back instead of bricking a physically remote, unattended node;
  - OS-level updates and the blockchain's own forkless runtime upgrades (a Substrate feature already assumed in `architecture.md`) can be reasoned about and authenticated through the same governance process described in [`governance.md`](governance.md).
- **Key storage:** node identity and validator keys live in a hardware security module or the device's secure element where available, consistent with the "Hardware security modules (HSM) for private key storage" requirement already listed in `architecture.md` §4.1 — today that requirement has no home; the OS is where it is actually enforced.
- **Service supervision:** the networking daemon, blockchain client, and energy-auditor run as supervised services that the OS restarts and health-checks, so a node that silently crashes doesn't just disappear from the network until someone notices.

### 2.3. Relationship to the existing docs

This section does not replace anything in `architecture.md` — it answers the question that document leaves open ("what does this software actually run on?"). `nodo/README.md`'s "Substrate-Based Node Client" and "Secure Interconnection" bullets become two of the services this OS ships by default, instead of two things a node operator is expected to configure separately.

## 3. The Parallel Network: What "Layer 0" and "Free" Actually Mean

### 3.1. The problem today

Right now, if you run a node for *any* blockchain — Bitcoin, Ethereum, or anything else — that node finds and talks to its peers over the public Internet: through your ISP, over standard TCP/IP, subject to that ISP's routing, logging, throttling, and any government or infrastructure failure along the way. This is true no matter how decentralized the blockchain's protocol itself is — its peer-to-peer layer still rides on centralized physical infrastructure.

### 3.2. What C-Project proposes

C-Project nodes form their own mesh transport layer — using the protocols already named in the [`network`](https://github.com/CProject-io/network) repo (CJDNS, BATMAN-adv, or Babel) — that is **parallel to the Internet, not dependent on it, but still interoperable with it**:

- *Parallel:* node-to-node links don't need to transit an ISP backbone. They can run over mesh Wi-Fi, LoRa, or direct radio/wired links between physically nearby nodes, encrypted end-to-end (CJDNS gives every node a self-generated, cryptographically-owned address).
- *Interoperable:* nodes that do have Internet access can act as optional gateways (e.g. via WireGuard, as already noted in `network/README.md` §3.2), stitching the mesh together across long distances and letting it exchange traffic with the normal Internet when that's useful.

This network is the "Layer 0" referenced on the landing page: a transport/connectivity layer that other blockchains can use instead of (or alongside) the public Internet for their own peer-to-peer traffic.

### 3.3. How another blockchain's node actually connects through it

Concretely, for someone running a node of an unrelated blockchain (say, Bitcoin):

1. A C-Project node exposes a local network interface on the machine it's running on — conceptually similar to a VPN/tunnel interface.
2. The Bitcoin node's own P2P software is pointed at that interface instead of (or in addition to) the normal network interface, the same way Bitcoin Core today can be run over Tor or I2P.
3. Outbound traffic to a peer is carried across the CJDNS mesh, encrypted hop-by-hop, to whichever C-Project node is closest to that peer (or to an Internet gateway node if the peer isn't reachable over the mesh), which hands it back off as normal TCP/IP to the destination.

This makes C-Project's relationship to other blockchains an **overlay for their existing P2P traffic**, not a new chain they need to integrate with at the protocol level. The "substrate" framing on the landing page and in `network/README.md` refers to this transport role — it is unrelated to the Substrate/Polkadot SDK blockchain framework that C-Project's *own* chain is built on (`architecture.md` §2.1); the two uses of the word should be kept clearly distinct in future docs to avoid confusing readers.

### 3.4. What is actually free, and what costs tokens

"Free access" (landing page hero section) and "stable fees linked to real capacity" (landing page, Business Verticals) are not contradictory, but the line between them has never been drawn in writing until now:

- **Free, always:** basic transport — a message or a peer-to-peer connection being relayed across the mesh. This doesn't meaningfully consume a relaying node's scarce resources beyond the energy it was already generating to exist on the network, so there's no reason to meter it. This is the actual "Layer 0, free and universal access" promise.
- **Metered, in C-Project's token:** anything that consumes a specific node's finite resources on another user's behalf — dedicated storage, sustained compute, or a guaranteed-bandwidth/SLA relay. These map to the "Decentralized Services" vertical already on the landing page and should stay priced, because unlike basic routing they have a real marginal cost to the node providing them.

### 4. Open questions this document intentionally leaves open

This is a first pass at writing down the concept; it is not a spec. Before any of this is implementable, the project still needs to define:

- the OS build system and release/signing process for OTA updates;
- the addressing/discovery scheme that maps a normal blockchain node's expected peer addresses onto CJDNS's self-generated addresses;
- which external protocols get a passthrough tunnel first (generic TCP passthrough is simple; protocol-aware proxies are more efficient but more work) and which blockchain ecosystems are the first interoperability targets;
- expected latency/throughput of the mesh versus the Internet for realistic node density, since "free" only matters if the network is actually usable.
