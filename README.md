# semver-incrementer

Just a small thing which takes your version and increments it by a number
specified. It is assumed that the numbers are not going beyond 9 when
incremented(`0.1.9` becomes `0.2.0`).

## Usage

    $ semver-incrementer 0.1.9 1
    $ 0.2.0
