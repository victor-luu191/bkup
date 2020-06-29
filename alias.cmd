@echo off

:: Temporary system path at cmd startup
set PATH=%PATH%;"C:\Program Files\Sublime Text 3\";"C:\Users\Victor\Anaconda3\";"C:\Users\Victor\Anaconda3\pkgs\notebook-6.0.3-py37_0\Scripts"

:: Add to path by command

rem DOSKEY add_python26=set PATH=%PATH%;"C:\Python26\"
DOSKEY add_python37=set PATH=%PATH%;"C:\Users\Victor\Anaconda3\pkgs\python-3.7.7-h81c818b_4"

:: Commands
DOSKEY ls=dir /B
DOSKEY sublime=sublime_text $*  
    ::sublime_text.exe is name of the executable. By adding a temporary entry to system path, we don't have to write the whole directory anymore.
:: "%USERPROFILE%/"
DOSKEY clear=cls

:: Conda commands - must be run inside anaconda cmd prompt
DOSKEY jupyter=jupyter-notebook $*
DOSKEY act=conda activate $*
DOSKEY deact=conda deactivate
DOSKEY ci=conda install $*
DOSKEY ceu=conda env update


:: Common directories
DOSKEY projects=cd "%USERPROFILE%\PycharmProjects\$*"
