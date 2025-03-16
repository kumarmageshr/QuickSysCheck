# QuickSysCheck
QuickSysCheck is a fast and simple command-line utility designed for Windows users to quickly inspect system health and resource utilization.  This lightweight tool provides essential system diagnostics such as memory information, RAM type, detailed hardware stats, and identifies memory-hungry applications — all from a user-friendly CMD menu.  
# Key Features:
View total installed RAM and system memory type.
1. Get full RAM module details (capacity, manufacturer, speed, serial number).
2. Identify top processes using the most RAM.
3. Easy-to-navigate text-based menu interface.
4. Portable and runs entirely via Windows CMD/PowerShell.

# Windows System Info CMD Tool

A simple interactive Windows batch script to display system information and monitor RAM usage.

## 📋 Menu Options

### 1️⃣ Show Current Directory
- Displays the current working directory.

### 2️⃣ Show RAM Details (Total Installed RAM)
- Shows the total installed physical memory on the system using:

### 3️⃣ Show RAM Type
- Displays the memory type code from SMBIOS:

- **SMBIOSMemoryType Codes:**
- `17` = DDR
- `19` = DDR2
- `24` = DDR3
- `26` = DDR4
- `34` = DDR5

### 4️⃣ Show Full RAM Information
- Displays complete RAM module details:

### 5️⃣ Check High RAM Utilizing Applications
- Displays the top 10 processes consuming the most RAM using PowerShell:
```powershell
Get-Process | Sort-Object -Property WorkingSet -Descending | 
Select-Object -First 10 Name, @{Name='Memory(MB)';Expression={[math]::Round($_.WorkingSet/1MB,2)}}
```
### 5️⃣  To exit 
