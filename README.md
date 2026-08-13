<p align="center">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="https://shieldcn.dev/header/grid.svg?title=The+Labs&subtitle=DevSecOps+%26+Infrastructure+Experiments&logo=flask&theme=zinc&mode=dark&align=center" />
    <img alt="The Labs" src="https://shieldcn.dev/header/grid.svg?title=The+Labs&subtitle=DevSecOps+%26+Infrastructure+Experiments&logo=flask&theme=zinc&mode=light&align=center" />
  </picture>
</p>

<p align="center">
  <a href="https://github.com/victor3spoir/the-labs/stargazers">
    <img src="https://shieldcn.dev/github/stars/victor3spoir/the-labs.svg?variant=secondary" alt="GitHub stars" />
  </a>
  <a href="https://github.com/victor3spoir/the-labs/blob/main/LICENSE">
    <img src="https://shieldcn.dev/github/license/victor3spoir/the-labs.svg?variant=secondary" alt="License" />
  </a>
  <a href="https://github.com/victor3spoir/the-labs/commits">
    <img src="https://shieldcn.dev/github/last-commit/victor3spoir/the-labs.svg?variant=secondary" alt="Last commit" />
  </a>
  <a href="https://github.com/victor3spoir/the-labs/issues">
    <img src="https://shieldcn.dev/github/issues/victor3spoir/the-labs.svg?variant=secondary" alt="Open issues" />
  </a>
</p>

<p align="center">
  <img src="https://shieldcn.dev/badge/Docker-2496ED?logo=docker&logoColor=white&variant=branded" alt="Docker" />
  <img src="https://shieldcn.dev/badge/Kubernetes-326CE5?logo=kubernetes&logoColor=white&variant=branded" alt="Kubernetes" />
  <img src="https://shieldcn.dev/badge/Terraform-7B42BC?logo=terraform&logoColor=white&variant=branded" alt="Terraform" />
  <img src="https://shieldcn.dev/badge/Ansible-EE0000?logo=ansible&logoColor=white&variant=branded" alt="Ansible" />
  <img src="https://shieldcn.dev/badge/Prometheus-E6522C?logo=prometheus&logoColor=white&variant=branded" alt="Prometheus" />
  <img src="https://shieldcn.dev/badge/Grafana-F46800?logo=grafana&logoColor=white&variant=branded" alt="Grafana" />
  <img src="https://shieldcn.dev/badge/Traefik-24A1C1?logo=traefikproxy&logoColor=white&variant=branded" alt="Traefik" />
</p>

<p align="center">
  <em>A showcase of practical DevSecOps and security experiments, hands-on labs, and real-world implementations.</em>
</p>

## 📖 About

**The Labs** is a portfolio of completed DevSecOps and security experiments that demonstrate practical implementations of security tools, techniques, and methodologies. This repository serves as a documentation and showcase of hands-on learning experiences and real-world security scenarios.

Each lab represents a complete, working implementation with documentation, results, and lessons learned. This is not a collection of boilerplates or templates, but rather a journal of practical security and DevSecOps experiments.

## ✨ What You'll Find Here

- **🔒 Security Experiments**: Practical implementations of security tools and techniques
- **🚀 Complete Labs**: Fully documented, working implementations from start to finish
- **📚 Real-World Scenarios**: Solutions to actual security and DevOps challenges
- **🔍 Tool Evaluations**: Hands-on testing and comparison of security tools
- **🛡️ Security Implementations**: Complete setups of security controls and monitoring
- **📊 Results & Analysis**: Documentation of findings, metrics, and lessons learned
- **⚙️ Integration Demos**: How different tools and technologies work together
- **🌐 Multi-Cloud Experiments**: Security and DevOps across different cloud platforms

## 📂 Repository Structure

Labs are organized by **domain** using a clear naming convention:

```
the-labs/
├── observability/           # Logs, metrics, traces
├── monitoring/              # Alerting, dashboards, health checks
├── infra/                   # Infrastructure labs
├── networking/              # Routing, DNS, load balancing
└── security/                # Auth, secrets, hardening
```

### Naming Convention

Each lab follows: `<domain>/<descriptive-name>`

The name must be **self-explanatory** — reading it should tell you exactly what the lab does.

Examples:
- `observability/loki-logs-ingestion`
- `monitoring/alertmanager-email`
- `networking/traefik-reverse-proxy`

See [labs-name.md](labs-name.md) for the complete naming guide.

### Lab Structure

Each lab directory contains:
- `README.md` - Lab overview, objectives, and setup instructions
- `compose.yml` or `docker-compose.yml` - Docker Compose configuration
- Configuration files and scripts as needed

## 🚀 Getting Started

### Browsing Labs

1. **Explore the repository**
   ```bash
git clone https://github.com/victor3spoir/the-labs.git
cd the-labs
```

2. **Navigate to a domain**
   ```bash
   cd observability    # or monitoring, infra, etc.
   ls                  # See all labs in that domain
   ```

3. **Run a specific lab**
   ```bash
   cd networking/traefik-reverse-proxy
   docker compose up -d
   ```

4. **Read the documentation**
   Each lab has its own README with objectives, architecture, and setup instructions

## 💡 Lab Domains

### 📊 Observability
- Logs ingestion and aggregation
- Metrics collection and storage
- Distributed tracing
- Visualization and dashboards

### 🔔 Monitoring
- Alerting and notification systems
- Health checks and uptime monitoring
- Performance monitoring
- Dashboard creation

### ⚙️ Infrastructure
- Container orchestration (Kubernetes)
- Reverse proxies and load balancers
- Cron schedulers and automation
- VM provisioning and IaC (Terraform, Ansible)

### 🌐 Networking
- DNS and service discovery
- Load balancing strategies
- Network routing and policies

### 🧪 Experiments
- Tool comparisons and benchmarks
- Proof of concepts
- Performance testing

### 🔐 Security
- Authentication and authorization
- Secrets management
- Security hardening
- Vulnerability scanning

## 🎯 Purpose

This repository serves multiple purposes:

- **Learning Documentation**: Record of hands-on learning experiences
- **Portfolio**: Showcase of practical DevSecOps skills
- **Knowledge Sharing**: Share implementations and lessons learned with the community
- **Reference**: Personal reference for future projects
- **Community**: Contribute to the DevSecOps knowledge base

## 📝 Lab Format

Each lab typically includes:

1. **Objective**: What the lab aims to demonstrate or solve
2. **Technologies Used**: Tools, platforms, and technologies involved
3. **Setup Instructions**: Step-by-step implementation guide
4. **Results**: Outcomes, screenshots, and metrics
5. **Lessons Learned**: Key takeaways and insights
6. **References**: Resources and documentation used

## 🤝 Contributing

While this is primarily a personal lab repository, contributions are welcome in the form of:

- Suggestions for improvements
- Corrections to documentation
- Questions and discussions about implementations

Please open an issue or discussion to engage with the content.

## 🔐 Security

This repository contains lab implementations which may include:
- Security tool configurations
- Intentionally vulnerable setups (for learning)
- Penetration testing scenarios

**⚠️ Warning**: Some labs may contain intentionally insecure configurations for educational purposes. Do not deploy these in production without proper security review and hardening.

## 📜 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 📞 Contact

- **Issues**: Use [GitHub Issues](https://github.com/victor3spoir/the-labs/issues) for questions or discussions
- **Author**: [Victor Espoir](https://github.com/victor3spoir)

## 🎓 Learning Journey

This repository represents a continuous learning journey in DevSecOps and security. Labs are added as new tools are explored, challenges are tackled, and knowledge is gained.

---

**⭐ If you find these labs useful or interesting, please consider giving this repository a star!**

*Practical DevSecOps & Security experiments - Learning by doing*