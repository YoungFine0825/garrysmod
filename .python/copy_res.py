import shutil
import sys
import os
import find_steam

steam_install_path = find_steam.get_steam_installation_directory()
if not steam_install_path:
    print("找不到Steam安装目录！")
    exit()
 #
garrysmod_install_path = steam_install_path + "\\steamapps\\common\\GarrysMod\\"
if not os.path.exists(garrysmod_install_path):
    print("未安装Garry's Mod ！")
    exit()
#
folders = []
if len(sys.argv) > 1:
    for i in range(1,len(sys.argv)):
        folders.append(str(sys.argv[i]))


py_file_path = os.path.dirname(os.path.abspath(__file__))
src_dir = py_file_path + "\\..\\"
def copy_folder(folder):
    src_folder = src_dir + folder
    if os.path.isdir(src_folder):
        dst_folder = garrysmod_install_path + "\\" + folder
        print("copy " + src_folder + " -> " + dst_folder)
        shutil.copytree(src_folder,dst_folder, dirs_exist_ok=True)
    else:
        print(src_folder + " isn't a folder !")


if len(folders) > 1:
    for folder in folders:
        copy_folder(folder)
else:
    copy_folder("bin")
    copy_folder("garrysmod")