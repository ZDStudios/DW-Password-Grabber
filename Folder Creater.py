import os

# Define the path for the main folder
desktop_path = os.path.join(os.path.expanduser("~"), "Desktop")
main_folder = "Encrypted passwords"
main_folder_path = os.path.join(desktop_path, main_folder)

# Define subfolders
subfolders = ["Edge", "Chrome", "Firefox", "Brave"]

# Create the main folder if it doesn't exist
if not os.path.exists(main_folder_path):
    os.makedirs(main_folder_path)

# Create subfolders inside the main folder
for subfolder in subfolders:
    subfolder_path = os.path.join(main_folder_path, subfolder)
    if not os.path.exists(subfolder_path):
        os.makedirs(subfolder_path)

print(f"Folder '{main_folder}' and subfolders {subfolders} created successfully!")
