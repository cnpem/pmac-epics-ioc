TOP = ../..
include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = pmac
# pmac.dbd will be created and installed
DBD += pmac.dbd

# pmac.dbd will be made up from these files:
pmac_DBD += base.dbd

# Include dbd files from all support applications:
pmac_DBD += asyn.dbd
pmac_DBD += drvAsynPowerPMACPort.dbd
pmac_DBD += motorSupport.dbd
pmac_DBD += devSoftMotor.dbd
pmac_DBD += pmacAsynMotorPort.dbd
pmac_DBD += busySupport.dbd
pmac_DBD += calcSupport.dbd
pmac_DBD += asSupport.dbd
pmac_DBD += caPutLog.dbd

# Add all the support libraries needed by this IOC
pmac_LIBS += calc
pmac_LIBS += busy
pmac_LIBS += pmacAsynMotorPort
pmac_LIBS += softMotor
pmac_LIBS += motor
pmac_LIBS += powerPmacAsynPort
pmac_LIBS += asyn
pmac_LIBS += autosave
pmac_LIBS += caPutLog

# pmac_registerRecordDeviceDriver.cpp derives from pmac.dbd
pmac_SRCS += pmac_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
pmac_SRCS_DEFAULT += pmacMain.cpp
pmac_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#pmac_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
pmac_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE
