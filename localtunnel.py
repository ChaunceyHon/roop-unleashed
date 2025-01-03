import subprocess
import threading
import time
import socket
import urllib.request

def wait_for_port(port):
    """等待指定端口启动"""
    while True:
        time.sleep(0.5)
        sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        result = sock.connect_ex(('127.0.0.1', port))
        if result == 0:
            sock.close()
            break
        sock.close()

def start_ngrok(port):
    """启动 ngrok 并输出公网 URL"""
    from colorama import Fore, Style

    # 启动 ngrok 的进程
    p = subprocess.Popen(["ngrok", "http", str(port)], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    
    # 等待 ngrok 启动
    time.sleep(2)
    
    # 提取公网 URL
    try:
        ngrok_url = subprocess.check_output(["curl", "-s", "http://127.0.0.1:4040/api/tunnels"])
        import json
        tunnels = json.loads(ngrok_url)
        public_url = tunnels['tunnels'][0]['public_url']
        print(Fore.GREEN + "\n公网 URL: ", Fore.RED, public_url, "\n", Style.RESET_ALL)
    except Exception as e:
        print(Fore.RED + "无法获取公网 URL，请检查 ngrok 是否启动正常。" + Style.RESET_ALL)
        print(str(e))
        p.terminate()

if __name__ == "__main__":
    # 设置监听端口
    local_port = 7860

    # 启动线程等待端口
    threading.Thread(target=wait_for_port, daemon=True, args=(local_port,)).start()

    # 启动 ngrok
    start_ngrok(local_port)

    # 运行 facefusion.py
    subprocess.run(["python", "facefusion.py","run"])
