import sublime, sublime_plugin, subprocess, os, threading

class RsyncProducteevCommand(sublime_plugin.TextCommand):

	def run(self, edit):
		thread = threading.Thread(target=self.syncData)
		thread.start()

	def syncData(self):
		syncCommand = "rsync -azCc --exclude 'app/cache' --exclude 'app/spool' --exclude 'app/logs' --delete-after --chmod=a=r,u+w,D+x /Users/jerome/Workspace/web/producteev4 jm@producteevdev.com:/home/jm/www/"
		proc = subprocess.Popen([syncCommand],shell=True)
		proc.wait()
		self.syncFinish()
		return

	def syncFinish(self):
		notif = "terminal-notifier -message 'Rsync completed' -title 'Producteev - Dev'"
		subprocess.call([notif],shell=True)