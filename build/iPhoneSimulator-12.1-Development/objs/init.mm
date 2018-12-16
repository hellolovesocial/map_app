#import <Foundation/Foundation.h>

extern "C" {
    void ruby_init(void);
    void ruby_init_loadpath(void);
    void ruby_script(const char *);
    void *rb_vm_top_self(void);
    void rb_define_global_const(const char *, void *);
    void rb_rb2oc_exc_handler(void);
    void ruby_init_device_repl(void);
void MREP_A42438AC9B5F4F0FADCD9A9F268E3E01(void *, void *);
void MREP_02A69AAABE9048BFA67E9B5878248C32(void *, void *);
void MREP_188610475F0D4121BEDE658742F530C4(void *, void *);
void MREP_AAA04FBA02EF48DC8CE6E1CCD63FB4A9(void *, void *);
void MREP_415960843D9F42E2851EDDB41BE12D2F(void *, void *);
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
MREP_A42438AC9B5F4F0FADCD9A9F268E3E01(self, 0);
MREP_02A69AAABE9048BFA67E9B5878248C32(self, 0);
MREP_188610475F0D4121BEDE658742F530C4(self, 0);
MREP_AAA04FBA02EF48DC8CE6E1CCD63FB4A9(self, 0);
MREP_415960843D9F42E2851EDDB41BE12D2F(self, 0);
#if !__LP64__
	}
	catch (...) {
	    rb_rb2oc_exc_handler();
	}
#endif
	initialized = true;
    }
}
