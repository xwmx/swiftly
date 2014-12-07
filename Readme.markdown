                      _______________________
     __________      ____(_)__  __/_  /___  /____  __
     __  ___/_ | /| / /_  /__  /_ _  __/_  /__  / / /
     _(__  )__ |/ |/ /_  / _  __/ / /_ _  / _  /_/ /
     /____/ ____/|__/ /_/  /_/    \__/ /_/  _\__, /
                                            /____/

# Swiftly

Transparent compilation for Swift scripts.

When added used to run swift command line programs, compiles the program, saves
the binary to a cache directory, and then calls the binary. On subsequent runs,
the binary is called instead of using the REPL.

Binaries are stored in subdirectories at `$HOME/.swiftly/cache/`, which is
created when `swiftly` is called for the first time. Each binary gets it
own directory, and the filename of each binary is set to the last
modified timestamp of the source file, resulting in a final directory
structure of: $HOME/.swiftly/cache/binary_name/last_modified_timestamp`
