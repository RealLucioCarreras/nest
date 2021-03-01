# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

EGIT_REPO_URI="https://github.com/tsujan/${PN}.git"

inherit git-r3 qmake-utils xdg

DESCRIPTION="Lightweight Qt5 plain-text editor"
HOMEPAGE="https://github.com/tsujan/FeatherPad"
SRC_URI=""

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE="X"

RDEPEND="app-text/hunspell:=
	dev-qt/qtcore:5
	dev-qt/qtgui:5
	dev-qt/qtnetwork:5
	dev-qt/qtprintsupport:5
	dev-qt/qtwidgets:5
	X? ( dev-qt/qtx11extras:5 )"
DEPEND="${RDEPEND}
	dev-qt/qtsvg:5"
BDEPEND="dev-qt/linguist-tools:5"

src_configure() {
	eqmake5 WITHOUT_X11="$(usex X NO YES)"
}

src_install() {
	einstalldocs
	emake INSTALL_ROOT="${ED}" install
}
