#!/usr/bin/python3
"""
contains the Mylist class
"""


class Mylist(list):
    """Implements sorted printing for the built-in list class."""

    def print_sorted(self):
        """print a list in sorted ascending order."""
        print(sorted(self))
