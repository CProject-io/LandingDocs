# LandingDocs
# C-Project: Official Repository

Welcome to the official repository of C-Project. This document outlines the project's management, contribution, and governance policies.

## 📜 Git Repository Management Policy

### 📌 1. Repository Structure
The repository is divided into the following main branches:

- **main (or master)**: Stable production code. Only updated through reviewed and approved pull requests (PRs).
- **develop**: Development branch where changes are integrated before merging into main.
- **feature/{name}**: Branches for new features (Example: `feature/implement-pog`).
- **bugfix/{name}**: Branches to fix identified bugs (Example: `bugfix/fix-energy-validation`).
- **hotfix/{name}**: Branches for critical fixes in main.

### 📌 2. Branching Strategy (Git Flow)

1️⃣ **New features or fixes** → Create a `feature/{name}` or `bugfix/{name}` branch from `develop`.
2️⃣ **Development and testing** → Work on the corresponding branch and test the code.
3️⃣ **Pull Request (PR) to develop** → Review by other members before merging.
4️⃣ **Integration into develop** → Merge the change once approved.
5️⃣ **Production releases** → When `develop` is ready, create a version (`release/{version}`) and merge into `main`.
6️⃣ **Critical fix in main** → Create a `hotfix/{name}` from `main`, fix it, and merge into `main` and `develop`.

### 📌 3. Contributions and Reviews

✔ **Contribution Rules:**
- Each contribution must go into a specific branch (`feature/`, `bugfix/`).
- Clear descriptions are required in PRs.
- It is recommended to use small and well-documented commits.

✔ **Review Process:**
- Every PR must be reviewed by at least 2 members before approval.
- Automatic checks (CI/CD) are used to validate code and tests.
- Discussions in PRs are encouraged before merging.

✔ **Commit Style (Conventional Commits):**
```bash
type(scope): short description in present tense
```
Examples:
✅ `feat(consensus): implement Proof-of-Generation validation`
✅ `fix(api): correct energy audit timestamp format`
✅ `docs(readme): update contributing guidelines`

**Valid commit types:**
- `feat`: New feature.
- `fix`: Bug fix.
- `docs`: Documentation changes.
- `style`: Formatting/code style changes with no functional impact.
- `refactor`: Code restructuring without functional changes.
- `test`: Adding or modifying tests.

### 📌 4. Releases and Versioning (SemVer)

We use Semantic Versioning:
```bash
MAJOR.MINOR.PATCH
```
Example:  
- `1.0.0` → First stable release.
- `1.1.0` → New functionality.
- `1.1.1` → Bug fix.

### 📌 5. Repository Security and Governance

🔒 **Access and Roles**
- Only foundation members can merge PRs into `main`.
- External contributors can create PRs to `develop`.
- Only administrators have access to secrets and credentials.

⚠ **Security Rules**
- Automatic vulnerability scanning on every PR.
- Dependency checks to avoid supply chain attacks.
- Code of conduct for respectful interactions.

## 📜 Proof of Generate Protocol Distribution and Governance Policy

### 📌 1. Block Reward Distribution

Each block generated on the C-Project network distributes rewards as follows:

✅ **60% – Energy-generating nodes**
- Distributed proportionally according to the energy contributed by each node.

✅ **40% – Network maintenance and development fund**
- Used for salaries, community incentives, and protocol improvements.
- **Burned automatically if not used within 48 hours.**

🔥 **Token Burning Mechanism**
- Unused funds are eliminated to avoid inflation.
- Maintains balance between token issuance and energy generation.

### 📌 2. Maintenance Fund Governance

🛠 **Resource Allocation**
- Rewards for technical contributions (`bugfix/`, `performance/`, `feature/`, `docs/`).
- Salaries for key developers and infrastructure maintenance.
- Adoption incentives (`hackathons`, `grants`, `bounties`).

🎙 **Decision-Making Process**
- Improvement and funding proposals through community voting on GitHub/Governance DAO.
- Full transparency on available funds and expenses.

### 📌 3. Integration with Repository Management Strategy

- Significant contributions can receive rewards.
- Funding requests are made via `funding-request/{name}` on GitHub.
- If tokens are not allocated within 48 hours, they are burned.

🎯 **Impact of This Strategy**  
✅ Encourages nodes to contribute energy generation.  
✅ Promotes continuous improvements in the protocol.  
✅ Maintains token value without uncontrolled inflation.  
✅ Fosters an active community aligned with the project's goals.

---

🚀 Thank you for contributing to C-Project! For more information, please refer to the documentation or join our discussions on Discord/GitHub.

