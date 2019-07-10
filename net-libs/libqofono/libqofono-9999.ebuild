# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6

inherit git-r3 qmake-utils


EGIT_REPO_URI="https://git.merproject.org/mer-core/libqofono"
EGIT_BRANCH="master"

DESCRIPTION="A library for accessing the ofono daemon, and a declarative plugin for it."
HOMEPAGE="https://git.merproject.org/mer-core/libqofono"

SRC_URI=""

LICENSE="GPL3"
KEYWORDS=""
IUSE=""
SLOT="0"

DEPEND="
    dev-qt/qtdbus
	dev-qt/qtdeclarative
	dev-qt/qtxmlpatterns
	net-misc/ofono
"

src_prepare() {
    default
	eapply_user
}

src_configure() {
	eqmake5
}

src_install() {
    emake INSTALL_ROOT="${D}" install
}
