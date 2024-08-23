import os
import sys
from typing import List

py_file_dir = os.path.dirname(os.path.abspath(__file__))

class FunctionDef:
    def __init__(self) -> None:
        self.haveReturnType = False
        self.returnType = None
        self.funcName = None
        self.haveArgs = False
        self.argsCnt = 0
        self.argsTypeList = []
        self.argsNameList = []
        self.desc = ""

    def printInfo(self):
        print("**** print function start ****")
        print("* function name = " + self.funcName)
        if self.haveReturnType:
            print("* return type = " + self.returnType)
        else:
            print("* return type = None")
        if self.haveArgs:
            for a in range(0,self.argsCnt):
                print("* Arg "+str(a)+" "+self.argsNameList[a]+" "+self.argsTypeList[a])
        else:
            print("* No Args")
        print("**** print function end ****")

def _parseClassMemberFunctionDef(class_name,line: str) -> FunctionDef:
    ret = FunctionDef()
    class_name_start_index = line.find(class_name)
    args_list_start_index = line.find('(')
    args_list_end_index = line.find(')')
    function_name_start_index = line.find(":")
    function_name = line[function_name_start_index+1:args_list_start_index].strip()
    ret.funcName = function_name
    #
    is_have_return_type = class_name_start_index > 0
    ret.haveReturnType = is_have_return_type
    if is_have_return_type:
        ret.returnType = line[0:class_name_start_index].strip()
    #
    is_have_args = (args_list_end_index - args_list_start_index) > 1
    args_cnt = 0
    if is_have_args:
        args_list_str = line[args_list_start_index+1:args_list_end_index]
        args_list = args_list_str.split(',')
        for arg in args_list:
            args_tokens = arg.strip().split(' ')
            arg_type = args_tokens[0]
            arg_name = "unname_value"
            if len(args_tokens) > 1:
                arg_name = args_tokens[1]
            ret.argsTypeList.append(arg_type)
            ret.argsNameList.append(arg_name)
            args_cnt = args_cnt + 1
    ret.haveArgs = is_have_args
    ret.argsCnt = args_cnt
    #
    return ret

def _parseClassMemberFunctionsFromDocFile(class_name: str,path_2_file: str) -> List[FunctionDef]:
    functionDefList: List[FunctionDef] = []
    line_index = 0
    with open(path_2_file, 'r',encoding='utf-8',errors="replace") as file:
        lines = file.readlines()
        for line in lines:
            if line_index % 2 == 0:
                func_def = _parseClassMemberFunctionDef(class_name,line)
                func_def.desc = lines[line_index + 1]
                functionDefList.append(func_def)
            line_index = line_index + 1
    return functionDefList
#
#
def _outputMemberFunctionTipsToFile(file,obj_name: str,func_def: FunctionDef):
    file.write("---")
    file.write(func_def.desc)
    if func_def.haveArgs:
        for a in range(0,func_def.argsCnt):
            file.write("---@param "+func_def.argsNameList[a]+" "+func_def.argsTypeList[a])
            file.write("\n")
    if func_def.haveReturnType:
        file.writelines("---@return "+func_def.returnType)
        file.write("\n")
    file.write("function " + obj_name)
    file.write(func_def.funcName)
    file.write('(')
    if func_def.haveArgs:
        for a in range(0,func_def.argsCnt):
            file.write(func_def.argsNameList[a])
            if a < func_def.argsCnt - 1:
                file.write(',')
    file.write(') end')
#
#
def gen_class_tips(class_name: str,path_2_members_doc_file: str,path_2_functions_doc_file: str,path_2_tips_file: str):
    if not class_name:
        print("Class Name is invalid!")
        return False
    if not path_2_functions_doc_file or (not os.path.exists(path_2_functions_doc_file)):
        print("Class function doc file path is invalid! " + path_2_functions_doc_file)
        return False
    if not path_2_tips_file :
        print("Lua tips file path is invalid!")
        return False
    if path_2_members_doc_file :
        if not os.path.exists(path_2_members_doc_file):
            print("Class member doc file path is invalid! " + path_2_members_doc_file)
            return False
        if path_2_members_doc_file == path_2_functions_doc_file:
            print("Class members doc file cannot same with member functions doc file")
            return False
    #
    functionDefList = _parseClassMemberFunctionsFromDocFile(class_name,path_2_functions_doc_file)
    #
    tipsFile = open(path_2_tips_file,"w",encoding="utf-8",errors="replace")
    tipsFile.write("---@class "+class_name+"\n")
    tipsFile.write("local class = {}\n")
    for func_def in functionDefList:
        tipsFile.write("\n\n")
        _outputMemberFunctionTipsToFile(tipsFile,"class:",func_def)
        tipsFile.write("\n")
    tipsFile.close()
    return True