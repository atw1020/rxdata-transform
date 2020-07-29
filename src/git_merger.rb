"""

Author: Arthur Wesley

"""
path = Dir.pwd

# Prior to the Merge, export files to JSON

if path
	Tone.include(Oj::Hashable)
	Table.include(Oj::Hashable)
	Color.include(Oj::Hashable)
	RPG::ObjectBase.include(Oj::Hashable)
	Oj.default_options = { indent: 2, mode: :compat }
	path = path.gsub(File::ALT_SEPARATOR, File::SEPARATOR)
	exporter = Rxdata::Exporter.new(path)
	exporter.export
end

# Merge 
System 'git merge --continue' # Ignore Conflicts (super unwise)

# now import the files from JSON
if path
	path = path.gsub(File::ALT_SEPARATOR, File::SEPARATOR)
	importer = Rxdata::Importer.new(path)
	importer.import
end