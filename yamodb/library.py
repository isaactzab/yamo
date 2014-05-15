import os
from sqlite3 import dbapi2 as sqlite3
from sqlalchemy import *

class library:
	def __init__(self, path):
		self.path = path
		if not self.exists():
			self.install()
		else:
			self.db = create_engine("sqlite:///" + self.path)
			self.db.echo = False
			self.md = BoundMetaData(db)
			
			
	def exists(self):
		return  self.path and os.path.isfile(self.path)
		
	def install(self):
		from dbinstaller import dbinstaller
		# print 'installing db '+ self.path
		self.dbinstaller = dbinstaller(self.path)
		return True
