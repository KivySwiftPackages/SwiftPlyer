from swift_tools.swift_types import *


@wrapper
class TTS:

    def __init__(self): ...

    def set_locale(self, locale: str): ...

    def speak(self, message: str): ...