googleandroidstudio)
    name="Android Studio"
    unset downloadURL appNewVersion
    if isSilicon
    then
        type="zip"
        downloadURL=$(curl -s https://developer.android.com/studio|grep mac_arm.zip|egrep -o 'https.*zip'|head -1)
        appNewVersion=$(print $downloadURL |grep mac_arm.zip|egrep -o 'https.*zip'|egrep -o 'studio.*'|cut -f3 -d/|head -1)
    fi
    if [[ -z $appNewVersion ]]
    then
        type="dmg"
        downloadURL=$(curl -s https://developer.android.com/studio|grep mac.dmg|egrep -o 'https.*dmg'|head -1)
        appNewVersion=$(print $downloadURL |grep mac.dmg|egrep -o 'https.*dmg'|head -1|egrep -o 'install.*'|cut -f2 -d/)
    fi
    expectedTeamID="EQHXZ8M8AV"

    #short version is whats needed
    [[ $appNewVersion == *.*.* ]] && appNewVersion=${appNewVersion%.*}
    ;;
