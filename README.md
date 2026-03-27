<!-- description: FileSystemWatcher on C:\ for exe/dll/sys/winmd: CIRCL + MalwareBazaar + MS sig; quarantines unknown unsigned outside Program Files—high false-positive risk. -->

# CleanGuard

Single script **`CleanGuard.ps1`**: a **`FileSystemWatcher`** on **`C:\`** (recursive) for **`.exe`**, **`.dll`**, **`.sys`**, **`.winmd`**. On each create/change it hashes the file and:

1. **Skips** if [CIRCL hashlookup](https://hashlookup.circl.lu/) reports high trust **or** the file is **Authenticode-valid** and signed by **Microsoft** (subject / thumbprint heuristics).
2. **Quarantines** if the SHA-256 is known in **[MalwareBazaar](https://bazaar.abuse.ch/)** via their API.
3. **Quarantines** anything **not** caught above that lives **outside** `C:\Windows`, `C:\Program Files`, `C:\Program Files (x86)`, and `C:\WindowsApps` — treated as “unsigned suspicious” (the script does **not** require MalwareBazaar hit for this path).
4. **Logs only** if unsigned but under those system/install folders.

Quarantine **moves** the file to **`C:\Quarantine\CleanGuard`** with a timestamp, copies a **`.bak`** to **`C:\ProgramData\CleanGuard\Backup`**, logs to **`C:\ProgramData\CleanGuard\log.txt`**, and can show a **MessageBox** on quarantine. An **`Undo-LastQuarantine`** function exists (reads **`C:\Quarantine\CleanGuard\.last`**) but is **not** bound to a parameter—you must **dot-source** and call it manually from the same session if you use it.

The script hides the console and loops forever (intended for **Task Scheduler** or long-running host).

---

## Requirements

- Windows with PowerShell, outbound HTTPS for CIRCL and MalwareBazaar.
- Expect **heavy disk churn** and **API rate** considerations if many files change under `C:\`.

---

## Risks (read before running)

- Monitoring **the entire `C:\` tree** is aggressive; builds, installers, and user tools outside “Program Files” may be **quarantined** even when benign.
- This is **not** a full AV product: missed malware and false positives are both possible.

---

## Usage

```powershell
.\CleanGuard.ps1
```

---

## Disclaimer

**NO WARRANTY.** THERE IS NO WARRANTY FOR THE PROGRAM, TO THE EXTENT PERMITTED BY APPLICABLE LAW. EXCEPT WHEN OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR OTHER PARTIES PROVIDE THE PROGRAM "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. THE ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE OF THE PROGRAM IS WITH YOU. SHOULD THE PROGRAM PROVE DEFECTIVE, YOU ASSUME THE COST OF ALL NECESSARY SERVICING, REPAIR OR CORRECTION.

**Limitation of Liability.** IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MODIFIES AND/OR CONVEYS THE PROGRAM AS PERMITTED ABOVE, BE LIABLE TO YOU FOR DAMAGES, INCLUDING ANY GENERAL, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAGES ARISING OUT OF THE USE OR INABILITY TO USE THE PROGRAM (INCLUDING BUT NOT LIMITED TO LOSS OF DATA OR DATA BEING RENDERED INACCURATE OR LOSSES SUSTAINED BY YOU OR THIRD PARTIES OR A FAILURE OF THE PROGRAM TO OPERATE WITH ANY OTHER PROGRAMS), EVEN IF SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES.

---

## Explained like you're five (the honest kind)

Your PC is a **busy kitchen**. This repo is at best a **sticky note on the fridge**: it might remind you where the knives are, but it does not make you a Michelin chef, and it definitely does not stop someone from sneaking in through the window. We use simple words on purpose so nobody confuses scripts with superpowers.

---

## Disclaimer (read this; it matters)

This software and documentation are provided **“as is”**, without warranty of any kind, express or implied, including but not limited to the warranties of merchantability, fitness for a particular purpose, and noninfringement. **Use at your own risk.**

- Nothing here is professional security, legal, medical, or financial advice.
- The authors and contributors are **not liable** for any direct, indirect, incidental, special, exemplary, or consequential damages (including loss of data, profits, goodwill, or business interruption) arising from use or inability to use this material, **even if advised of the possibility** of such damages.
- You are solely responsible for compliance with laws and policies that apply to you. Do not use these tools to violate privacy, computer misuse laws, or terms of service.
- “Detection,” “monitoring,” and “hardening” features can be wrong (false positives), miss real threats (false negatives), and change system behavior. **Test in a safe environment** before relying on anything important.

If you do not agree, **do not use** this repository.
