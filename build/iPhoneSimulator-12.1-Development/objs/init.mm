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
void MREP_B3BA6C3C29504883A1261752202E0324(void *, void *);
void MREP_B65B7B9EB913432BB14BA30AEC990640(void *, void *);
void MREP_3B088A88E9C54619A66CEF62E3741766(void *, void *);
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
MREP_B3BA6C3C29504883A1261752202E0324(self, 0);
MREP_B65B7B9EB913432BB14BA30AEC990640(self, 0);
MREP_3B088A88E9C54619A66CEF62E3741766(self, 0);
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
