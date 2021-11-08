rem Create Makefiles
cmake -GNinja ^
      -DPKG_CONFIG_USE_CMAKE_PREFIX_PATH=ON ^
      -DCMAKE_PREFIX_PATH=%LIBRARY_LIB%\pkgconfig ^
      -DBUILD_SHARED_LIBS=ON ^
      -DBUILD_ZENLIB=OFF ^
      -DBUILD_ZLIB=OFF ^
      -DCMAKE_INSTALL_PREFIX=%PREFIX% ^
      -DCMAKE_INSTALL_LIBDIR=lib ^
      -DCMAKE_BUILD_TYPE=Release ^
      -DINCLUDE_INSTALL_DIR=%PREFIX%\include ^
      -S Project\CMake ^
      -B build

rem Build
cmake --build build -- -j%CPU_COUNT%

rem Install
cmake --build build -- install
