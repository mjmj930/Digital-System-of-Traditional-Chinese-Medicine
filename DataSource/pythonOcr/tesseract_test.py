from PIL import Image
import pytesseract


# 添加tesseract的路径
#pytesseract.pytesseract.tesseract_cmd = r'D:\software\Tesseract-OCR\tesseract.exe'
"""
image_to_string()：如果识别英文或数字可以不必额外参数，如果识别其他语言则需要加上lang参数
lang='chi_sim'表示要识别的是中文简体
没有识别出来时，返回空白
"""
text = pytesseract.image_to_string(Image.open('D:/Digital-System-of-Traditional-Chinese-Medicine/DataSource/pythonOcr/images/shouxiezi.png'), lang='chi_sim')
print(text)
