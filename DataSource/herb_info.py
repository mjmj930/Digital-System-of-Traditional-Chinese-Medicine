# 运行1.py herb_info_part2.py herb_info_part3.py herb_info_part4.py
import concurrent.futures
import subprocess


def run_script(script_name):
    """运行给定的脚本文件"""
    subprocess.run(["python", script_name])


if __name__ == "__main__":
    # 脚本名称列表
    scripts = ['herb_info_part1.py', 'herb_info_part2.py', 'herb_info_part3.py', 'herb_info_part4.py']

    # 使用ThreadPoolExecutor并发执行
    with concurrent.futures.ThreadPoolExecutor() as executor:
        executor.map(run_script, scripts)