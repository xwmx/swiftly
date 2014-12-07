                      _______________________
     __________      ____(_)__  __/_  /___  /____  __
     __  ___/_ | /| / /_  /__  /_ _  __/_  /__  / / /
     _(__  )__ |/ |/ /_  / _  __/ / /_ _  / _  /_/ /
     /____/ ____/|__/ /_/  /_/    \__/ /_/  _\__, /
                                            /____/

# Swiftly

Transparent compilation for Swift command line scripts / programs.

When added used to run swift command line programs, compiles the program, saves
the binary to a cache directory, and then calls the binary. On subsequent runs,
the binary is called instead of using the REPL.

Binaries are stored in subdirectories at `$HOME/.swiftly/cache/`, which is
created when `swiftly` is called for the first time. Each binary gets it
own directory, with a subdirectory set to the last modified timestamp of the
source file, and a binary name set to the original executable name so
internal references to the executable name work properly. The resulting final
directory structure is:

    $HOME/.swiftly/cache/executable_filenename/last_modified_timestamp/executable_filenename

## Installation

Simply add the `swiftly` executable to your `$PATH` and use it in place
of the `swift` command when running swift scripts.

Swiftly is intended to be primarily called via a shebang. To do so,
replace the swift sheband with:

    #!/usr/bin/env swiftly

## Rationale

Swift REPL startup time is much slower than that of compiled binaries.
For a small comparison:

REPL (first run)

    ./test.swift example  0.13s user 0.06s system 90% cpu 0.208 total

compiled (all subsequent runs)

    ./test.swift example  0.01s user 0.01s system 85% cpu 0.018 total

## Caveats

There might be a better way approaching this, and I'd love to hear
suggestions.

## TODO

Automatically remove outdated cached binary files.
