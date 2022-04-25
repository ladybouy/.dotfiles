#!/usr/bin/env python3

import os

def ReplaceMultipleText():
    #TODO Take in a list of words to replace
    return

def ReplaceText(file, replaced, replacing):

    print("Processing",file)
    with open (file, "r") as f:
        data = f.read()
        replaced_data = data.replace(replaced, replacing)

    with open (file, "w") as f:
        f.write(replaced_data)


if __name__ == "__main__":
   # file = sys.argv[1]

    old_text = input("Enter text to be replaced: ")
    new_text = input("Enter replacing text: ")

    for subdir, dirs, files in os.walk('.'):
        for file in files:
            file_path = os.path.join(subdir, file)
            ReplaceText(file_path, old_text, new_text)
