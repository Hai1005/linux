
obj-m += helloworld_rpi4.o helloworld_rpi4_with_parameters.o helloworld_rpi4_with_timing.o 
obj-m += helloworld_rpi4_char_driver.o helloworld_rpi4_class_driver.o misc_rpi4_driver.o
obj-m += hellokeys_rpi4.o ledRGB_rpi4_platform.o ledRGB_rpi4_class_platform.o led_rpi4_UIO_platform.o
obj-m += io_rpi4_expander.o ltc3206_rpi4_led_class.o 
obj-m += int_rpi4_key.o int_rpi4_key_wait.o keyled_rpi4_class.o
obj-m += linkedlist_rpi4_platform.o
obj-m += sdma_rpi4_m2m.o
obj-m += i2c_rpi4_accel.o adxl345_rpi4.o 
obj-m += ltc2607_rpi4_dual_device.o ltc2422_rpi4_dual.o ltc2422_rpi4_trigger.o
obj-m += adxl345_rpi4_iio.o


KERNEL_DIR ?= $(HOME)/linux

all:
	make -C $(KERNEL_DIR) \
		ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- \
		SUBDIRS=$(PWD) modules

clean:
	make -C $(KERNEL_DIR) \
		ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- \
		SUBDIRS=$(PWD) clean

deploy:
	scp *.ko pi@10.0.0.10:


