# This file was automatically generated on Thu 15 Nov 2018 14:29:01 GMT from
# source: /home/hgv27681/R3.14.12.7/support/pmac/etc/makeIocs/lab.xml
# 
# *** Please do not edit this file: edit the source file instead. ***
# 
TOP = ../..
include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE

#----------------------------------------------------
#  Optimization of db files using dbst (DEFAULT: NO)
#DB_OPT = YES

#----------------------------------------------------
# Create and install (or just install) into <top>/db
# databases, templates, substitutions like this
DB += pmac.db
DB += gpio.db
DB += gpio.template
DB += basic_asyn_motor.template
DB += dls_pmac_asyn_motor.template
DB += dls_pmac_cs_asyn_motor.template

#DB_INSTALLS += $(PMAC)/db/dls_pmac_asyn_motor.template
#DB_INSTALLS += $(PMAC)/db/dls_pmac_cs_asyn_motor.template
DB_INSTALLS += $(PMAC)/db/motor_in_cs.template
DB_INSTALLS += $(PMAC)/db/eloss_kill_autohome_records.template
DB_INSTALLS += $(PMAC)/db/pmacDirectMotor.template
DB_INSTALLS += $(PMAC)/db/pmacController.template
DB_INSTALLS += $(PMAC)/db/powerPmacStatus.template
DB_INSTALLS += $(PMAC)/db/pmacStatusAxis.template
DB_INSTALLS += $(PMAC)/db/pmacVariableWrite.template

include $(TOP)/configure/RULES


