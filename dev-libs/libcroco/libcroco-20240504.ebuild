# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake-multilib

DESCRIPTION="Generic Cascading Style Sheet (CSS) parsing and manipulation toolkit"
HOMEPAGE="https://gitlab.com/inkscape/libcroco"
SRC_URI="https://dev.gentoo.org/~dilfridge/distfiles/${P}.tar.xz"

LICENSE="LGPL-2"
SLOT="0.6"
#KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~ia64 ~loong ~m68k ~mips ~ppc ~ppc64 ~s390 ~sparc ~x86 ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x64-solaris"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="
	>=dev-libs/glib-2.34.3:2[${MULTILIB_USEDEP}]
	>=dev-libs/libxml2-2.9.1-r4[${MULTILIB_USEDEP}]
"
DEPEND="${RDEPEND}"
BDEPEND="
	dev-build/gtk-doc-am
	virtual/pkgconfig
"

S=${WORKDIR}/${PN}

PATCHES=(
	"${FILESDIR}/${P}-install.patch"
)

src_configure() {
	# bug #855704
	append-flags -fno-strict-aliasing
	filter-lto

	cmake-multilib_src_configure
}
