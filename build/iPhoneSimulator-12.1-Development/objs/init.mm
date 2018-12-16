#import <Foundation/Foundation.h>

extern "C" {
    void ruby_init(void);
    void ruby_init_loadpath(void);
    void ruby_script(const char *);
    void *rb_vm_top_self(void);
    void rb_define_global_const(const char *, void *);
    void rb_rb2oc_exc_handler(void);
    void ruby_init_device_repl(void);
void MREP_342010F0C0334BC1A01370F71F58DABD(void *, void *);
void MREP_D82C411C9ED74214B226EF49D8DA7AEC(void *, void *);
void MREP_924A550EAACD4651BD3E35A202ADC076(void *, void *);
void MREP_9C9787CDEA184ECFA6E4A2459F427E68(void *, void *);
void MREP_CE768A9F431D4791AD0FB847534651C5(void *, void *);
int rm_repl_port = 56833;
}

extern "C"
void
RubyMotionInit(int argc, char **argv)
{
    static bool initialized = false;
    if (!initialized) {
	ruby_init();
	ruby_init_loadpath();
        if (argc > 0) {
	    const char *progname = argv[0];
	    ruby_script(progname);
	}
#if !__LP64__
	try {
#endif
	    void *self = rb_vm_top_self();
ruby_init_device_repl();
rb_define_global_const("RUBYMOTION_ENV", @"development");
rb_define_global_const("RUBYMOTION_VERSION", @"5.16");
MREP_342010F0C0334BC1A01370F71F58DABD(self, 0);
MREP_D82C411C9ED74214B226EF49D8DA7AEC(self, 0);
MREP_924A550EAACD4651BD3E35A202ADC076(self, 0);
MREP_9C9787CDEA184ECFA6E4A2459F427E68(self, 0);
MREP_CE768A9F431D4791AD0FB847534651C5(self, 0);
#if !__LP64__
	}
	catch (...) {
	    rb_rb2oc_exc_handler();
	}
#endif
	initialized = true;
    }
}
