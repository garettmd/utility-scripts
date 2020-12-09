#!/usr/bin/env python

import sys
from subprocess import PIPE, Popen

from gooey import Gooey, GooeyParser


def shrinker(files, size):
    if sys.platform == "win32":
        cmd = "magick"
    else:
        cmd = "convert"

    for file in files:
        proc = Popen(
            [
                cmd,
                file,
                "-define",
                "jpeg:extent={0}".format(size),
                "{0}_shrunk.jpg".format(file),
            ],
            stdout=PIPE,
            stderr=PIPE,
        )
        print("Shrinking {0}".format(file))
        proc.communicate()


@Gooey()
def main():
    parser = GooeyParser(description="Shrink images!")
    parser.add_argument("input", help="Files to shrink", widget="FileChooser")
    parser.add_argument(
        "size",
        help="Max size to shrink images to",
        choices=["1kb", "500kb", "1mb", "10mb", "100mb"],
    )
    args = parser.parse_args()
    shrinker(args.input, args.size)


if __name__ == "__main__":
    main()
