# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	addr2line-0.15.2
	adler-1.0.2
	aho-corasick-0.7.15
	ansi_term-0.12.1
	anyhow-1.0.45
	arc-swap-0.4.8
	arrayvec-0.5.2
	async-channel-1.6.1
	async-executor-1.4.1
	async-global-executor-2.0.2
	async-io-1.6.0
	async-lock-2.4.0
	async-mutex-1.4.0
	async-process-1.2.0
	async-std-1.10.0
	async-task-4.0.3
	async-trait-0.1.51
	atomic-waker-1.0.0
	atty-0.2.14
	autocfg-1.1.0
	backtrace-0.3.59
	base64-0.13.0
	bincode-1.3.3
	bitflags-1.3.2
	blocking-1.0.2
	boxfnonce-0.1.1
	bumpalo-3.8.0
	byteorder-1.4.3
	cache-padded-1.1.1
	cassowary-0.3.0
	cc-1.0.71
	cfg-if-0.1.10
	cfg-if-1.0.0
	chrono-0.4.19
	clap-3.0.10
	clap_complete-3.0.4
	clap_derive-3.0.6
	close_fds-0.3.2
	colored-2.0.0
	colorsys-0.6.5
	concurrent-queue-1.2.2
	console-0.14.1
	console-0.15.0
	core-foundation-sys-0.8.3
	cranelift-bforest-0.68.0
	cranelift-codegen-0.68.0
	cranelift-codegen-meta-0.68.0
	cranelift-codegen-shared-0.68.0
	cranelift-entity-0.68.0
	cranelift-frontend-0.68.0
	crc32fast-1.2.1
	crossbeam-0.8.1
	crossbeam-channel-0.5.1
	crossbeam-deque-0.8.1
	crossbeam-epoch-0.9.5
	crossbeam-queue-0.3.2
	crossbeam-utils-0.8.5
	ctor-0.1.21
	daemonize-0.4.1
	darling-0.13.0
	darling_core-0.13.0
	darling_macro-0.13.0
	derivative-2.2.0
	dialoguer-0.9.0
	directories-next-2.0.0
	dirs-2.0.2
	dirs-sys-0.3.6
	dirs-sys-next-0.1.2
	dtoa-0.4.8
	either-1.6.1
	encode_unicode-0.3.6
	enumset-1.0.8
	enumset_derive-0.5.5
	erased-serde-0.3.16
	event-listener-2.5.1
	fallible-iterator-0.2.0
	fastrand-1.5.0
	fnv-1.0.7
	form_urlencoded-1.0.1
	fuchsia-cprng-0.1.1
	futures-0.3.17
	futures-channel-0.3.17
	futures-core-0.3.17
	futures-executor-0.3.17
	futures-io-0.3.17
	futures-lite-1.12.0
	futures-macro-0.3.17
	futures-sink-0.3.17
	futures-task-0.3.17
	futures-util-0.3.17
	generational-arena-0.2.8
	getopts-0.2.21
	getrandom-0.1.16
	getrandom-0.2.3
	ghost-0.1.2
	gimli-0.22.0
	gimli-0.24.0
	gloo-timers-0.2.1
	hashbrown-0.11.2
	heck-0.3.3
	heck-0.4.0
	hermit-abi-0.1.19
	highway-0.6.4
	humantime-2.1.0
	ident_case-1.0.1
	idna-0.2.3
	indexmap-1.7.0
	insta-1.8.0
	instant-0.1.12
	interprocess-1.1.1
	intmap-0.7.0
	inventory-0.1.10
	inventory-impl-0.1.10
	itoa-0.4.8
	js-sys-0.3.55
	kv-log-macro-1.0.7
	lazy_static-1.4.0
	leb128-0.2.5
	lev_distance-0.1.0
	libc-0.2.112
	libloading-0.6.7
	libssh2-sys-0.2.23
	libz-sys-1.1.3
	linked-hash-map-0.5.4
	lock_api-0.4.5
	log-0.4.14
	log-mdc-0.1.0
	log4rs-1.0.0
	mach-0.3.2
	matches-0.1.9
	memchr-2.4.1
	memmap2-0.2.3
	memoffset-0.6.4
	miniz_oxide-0.4.4
	mio-0.7.14
	miow-0.3.7
	more-asserts-0.2.1
	names-0.11.0
	nix-0.19.1
	nom-5.1.2
	ntapi-0.3.6
	num-integer-0.1.44
	num-traits-0.2.14
	num_cpus-1.13.0
	numtoa-0.1.0
	object-0.22.0
	object-0.24.0
	once_cell-1.8.0
	openssl-sys-0.9.70
	ordered-float-2.8.0
	os_str_bytes-6.0.0
	parking-2.0.0
	parking_lot-0.11.2
	parking_lot_core-0.8.5
	percent-encoding-2.1.0
	phf-0.8.0
	phf_codegen-0.8.0
	phf_generator-0.8.0
	phf_shared-0.8.0
	pin-project-lite-0.2.7
	pin-utils-0.1.0
	pkg-config-0.3.22
	polling-2.1.0
	ppv-lite86-0.2.15
	pretty-bytes-0.2.2
	proc-macro-error-1.0.4
	proc-macro-error-attr-1.0.4
	proc-macro-hack-0.5.19
	proc-macro-nested-0.1.7
	proc-macro2-1.0.32
	quote-1.0.10
	rand-0.3.23
	rand-0.4.6
	rand-0.7.3
	rand-0.8.4
	rand_chacha-0.2.2
	rand_chacha-0.3.1
	rand_core-0.3.1
	rand_core-0.4.2
	rand_core-0.5.1
	rand_core-0.6.3
	rand_hc-0.2.0
	rand_hc-0.3.1
	rand_pcg-0.2.1
	rayon-1.5.1
	rayon-core-1.9.1
	rdrand-0.4.0
	redox_syscall-0.1.57
	redox_syscall-0.2.10
	redox_termios-0.1.2
	redox_users-0.4.0
	regalloc-0.0.31
	regex-1.4.6
	regex-syntax-0.6.25
	region-2.2.0
	remove_dir_all-0.5.3
	rustc-demangle-0.1.21
	rustc-hash-1.1.0
	ryu-1.0.5
	scopeguard-1.1.0
	serde-1.0.130
	serde-value-0.7.0
	serde_bytes-0.11.5
	serde_derive-1.0.130
	serde_json-1.0.69
	serde_yaml-0.8.21
	signal-hook-0.3.10
	signal-hook-registry-1.4.0
	similar-1.3.0
	siphasher-0.3.7
	slab-0.4.5
	smallvec-1.7.0
	socket2-0.4.2
	spinning-0.1.0
	ssh2-0.9.3
	stable_deref_trait-1.2.0
	strip-ansi-escapes-0.1.1
	strsim-0.10.0
	strum-0.20.0
	strum_macros-0.20.1
	suggestion-0.1.0
	syn-1.0.81
	sysinfo-0.22.5
	target-lexicon-0.11.2
	tempfile-3.2.0
	termcolor-1.1.2
	terminal_size-0.1.17
	terminfo-0.7.3
	termion-1.5.6
	textwrap-0.14.2
	thiserror-1.0.30
	thiserror-impl-1.0.30
	thread-id-3.3.0
	time-0.1.44
	tinyvec-1.5.0
	tinyvec_macros-0.1.0
	tracing-0.1.29
	tracing-attributes-0.1.18
	tracing-core-0.1.21
	traitobject-0.1.0
	typemap-0.3.3
	typetag-0.1.7
	typetag-impl-0.1.7
	unicode-bidi-0.3.7
	unicode-normalization-0.1.19
	unicode-segmentation-1.8.0
	unicode-width-0.1.9
	unicode-xid-0.2.2
	unsafe-any-0.4.2
	url-2.2.2
	utf8parse-0.2.0
	uuid-0.8.2
	value-bag-1.0.0-alpha.8
	vcpkg-0.2.15
	version_check-0.9.3
	vte-0.10.1
	vte_generate_state_changes-0.1.1
	waker-fn-1.1.0
	wasi-0.9.0+wasi-snapshot-preview1
	wasi-0.10.0+wasi-snapshot-preview1
	wasm-bindgen-0.2.78
	wasm-bindgen-backend-0.2.78
	wasm-bindgen-futures-0.4.28
	wasm-bindgen-macro-0.2.78
	wasm-bindgen-macro-support-0.2.78
	wasm-bindgen-shared-0.2.78
	wasmer-1.0.2
	wasmer-compiler-1.0.2
	wasmer-compiler-cranelift-1.0.2
	wasmer-derive-1.0.2
	wasmer-engine-1.0.2
	wasmer-engine-jit-1.0.2
	wasmer-engine-native-1.0.2
	wasmer-object-1.0.2
	wasmer-types-1.0.2
	wasmer-vm-1.0.2
	wasmer-wasi-1.0.2
	wasmparser-0.65.0
	wast-38.0.1
	wat-1.0.40
	web-sys-0.3.55
	wepoll-ffi-0.1.2
	which-4.2.2
	winapi-0.3.9
	winapi-i686-pc-windows-gnu-0.4.0
	winapi-util-0.1.5
	winapi-x86_64-pc-windows-gnu-0.4.0
	yaml-rust-0.4.5
	zeroize-1.4.3
"

inherit cargo xdg-utils desktop optfeature

DESCRIPTION="A terminal workspace with batteries included"
HOMEPAGE="https://github.com/zellij-org/zellij"
SRC_URI="
	https://github.com/zellij-org/zellij/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	$(cargo_crate_uris)
"
LICENSE="
	|| ( Apache-2.0 MIT )
	|| ( Apache-2.0 MIT )
	|| ( Apache-2.0 MIT MPL-2.0 )
	|| ( MIT )
	|| ( MIT Unlicense )
	|| ( BSD )
	|| ( BSD-2 )
	||
	Apache-2.0
	MIT
	Unlicense
	MPL-2.0
	BSD
	BSD-2
"
SLOT="0"
KEYWORDS="~amd64"
IUSE="bash-completion fish-completion zsh-completion doc examples"
REQUIRED_USE="|| ( bash-completion fish-completion zsh-completion )"

DEPEND="
	bash-completion? (
		app-shells/bash
	)
	fish-completion? (
		app-shells/fish
	)
	zsh-completion? (
		app-shells/zsh
	)
	dev-lang/rust
"
BDEPEND="
	$DEPEND
"
RDEPEND="
	$DEPEND
	!x11-wm/$PN-bin
"

QA_FLAGS_IGNORED="usr/bin/.*"

src_compile() {
	cargo_src_compile
}

src_install() {
	dobin target/release/"$PN"

	if use examples; then
		insinto "/usr/share/zellij/layouts/"
		doins -r assets/example/layouts/*
	fi


	insinto "/usr/share/zellij/plugins/"
	doins-r assets/plugins/*


	if use bash-completion; then
		insinto "usr/share/bash-completion/completions/"
		doins assets/completions/zellij.bash
	fi

	if use fish-completion; then
		insinto usr/share/fish/vendor_completions.d/
		doins assets/completions/zellij.fish
	fi

	if use zsh-completion; then
		insinto usr/share/zsh/vendor-completions/
		use zsh && doins assets/completions/_zellij
	fi


	#insinto /usr/share/xsessions/
	#doins assets/zellij.desktop

	use doc && dodoc README.md GOVERNANCE.md
}

pkg_postinst() {
	elog "Read the documentation for $PN at <https://zellij.dev/documentation>"
	elog "for usage, customization and other instructions"
	optfeature "Emerge nerdfonts for best experience" 
	xdg_desktop_database_update
}

pkg_postrm() {
	xdg_desktop_database_update
}
