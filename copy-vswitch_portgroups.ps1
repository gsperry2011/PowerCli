connect-viserver "vcs01.wcbc.local"

$portgroups = get-vmhost -name 'vmh01*' | Get-VirtualSwitch -name 'vSwitch0' | Get-VirtualPortGroup

foreach ($portgroup in $portgroups){
    get-vmhost 'vmh03*' | Get-VirtualSwitch -name 'vSwitch0' | New-VirtualPortGroup -Name $portgroup.Name -VLanId $portgroup.VLanId
}
