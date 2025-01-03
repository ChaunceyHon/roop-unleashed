#!/bin/bash

# 创建保存模型的目录
mkdir -p /workspace/roop-unleashed/models/CodeFormer/

# 函数用于检查文件是否存在
check_and_download() {
    file_path="/workspace/roop-unleashed/models/CodeFormer/$1"
    url="$2"
    if [ -f "$file_path" ]; then
        echo "File $file_path already exists, skipping download."
    else
        echo "Downloading $url to $file_path"
        wget -P /workspace/roop-unleashed/models/CodeFormer "$url"
    fi
}

# 下载并保存模型文件
# 确保这里的文件名与实际下载的文件名匹配
check_and_download "CodeFormerv0.1.onnx" https://hf-mirror.com/countfloyd/deepfake/resolve/main/CodeFormerv0.1.onnx