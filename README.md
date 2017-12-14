# SignalTextBackupViewer
A comfortable view of your SignalPlaintextBackup.xml

This is a super early version.

![A screenshot of the current version](screenshot.png "This is what it looks like on my PC.")


# Features
* Sorts messages by contact
* Displays name next to number (if available)
* Marks received and sent messages

# Usage
* Make a backup of your Signal messages in the app
* Move the file SignalPlaintextBackup.xml from your phone (/sdcard/SignalPlaintextBackup.xml) and the SignalBackupTreeView.xsl from this repository to one folder
* Open the .xml with a text editor and paste the line `<?xml-stylesheet type="text/xsl" href="SignalBackupTreeView.xsl"?>` as a second line into it
* Open the .xml file with a web browser

# Known Issues
* It may be that message content makes the .xml invalid. Test this with a xml validator.
* It's super ugly.
* There is no collapse/expand mechanism for the grouped message threads. I am on it and that is the reason why you see the telephone number two times.
