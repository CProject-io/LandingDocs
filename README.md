LandingDocs
C-Project: Official Repository
Welcome to the official repository of C-Project. This document outlines the project's management, contribution, and governance policies.

📜 Git Repository Management Policy
📌 1. Repository Structure
The repository is organized into the following main branches:

main (or master): Stable production code. Updated only through reviewed and approved pull requests (PRs).
develop: Development branch where changes are integrated before merging into main.
feature/{name}: Branches for new features (Example: feature/implement-pog).
bugfix/{name}: Branches for fixing identified bugs (Example: bugfix/fix-energy-validation).
hotfix/{name}: Branches for critical fixes in the main.
📌 2. Branching Strategy (Git Flow)
1️⃣ New features or fixes → Create a feature/{name} or bugfix/{name} branch from develop.
2️⃣ Development and testing → Work on the branch and test the code.
3️⃣ Pull Request (PR) to develop → Review by other members before merging.
4️⃣ Integration into develop → Merge the change once approved.
5️⃣ Production releases → When develop is ready, create a release/{version} and merge it into main.
6️⃣ Urgent fix in main → Create a hotfix/{name} from main, fix, and merge into both main and develop.

📌 3. Contributions and Reviews
✔ Contribution Rules:

Every contribution should be in a specific branch (feature/, bugfix/).
A clear description is required in PRs.
Prefer small, well-documented commits.
✔ Review Process:

All PRs must be reviewed by at least 2 members before approval.
Automated checks (CI/CD) are used for code validation and testing.
Discussions on PRs are encouraged before merging.
✔ Commit Style (Conventional Commits):

bash
Copiar
Editar
type(scope): short description in present tense
Examples:
✅ feat(consensus): implement Proof-of-Generation validation
✅ fix(api): correct energy audit timestamp format
✅ docs(readme): update contributing guidelines

Valid Commit Types:

feat: New feature.
fix: Bug fix.
docs: Documentation changes.
style: Code formatting without affecting functionality.
refactor: Code restructuring without functional changes.
test: Add or modify tests.
📌 4. Releases and Versioning (SemVer)
We use Semantic Versioning:

bash
Copiar
Editar
MAJOR.MINOR.PATCH
Example:

1.0.0 → First stable release.
1.1.0 → New feature added.
1.1.1 → Bug fix.
📌 5. Repository Security and Governance
🔒 Access and Roles

Only foundation members can merge PRs into main.
External collaborators can submit PRs to develop.
Only admins have access to secrets and credentials.
⚠ Security Rules

Automatic vulnerability scanning on every PR.
Dependency checks to prevent supply chain attacks.
Code of conduct to ensure respectful interactions.
📜 Protocol Governance and Proof of Generate Distribution Policy
📌 1. Block Reward Distribution
For each block generated in the C-Project network, rewards are distributed as follows:

✅ 60% – Energy Generating Nodes

Proportionally distributed based on the energy contributed by each node.
✅ 40% – Network Maintenance and Development Fund

Used to pay salaries, incentivize the community, and improve the protocol.
Automatically burned if not used within 48 hours.
🔥 Token Burn Mechanism

Unused funds are removed to prevent inflation.
Maintains the balance between token issuance and energy generation.
📌 2. Maintenance Fund Governance
🛠 Resource Allocation

Rewards for technical contributions (bugfix/, performance/, feature/, docs/).
Salaries for key developers and infrastructure maintenance.
Adoption incentives (hackathons, grants, bounties).
🎙 Decision-Making Process

Improvement and funding proposals are voted on via GitHub/Governance DAO.
Full transparency on available funds and expenses.
📌 3. Integration with Repository Management Strategy
Significant contributions may receive rewards.
Funding requests are made via funding-request/{name} on GitHub.
If tokens are not allocated within 48 hours, they are burned.
🎯 Impact of This Strategy
✅ Encourages nodes to contribute energy generation.
✅ Promotes continuous protocol improvements.
✅ Maintains token value without uncontrolled inflation.
✅ Fosters an active community aligned with project goals.

🚀 Thank you for contributing to C-Project! For more information, please check the documentation or join our discussions on Discord/GitHub.

