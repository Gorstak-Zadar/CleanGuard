# 🛡️ CleanGuard

> Real-time **file monitor** for `.exe`, `.dll`, `.sys`, `.winmd` — uses CIRCL (whitelist) and MalwareBazaar (blacklist), **no VirusTotal**.

---

## ✨ Features

| Feature | Description |
|---------|-------------|
| 🔍 **File Monitoring** | Watches for new/changed executables and DLLs |
| 📦 **CIRCL Lookup** | Trust score via [hashlookup.circl.lu](https://hashlookup.circl.lu/) |
| 🚫 **MalwareBazaar** | Blacklist lookup via [abuse.ch](https://bazaar.abuse.ch/) |
| ✅ **Microsoft Signed** | Skips validation for Microsoft-signed files |
| 📥 **Quarantine** | Auto-quarantines detected threats with backup |

---

## 📋 Requirements

| Requirement | Details |
|-------------|---------|
| **OS** | Windows 10/11 |
| **PowerShell** | 5.1+ |
| **Network** | Internet for hash lookups |

---

## 🚀 Usage

```powershell
.\CleanGuard.ps1
```

---

## 📁 Paths

| Path | Purpose |
|------|---------|
| `C:\Quarantine\CleanGuard` | Quarantined files |
| `C:\ProgramData\CleanGuard\Backup` | Backup copies before quarantine |
| `C:\ProgramData\CleanGuard\log.txt` | Log file |

---

## 🔄 Undo Last Quarantine

Run `.\CleanGuard.ps1` with the Undo-LastQuarantine function (or use the provided shortcut if available).

---

<p align="center">
  <sub>🛡️ Gorstak Antivirus Tooling</sub>
</p>
