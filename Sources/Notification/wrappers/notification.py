from swift_tools.swift_types import *

@wrapper
class Notification:

    def __init__(self): ...

    def notify(self, title: str, message: str, app_name: str, app_icon: str, timeout: double): ...

    def reset_badge(self): ...