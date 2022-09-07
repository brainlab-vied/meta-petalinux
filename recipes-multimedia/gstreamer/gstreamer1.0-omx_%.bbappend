BRANCH = "xlnx-rebase-v1.18.5"
REPO   = "git://github.com/Xilinx/gst-omx.git;protocol=https"

BRANCHARG = "${@['nobranch=1', 'branch=${BRANCH}'][d.getVar('BRANCH') != '']}"

PV = "1.18.5+git${SRCPV}"

SRC_URI = " \
	${REPO};${BRANCHARG};name=gst-omx \
"

SRCREV_gst-omx = "0aa11eaf4175c1731970f1c410d9857acbff65e9"
SRCREV_FORMAT = "gst-omx"

S = "${WORKDIR}/git"


RDEPENDS_${PN}_append_zynqmp = " libomxil-xlnx"
DEPENDS_append_zynqmp = " libomxil-xlnx"

EXTRA_OECONF_append_zynqmp =  " --with-omx-header-path=${STAGING_INCDIR}/vcu-omx-il"
EXTRA_OEMESON += " -Dheader_path=${STAGING_INCDIR}/vcu-omx-il"

GSTREAMER_1_0_OMX_TARGET_zynqmp ?= "zynqultrascaleplus"
GSTREAMER_1_0_OMX_CORE_NAME_zynqmp ?= "${libdir}/libOMX.allegro.core.so.1"

PACKAGE_ARCH_zynqmp = "${SOC_FAMILY_ARCH}"
