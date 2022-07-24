# $LOCAL_ROM_PATH = "C:\Users\emman\Downloads\Contra (USA).nes"

# $RETRO_PIE_PATH = "~RetroPie\roms\nes\Contra (USA).nes"
 
# $REMOTE_USER = "pi"
# $REMOTE_IP_ADDR = "192.168.1.183"

# $PASSWORD = "raspberry"

# pscp -pw $PASSWORD $LOCAL_ROM_PATH "$($REMOTE_USER)@$($REMOTE_IP_ADDR):$($RETRO_PIE_PATH)"



$jsonObj = (Get-Content 'example.json' | ConvertFrom-Json)

$hashTbl = @{}
foreach ($property in $jsonObj.PSObject.Properties) {
    $hashTbl[$property.Name] = $property.Value
}

$hashTbl