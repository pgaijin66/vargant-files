#include <linux/bpf.h>
#include <linux/ptrace.h>
#include <bcc/proto.h>

int kprobe__sys_clone(void *ctx) {
    bpf_trace_printk("Hello, World!\n");
    return 0;
}