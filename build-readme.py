# ---------------------------------------------------------------------------- #
#                                build-readme.py                               #
# ---------------------------------------------------------------------------- #
#                             Author: Archie Adams                             #
# ---------------------------------------------------------------------------- #
#     Copies content from current README.md up to the documentation section    #
#    then creates links to all documentation .md files in the src directory.   #
#               Also creates a standalone documentation.md file.               #
# ---------------------------------------------------------------------------- #

# ! Only works up to src/xxx/yyy/zzz.md level directories.
# ! May need to add nested header functionality in the future.

import os

fileOutput = open("./build/README-NEW.md", 'w')
fileDocOutput = open("./build/documentation-NEW.md", 'w')


# ----------------------- Create file header sections. ----------------------- #
scriptCopy = False
fileREADME = open("./README.md", 'r')
for line in fileREADME:

    fileOutput.write(line)

    # Only write the SCRIPT COPY section without the tags to the
    # documentation.md file.
    if scriptCopy & (line != "<!-- SCRIPT STOP -->\n"):
        fileDocOutput.write(line)
    if line == "<!-- SCRIPT COPY -->\n":
        scriptCopy = True

    if line == "<!-- SCRIPT STOP -->\n":
        break
fileREADME.close()
# ---------------------------------------------------------------------------- #


# ------------------ Create links to documentation.md files. ----------------- #
print("")
headingTag = "\n---\n## "
currentHeading = ""
for root, dirs, files in os.walk("src"):
    for file in files:
        if file.endswith(".md"):

            if root == "src":
                print("ERROR: .md file should not be present src.\n")
                exit()

            filename = file[0:-3]
            foldername = root.split("\\")[-1]
            parentFoldername = root.split("\\")[-2]

            # If filename is the same as the folder name then do not use the
            # foldername for header, use its parent instead.
            if currentHeading != parentFoldername:
                if filename == foldername:
                    currentHeading = parentFoldername
                    fileOutput.write(headingTag + currentHeading + "\n")
                    fileDocOutput.write(headingTag + currentHeading + "\n")

                elif currentHeading != foldername:
                    currentHeading = foldername
                    fileOutput.write(headingTag + currentHeading + "\n")
                    fileDocOutput.write(headingTag + currentHeading + "\n")

            link = "[" + file + "](.\\" + root + "\\" + file + ")  \n"
            print("Adding links to: " + file)
            fileOutput.write(link)
            fileDocOutput.write(link)
# ---------------------------------------------------------------------------- #


fileOutput.close()
fileDocOutput.close()

print("\nFinished: ./build/README-NEW.md")
print("Finished: ./build/documentation-NEW.md\n")
