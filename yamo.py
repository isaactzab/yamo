import ConfigParser
import os
from yamodb.library import library

class Yamo(object):
	def __init__(self):
		self.init_configuration()
		self.lib = library(
			self.config.get('library','path') + 
			self.config.get('library','db')
		)

		# self.parse_directory(self.config.get('library','path'))


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