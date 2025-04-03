rem Create Makefiles
cmake -G Ninja ^
      -D CMAKE_POLICY_VERSION_MINIMUM=3.5 ^
      -D BUILD_ZENLIB=OFF ^
      -D BUILD_ZLIB=OFF ^
      -D CMAKE_BUILD_TYPE=Release ^
      -D CMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
      -D BUILD_SHARED_LIBS=ON ^
      -S Project\CMake ^
      -B build
if errorlevel 1 exit /b 1

rem Build
cmake --build build -- -j%CPU_COUNT%
if errorlevel 1 exit /b 1

rem Install
cmake --build build -- install
if errorlevel 1 exit /b 1
