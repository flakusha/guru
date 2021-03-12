# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

DESCRIPTION="Qt plugin for HEIF images"
HOMEPAGE="https://github.com/jakar/qt-heif-image-plugin"
SRC_URI="https://github.com/jakar/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
	dev-qt/qtcore
	dev-qt/qtgui
	>=media-libs/libheif-1.10.0:0=[libde265]
"
DEPEND="${RDEPEND}"
BDEPEND="virtual/pkgconfig"

PATCHES=( "${FILESDIR}/${P}_RGB88.patch" )
