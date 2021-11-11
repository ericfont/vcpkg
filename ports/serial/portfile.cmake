vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO wjwwood/serial
    REF 1.2.1
    SHA512 41df7b5cd7237f3990f2debe8d3eb17cbe428666f9b298072abccd2bbaed4a1e82b074a416af132c94c0e2abff881513e7b4ab4feab82a6b7ae01cd01be5fa3e
)

vcpkg_find_acquire_program(PYTHON3)

vcpkg_execute_required_process(COMMAND ${PYTHON3} -m pip install --user -U catkin_tools catkin_pkg empy WORKING_DIRECTORY ${CURRENT_BUILDTREES_DIR} LOGNAME pip-install-catkin-${TARGET_TRIPLET})

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    PREFER_NINJA
)

vcpkg_install_cmake()

# # Handle copyright
# file(INSTALL ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/serial RENAME copyright)
