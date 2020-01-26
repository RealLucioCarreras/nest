# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CABAL_FEATURES="lib profile haddock hoogle hscolour test-suite"

inherit haskell-cabal

DESCRIPTION="Network byte order utilities"
HOMEPAGE="https://github.com/kazu-yamamoto/network-byte-order"
SRC_URI="https://hackage.haskell.org/package/${P}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=dev-lang/ghc-7.10.1:="
DEPEND="${RDEPEND}"
BDEPEND=">=dev-haskell/cabal-1.22.2.0
	test? ( dev-haskell/doctest:=[profile?] )"
