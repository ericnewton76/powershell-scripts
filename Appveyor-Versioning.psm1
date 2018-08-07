function Parse-SemVerTag {
    param( 
    [parameter(Mandatory=$true)]
    [string]
    $Version 
    )

    $props = @{
        OriginalString="$Version"
        PreId=""
        SemVer=""
        Major=0
        Minor=0
        Patch=0
    }

    if($Version -eq $false) { return $props }

    if($Version.StartsWith("v") -eq $true) { $Version = $Version.Substring(1) }

    if($Version.IndexOf("-") -gt -1) {
        $props.PreId = $Version.Substring($Version.IndexOf("-")+1)
        $props.OriginalString = $Version.Substring(0,$Version.IndexOf("-"))
        $props.SemVer = $Version
    } else {
        $props.OriginalString = $Version
        $props.SemVer = $Version
    }

    $semverSplit = $Version.Split('.')

    if($semverSplit.Length -ge 1) {
        $props.Major = $semverSplit[0]
    }
    if($semverSplit.Length -ge 2) {
        $props.Minor = $semverSplit[1]
    }
    if($semverSplit.Length -ge 3) {
        $props.Patch = $semverSplit[2]
    }

    return $props
}

#export members
Export-ModuleMember -Function Parse-SemVerTag
