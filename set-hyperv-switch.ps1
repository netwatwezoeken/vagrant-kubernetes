Write-Host "Switch to static ip NAT switch"

# See: https://www.thomasmaurer.ch/2016/01/change-hyper-v-vm-switch-of-virtual-machines-using-powershell/

Get-VM $Args[0] | Get-VMNetworkAdapter | Connect-VMNetworkAdapter -SwitchName "NAT Switch 192.168.40.x"