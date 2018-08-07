function Parse-SemVer {
    param( 
    [parameter(Mandatory=$true)]
    [string]
    $Version 
    )

    $props = @{
        Version=""
        PreId=""
        SemVer=""
    }
    if($Version -eq $false) { return $props }

    if($Version.StartsWith("v") -eq $true) { $Version = $Version.Substring(1) }

    if($Version.IndexOf("-") -gt -1) {
        $props.PreId = $Version.Substring($Version.IndexOf("-")+1)
        $props.Version = $Version.Substring(0,$Version.IndexOf("-"))
        $props.SemVer = $Version
    } else {
        $props.Version = $Version
        $props.SemVer = $Version
    }

    return $props
}

#export members
Export-ModuleMember -Function Parse-SemVer
