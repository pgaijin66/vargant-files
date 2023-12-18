#!/usr/bin/env python3

from bcc import BPF
from pathlib import Path


bpf_source = Path('main.c').read_text()
bpf = BPF(text=bpf_source).trace_print()

