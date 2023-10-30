#!../../bin/linux-x86_64/pmac

< envPaths

cd "${TOP}"

## Register all support components
dbLoadDatabase "dbd/pmac.dbd"
pmac_registerRecordDeviceDriver pdbbase

# Setup BL (BeamLine)! It is used in GPIO substitutions
epicsEnvSet("BL", "COI:A:PB02")
epicsEnvSet("IOCNAME", "COI-A-PB02")

# Delta Tau setup
epicsEnvSet("PPMAC_IP", "10.20.56.17")
epicsEnvSet("PPMAC_SSH_PORT", "BRICK1port")
epicsEnvSet("PPMAC_PORT", "Brick")
epicsEnvSet("PPMAC_CS1_PORT", "CS1")
epicsEnvSet("PPMAC_CS2_PORT", "CS2")
epicsEnvSet("EPICS_DB_INCLUDE_PATH", "$(TOP)/db")

# Attach to the SSH port
#drvAsynPowerPMACPortConfigure(port_name, host_address, username, password, priority, noAutoConnect, noProcessEos)
drvAsynPowerPMACPortConfigure("$(PPMAC_SSH_PORT)", "$(PPMAC_IP)", "root", "deltatau", "0", "0", "0")

#### Trace functions (works with asyn.dbd) #####

### asynSetTraceMask
# x1: ERROR, x2: IO, x4: FILTER, x8: DRIVER_IO, x10: FLOW, x20: WARNING
#asynSetTraceMask("BRICK1port", -1, 0x2)

### asynSetTraceIOMask
# x1: ASCII, x2: ESCAPE, x4: HEX
#asynSetTraceIOMask("BRICK1port", -1, 0x1)

### asynSetTraceInfoMask(
# x1: TIME (default), x2: PORT (port, addr, reason), x4: SOURCE (file, lineno), x8: THREAD (thread_id)
#asynSetTraceInfoMask("BRICK1port", -1, 0x1)

### asynSetTraceFile
# logfilename (in $TOP)
#asynSetTraceFile("BRICK1port", -1, "temp.log")

#### end Trace functions ######

# Configure Model 3 controller driver
# powerPmacCreateController(controller_port, low_level_port, address, axes, moving_poll, idle_poll)
pmacCreateController("$(PPMAC_PORT)", "$(PPMAC_SSH_PORT)", 0 , 4, 100, 100)

# Create the Model 3 motion axis drivers
#pmacCreateAxes(controller_port, axis_count)
pmacCreateAxes("$(PPMAC_PORT)", 4)

# Set up for running coordinate system
#pmacCreateCS(coordinate_system_port, controller_port_name, coordinate_system_number, motion_program_number)
pmacCreateCS("$(PPMAC_CS1_PORT)", "$(PPMAC_PORT)", 1, 1)
pmacCreateCS("$(PPMAC_CS2_PORT)", "$(PPMAC_PORT)", 2, 1)

# Create the coordinate system axes
#pmacCreateCSAxes(coordinate_system_port, num_coordinate_system_axes)
pmacCreateCSAxis("$(PPMAC_CS1_PORT)", 7)
pmacCreateCSAxis("$(PPMAC_CS1_PORT)", 8)
pmacCreateCSAxis("$(PPMAC_CS2_PORT)", 7)
pmacCreateCSAxis("$(PPMAC_CS2_PORT)", 8)

# Define coordinate step resolution
#pmacSetCoordStepsPerUnit(coordinate_system_port, cs_axis, counts_per_egu)
pmacSetCoordStepsPerUnit("$(PPMAC_CS1_PORT)", 7, 1)
pmacSetCoordStepsPerUnit("$(PPMAC_CS1_PORT)", 8, 1)
pmacSetCoordStepsPerUnit("$(PPMAC_CS2_PORT)", 7, 1)
pmacSetCoordStepsPerUnit("$(PPMAC_CS2_PORT)", 8, 1)

#pmacDebug("$(PPMAC_PORT)",1, 0, 4);

## Load record instances
dbLoadRecords("db/gpio.db", "P=$(BL)")

cd "${TOP}/iocBoot/${IOC}"

dbLoadTemplate("pmac.substitutions")

iocInit

