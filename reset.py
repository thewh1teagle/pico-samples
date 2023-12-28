import os
import serial

if os.name == 'nt':  # sys.platform == 'win32':
    from serial.tools.list_ports_windows import comports
elif os.name == 'posix':
    from serial.tools.list_ports_posix import comports

ports = comports()
for port in ports:
    print(port.device)
    if port.pid == 10: # PI Pico
        ser = serial.Serial(port=port.device)
        ser.baudrate = 1200