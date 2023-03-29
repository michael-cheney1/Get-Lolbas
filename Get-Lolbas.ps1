Install-Module powershell-yaml
Import-Module powershell-yaml

git clone https://github.com/LOLBAS-Project/LOLBAS.git
$array = @()
$files = Get-ChildItem -Filter *.yml
foreach ($file in $files) {
    $myObject = [PSCustomObject]@{}
    $yaml = Get-Content $file -Raw
    $obj = ConvertFrom-Yaml $yaml
    $myObject | Add-Member -MemberType NoteProperty -Name 'Name' -Value $obj.Name
    $myObject | Add-Member -MemberType NoteProperty -Name 'Description' -Value $obj.Description
    $myObject | Add-Member -MemberType NoteProperty -Name 'Created' -Value $obj.Created
    $myObject | Add-Member -MemberType NoteProperty -Name 'Author' -Value $obj.Author
    $myObject | Add-Member -MemberType NoteProperty -Name 'Commands' -Value $obj.Commands
    $myObject | Add-Member -MemberType NoteProperty -Name 'Code_Sample' -Value $obj.Code_Sample
    $myObject | Add-Member -MemberType NoteProperty -Name 'Resources' -Value $obj.Resources
    $myObject | Add-Member -MemberType NoteProperty -Name 'Full_Path' -Value $obj.Full_Path
    $myObject | Add-Member -MemberType NoteProperty -Name 'Detection' -Value $obj.Detection
    $myObject | Add-Member -MemberType NoteProperty -Name 'Acknowledgement' -Value $obj.Acknowledgement
    $array += $myObject
}

# Check if at least one of the paths exists
