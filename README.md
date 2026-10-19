<div align="center">

# 🔐 Arch Security Scripts

**Daily-driver security automation for Arch Linux**

</div>

---

## Philosophy

These scripts are not toys. They are the same ones I use on my own machines to maintain a hardened baseline without constant manual intervention.

## Included Tools

| Script | Purpose | Privilege |
|--------|---------|-----------|
| `firewall-setup.sh` | Strict nftables configuration (default drop) | root |
| `privacy-toggle.sh` | MAC randomization + privacy DNS | root |
| `update-checker.sh` | Security update notifier | user |
| `hardening-check.sh` | Verify current hardening status | user/root |
| `clamav-scan.sh` | Automated on-demand scanning | root |

## Installation

```bash
git clone https://github.com/blackhat264/arch-security-scripts.git
cd arch-security-scripts
chmod +x *.sh
```

## Recommended Workflow

1. Run `firewall-setup.sh`
2. Enable AppArmor + Fail2Ban
3. Schedule `hardening-check.sh` via systemd timer or cron
4. Periodically run `clamav-scan.sh`

## Notes

- Always review scripts before execution
- Some settings may break proprietary software
- Designed for Arch Linux (may work on derivatives with small changes)

## License

MIT
