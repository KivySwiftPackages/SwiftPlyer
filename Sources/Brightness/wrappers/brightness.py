from swift_tools.swift_types import *

@wrapper
class Brightness:

    def __init__(self): ...

    def current_level(self) -> double: ...

    def set_level(self, level: double): ...