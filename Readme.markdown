                      _______________________
     __________      ____(_)__  __/_  /___  /____  __
     __  ___/_ | /| / /_  /__  /_ _  __/_  /__  / / /
     _(__  )__ |/ |/ /_  / _  __/ / /_ _  / _  /_/ /
     /____/ ____/|__/ /_/  /_/    \__/ /_/  _\__, /
                                            /____/

# Swiftly

Transparent compilation for Swift command line scripts / programs.

When used to run swift command line programs, swiftly compiles the program,
saves the binary to a cache directory, and then calls the binary. On
subsequent runs, the binary is called instead of using the REPL.

Binaries are stored in subdirectories at `$HOME/.swiftly/cache/`, which is
created when `swiftly` is called for the first time. Each binary gets it
own directory, with a subdirectory set to the last modified timestamp of the
source file, and a binary name set to the original executable name so
internal references to the executable name work properly. The resulting final
directory structure is:

    $HOME/.swiftly/cache/executable_filenename/last_modified_timestamp/executable_filenename

The `swiftly` executable can also be used in place of the `swift`
program and should behave the same. For example, when running `swiftly` with no
arguments, the Swift REPL will launch.

## Installation

Simply add the `swiftly` executable to your `$PATH` and use it in place
of the `swift` command when running swift scripts. To use run a script with
`swiftly`, set the shebang to:

    #!/usr/bin/env swiftly

## Rationale

Swift REPL startup time is much slower than that of compiled binaries.
For a small comparison:

REPL (first run)

    ./example.swift example  0.13s user 0.06s system 90% cpu 0.208 total

compiled (all subsequent runs)

    ./example.swift example  0.01s user 0.01s system 85% cpu 0.018 total

## Caveats

This is still mostly an experiment at this point, though it should work
fine. There might be a better way approaching this, and I'd love to hear
suggestions.

