#!/bin/bash

# 创建保存模型的目录
mkdir -p /workspace/roop-unleashed/models

# 函数用于检查文件是否存在
check_and_download() {
    file_path="/workspace/roop-unleashed/models/$1"
    url="$2"
    if [ -f "$file_path" ]; then
        echo "File $file_path already exists, skipping download."
    else
        echo "Downloading $url to $file_path"
        wget -P /workspace/roop-unleashed/models "$url"
    fi
}

# 下载并保存模型文件
# 确保这里的文件名与实际下载的文件名匹配
check_and_download "inswapper_128.onnx" https://hf-mirror.com/CountFloyd/deepfake/resolve/main/inswapper_128.onnx
check_and_download "reswapper_128.onnx" https://hf-mirror.com/CountFloyd/deepfake/resolve/main/reswapper_128.onnx
check_and_download "reswapper_256.onnx" https://hf-mirror.com/CountFloyd/deepfake/resolve/main/reswapper_256.onnx
check_and_download "GFPGANv1.4.onnx" https://hf-mirror.com/CountFloyd/deepfake/resolve/main/GFPGANv1.4.onnx
check_and_download "DMDNet.pth" https://github.com/csxmli2016/DMDNet/releases/download/v1/DMDNet.pth
check_and_download "GPEN-BFR-512.onnx" https://hf-mirror.com/CountFloyd/deepfake/resolve/main/GPEN-BFR-512.onnx
check_and_download "restoreformer_plus_plus.onnx" https://hf-mirror.com/CountFloyd/deepfake/resolve/main/restoreformer_plus_plus.onnx
check_and_download "xseg.onnx" https://hf-mirror.com/CountFloyd/deepfake/resolve/main/xseg.onnx