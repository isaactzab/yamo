import ConfigParser
import os
import sqlite3
# import yamodb


# class Yamo(object):
# 	config = 
# 	def __init__(self):
# 		print self.config.get('library','path')

# 		# yamo['config'] = ConfigParser.RawConfigParser()
# 		# yamo['config'].read('./config.cfg')
# 		# library_path = yamo['config'].get('library','path')
# if __name__ == '__main__':
# 	Yamo()



class Yamo(object):
	def __init__(self):
		self.init_configuration()
		self.parse_directory(self.config.get('library','path'))


	def init_configuration(self):
		self.config = ConfigParser.RawConfigParser()
		self.config.read('./config.cfg')
	
	def parse_directory(self,path):
		for dirname, dirnames, filenames in os.walk(path):
			for filename in filenames:
				print os.path.join(dirname, filename)
			# for subdirname in dirnames:
			# 	print os.path.join(dirname, subdirname)



if __name__ == '__main__':
    Yamo()