from swift_tools.swift_types import *


@wrapper
class Text:

    def set_locale(self, locale: str): ...

    def speak(self, message: str): ...