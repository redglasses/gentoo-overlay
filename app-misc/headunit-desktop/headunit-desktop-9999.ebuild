# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6

inherit git-r3 qmake-utils


EGIT_REPO_URI="https://github.com/viktorgino/headunit-desktop.git"
EGIT_BRANCH="master"

DESCRIPTION="HeadUnit Desktop is a car PC software built with Qt 5 and QML"
HOMEPAGE="https://github.com/viktorgino/headunit-desktop.git"

SRC_URI=""

LICENSE="GPL3"
KEYWORDS=""
IUSE=""
SLOT="0"

DEPEND="
    dev-libs/boost
    dev-libs/libusb
	dev-libs/protobuf
    dev-qt/qtbluetooth[qml]
	dev-qt/qtcharts
    dev-qt/qtdeclarative
	dev-qt/qtgraphicaleffects
    dev-qt/qtmultimedia[qml,widgets]
	dev-qt/qtquickcontrols
    dev-qt/qtwidgets
	gnome-base/gconf
	kde-frameworks/bluez-qt
	media-libs/faad2
	media-libs/gst-plugins-bad
	media-libs/libcanberra
	media-libs/mesa
	media-libs/taglib
    media-plugins/gst-plugins-libav
    media-plugins/gst-plugins-pulse
    media-plugins/gst-plugins-omx
	media-sound/pulseaudio[bluetooth]
    net-libs/libqofono
	net-wireless/bluez[obex]
	net-wireless/rtl-sdr
	sci-libs/fftw
	sys-libs/zlib
    "
src_prepare() {
    default
	eapply_user
	protoc --proto_path=modules/android-auto/headunit/hu/ --cpp_out=modules/android-auto/headunit/hu/generated.x64/ modules/android-auto/headunit/hu/hu.proto
}

src_configure() {
	eqmake5 PREFIX="${EPREFIX}/usr/${PN}"
}

src_install() {
	emake INSTALL_ROOT="${EPREFIX}/usr/${PN}" install
}
