# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "ENC_TERC4" -parent ${Page_0}
  ipgui::add_param $IPINST -name "ENC_TMDS" -parent ${Page_0}
  ipgui::add_param $IPINST -name "GOING_T4" -parent ${Page_0}
  ipgui::add_param $IPINST -name "GOING_VID" -parent ${Page_0}
  ipgui::add_param $IPINST -name "HDCP_OFF" -parent ${Page_0}
  ipgui::add_param $IPINST -name "HDCP_ON" -parent ${Page_0}
  ipgui::add_param $IPINST -name "INIT" -parent ${Page_0}
  ipgui::add_param $IPINST -name "LEAVE_T4" -parent ${Page_0}
  ipgui::add_param $IPINST -name "PREAM_T4" -parent ${Page_0}
  ipgui::add_param $IPINST -name "PREAM_VID" -parent ${Page_0}
  ipgui::add_param $IPINST -name "TERC4" -parent ${Page_0}
  ipgui::add_param $IPINST -name "VIDEO" -parent ${Page_0}
  ipgui::add_param $IPINST -name "nSTATES" -parent ${Page_0}


}

proc update_PARAM_VALUE.ENC_TERC4 { PARAM_VALUE.ENC_TERC4 } {
	# Procedure called to update ENC_TERC4 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.ENC_TERC4 { PARAM_VALUE.ENC_TERC4 } {
	# Procedure called to validate ENC_TERC4
	return true
}

proc update_PARAM_VALUE.ENC_TMDS { PARAM_VALUE.ENC_TMDS } {
	# Procedure called to update ENC_TMDS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.ENC_TMDS { PARAM_VALUE.ENC_TMDS } {
	# Procedure called to validate ENC_TMDS
	return true
}

proc update_PARAM_VALUE.GOING_T4 { PARAM_VALUE.GOING_T4 } {
	# Procedure called to update GOING_T4 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.GOING_T4 { PARAM_VALUE.GOING_T4 } {
	# Procedure called to validate GOING_T4
	return true
}

proc update_PARAM_VALUE.GOING_VID { PARAM_VALUE.GOING_VID } {
	# Procedure called to update GOING_VID when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.GOING_VID { PARAM_VALUE.GOING_VID } {
	# Procedure called to validate GOING_VID
	return true
}

proc update_PARAM_VALUE.HDCP_OFF { PARAM_VALUE.HDCP_OFF } {
	# Procedure called to update HDCP_OFF when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.HDCP_OFF { PARAM_VALUE.HDCP_OFF } {
	# Procedure called to validate HDCP_OFF
	return true
}

proc update_PARAM_VALUE.HDCP_ON { PARAM_VALUE.HDCP_ON } {
	# Procedure called to update HDCP_ON when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.HDCP_ON { PARAM_VALUE.HDCP_ON } {
	# Procedure called to validate HDCP_ON
	return true
}

proc update_PARAM_VALUE.INIT { PARAM_VALUE.INIT } {
	# Procedure called to update INIT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.INIT { PARAM_VALUE.INIT } {
	# Procedure called to validate INIT
	return true
}

proc update_PARAM_VALUE.LEAVE_T4 { PARAM_VALUE.LEAVE_T4 } {
	# Procedure called to update LEAVE_T4 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.LEAVE_T4 { PARAM_VALUE.LEAVE_T4 } {
	# Procedure called to validate LEAVE_T4
	return true
}

proc update_PARAM_VALUE.PREAM_T4 { PARAM_VALUE.PREAM_T4 } {
	# Procedure called to update PREAM_T4 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.PREAM_T4 { PARAM_VALUE.PREAM_T4 } {
	# Procedure called to validate PREAM_T4
	return true
}

proc update_PARAM_VALUE.PREAM_VID { PARAM_VALUE.PREAM_VID } {
	# Procedure called to update PREAM_VID when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.PREAM_VID { PARAM_VALUE.PREAM_VID } {
	# Procedure called to validate PREAM_VID
	return true
}

proc update_PARAM_VALUE.TERC4 { PARAM_VALUE.TERC4 } {
	# Procedure called to update TERC4 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.TERC4 { PARAM_VALUE.TERC4 } {
	# Procedure called to validate TERC4
	return true
}

proc update_PARAM_VALUE.VIDEO { PARAM_VALUE.VIDEO } {
	# Procedure called to update VIDEO when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.VIDEO { PARAM_VALUE.VIDEO } {
	# Procedure called to validate VIDEO
	return true
}

proc update_PARAM_VALUE.nSTATES { PARAM_VALUE.nSTATES } {
	# Procedure called to update nSTATES when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.nSTATES { PARAM_VALUE.nSTATES } {
	# Procedure called to validate nSTATES
	return true
}


proc update_MODELPARAM_VALUE.INIT { MODELPARAM_VALUE.INIT PARAM_VALUE.INIT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.INIT}] ${MODELPARAM_VALUE.INIT}
}

proc update_MODELPARAM_VALUE.GOING_T4 { MODELPARAM_VALUE.GOING_T4 PARAM_VALUE.GOING_T4 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.GOING_T4}] ${MODELPARAM_VALUE.GOING_T4}
}

proc update_MODELPARAM_VALUE.TERC4 { MODELPARAM_VALUE.TERC4 PARAM_VALUE.TERC4 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.TERC4}] ${MODELPARAM_VALUE.TERC4}
}

proc update_MODELPARAM_VALUE.LEAVE_T4 { MODELPARAM_VALUE.LEAVE_T4 PARAM_VALUE.LEAVE_T4 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.LEAVE_T4}] ${MODELPARAM_VALUE.LEAVE_T4}
}

proc update_MODELPARAM_VALUE.GOING_VID { MODELPARAM_VALUE.GOING_VID PARAM_VALUE.GOING_VID } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.GOING_VID}] ${MODELPARAM_VALUE.GOING_VID}
}

proc update_MODELPARAM_VALUE.VIDEO { MODELPARAM_VALUE.VIDEO PARAM_VALUE.VIDEO } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.VIDEO}] ${MODELPARAM_VALUE.VIDEO}
}

proc update_MODELPARAM_VALUE.PREAM_T4 { MODELPARAM_VALUE.PREAM_T4 PARAM_VALUE.PREAM_T4 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.PREAM_T4}] ${MODELPARAM_VALUE.PREAM_T4}
}

proc update_MODELPARAM_VALUE.PREAM_VID { MODELPARAM_VALUE.PREAM_VID PARAM_VALUE.PREAM_VID } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.PREAM_VID}] ${MODELPARAM_VALUE.PREAM_VID}
}

proc update_MODELPARAM_VALUE.nSTATES { MODELPARAM_VALUE.nSTATES PARAM_VALUE.nSTATES } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.nSTATES}] ${MODELPARAM_VALUE.nSTATES}
}

proc update_MODELPARAM_VALUE.ENC_TMDS { MODELPARAM_VALUE.ENC_TMDS PARAM_VALUE.ENC_TMDS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.ENC_TMDS}] ${MODELPARAM_VALUE.ENC_TMDS}
}

proc update_MODELPARAM_VALUE.ENC_TERC4 { MODELPARAM_VALUE.ENC_TERC4 PARAM_VALUE.ENC_TERC4 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.ENC_TERC4}] ${MODELPARAM_VALUE.ENC_TERC4}
}

proc update_MODELPARAM_VALUE.HDCP_OFF { MODELPARAM_VALUE.HDCP_OFF PARAM_VALUE.HDCP_OFF } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.HDCP_OFF}] ${MODELPARAM_VALUE.HDCP_OFF}
}

proc update_MODELPARAM_VALUE.HDCP_ON { MODELPARAM_VALUE.HDCP_ON PARAM_VALUE.HDCP_ON } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.HDCP_ON}] ${MODELPARAM_VALUE.HDCP_ON}
}

