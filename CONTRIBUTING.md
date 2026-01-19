# Contributing to The Labs

First off, thank you for considering contributing to The Labs! It's people like you that make this repository a valuable resource for the DevSecOps community.

## 🌟 How Can I Contribute?

### Reporting Bugs

Before creating bug reports, please check the existing issues to avoid duplicates. When you create a bug report, include as many details as possible:

- **Use a clear and descriptive title**
- **Describe the exact steps to reproduce the problem**
- **Provide specific examples** (configuration files, commands, etc.)
- **Describe the behavior you observed and what you expected**
- **Include screenshots or code snippets** if relevant
- **Specify your environment** (OS, tool versions, cloud provider, etc.)

### Suggesting Enhancements

Enhancement suggestions are tracked as GitHub issues. When creating an enhancement suggestion:

- **Use a clear and descriptive title**
- **Provide a detailed description** of the suggested enhancement
- **Explain why this enhancement would be useful** to most users
- **List any similar features** in other repositories if applicable

### Pull Requests

We actively welcome your pull requests! Here's the process:

1. **Fork the repository** and create your branch from `main`
2. **Make your changes** following our guidelines below
3. **Test your changes** thoroughly
4. **Update documentation** if you're adding or changing functionality
5. **Ensure your code follows** existing style patterns
6. **Write a clear commit message** describing your changes
7. **Submit a pull request** with a comprehensive description

## 📝 Guidelines

### Code Style

- Follow existing formatting and style patterns in the repository
- Use clear, descriptive names for files and directories
- Keep configurations simple and well-commented
- Include inline comments for complex logic or security-specific settings

### Directory Structure

When adding new boilerplates:

```
category/
├── tool-or-service/
│   ├── README.md              # Detailed documentation
│   ├── example-config.yml     # Main configuration file
│   ├── .env.example          # Environment variables template (if needed)
│   └── docs/                 # Additional documentation
│       └── setup-guide.md
```

### Documentation Requirements

Every boilerplate MUST include:

1. **README.md** with:
   - Brief description of what it does
   - Prerequisites
   - Installation/setup instructions
   - Configuration options
   - Usage examples
   - Common troubleshooting tips
   - Security considerations

2. **Comments in configuration files** explaining:
   - Purpose of each major section
   - Security-relevant settings
   - Customization points
   - Environment-specific values

3. **Example files** (when applicable):
   - `.env.example` for environment variables
   - Sample input/output
   - Test data

### Security Standards

All contributions must adhere to security best practices:

- ✅ **DO**: Follow the principle of least privilege
- ✅ **DO**: Use secrets management for sensitive data
- ✅ **DO**: Include security scanning in CI/CD templates
- ✅ **DO**: Document security considerations
- ✅ **DO**: Use secure defaults
- ❌ **DON'T**: Commit secrets, API keys, or passwords
- ❌ **DON'T**: Use deprecated or vulnerable dependencies
- ❌ **DON'T**: Disable security features without clear documentation

### Testing

Before submitting:

- Test configurations in a clean environment
- Verify all commands in documentation work as described
- Check that no hardcoded values or secrets are included
- Ensure files are properly formatted (YAML, JSON, etc.)

## 🔍 Review Process

1. **Initial Review**: A maintainer will review your PR within a few days
2. **Feedback**: You may receive requests for changes or clarifications
3. **Approval**: Once approved, your PR will be merged
4. **Credit**: Contributors are recognized in the project

## 🎯 What We're Looking For

High-priority contributions:

- **New boilerplates** for popular DevSecOps tools
- **Security improvements** to existing configurations
- **Documentation enhancements** and examples
- **Bug fixes** and error corrections
- **Cloud provider templates** (AWS, Azure, GCP, etc.)
- **Compliance frameworks** (SOC2, ISO 27001, GDPR, etc.)

## 📋 Checklist for Contributions

Before submitting your PR, ensure:

- [ ] Code follows existing style and patterns
- [ ] Documentation is complete and clear
- [ ] No secrets or sensitive data are included
- [ ] Configuration has been tested
- [ ] README.md includes all required sections
- [ ] Security best practices are followed
- [ ] Examples are provided where applicable
- [ ] Commit messages are clear and descriptive

## 💬 Communication

- Use GitHub Issues for bug reports and feature requests
- Use GitHub Discussions for questions and general discussion
- Be respectful and constructive in all interactions
- Follow our [Code of Conduct](CODE_OF_CONDUCT.md)

## 🏷️ Labeling

We use labels to categorize issues and PRs:

- `bug`: Something isn't working
- `enhancement`: New feature or request
- `documentation`: Documentation improvements
- `security`: Security-related changes
- `good first issue`: Good for newcomers
- `help wanted`: Extra attention needed

## 📄 License

By contributing, you agree that your contributions will be licensed under the MIT License.

## 🙏 Recognition

All contributors will be recognized in our project. Your contributions help build a valuable resource for the entire DevSecOps community!

---

Thank you for contributing to The Labs! 🚀
