if (-not (Get-Module ActiveDirectory)){
  Import-Module ActiveDirectory
}
$UserName = Read-Host -Prompt 'Enter your username'
$domain = "DC=ad,DC=$($UserName),DC=devopslab,DC=xyz"
$UPDomain = "ad.$($UserName).devopslab.xyz"
$NetBIOSDomainName = "jl222gk"
$EmailDomain = "$($UserName).devopslab.xyz"
$companyName = "Acme Inc."
$employees = Import-Csv "$($pwd)\acme-employees.csv" -Delimiter ","

##----------------------------------------------------------------------------#
## Funktioner
##----------------------------------------------------------------------------#
#-----------------------------------------------------------------------------
#-
#- ConvertTo-NonDiacriticString
#-
#- AV       : Mats Loock , Högskolan i Kalmar
#- DATUM    : 2009-09-20
#-
#- KOMMENTAR : Funktionen tar bort diakritiska tecken som lagts till
#-             bokstäver (över, under eller ovanpå) i en sträng.
#-
#-----------------------------------------------------------------------------
function ConvertTo-NonDiacriticString
{
	param($inputObject)

	begin
	{
		if ($inputObject)
		{
			Write-Output $inputObject | &($MyInvocation.InvocationName)
			break
		}

		[string[]] $result = @()
	}

	process
	{
		if ($_ -is [string])
		{
			$normalized = $_.Normalize([System.Text.NormalizationForm]::FormKD)
			$ascii = [System.Text.Encoding]::GetEncoding("us-ascii",
				(New-Object System.Text.EncoderReplacementFallback([String]::Empty)),
				(New-Object System.Text.DecoderReplacementFallback([String]::Empty)))
			$encodedBytes = New-Object byte[] $ascii.GetByteCount($normalized)
			$ascii.GetBytes($normalized, 0, $normalized.Length, $encodedBytes, 0) | Out-Null
			$result += $ascii.GetString($encodedBytes);
		}
	}

	end
	{
		if (-not $inputObject)
		{
			Write-Output $result
		}
	}
}
#-----------------------------------------------------------------------------
#-
#- ConvertTo-SimpleString
#-
#- AV       : Jacob Lindehoff, Linnéuniversitetet
#- DATUM    : 2012-02-01
#-
#- KOMMENTAR : Funktionen som anpasar en sträng till DN sträng.
#-
#-----------------------------------------------------------------------------
function ConvertTo-SimpleString
{
	param($inputObject)

	begin
	{
		if ($inputObject)
		{
			Write-Output $inputObject | &($MyInvocation.InvocationName)
			break
		}

		[string[]] $result = @()
	}

	process
	{
		if ($_ -is [string])
		{
			$result = $_.Trim() | ConvertTo-NonDiacriticString
	        $result = $result -replace "\s+", "_"
		}
	}

	end
	{
		if (-not $inputObject)
		{
			Write-Output $result
		}
	}
}

#-----------------------------------------------------------------------------
#-
#- Decorate-ItemWithSamAccountName
#-
#- AV       : Mats Loock , Högskolan i Kalmar
#- DATUM    : 2009-09-18
#-
#- KOMMENTAR : ...
#-
#-----------------------------------------------------------------------------
function Decorate-ItemWithSamAccountName
{
	param($inputObject)

	begin
	{
		if ($inputObject)
		{
			Write-Output $inputObject | &($MyInvocation.InvocationName)
			break
		}

		[string[]] $result = @()
	}

	process
	{
		if ($_)
		{
			$result += $_ | Add-Member `
				-Name SamAccountName `
				-Value (New-SamAccountName $_.FirstName $_.LastName) `
				-MemberType NoteProperty `
				-PassThru `
				-Force
		}
	}

	end
	{
		if ($inputObject)
		{
			Write-Output $result
		}
	}
}

#-----------------------------------------------------------------------------
#-
#- Decorate-UserWithPassword
#-
#- AV       : Mats Loock , Högskolan i Kalmar
#- DATUM    : 2009-09-18
#-
#- KOMMENTAR : ...
#-
#-----------------------------------------------------------------------------
function Decorate-ItemWithPassword
{
	param($inputObject)

	begin
	{
		if ($inputObject)
		{
			Write-Output $inputObject | &($MyInvocation.InvocationName)
			break
		}

		[string[]] $result = @()
	}

	process
	{
		if ($_)
		{
			$_ | Add-Member `
					-Name Password `
					-Value (New-Password) `
					-MemberType NoteProperty
		}
	}

	end
	{
		if ($inputObject)
		{
			Write-Output $result
		}
	}
}


#-----------------------------------------------------------------------------
#-
#- Decorate-UserWithCountryCode
#-
#- AV       : Jacob Lindehoff , Linnéuniversitetet
#- DATUM    : 2012-01-31
#-
#- KOMMENTAR : ...
#-
#-----------------------------------------------------------------------------
function Decorate-ItemWithCountryCode
{
	param($inputObject)

	begin
	{
		if ($inputObject)
		{
			Write-Output $inputObject | &($MyInvocation.InvocationName)
			break
		}

		[string[]] $result = @()
        $CountryCodes = "US"
	}

	process
	{
		if ($_)
		{
            $country = $_.CountryRegionName
			$_ | Add-Member `
					-Name CountryCode `
					-Value $CountryCodes `
					-MemberType NoteProperty
		}
	}

	end
	{
		if ($inputObject)
		{
			Write-Output $result
		}
	}
}


#-----------------------------------------------------------------------------
#-
#- New-Password
#-
#- AV       : Mats Loock , Högskolan i Kalmar
#- DATUM    : 2009-09-17
#-
#- KOMMENTAR : Funktionen genererar ett starkt lösenord (ett lösenord
#-             med minst sju tecken från minst tre av fyra teckengrupper).
#-
#-----------------------------------------------------------------------------
#-
#- By default Windows Server 2003 requires passwords to meet
#- the following criteria for strong passwords:
#-
#- - Has at least 7 characters
#- - Does not contain "Administrator" or "Admin"
#- - Contains characters from three of the following categories:
#- - Uppercase letters (A, B, C, and so on)
#- - Lowercase letters (a, b, c, and so on)
#- - Numbers (0, 1, 2, and so on)
#- - Non-alphanumeric characters (#, &, ~, and so on)
#-
#-----------------------------------------------------------------------------#

[System.Random] $random = New-Object System.Random

function New-Password
{
 	param
	(
		[int] $Length = 0,
		[int] $MinLength = 7,
		[int] $MaxLength = 10,
		[int] $NumberOfNonAplhanumericCharacters = 0
	)

	# Verifierar parameterar.
	if ($Length -eq 0)
	{
		# Kontrollerar att $MinLength och $MaxLength har
		# korrekta värden, ...och
		if ($MinLength -lt 7)
		{
			throw "$MinLength måste vara större eller lika med 7."
		}

		if ($MinLength -gt $MaxLength)
		{
			throw "$MinLength måste vara mindre eller lika med $MaxLength."
		}

		# ...slumpar antalet tecken i lösenordet till ett värde mellan
		# $MinLength och $MaxLength (inklusive).
		$Length = $random.Next($MinLength, $MaxLength + 1)
	}

	if ($Length -lt 7)
	{
		throw "$Length måste vara större eller lika med 7."
	}

	# Initierar array med teckengrupper.
	$characterGroups =
		"ABCDEFGHJKLMNPQRSTUVWXYZ",   # uteslutit I och O
		"abcdefghjkmnopqrstuvwxyz",   # uteslutit l
		"23456789",                   # uteslutit 0 och 1
		"!#$%&()*+-./"                # uteslutit , " och '

	# Skapar variabel för lösenord och...
	[System.Text.StringBuilder] $password =
		New-Object System.Text.StringBuilder($Length)

	# ...variabel för vilka teckengrupper som ska användas.
	$characterGroupIndexes = 1, 2, 3

	# Lägger till hur många gånger teckengrupp 4 ska användas,...
	$characterGroupIndexes += @(3) * $numberOfNonAplhanumericCharacters;

	# ...slumpar resterande teckengrupper mellan 1 och 3, och...
	for ($i = $characterGroupIndexes.Length; $i -lt $Length; $i++)
	{
		$characterGroupIndexes += $random.Next(3)
	}

	# ...blandar teckengrupperna,...
	for ($i = $characterGroupIndexes.Length - 1; $i -gt 0; $i--)
	{
		$index = $random.Next($i + 1)
		$temp = $characterGroupIndexes[$index]
		$characterGroupIndexes[$index] = $characterGroupIndexes[$i]
		$characterGroupIndexes[$i] = $temp
	}

	# ...slumpar tecken från grupperna, och...
	foreach ($index in $characterGroupIndexes)
	{
		$s = $characterGroups[$index][$random.Next($charactergroups[$index].Length)]
		$password.Append($s) | Out-Null
	}

	# ...returnerar det slumpade lösenordet.
	Write-Output $password.ToString()
}

#-----------------------------------------------------------------------------
#-
#- New-UserName
#-
#- AV       : Mats Loock , Högskolan i Kalmar
#- DATUM    : 2009-09-18
#-
#- KOMMENTAR : ...
#-
#-----------------------------------------------------------------------------
function New-SamAccountName
{
	param
	(
		[string] $firstName,
		[string] $lastName
	)

	$userName = ($firstName.Trim() + $lastName.Trim()[0]).ToLower() | ConvertTo-NonDiacriticString
	$userName = $userName -replace "\s+", "_"

	$cretieria = "$userName*"
	$match = Get-ADUser -Filter { sAMAccountName -like $cretieria } |
		Sort-Object -Property "sAMAccountName" -Descending |
		Select-Object -First 1

	if ($match)
	{
		$index = ($match.sAMAccountName -replace "[^\d+$]", "") -as [int]
		if ($index -gt 0)
		{
			$index++
		}
		else
		{
			$index = 2
		}

		if ($index -lt 10)
		{
			$userName += 0
		}
		$userName += $index
	}
	Write-Output $userName
}



function SetAcl ([string]$Path, [string]$Access, [string]$Permission) {
	$GetACL = Get-Acl $Path
	$Allinherit = [system.security.accesscontrol.InheritanceFlags]"ContainerInherit, ObjectInherit"
	$Allpropagation = [system.security.accesscontrol.PropagationFlags]"None"
	$AccessRule = New-Object system.security.AccessControl.FileSystemAccessRule($Access, $Permission, $AllInherit, $Allpropagation, "Allow")

	if ($GetACL.Access | Where { $_.IdentityReference -eq $Access}) {
		$AccessModification = New-Object system.security.AccessControl.AccessControlModification
		$AccessModification.value__ = 2
		$Modification = $False
		$GetACL.ModifyAccessRule($AccessModification, $AccessRule, [ref]$Modification) | Out-Null
	} else {
		$GetACL.AddAccessRule($AccessRule)
	}
	Set-Acl -aclobject $GetACL -Path $Path
}

function CreateFolder ([string]$Path) {
	if (Test-Path $Path) {
		Write-Host "Folder: $Path Already Exists" -ForeGroundColor Yellow
	} else {
		New-Item -Path $Path -type directory | Out-Null
	}
}


#Creating Department Shares
New-ADOrganizationalUnit -Name "Groups" -Path $domain -ProtectedFromAccidentalDeletion $False
New-ADOrganizationalUnit -Name "Domain Local Groups" -Path "OU=Groups,$domain" -ProtectedFromAccidentalDeletion $False

$current = 1

#Create Global Groups
New-ADOrganizationalUnit -Name "Global Groups" -Path "OU=Groups,$domain" -ProtectedFromAccidentalDeletion $False
$Departments = $employees | Select-Object -Property Department -Unique
$current = 1
foreach($department in $Departments){
    Write-Progress -activity "Creating Department Groups" -status $department.Department -PercentComplete (($current/($Departments.Count))*100)
    New-ADGroup -Name "G_All_$($department.Department | ConvertTo-SimpleString)" -Path "OU=Global Groups,OU=Groups,$domain" -GroupCategory Security -GroupScope Global
    $current++
}
$JobTitles = $employees | Select-Object -Property JobTitle -Unique
$current = 1
foreach($jobtitle in $JobTitles){
    Write-Progress -activity "Creating Job Title Groups" -status $jobtitle.JobTitle -PercentComplete (($current/($JobTitles.Count))*100)
    New-ADGroup -Name "G_JT_$($jobtitle.JobTitle | ConvertTo-SimpleString)" -Path "OU=Global Groups,OU=Groups,$domain" -GroupCategory Security -GroupScope Global
    $current++
}

#Create OU Structure
$MainCities = $employees | Group-Object -Property City
New-ADOrganizationalUnit -Name "Employees" -Path $domain -ProtectedFromAccidentalDeletion $False
$current = 1
foreach($City in $MainCities){
    New-ADOrganizationalUnit -Name $City.Name -Path "OU=Employees,$domain" -ProtectedFromAccidentalDeletion $False
    New-ADOrganizationalUnit -Name "Servers" -Path "OU=$($City.Name),OU=Employees,$domain" -ProtectedFromAccidentalDeletion $False
    New-ADOrganizationalUnit -Name "Departments" -Path "OU=$($City.Name),OU=Employees,$domain" -ProtectedFromAccidentalDeletion $False
    $dep = $City.Group | Select-Object -Property Department -Unique
    foreach($department in $dep){
        Write-Progress -activity "Creating OU Structure" -status $department.Department -PercentComplete (($current/($dep.Count))*100)
        New-ADOrganizationalUnit -Name $department.Department -Path "OU=Departments,OU=$($City.Name),OU=Employees,$domain" -ProtectedFromAccidentalDeletion $False
        New-ADOrganizationalUnit -Name "Users" -Path "OU=$($department.Department),OU=Departments,OU=$($City.Name),OU=Employees,$domain" -ProtectedFromAccidentalDeletion $False
        New-ADOrganizationalUnit -Name "Clients" -Path "OU=$($department.Department),OU=Departments,OU=$($City.Name),OU=Employees,$domain" -ProtectedFromAccidentalDeletion $False
        $current++
    }
}
#Create Users
$employees | Decorate-ItemWithPassword
$employees | Decorate-ItemWithCountryCode
$currentUserNr = 1
foreach($employee in $employees){
    $path = "OU=Users,OU=$($employee.Department),OU=Departments,OU=$($employee.City),OU=Employees,$domain"
    $employee | Decorate-ItemWithSamAccountName

    Write-Progress -activity "Adding Users" -status "Current user: $($employee.FirstName) $($employee.LastName) ($($employee.SamAccountName))" -PercentComplete (($currentUserNr / $($employees.Count))  * 100)

    #Create User
	New-ADUser `
		-Name "$($employee.FirstName) $($employee.LastName) ($($employee.SamAccountName))" `
		-SamAccountName $employee.SamAccountName `
		-Path $path `
		-AccountPassword (ConvertTo-SecureString $employee.Password -AsPlainText -force) `
		-DisplayName "$($employee.FirstName) $($employee.LastName)" `
		-GivenName $employee.FirstName `
		-Surname $employee.LastName `
		-UserPrincipalName "$($employee.SamAccountName)@$UPDomain" `
        -City $employee.City `
        -Country "$($employee.CountryCode)" `
        -PostalCode "$($employee.PostalCode)" `
        -StreetAddress "$($employee.AddressLine1)" `
        -State "$($employee.StateProvinceName)" `
        -OfficePhone "$($employee.Phone)" `
        -Company $companyName `
        -Department $employee.Department `
        -Title "$($employee.JobTitle)" `
        -EmailAddress "$($employee.SamAccountName)@$EmailDomain" `
        -Enabled $True  `
    #Group memberships
    Add-ADGroupMember -Identity "G_All_$($employee.Department | ConvertTo-SimpleString)" -Member $employee.SamAccountName
    Add-ADGroupMember -Identity "G_JT_$($employee.JobTitle | ConvertTo-SimpleString)" -Member $employee.SamAccountName
    $currentUserNr++
}

$employees | Select-Object -Property LastName,FirstName,SamAccountName,Password | Sort-Object -Property LastName | Export-Csv -Path "$($ScriptPath)Acme_Employees-Data.csv"
