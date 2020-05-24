tell application "Music"
	tell artwork 1 of current track
		set srcBytes to raw data
		if format is JPEG picture then
			set imgFormat to ".jpg"
		else
			set imgFormat to ".png"
		end if
	end tell
	set albumName to album of current track
	set albumArtist to album artist of current track
	if length of albumArtist is 0 then
		set albumArtist to artist of current track
	end if
	set fileName to (do shell script "echo " & quoted form of albumArtist & quoted form of albumName & " | sed \"s/[^a-zA-Z0-9]//g\"") & imgFormat
end tell
set tmpName to ((path to temporary items from user domain) as text) & fileName
set outFile to open for access file tmpName with write permission
set eof outFile to 0
write srcBytes to outFile
close access outFile