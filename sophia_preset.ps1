#Requires -RunAsAdministrator
#Requires -Version 5.1

[CmdletBinding()]
param
(
	[Parameter(Mandatory = $false)]
	[string[]]
	$Functions
)

Clear-Host

$Host.UI.RawUI.WindowTitle = "Sophia Script for Windows 10 v5.12.14 | Made with $([char]::ConvertFromUtf32(0x1F497)) of Windows | $([char]0x00A9) farag & Inestic, 2014$([char]0x2013)2022"
Remove-Module -Name Sophia -Force -ErrorAction Ignore
Import-Module -Name $PSScriptRoot\Manifest\Sophia.psd1 -PassThru -Force
Import-LocalizedData -BindingVariable Global:Localization -FileName Sophia -BaseDirectory $PSScriptRoot\Localizations

#region Protection

Checkings -Warning
CreateRestorePoint

#endregion Protection

#region Privacy & Telemetry

DiagTrackService -Disable
DiagnosticDataLevel -Minimal
ErrorReporting -Disable
FeedbackFrequency -Never
ScheduledTasks -Disable
SigninInfo -Disable
LanguageListAccess -Disable
AdvertisingID -Disable
WindowsWelcomeExperience -Hide
WindowsTips -Disable
SettingsSuggestedContent -Hide
AppsSilentInstalling -Disable
WhatsNewInWindows -Disable
TailoredExperiences -Disable
BingSearch -Disable

#endregion Privacy & Telemetry

#region UI & Personalization

ThisPC -Show
CheckBoxes -Disable
HiddenItems -Enable
FileExtensions -Show
MergeConflicts -Show
OpenFileExplorerTo -ThisPC
CortanaButton -Hide
OneDriveFileExplorerAd -Hide
SnapAssist -Disable
FileTransferDialog -Detailed
FileExplorerRibbon -Expanded
RecycleBinDeleteConfirmation -Enable
3DObjects -Hide
QuickAccessRecentFiles -Hide
QuickAccessFrequentFolders -Hide
TaskViewButton -Hide
PeopleTaskbar -Hide
SecondsInSystemClock -Show
TaskbarSearch -Hide
WindowsInkWorkspace -Hide
NotificationAreaIcons -Hide
MeetNow -Hide
NewsInterests -Disable
ControlPanelView -LargeIcons
WindowsColorMode -Dark
AppColorMode -Dark
NewAppInstalledNotification -Hide
FirstLogonAnimation -Disable
JPEGWallpapersQuality -Max
TaskManagerWindow -Expanded
RestartNotification -Show
ShortcutsSuffix -Disable
PrtScnSnippingTool -Disable
AppsLanguageSwitch -Enable
AeroShaking -Enable
UnpinTaskbarShortcuts -Shortcuts Edge, Store, Mail

#endregion UI & Personalization

#region OneDrive

OneDrive -Uninstall

#endregion OneDrive

#region System

StorageSense -Enable
StorageSenseFrequency -Month
StorageSenseTempFiles -Enable
Hibernation -Disable
TempFolder -Default
Win32LongPathLimit -Disable
BSoDStopError -Enable
AdminApprovalMode -Never
MappedDrivesAppElevatedAccess -Enable
DeliveryOptimization -Disable
WaitNetworkStartup -Disable
WindowsManageDefaultPrinter -Disable
WindowsFeatures -Disable
WindowsCapabilities -Uninstall
UpdateMicrosoftProducts -Enable
PowerPlan -High
LatestInstalled.NET -Enable
NetworkAdaptersSavePower -Disable
IPv6Component -Disable
InputMethod -Default
SetUserShellFolderLocation -Default
WinPrtScrFolder -Default
RecommendedTroubleshooting -Automatically
FoldersLaunchSeparateProcess -Enable
ReservedStorage -Disable
F1HelpPage -Disable
NumLock -Enable
CapsLock -Enable
StickyShift -Disable
Autoplay -Disable
ThumbnailCacheRemoval -Enable
SaveRestartableApps -Enable
NetworkDiscovery -Disable
ActiveHours -Automatically
RestartDeviceAfterUpdate -Disable
UninstallPCHealthCheck
InstallVCRedistx64

#endregion System

#region WSL


#endregion WSL

#region Start menu

RecentlyAddedApps -Hide
AppSuggestions -Hide
RunPowerShellShortcut -Elevated
PinToStart -Tiles ControlPanel, PowerShell

#endregion Start menu

#region UWP apps

HEIF -Install
CortanaAutostart -Disable
BackgroundUWPApps -Disable
UninstallUWPApps
CheckUWPAppsUpdates

#endregion UWP apps

#region Gaming

XboxGameBar -Disable
XboxGameTips -Disable
GPUScheduling -Enable
SetAppGraphicsPerformance

#endregion Gaming

#region Scheduled tasks

CleanupTask -Register
SoftwareDistributionTask -Register
TempTask -Register

#endregion Scheduled tasks

#region Microsoft Defender & Security

NetworkProtection -Enable
PUAppsDetection -Enable
DefenderSandbox -Enable
AuditProcess -Enable
CommandLineProcessAudit -Enable
EventViewerCustomView -Enable
PowerShellModulesLogging -Enable
PowerShellScriptsLogging -Enable
AppsSmartScreen -Disable
SaveZoneInformation -Disable
WindowsScriptHost -Enable
WindowsSandbox -Disable
DismissMSAccount
DismissSmartScreenFilter

#endregion Microsoft Defender & Security

#region Context menu

MSIExtractContext -Show
CABInstallContext -Show
RunAsDifferentUserContext -Show
CastToDeviceContext -Hide
ShareContext -Hide
EditWithPaint3DContext -Hide
EditWithPhotosContext -Hide
CreateANewVideoContext -Hide
ImagesEditContext -Hide
PrintCMDContext -Hide
IncludeInLibraryContext -Hide
SendToContext -Hide
BitLockerContext -Hide
BitmapImageNewContext -Hide
RichTextDocumentNewContext -Hide
CompressedFolderNewContext -Hide
MultipleInvokeContext -Enable
UseStoreOpenWith -Hide

#endregion Context menu

RefreshEnvironment
Errors