$vidurl = Read-Host -Prompt "Enter URL"
#$formatchoice = Read-Host -Prompt "Audio [M] or Video [V]"
$singleplaylistchoice = Read-Host -Prompt "Playlist[P] or Single[S]"
$userhomedir = "$env:USERPROFILE"
$downloadlocation = "$userhomedir\Downloads\YTDownloads"
If(-not(test-path -PathType container $downloadlocation)){
    Write-Output "Directory not present so created directory $downloadlocation"
    New-Item -ItemType Directory -Path $downloadlocation
}
cd $downloadlocation;
if ($singleplaylistchoice -eq "P") {
    yt-dlp -i --no-abort-on-error --yes-playlist -k $vidurl --no-keep-video -x --audio-format mp3 # for downloaing the playlist with audio only
}
elseif ($singleplaylistchoice -eq "S") {
    yt-dlp -i --no-abort-on-error --no-playlist -k $vidurl --no-keep-video -x --audio-format mp3 # for downloading the individual audio only.
}
else {
    Write-Output "Invalid choice for Playlist or Single. Please restart the script and choose Playlist [P] or Single [S]."
}



#yt-dlp -i --no-abort-on-error -S ext --no-playlist -k $vidurl --recode mp4 # for downloading the individual video only.
#yt-dlp -i --no-abort-on-error --yes-playlist -k $vidurl # for downloading the individual video only.

#yt-dlp -i --no-abort-on-error -S ext -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]' --no-playlist -k $vidurl --no-part

#yt-dlp --help |Out-GridView