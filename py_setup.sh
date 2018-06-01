#!/bin/bash
# NOT USE, as jupyter notebooks cannot import modules after installed 
source utils.sh

e_header "Python installations"

echo "installing Python interpreters..."
echo "pyenv install 3.6.5"
pyenv install 3.6.5
echo "pyenv install 2.7.15"
pyenv install 2.7.15

echo "installing anaconda..."
echo "pyenv install anaconda3-5.1.0"
pyenv install anaconda3-5.1.0

e_success "Python installations done"

# global env
e_header "Global setups and environments"
echo "create jupyter env running on Python3"
pyenv virtualenv 3.6.5 jupyter3

echo "installing jupyter with Python3 as default..."
pyenv activate jupyter3
pip install jupyter
python -m ipykernel install --user
pyenv deactivate
e_success "jupyter installed successfully"

echo "create env for Python2"
pyenv virtualenv 2.7.15 ipython2

echo "installing kernel for Python2 to enable notebooks for Python2"
pyenv activate ipython2
pip install ipykernel
python -m ipykernel install --user
pyenv deactivate

echo "set PATH priority for diff environments"
pyenv global 3.6.5 2.7.15 jupyter3 ipython2