# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{10..11} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1

SRC_URI="https://github.com/nwg-piotr/nwg-displays/archive/v${PV}.tar.gz -> ${P}.tar.gz"
KEYWORDS="~amd64"

DESCRIPTION="Output management utility for sway and Hyprland"
HOMEPAGE="https://github.com/nwg-piotr/nwg-displays"
LICENSE="MIT"

SLOT="0"

RDEPEND="
	gui-apps/wlr-randr
	x11-libs/gtk+:3
"
DEPEND="${RDEPEND}"
