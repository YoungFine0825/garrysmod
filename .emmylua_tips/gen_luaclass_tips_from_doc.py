import os
import sys
import emmylua_tips_helper
import argparse

parser = argparse.ArgumentParser(description='Description of your program')
parser.add_argument('--class_name', type=str, help='Input file path')
parser.add_argument('--tips_file', type=str, help='Output file path')
parser.add_argument('--member_functions_doc', type=str, help='Output file path')
parser.add_argument('--members_doc',type=str,help='Enable verbose mode')
args = parser.parse_args()

path_to_member_doc = None
if args.members_doc:
    path_to_member_doc = args.members_doc

is_success = emmylua_tips_helper.gen_class_tips(args.class_name,path_to_member_doc,args.member_functions_doc,args.tips_file)
if is_success:
    print("生成Lua Class Tips文件成功！")
else:
    print("生成Lua Class Tips文件失败！")