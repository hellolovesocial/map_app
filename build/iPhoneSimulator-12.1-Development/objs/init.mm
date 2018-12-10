#import <Foundation/Foundation.h>

extern "C" {
    void ruby_init(void);
    void ruby_init_loadpath(void);
    void ruby_script(const char *);
    void *rb_vm_top_self(void);
    void rb_define_global_const(const char *, void *);
    void rb_rb2oc_exc_handler(void);
    void ruby_init_device_repl(void);
void MREP_767651074E5346868102E9715B15110F(void *, void *);
void MREP_F099F76D4D214F0DB7CD37F4E48B0190(void *, void *);
void MREP_A5BC9F52BD9E4ACEA2A15262FB493DD5(void *, void *);
void MREP_D285AE6611A640D9A0D0F292D37FEA05(void *, void *);
void MREP_DAB04659BAB04CCDA51A101CF835D4BB(void *, void *);
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
MREP_767651074E5346868102E9715B15110F(self, 0);
MREP_F099F76D4D214F0DB7CD37F4E48B0190(self, 0);
MREP_A5BC9F52BD9E4ACEA2A15262FB493DD5(self, 0);
MREP_D285AE6611A640D9A0D0F292D37FEA05(self, 0);
MREP_DAB04659BAB04CCDA51A101CF835D4BB(self, 0);
#if !__LP64__
	}
	catch (...) {
	    rb_rb2oc_exc_handler();
	}
#endif
	initialized = true;
    }
}
