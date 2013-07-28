#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include "ppport.h"
#include <libpiface-1.0/pfio.h>
bool pfio_initialized = false;

MODULE = PiFace		PACKAGE = PiFace		

void
pfio_init()
	CODE:
		if (pfio_init() < 0)
			croak ("Cannot initialize PFIO. Did you connect your PiFace?");
		pfio_initialized = true;

void
pfio_deinit()
	CODE:
		pfio_deinit();
		pfio_initialized = false;

bool
pfio_inited()
	CODE:
		RETVAL = pfio_initialized;
	OUTPUT:
		RETVAL

void
pfio_digital_write(pin,value)
		int pin
		int value
	CODE:
		if (pin < 0 || pin > 7)
			croak ("Invalid PIN number, it should be between 0 and 7");
		if (!pfio_initialized)
			croak ("PFIO not initialized, use pfio_init()");
		pfio_digital_write (pin, value);

int
pfio_digital_read(pin)
		int pin
	CODE:
		if (pin < 0 || pin > 7)
			croak ("Invalid PIN number, it should be between 0 and 7");
		if (!pfio_initialized)
			croak ("PFIO not initialized, use pfio_init()");
		RETVAL = pfio_digital_read (pin);
	OUTPUT:
		RETVAL

int
pfio_read_input()
	CODE:
		if (!pfio_initialized)
			croak ("PFIO not initialized, use pfio_init()");
		RETVAL = pfio_read_input();
	OUTPUT:
		RETVAL

int
pfio_read_output()
	CODE:
		if (!pfio_initialized)
			croak ("PFIO not initialized, use pfio_init()");
		RETVAL = pfio_read_output();
	OUTPUT:
		RETVAL

void
pfio_write_output(mask)
		int mask
	CODE:
		if (!pfio_initialized)
			croak ("PFIO not initialized, use pfio_init()");
		pfio_write_output (mask);

int
pfio_get_pin_bit_mask(pin)
		int pin
	CODE:
		if (pin < 0 || pin > 7)
			croak ("Invalid PIN number, it should be between 0 and 7");
		RETVAL = pfio_get_pin_bit_mask (pin);
	OUTPUT:
		RETVAL

int
pfio_get_lowest_pin_number(mask)
		int mask
	CODE:
		RETVAL = pfio_get_pin_number (mask);
	OUTPUT:
		RETVAL

