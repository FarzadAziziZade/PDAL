set CONDA_ENVIRO=pdal-build

call conda activate %CONDA_ENVIRO%

cd %CONDA_ENVIRO%

echo "conda prefix" %CONDA_PREFIX%
REM set GENERATOR="Visual Studio 14 2015 Win64"
set GENERATOR="NMake Makefiles"
set GENERATOR="Ninja"

set ORACLE_HOME=%CONDA_PREFIX%
cmake -G %GENERATOR% ^
      -DCMAKE_BUILD_TYPE:STRING=RelWithDebInfo ^
      -DCMAKE_LIBRARY_PATH:FILEPATH="=%CONDA_PREFIX%/Library/lib" ^
      -DBUILD_PLUGIN_PYTHON=ON ^
	  -DPython3_ROOT_DIR:FILEPATH="%CONDA_PREFIX%" ^
	  -DPython3_FIND_STRATEGY=LOCATION ^
      -DBUILD_PLUGIN_I3S=ON ^
	  -DBUILD_PLUGIN_E57=ON ^
	  -DBUILD_PLUGIN_TILEDB=ON ^
      -DBUILD_PLUGIN_FBX=OFF ^
      -DBUILD_PLUGIN_ICEBRIDGE=ON ^
      -DBUILD_PLUGIN_NITF=ON ^
      -DBUILD_PLUGIN_TILEDB=ON ^
      -DWITH_TESTS=ON ^
      -DWITH_ZLIB=ON ^
      -DBUILD_PLUGIN_PGPOINTCLOUD=ON ^
      -DBUILD_PGPOINTCLOUD_TESTS=OFF ^
      -DCMAKE_VERBOSE_MAKEFILE=OFF ^
      -DWITH_ZSTD=ON ^
      -DWITH_LZMA=ON ^
      -DLIBLZMA_LIBRARY:FILEPATH=%CONDA_PREFIX%\Library\lib\liblzma.lib ^
      -DZSTD_LIBRARY:FILEPATH=%CONDA_PREFIX%\Library\lib\libzstd.lib ^
	  -DBUILD_PLUGIN_RDBLIB=OFF ^
	  -DRdb_ROOT=..\..\..\..\rdblib-2.2.1-x86_64-windows\interface\cpp ^
      .. --debug-trycompile

call ninja
REM nmake /f Makefile
