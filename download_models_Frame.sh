#!/bin/bash

# 创建保存模型的目录
mkdir -p /workspace/roop-unleashed/models/Frame

# 函数用于检查文件是否存在
check_and_download() {
    file_path="/workspace/roop-unleashed/models/Frame/$1"
    url="$2"
    if [ -f "$file_path" ]; then
        echo "File $file_path already exists, skipping download."
    else
        echo "Downloading $url to $file_path"
        wget -P /workspace/roop-unleashed/models/Frame "$url"
    fi
}

# 下载并保存模型文件
# 确保这里的文件名与实际下载的文件名匹配
check_and_download "deoldify_artistic.onnx" https://hf-mirror.com/countfloyd/deepfake/resolve/main/deoldify_artistic.onnx
check_and_download "deoldify_stable.onnx" https://hf-mirror.com/countfloyd/deepfake/resolve/main/deoldify_stable.onnx
check_and_download "isnet-general-use.onnx" https://hf-mirror.com/countfloyd/deepfake/resolve/main/isnet-general-use.onnx
check_and_download "real_esrgan_x4.onnx" https://hf-mirror.com/countfloyd/deepfake/resolve/main/real_esrgan_x4.onnx
check_and_download "real_esrgan_x2.onnx" https://hf-mirror.com/countfloyd/deepfake/resolve/main/real_esrgan_x2.onnx
check_and_download "lsdir_x4.onnx" https://hf-mirror.com/countfloyd/deepfake/resolve/main/lsdir_x4.onnx