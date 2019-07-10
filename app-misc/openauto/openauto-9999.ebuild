# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6

inherit git-r3 cmake-utils


EGIT_REPO_URI="https://github.com/redglasses/openauto.git"
EGIT_BRANCH="master"

DESCRIPTION="AndroidAuto headunit emulator"
HOMEPAGE="https://github.com/f1xpl/openauto.git"

SRC_URI=""

LICENSE="GPL3"
KEYWORDS=""
IUSE="rpi3"
SLOT="0"

DEPEND="
    dev-libs/aasdk
    dev-qt/qtbluetooth
    dev-qt/qtmultimedia[widgets]
    dev-qt/qtwidgets
    media-sound/pulseaudio
    media-plugins/gst-plugins-libav
    media-libs/rtaudio
    "
src_prepare() {
	eapply_user
}

src_configure() {
    local mycmakeargs=(
        -DCMAKE_BUILD_TYPE=Release
		-DBCM_HOST_LIBRARIES="/usr/lib64/libbcm_host.so"
		-DILCLIENT_LIBRARIES="/usr/lib64/libilclient.a"
		-DVCOS_LIBRARIES="/usr/lib64/libvcos.so"
		-DVCILCS_LIBRARIES="/usr/lib/libvcilcs.a"
		-DVCHIQ_ARM_LIBRARIES="/usr/lib64/libvchiq_arm.so"
        -DAASDK_INCLUDE_DIRS="/usr/include"
        -DAASDK_LIBRARIES="/usr/lib64/libaasdk.so"
        -DAASDK_PROTO_INCLUDE_DIRS="/usr/include"
        -DAASDK_PROTO_LIBRARIES="/usr/lib64/libaasdk_proto.so"
    )
	if use rpi3 ; then
	    mycmakeargs="${mycmakeargs} -DRPI3_BUILD"
	fi
    cmake-utils_src_configure
}

src_compile() {
    cmake-utils_src_compile
}

src_install() {
    dobin bin/autoapp
    dobin bin/btservice
}

pkg_postinst() {
    elog "******************************"
	elog "This is not Gentoo maintained ebuild, please do not fill bugs in gentoo bugzilla"
    elog "******************************"
    elog "For Device detection enable genthree overlay and emerge dev-util/android-udev-rules"
    elog "***"
    elog "eselect repository enable genthree"
    elog "emerge dev-util/android-udev-rules"
    elog "***"
}