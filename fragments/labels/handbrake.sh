handbrake)
    name="HandBrake"
    type="dmg"
    downloadURL=$(curl --silent --fail "https://api.github.com/repos/HandBrake/HandBrake/releases/latest" \
        | awk -F '"' "/browser_download_url/ && /dmg/ && ! /sig/ && ! /CLI/ { print \$4 }")
    appNewVersion=$(curl -sf "https://api.github.com/repos/HandBrake/HandBrake/releases/latest" | awk -F '"' "/tag_name/ { print \$4 }")
    expectedTeamID="5X9DE89KYV"
    ;;
