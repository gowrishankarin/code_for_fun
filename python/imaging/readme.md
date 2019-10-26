#EXIF Manipulator#


###System Task###
1. Create file(eg. image_list.txt) having list of images in the folder recursively.
2. Best done with the following command on unix/linux/mac operating system.
Python Algorithm
3. Read image_list.txt and list the images.
4. Create a tuple or dictionary of images and its metadata. Ensure key is location of the image and value is metadata.
5. Read images sequentially using appropriate exif tool.
6. Retrieve the metadata and update the dictionay value.

###There are 5 Methods:###

####format_file_path: 
Internal use, reads image_list.txt and creates a list of jpg file locations, we can improve this to support all image formats.
####create_exif_dict: 
Creates dictionary of file location and its exif metadata.
####update_exif_metadata: 
Update an exif metadata for a given image, INPUT: file, metadata_key, metadata_value
####index_image_gallery: 
Index all images in the image_list.txt, starting from 0 to n. We can improve this function by taking offset.




##Reference##

>find $PWD/data -iwholename "*.jpg" > image_list.txt

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
