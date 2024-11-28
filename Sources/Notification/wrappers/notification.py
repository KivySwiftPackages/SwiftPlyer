from swift_tools.swift_types import *

@wrapper
class Notification:

    def notify(self, title: str, message: str, app_name: str, app_icon: str, timeout: double): ...