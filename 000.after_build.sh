# 保存编译打包文件
find build -type f -name "*.deb" -exec cp {} build_package/ \;

# 保存所有编译结果
find build -name compile_commands.json -exec cat {} \; > all_compile_commands.json
