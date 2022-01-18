# Powershell-Ignore-Windows-Dev-License

## Used to:
1) Allow all trusted apps (appx, uwp, etc.)
2) Allow development without a license to be able to commit those apps
3) Sets developer settings to a developer status for the user account which ignores the need for sideloading
4) If you need to compile an appx or uwp using an external application outside of Visual Studio (EX: Bash script calling VS directory), these permission may be needed
5) Allows install of the appx/uwp via CLI or external language to get around Group Policy which may limit a double-click install of an appx/uwp

Also has a Windows balloon notification that says that it ran with a customizable title and text.
