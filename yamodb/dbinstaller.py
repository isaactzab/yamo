import os
from sqlite3 import dbapi2 as sqlite3

class dbinstaller:
	def __init__(self, path):
		self.path = path
		if not self.create_db_file():
			return False
		if not self.create_tables():
			return False
		if not self.append_data():
			return False

		return None


	def create_db_file(self):
		self.sqlcnx = sqlite3.connect(self.path)
		return True if self.sqlcnx else False

	def create_tables(self):
		schema = open(os.path.realpath("yamodb/schema.sql")).read()
		cursor = self.sqlcnx.cursor()
		cursor.executescript(schema)
		self.sqlcnx.commit()
		return True
	def append_data(self):
		#adding some data to get works
		return True
