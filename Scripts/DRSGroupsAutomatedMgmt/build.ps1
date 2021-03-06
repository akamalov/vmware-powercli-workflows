<#
.NOTES
https://github.com/equelin/vmware-powercli-workflows
#>

[cmdletbinding()]
param(
    [string[]]$Task = 'default'
)

if (!(Get-Module -Name Pester -ListAvailable)) { Install-Module -Name Pester -Scope CurrentUser }
if (!(Get-Module -Name psake -ListAvailable)) { Install-Module -Name psake -Scope CurrentUser }

if (!(Get-Module -Name DRSRule)) { Import-Module $PSScriptRoot\Functions\DRSRule -Force -ErrorAction Stop}

Invoke-psake -buildFile "$PSScriptRoot\psakeBuild.ps1" -taskList $Task -Verbose:$VerbosePreference