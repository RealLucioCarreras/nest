# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CABAL_FEATURES="lib profile haddock hoogle hscolour test-suite"

inherit haskell-cabal

DESCRIPTION="Common lower-level functions needed by various streaming data libraries"
HOMEPAGE="https://github.com/fpco/streaming-commons"
SRC_URI="https://hackage.haskell.org/package/${P}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-haskell/async:=[profile?]
	dev-haskell/network:=[profile?]
	dev-haskell/random:=[profile?]
	dev-haskell/stm:=[profile?]
	dev-haskell/text:=[profile?]
	dev-haskell/zlib:=[profile?]
	>=dev-lang/ghc-7.10.1:="
DEPEND="${RDEPEND}"
BDEPEND=">=dev-haskell/cabal-1.22.2.0:=[profile?]
	test? ( >=dev-haskell/hspec-1.8:=[profile?]
		dev-haskell/quickcheck:2=[profile?] )"
