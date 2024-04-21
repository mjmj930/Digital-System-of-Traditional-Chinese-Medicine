try:

    import Image

except ImportError:

    from PIL import Image

from pytesseract import *

print(pytesseract.image_to_string(Image.open('YOUR_IMAGE_PATH')))

