# file-organization-scripts
A Collection of File Organization Scripts written by me. I use them to organize my photos, comic, videos and so on. 

## 1. empty folder eliminator
Dragging the parent folder onto the file, all empty subfolders will be delete.
## 2. auto prefix adder 
Dragging in a file will automatically add the root directory name as a prefix.

For example:

1. 2021-Japan
   1. Day1
      1. IMG-0809.png
      2. IMG-0810.png
      3. IMG-0811.png
   2. Day2
      1. IMG-0812.png
      2. IMG-0813.png
      3. IMG-0814.png

After you search <u>'.png'</u> inside <u>2021-Japan</u> folder and drag all the 6 files to the <u>auto prefix adder.bat</u>, the files will now become:

1. 2021-Japan
   1. Day1
      1. Day1 IMG-0809.png
      2. Day1 IMG-0810.png
      3. Day1 IMG-0811.png
   2. Day2
      1. Day2 IMG-0812.png
      2. Day2 IMG-0813.png
      3. Day2 IMG-0814.png

And it's convinient for you to review them by moving them together:

2021-Japan

1. Day1 IMG-0809.png
2. Day1 IMG-0810.png
3. Day1 IMG-0811.png
4. Day2 IMG-0812.png
5. Day2 IMG-0813.png
6. Day2 IMG-0814.png

## 3. auto prefix adder v2

Some times unkown errors occur when coming to the case that parent folders' name be like '2021.04 Japan'. In this case,  after renaming, the new files' prefix would be like '2021 IMG-0809' (Some part of the parent's name is lost).

And now you will need auto prefix adder v2. But v2 has a vital unknown bug too. For example:

1. 2021-Japan
   1. 11.01
      1. IMG-0809.png
      2. IMG-0810.png
      3. IMG-0811.png
   2. 12.01
      1. IMG-0812.png
      2. IMG-0813.png
      3. IMG-0814.png

After you search <u>'.png'</u> inside <u>2021-Japan</u> folder and drag all the 6 files to the <u>auto prefix adder v2.bat</u>, the files will now become:

1. 2021-Japan
   1. 11.01
      1. 11 IMG-0809.png
      2. 11 IMG-0810.png
      3. 11 IMG-0811.png
   2. 12.01
      1. 11 IMG-0812.png
      2. 11 IMG-0813.png
      3. 11 IMG-0814.png

The above shows the unknown bug. I will try to solve it if someday I cannot stand it anymore. 

## 4. suffix changer - exe to 7z
drag bunch of .exe file to it, change all to .7z file.
## 5. target file counter
Current function of the tool: Traverse all folders and their subfolders, and return the total number of files with the extensions .jpg, .png, and .jpeg (the sum of them). 

You can use it to count any types of files simply by adjusting the <u>'extensions'</u> array and the destination folder path.

```python
# Traverse all folders and their subfolders, and return the total number of .jpg, .png, .jpeg files (sum)
import os

def count_image_files(root_folder):
    extensions = ['.jpg', '.png', '.jpeg', 'gif', 'webp']
    total_count = 0
    for foldername, subfolders, filenames in os.walk(root_folder):
        for filename in filenames:
            file_extension = os.path.splitext(filename)[1].lower()  # Get the file extension and convert to lowercase
            if file_extension in extensions:
                total_count += 1
    return total_count

# Input multiple folder paths, separated by spaces
folders = input("Please enter the folder paths to traverse, separated by spaces: ").split()

total_files = 0
for folder in folders:
    total_files += count_image_files(folder)

print(f"There are a total of {total_files} image files that meet the requirements.")
```

