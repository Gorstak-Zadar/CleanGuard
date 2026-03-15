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

---

## Disclaimer

**NO WARRANTY.** THERE IS NO WARRANTY FOR THE PROGRAM, TO THE EXTENT PERMITTED BY APPLICABLE LAW. EXCEPT WHEN OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR OTHER PARTIES PROVIDE THE PROGRAM "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. THE ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE OF THE PROGRAM IS WITH YOU. SHOULD THE PROGRAM PROVE DEFECTIVE, YOU ASSUME THE COST OF ALL NECESSARY SERVICING, REPAIR OR CORRECTION.

**Limitation of Liability.** IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MODIFIES AND/OR CONVEYS THE PROGRAM AS PERMITTED ABOVE, BE LIABLE TO YOU FOR DAMAGES, INCLUDING ANY GENERAL, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAGES ARISING OUT OF THE USE OR INABILITY TO USE THE PROGRAM (INCLUDING BUT NOT LIMITED TO LOSS OF DATA OR DATA BEING RENDERED INACCURATE OR LOSSES SUSTAINED BY YOU OR THIRD PARTIES OR A FAILURE OF THE PROGRAM TO OPERATE WITH ANY OTHER PROGRAMS), EVEN IF SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES.
