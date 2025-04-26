from swift_tools.swift_types import *

@wrapper
class Email:

    def __init__(self): ...
    
    def send(self, recipient: Optional[str], subject: Optional[str], text: Optional[str]): ...
