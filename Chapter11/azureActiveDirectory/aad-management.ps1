
# The Azure AD module is not a subpackage of the Az module, so we need
# to install it separately.
Install-Module -Name AzureAD

$PasswordProfile = New-Object -TypeName Microsoft.Open.AzureAD.Model.PasswordProfile
$PasswordProfile.Password = "Zaro3260"

$premiumGroupName = "PremiumUsers"
$trailGroupName = "TrailUsers"

$users = @{"charlotte" = "charlotte@myerscough.dev"; "dave" = "dave@myerscough.dev"}

# First we need to connect to AzureAD. This step is required even if you are using the
# Azure CloudShell.
Connect-AzureAD

# Create a new group for users that will not have their Azure Data Explorer requests capped.
New-AzureADGroup -DisplayName $premiumGroupName -SecurityEnabled $true -MailEnabled $false -MailNickName "NotSet" -Description "Premium users will not have their Azure Data Explorer request limit capped"

# Create a new group for users that will have their Azure Data Explorer request capped.
New-AzureADGroup -DisplayName $trailGroupName -SecurityEnabled $true -MailEnabled $false -MailNickName "NotSet" -Description "Trail users will have their Azure Data Explorer request limit capped"

# Create new AzureAD user
New-AzureADUser -DisplayName "Charlotte Myerscough" -PasswordProfile $PasswordProfile -UserPrincipalName "charlotte@myerscough.dev" -AccountEnabled $true -MailNickName "Charlotte"
New-AzureADUser -DisplayName "Dave Myerscough" -PasswordProfile $PasswordProfile -UserPrincipalName "dave@myerscough.dev" -AccountEnabled $true -MailNickName "Dave"

# Add Charlotte to PremiumUsers
$groupId = (Get-AzureADGroup -SearchString $premiumGroupName).ObjectId
$userId = (Get-AzureADUser -ObjectId "charlotte@myerscough.dev").ObjectId
Add-AzureADGroupMember -ObjectId $groupId -RefObjectId $userId

# Add Dave to TrailUsers
$groupId = (Get-AzureADGroup -SearchString $trailGroupName).ObjectId
$userId = (Get-AzureADUser -ObjectId "dave@myerscough.dev").ObjectId
Add-AzureADGroupMember -ObjectId $groupId -RefObjectId $userId