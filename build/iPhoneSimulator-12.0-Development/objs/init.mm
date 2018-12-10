#import <Foundation/Foundation.h>

extern "C" {
    void ruby_init(void);
    void ruby_init_loadpath(void);
    void ruby_script(const char *);
    void *rb_vm_top_self(void);
    void rb_define_global_const(const char *, void *);
    void rb_rb2oc_exc_handler(void);
    void ruby_init_device_repl(void);
void MREP_76514CE91BC646C28D07F3BA60618CEF(void *, void *);
void MREP_6389AF9F2E804EEDA088E6C590C817C4(void *, void *);
void MREP_6BB580BF489B4DDFA0BCF5537095FF92(void *, void *);
void MREP_B9CF41D167DD4C98852F7427B9FCF1A4(void *, void *);
void MREP_74764806292C4809A6D8D0372F96FD02(void *, void *);
int rm_repl_port = 50584;
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
rb_define_global_const("RUBYMOTION_VERSION", @"5.14");
MREP_76514CE91BC646C28D07F3BA60618CEF(self, 0);
MREP_6389AF9F2E804EEDA088E6C590C817C4(self, 0);
MREP_6BB580BF489B4DDFA0BCF5537095FF92(self, 0);
MREP_B9CF41D167DD4C98852F7427B9FCF1A4(self, 0);
MREP_74764806292C4809A6D8D0372F96FD02(self, 0);
#if !__LP64__
	}
	catch (...) {
	    rb_rb2oc_exc_handler();
	}
#endif
	initialized = true;
    }
}
