set -e
echo "Version: $1"

git clone --depth 1 --branch $1 https://github.com/ocornut/imgui
git clone --depth 1 https://github.com/dearimgui/dear_bindings

python3 -m venv venv
source venv/bin/activate
python3 -m pip install -r dear_bindings/requirements.txt

mkdir -p src
python3 dear_bindings/dear_bindings.py -o src/cimgui --custom-namespace-prefix ig imgui/imgui.h
cp imgui/*.h imgui/*.cpp imgui/LICENSE.txt src/
