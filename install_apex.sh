echo "Building and Installing APEX"
CUDA_VISIBLE_DEVICES=0 python -m pip install -v --disable-pip-version-check --no-cache-dir --no-build-isolation --config-settings "--build-option=--cpp_ext" --config-settings "--build-option=--cuda_ext" "git+https://github.com/NVIDIA/apex.git"
