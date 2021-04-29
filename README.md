# powershell-block-exe
Powershell script to create Registry entry blocking a given exe.
Run as admin.

### Registry Setup
#### (https://www.howtogeek.com/howto/8739/restrict-users-to-run-only-specified-programs-in-windows-7/ for reference)
- Navigate to HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies
- Right click Policies > New > Key > Name it "Explorer"
- Right click the new Explorer key > New > DWORD (32-bit) > Name it "DisallowRun"
- Double click DisallowRun > Change value to 1
- On the left, right click the Explorer key > New > Key > Name it "DisallowRun" also
- Inside this key is where the entries will be added by the script.
  - Format is "Keyname(I'm using numbers)"="exe-filename"

### Usage  

    DisallowRun.ps1 <key-name> <filename-of-exe>  
    # Just file name, don't need full path
    # Ex:
    #   DisallowRun.ps1 1 AdobeUpdater.exe
