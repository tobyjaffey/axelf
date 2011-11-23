TARGET=axelf
CC=avr-gcc
CFLAGS=-O2 -mmcu=at90usb162 -Wall

SRCS=$(TARGET).c

$(TARGET).hex: $(TARGET).elf
	avr-objcopy -j .text -O ihex $(TARGET).elf $(TARGET).hex

$(TARGET).elf: $(SRCS)
	$(CC) $(CFLAGS) $(SRCS) -o $@

install: $(TARGET).hex
	@echo edit the install target to suit your programmer
	#avrdude -p usb162 -c avrusb500 -P /dev/tty.usbserial-A3001g3O -U flash:w:$(TARGET).hex -U lfuse:w:0xDE:m

clean:
	rm -f $(TARGET).hex $(TARGET).elf
