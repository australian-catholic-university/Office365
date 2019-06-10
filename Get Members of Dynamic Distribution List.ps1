$UserCredential = Get-Credential
$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $UserCredential -Authentication Basic -AllowRedirection
Import-PSSession $Session -DisableNameChecking

$DynamicDL = "DL-name@acu.edu.au"

$members = Get-DynamicDistributionGroup -Identity $DynamicDL
Get-Recipient -RecipientPreviewFilter $members.RecipientFilter | select Displayname,PrimarySmtpAddress

Remove-PSSession $Session