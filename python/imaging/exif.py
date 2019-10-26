import pyexiv2
from PIL import Image
from PIL.ExifTags import TAGS

"""
Reference
find $PWD/data -iwholename "*.jpg" > image_list.txt
PYTHON 2.7.2:
Install python and python dev tools.
EXIF Tags: 
http://www.sno.phy.queensu.ca/~phil/exiftool/TagNames/EXIF.html
Python Imaging Library: 
http://www.pythonware.com/products/pil/
Take the source code and build in your VM. Bunch of 
dependency libraries are mentioned have a look.
PYEXIV2: 
http://tilloy.net/dev/pyexiv2/download.html
Take the source code and build in your VM. It might ask for
boost. Install boost from the repo. This might end up trickier.
It got a dependency exiv2 library. Install the same.
You need to install scons to build pyexiv2 library.
IMAGE NUMBER : 0x9211 --> Exif.Image.ImageNumber
"""

def format_file_path(image_list):
	return [an_image.split(".")[0] + "." + an_image.split(".")[1].strip('\n') for an_image in image_list]

# keys on exif meta data is an integer, refer "get_exif_tags" method to interpret the tag keys.
def create_exif_dict(image_list):
	return {an_image:(Image.open(an_image))._getexif() for an_image in image_list }

def get_exif_tags(file_name):
	return {TAGS.get(tag): value for tag, value in exif_dict[file_name].items()}

"""Careful, you might loose your original exif data and key format should be maintained!!!"""
def update_exif_metadata(file_name, key, value):
	image = pyexiv2.ImageMetadata(file_name).read()
	image_.__setitem__(key, index)
	image.write()

"""Careful, you are working on the actual image, you might loose your old meta data!!!"""
def index_image_gallery():
	for index in range(len(imageList)):
		image_ = pyexiv2.metadata.ImageMetadata(imageList[index])
		image_.read()
		image_.__setitem__("Exif.Image.ImageNumber", index)
		image_.write()

imageList = format_file_path(list(open('image_list.txt')))
exif_dict = create_exif_dict(imageList)
