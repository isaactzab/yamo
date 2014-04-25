class library:
	def __init__(self, path):
		self.path = path
		if not self.exists():
			self.install()
		
	def exists(self):
		return not self.path and os.path.isfile(self.path)
		
	def install(self):
		print 'installing db '+ self.path
		#self.dbinstaller = dbinstaller(self.path)



class dbinstaller(path):
	def __ini__(self,path):
		self.path = path
		if not self.create_db_file():
			return false
		if not self.create_main_file_table():
			return false
		if not self.append_data():
			return false

		return true


	def create_db_file(self):
		#make a db file
		return true
	def create_main_file_table(self):
		# create table
		return true
	def create_main_category_table(self):
		# creating main categories
	def append_data(self):
		#adding some data to get works
		return true
