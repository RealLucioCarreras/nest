# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6
MY_PN="${PN/_/-}"
MY_P="${MY_PN}-${PV}"

inherit linux-mod toolchain-funcs git-r3

DESCRIPTION="Ratelimit iptables module"
HOMEPAGE="https://github.com/aabc/${MY_PN}"
EGIT_REPO_URI="https://github.com/aabc/${MY_PN}.git"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE="debug"

RDEPEND="
	net-firewall/iptables
"
DEPEND="${RDEPEND}
	virtual/linux-sources
	virtual/pkgconfig
"
S="${WORKDIR}/${MY_P}"

pkg_setup() {
	MODULE_NAMES="xt_ratelimit(ipt_ratelimit)"
	IPT_LIB="/usr/$(get_libdir)/xtables"
	linux-mod_pkg_setup
}

src_prepare() {
	sed -i \
		-e 's:make -C:$(MAKE) -C:g' \
		-e 's:gcc -O2:$(CC) $(CFLAGS) $(LDFLAGS):' \
		-e 's:gcc:$(CC) $(CFLAGS) $(LDFLAGS):' \
		Makefile || die "sed in Makefile failed"

	if ! use debug; then
		sed 's/CFLAGS_xt_ratelimit.o := -DDEBUG//' \
			-i Makefile || die "sed for debug failed"
	fi

	default
}

src_compile() {
	emake ARCH="$(tc-arch-kernel)" CC="$(tc-getCC)" all
}

src_install() {
	linux-mod_src_install
	exeinto "${IPT_LIB}"
	doexe libxt_ratelimit.so
	doheader xt_ratelimit.h
}
