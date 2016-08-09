# ADB-Date-Changer
ADB Date changer is a small utility app for Android developers that allows to change quickly change date & time on the device. 

So forget about writing `adb shell 'su 0 date -s 20160530.213000'` to set a concrete date on the device. You can just drag the arrows of the clock to the required date with this small app for **OS X**. 

## How to install
Well very easy. You just need **go** to the [latest releases](https://github.com/vitovalov/ADB-Date-Changer/releases/latest) and download the latest [ADB.Date.Changer.app.zip](https://github.com/vitovalov/ADB-Date-Changer/releases/download/v1.0/ADB.Date.Changer.app.zip). Then **uncompress** and **drag-and-drop** to your OSX Applications folder where all the other apps live. Or just run it from wherever you want. 

*Note*:<br>
You may need to allow it in OSX System Settings/Security&Privacy/General as you typically do for all apps that aren't from App Store.
##Requirements

- Root access. I recommend use Genymotion which by default gives you a rooted emulator. 

- Works for API 1..22. By some reason adb is not allowed to change date on API 23. 

- Automatic time disabled in [SETTINGS]. 

![img](github-res/auto-date-disabled.png)

## See it in action

![img](github-res/demo1.gif)

###Notes

- If you see the program stuck it may be caused because of the conflict between bundled adb and your machine's adb. If this happens to many users, I will see how to fix it in future release. For now submit a issue/vote and reboot your machine as workaround. (restarting adb server might not always work but you can try) 
