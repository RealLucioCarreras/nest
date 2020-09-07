# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DISTUTILS_USE_SETUPTOOLS=pyproject.toml
PYTHON_COMPAT=( python3_{6..8} )

inherit distutils-r1 eutils

DESCRIPTION="Validate configuration and produce human readable error messages"
HOMEPAGE="https://github.com/willmcgugan/rich"
SRC_URI="https://github.com/willmcgugan/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-python/colorama[${PYTHON_USEDEP}]
	dev-python/commonmark[${PYTHON_USEDEP}]
	dev-python/pygments[${PYTHON_USEDEP}]
	dev-python/typing-extensions[${PYTHON_USEDEP}]
	$(python_gen_cond_dep 'dev-python/dataclasses[${PYTHON_USEDEP}]' python3_6)"
DEPEND="${RDEPEND}"

distutils_enable_tests pytest

python_prepare_all() {
	# Build is done with poetry
	rm setup.py || die "rm failed"

	distutils-r1_python_prepare_all
}

pkg_postinst() {
	optfeature "integration with HTML widgets for Jupyter" dev-python/ipywidgets
}
