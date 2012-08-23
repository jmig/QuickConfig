import sublime, sublime_plugin, subprocess, os

class RsyncProducteevCommand(sublime_plugin.TextCommand):
	def run(self, edit):
		syncProject = "rsync -azCc --exclude 'app/cache' --exclude 'app/spool' --exclude 'app/logs' --delete-after --chmod=a=r,u+w,D+x /Users/jerome/Workspace/web/producteev4 jm@producteevdev.com:/home/jm/www/ &"
		subprocess.call([syncProject],shell=True)
                print "Rsync DONE"
