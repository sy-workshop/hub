import sys, os, shutil
from datetime import datetime

# Paths for network on windows
PATHCONFIG = {
    "archive": "O:\\",
    "printer": "P:\\",
    "labshare": "S:\\"
}

print("")
print("#############################")
print("##  SYHUB - BACKUP SCRIPT  ##")
print("#############################")
print("> (c) Sy Lenz 2025 - Version 0.1.0")
print("|")

# Check if destination is specified
if len(sys.argv) < 2:
    print("[ERROR] A destination has to be provided!")
    exit()
    
dest = sys.argv[1]
folder_name = "syhub_" + datetime.now().strftime("%Y-%m-%d_%H-%M-%S")
    
print(f"> Destination: {dest}")
print(f"> Folder name: {folder_name}")
print(f"> Folders: ")

for key in PATHCONFIG:
    print(f"| > '{key}': '{PATHCONFIG[key]}'")
    
print("|")
print("> Starting backup ... ")

# Create root folder
os.makedirs(dest + "/" + folder_name)

# Copy drives
for key in PATHCONFIG:
    shutil.copytree(PATHCONFIG[key], dest + "/" + folder_name + "/" + key)