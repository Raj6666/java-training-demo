CREATE ALIAS next_id FOR "com.richstonedt.gempile.core.common.H2IdGenerator.generate";

-- ----------------------------
-- Table structure for gem_abnormal_reasons
-- ----------------------------
DROP TABLE IF EXISTS  "gem_abnormal_reasons";
CREATE TABLE  "gem_abnormal_reasons" (
"id" varchar DEFAULT next_id() PRIMARY KEY,
"abnormal_type_id" varchar,
"name" varchar  ,
"abnormal_reason_code" int4
)
;

-- ----------------------------
-- Table structure for gem_abnormal_types
-- ----------------------------
DROP TABLE IF EXISTS  "gem_abnormal_types";
CREATE TABLE  "gem_abnormal_types" (
"id" varchar DEFAULT next_id() PRIMARY KEY,
"name" varchar ,
"abnormal_type_code" int4,
"network_interface" varchar
)
;

DROP TABLE IF EXISTS gem_application_type_mapping CASCADE;

CREATE TABLE gem_application_type_mapping
(
   id                varchar   DEFAULT next_id() NOT NULL,
   intsid1           varchar,
   intwruleid        varchar,
   intaruleid        varchar,
   service_sub_name  varchar,
   service_name      varchar
);

ALTER TABLE gem_application_type_mapping
   ADD CONSTRAINT gem_application_type_mapping_pkey
   PRIMARY KEY (id);

COMMENT ON COLUMN gem_application_type_mapping.intsid1 IS '网站一级业务ID';
COMMENT ON COLUMN gem_application_type_mapping.intwruleid IS '网站识别ID';
COMMENT ON COLUMN gem_application_type_mapping.intaruleid IS 'APP识别ID';
COMMENT ON COLUMN gem_application_type_mapping.service_sub_name IS '应用小类中文名称';
COMMENT ON COLUMN gem_application_type_mapping.service_name IS '应用大类中文名称';

COMMIT;

-- ----------------------------
-- Table structure for gem_auto_alert_indicator_dimensions
-- ----------------------------
DROP TABLE IF EXISTS  "gem_auto_alert_indicator_dimensions";
CREATE TABLE  "gem_auto_alert_indicator_dimensions" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"indicator_id" varchar  ,
"network_interface" varchar  ,
"dimension_name" varchar
)
;

-- ----------------------------
-- Table structure for gem_auto_alert_indicator_rules
-- ----------------------------
DROP TABLE IF EXISTS  "gem_auto_alert_indicator_rules";
CREATE TABLE  "gem_auto_alert_indicator_rules" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"name" varchar  ,
"type_id" varchar  ,
"parameter" varchar  ,
"level1_first_relational_operator" varchar  ,
"level1_first_threshold" int4,
"level2_first_relational_operator" varchar  ,
"level2_first_threshold" int4,
"level3_first_relational_operator" varchar  ,
"level3_first_threshold" int4,
"unit" varchar  ,
"dimension_values" varchar  ,
"dimension_name" varchar  ,
"network_interface" varchar  ,
"modified_time" timestamp(6),
"interval" varchar  ,
"is_active" boolean,
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP(),
"rule_name" varchar
)
;

-- ----------------------------
-- Table structure for gem_auto_alert_indicators
-- ----------------------------
DROP TABLE IF EXISTS  "gem_auto_alert_indicators";
CREATE TABLE  "gem_auto_alert_indicators" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"name" varchar  ,
"parameter" varchar  ,
"parent_id" varchar  ,
"level" int4,
"network_interface" varchar
)
;

-- ----------------------------
-- Table structure for gem_auto_alert_records_15m_statistics
-- ----------------------------
DROP TABLE IF EXISTS  "gem_auto_alert_records_15m_statistics";
CREATE TABLE  "gem_auto_alert_records_15m_statistics" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"rule_id" varchar  ,
"dimension_value" varchar  ,
"dimension_name" varchar  ,
"network_interface" varchar  ,
"datetime" timestamp(6),
"modified_time" timestamp(6),
"alert_level" int4,
"alert_frequency" int4,
"is_active" int4,
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP(),
"operation_type" varchar  ,
"cancelable" boolean DEFAULT true
)
;

-- ----------------------------
-- Table structure for gem_auto_alert_records_30m_statistics
-- ----------------------------
DROP TABLE IF EXISTS  "gem_auto_alert_records_30m_statistics";
CREATE TABLE  "gem_auto_alert_records_30m_statistics" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"rule_id" varchar  ,
"dimension_value" varchar  ,
"dimension_name" varchar  ,
"network_interface" varchar  ,
"datetime" timestamp(6),
"modified_time" timestamp(6),
"alert_level" int4,
"alert_frequency" int4,
"is_active" int4,
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP(),
"operation_type" varchar  ,
"cancelable" BOOLEAN DEFAULT TRUE
)
;

-- ----------------------------
-- Table structure for gem_auto_alert_records_5m_statistics
-- ----------------------------
DROP TABLE IF EXISTS  "gem_auto_alert_records_5m_statistics";
CREATE TABLE  "gem_auto_alert_records_5m_statistics" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"rule_id" varchar  ,
"dimension_value" varchar  ,
"dimension_name" varchar  ,
"network_interface" varchar  ,
"datetime" timestamp(6),
"modified_time" timestamp(6),
"alert_level" int4,
"alert_frequency" int4,
"is_active" int4,
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP(),
"operation_type" varchar  ,
"cancelable" BOOLEAN DEFAULT TRUE
)
;

-- ----------------------------
-- Table structure for gem_auto_alert_s1_mme_kpi_15m_statistics
-- ----------------------------
DROP TABLE IF EXISTS  "gem_auto_alert_s1_mme_kpi_15m_statistics";
CREATE TABLE  "gem_auto_alert_s1_mme_kpi_15m_statistics" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"whole_network" varchar  ,
"mme_code" varchar  ,
"mme_group_id" varchar  ,
"enodeb_id" varchar  ,
"cell_id" varchar  ,
"tac" varchar  ,
"datetime" timestamp(6),
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP(),
"eps_attach_success_ratio" numeric,
"eps_attach_timedelay" int8,
"combined_attach_success_ratio" numeric,
"authentication_success_ratio" numeric,
"authentication_timedelay" int8,
"security_success_ratio" numeric,
"security_timedelay" int8,
"default_eps_bear_success_ratio" numeric,
"ue_pdn_success_ratio" numeric,
"service_request_success_ratio" numeric,
"service_request_establish_timedelay" int8,
"service_request_authentication_success_ratio" numeric,
"service_request_authentication_timedelay" int8,
"service_request_security_success_ratio" numeric,
"service_request_security_timedelay" int8,
"service_request_uecontext_release_timedelay" int8,
"paging_success_ratio" numeric,
"paging_timedelay" int8,
"ps_paging_success_ratio" numeric,
"ps_paging_timedelay" int8,
"cs_paging_success_ratio" numeric,
"cs_paging_timedelay" int8,
"imsi_paging_success_ratio" numeric,
"tmsi_paging_success_ratio" numeric,
"extended_service_request_success_ratio" numeric,
"extended_service_request_establish_timedelay" int8,
"extended_service_request_authentication_success_ratio" numeric,
"extended_service_request_authentication_timedelay" int8,
"extended_service_request_security_success_ratio" numeric,
"extended_service_request_security_timedelay" int8,
"extended_service_request_uecontext_release_timedelay" int8,
"original_service_success_ratio" numeric,
"original_service_timedelay" int8,
"original_service_authentication_success_ratio" numeric,
"original_service_authentication_timedelay" int8,
"original_service_security_success_ratio" numeric,
"original_service_security_timedelay" int8,
"original_service_uecontext_release_timedelay" int8,
"terminal_service_success_ratio" numeric,
"terminal_service_timedelay" int8,
"terminal_service_authentication_success_ratio" numeric,
"terminal_service_authentication_timedelay" int8,
"terminal_service_security_success_ratio" numeric,
"terminal_service_security_timedelay" int8,
"terminal_service_uecontext_release_timedelay" int8,
"emergency_service_success_ratio" numeric,
"emergency_service_timedelay" int8,
"e_rab_establish_success_ratio" numeric,
"e_rab_establish_timedelay" int8,
"e_rab_modify_success_ratio" numeric,
"e_rab_modify_timedelay" int8,
"e_rab_release_success_ratio" numeric,
"e_rab_release_timedelay" int8,
"dedicated_eps_bear_success_ratio" numeric,
"eps_bear_modify_success_ratio" numeric,
"eps_bear_deactivation_success_ratio" numeric,
"eps_bear_resource_allocation_success_ratio" numeric,
"eps_bear_resource_modify_success_ratio" numeric,
"pdn_disconnect_success_ratio" numeric,
"ue_detach_success_ratio" numeric,
"ue_detach_timedelay" int8,
"network_detach_success_ratio" numeric,
"network_detach_timedelay" int8,
"tau_success_ratio" numeric,
"tau_timedelay" int8,
"cycle_tau_success_ratio" numeric,
"cycle_tau_timedelay" int8,
"tau_authentication_success_ratio" numeric,
"tau_authentication_timedelay" int8,
"tau_security_success_ratio" numeric,
"tau_security_timedelay" int8,
"combined_tau_success_ratio" numeric,
"combined_imsi_tau_success_ratio" numeric,
"s1_handover_out_timedelay" int8,
"s1_handover_out_success_ratio" numeric,
"s1_handover_in_timedelay" int8,
"s1_handover_in_success_ratio" numeric,
"x2_handover_timedelay" int8,
"x2_handover_success_ratio" numeric,
"s1_l2u_handover_out_success_ratio" numeric,
"s1_l2u_handover_out_timedelay" int8,
"s1_l2g_handover_out_timedelay" int8,
"s1_l2g_handover_out_success_ratio" numeric,
"s1_u2l_handover_in_success_ratio" numeric,
"s1_u2l_handover_in_timedelay" int8,
"s1_g2l_handover_in_success_ratio" numeric,
"s1_g2l_handover_in_timedelay" int8,
"reset_success_ratio" numeric,
"s1_setup_success_ratio" numeric,
"enb_configuration_update_success_ratio" numeric,
"mme_configuration_update_success_ratio" numeric,
"sms_success_ratio" numeric,
"sms_timedelay" int8,
"sms_send_success_ratio" numeric,
"sms_send_timedelay" int8,
"sms_receive_success_ratio" numeric,
"sms_receive_timedelay" int8,
"csfb_original_success_ratio" numeric,
"csfb_original_authenticationg_success_ratio" numeric,
"csfb_original_authentication_timedelay" int8,
"csfb_original_securityg_success_ratio" numeric,
"csfb_original_security_timedelay" int8,
"csfb_terminal_success_ratio" numeric,
"csfb_terminal_authenticationg_success_ratio" numeric,
"csfb_terminal_authentication_timedelay" int8,
"csfb_terminal_securityg_success_ratio" numeric,
"csfb_terminal_security_timedelay" int8,
"csfb_emergency_success_ratio" numeric
)
;
-- ----------------------------
-- Table structure for gem_auto_alert_s1_mme_kpi_30m_statistics
-- ----------------------------
DROP TABLE IF EXISTS  "gem_auto_alert_s1_mme_kpi_30m_statistics";
CREATE TABLE  "gem_auto_alert_s1_mme_kpi_30m_statistics" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"whole_network" varchar  ,
"mme_code" varchar  ,
"mme_group_id" varchar  ,
"enodeb_id" varchar  ,
"cell_id" varchar  ,
"tac" varchar  ,
"datetime" timestamp(6),
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP(),
"eps_attach_success_ratio" numeric,
"eps_attach_timedelay" int8,
"combined_attach_success_ratio" numeric,
"authentication_success_ratio" numeric,
"authentication_timedelay" int8,
"security_success_ratio" numeric,
"security_timedelay" int8,
"default_eps_bear_success_ratio" numeric,
"ue_pdn_success_ratio" numeric,
"service_request_success_ratio" numeric,
"service_request_establish_timedelay" int8,
"service_request_authentication_success_ratio" numeric,
"service_request_authentication_timedelay" int8,
"service_request_security_success_ratio" numeric,
"service_request_security_timedelay" int8,
"service_request_uecontext_release_timedelay" int8,
"paging_success_ratio" numeric,
"paging_timedelay" int8,
"ps_paging_success_ratio" numeric,
"ps_paging_timedelay" int8,
"cs_paging_success_ratio" numeric,
"cs_paging_timedelay" int8,
"imsi_paging_success_ratio" numeric,
"tmsi_paging_success_ratio" numeric,
"extended_service_request_success_ratio" numeric,
"extended_service_request_establish_timedelay" int8,
"extended_service_request_authentication_success_ratio" numeric,
"extended_service_request_authentication_timedelay" int8,
"extended_service_request_security_success_ratio" numeric,
"extended_service_request_security_timedelay" int8,
"extended_service_request_uecontext_release_timedelay" int8,
"original_service_success_ratio" numeric,
"original_service_timedelay" int8,
"original_service_authentication_success_ratio" numeric,
"original_service_authentication_timedelay" int8,
"original_service_security_success_ratio" numeric,
"original_service_security_timedelay" int8,
"original_service_uecontext_release_timedelay" int8,
"terminal_service_success_ratio" numeric,
"terminal_service_timedelay" int8,
"terminal_service_authentication_success_ratio" numeric,
"terminal_service_authentication_timedelay" int8,
"terminal_service_security_success_ratio" numeric,
"terminal_service_security_timedelay" int8,
"terminal_service_uecontext_release_timedelay" int8,
"emergency_service_success_ratio" numeric,
"emergency_service_timedelay" int8,
"e_rab_establish_success_ratio" numeric,
"e_rab_establish_timedelay" int8,
"e_rab_modify_success_ratio" numeric,
"e_rab_modify_timedelay" int8,
"e_rab_release_success_ratio" numeric,
"e_rab_release_timedelay" int8,
"dedicated_eps_bear_success_ratio" numeric,
"eps_bear_modify_success_ratio" numeric,
"eps_bear_deactivation_success_ratio" numeric,
"eps_bear_resource_allocation_success_ratio" numeric,
"eps_bear_resource_modify_success_ratio" numeric,
"pdn_disconnect_success_ratio" numeric,
"ue_detach_success_ratio" numeric,
"ue_detach_timedelay" int8,
"network_detach_success_ratio" numeric,
"network_detach_timedelay" int8,
"tau_success_ratio" numeric,
"tau_timedelay" int8,
"cycle_tau_success_ratio" numeric,
"cycle_tau_timedelay" int8,
"tau_authentication_success_ratio" numeric,
"tau_authentication_timedelay" int8,
"tau_security_success_ratio" numeric,
"tau_security_timedelay" int8,
"combined_tau_success_ratio" numeric,
"combined_imsi_tau_success_ratio" numeric,
"s1_handover_out_timedelay" int8,
"s1_handover_out_success_ratio" numeric,
"s1_handover_in_timedelay" int8,
"s1_handover_in_success_ratio" numeric,
"x2_handover_timedelay" int8,
"x2_handover_success_ratio" numeric,
"s1_l2u_handover_out_success_ratio" numeric,
"s1_l2u_handover_out_timedelay" int8,
"s1_l2g_handover_out_timedelay" int8,
"s1_l2g_handover_out_success_ratio" numeric,
"s1_u2l_handover_in_success_ratio" numeric,
"s1_u2l_handover_in_timedelay" int8,
"s1_g2l_handover_in_success_ratio" numeric,
"s1_g2l_handover_in_timedelay" int8,
"reset_success_ratio" numeric,
"s1_setup_success_ratio" numeric,
"enb_configuration_update_success_ratio" numeric,
"mme_configuration_update_success_ratio" numeric,
"sms_success_ratio" numeric,
"sms_timedelay" int8,
"sms_send_success_ratio" numeric,
"sms_send_timedelay" int8,
"sms_receive_success_ratio" numeric,
"sms_receive_timedelay" int8,
"csfb_original_success_ratio" numeric,
"csfb_original_authenticationg_success_ratio" numeric,
"csfb_original_authentication_timedelay" int8,
"csfb_original_securityg_success_ratio" numeric,
"csfb_original_security_timedelay" int8,
"csfb_terminal_success_ratio" numeric,
"csfb_terminal_authenticationg_success_ratio" numeric,
"csfb_terminal_authentication_timedelay" int8,
"csfb_terminal_securityg_success_ratio" numeric,
"csfb_terminal_security_timedelay" int8,
"csfb_emergency_success_ratio" numeric
)
;

-- ----------------------------
-- Table structure for gem_auto_alert_s1_mme_kpi_5m_statistics
-- ----------------------------
DROP TABLE IF EXISTS  "gem_auto_alert_s1_mme_kpi_5m_statistics";
CREATE TABLE  "gem_auto_alert_s1_mme_kpi_5m_statistics" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"whole_network" varchar  ,
"mme_code" varchar  ,
"mme_group_id" varchar  ,
"enodeb_id" varchar  ,
"cell_id" varchar  ,
"tac" varchar  ,
"datetime" timestamp(6),
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP() ,
"eps_attach_success_ratio" numeric,
"eps_attach_timedelay" int8,
"combined_attach_success_ratio" numeric,
"authentication_success_ratio" numeric,
"authentication_timedelay" int8,
"security_success_ratio" numeric,
"security_timedelay" int8,
"default_eps_bear_success_ratio" numeric,
"ue_pdn_success_ratio" numeric,
"service_request_success_ratio" numeric,
"service_request_establish_timedelay" int8,
"service_request_authentication_success_ratio" numeric,
"service_request_authentication_timedelay" int8,
"service_request_security_success_ratio" numeric,
"service_request_security_timedelay" int8,
"service_request_uecontext_release_timedelay" int8,
"paging_success_ratio" numeric,
"paging_timedelay" int8,
"ps_paging_success_ratio" numeric,
"ps_paging_timedelay" int8,
"cs_paging_success_ratio" numeric,
"cs_paging_timedelay" int8,
"imsi_paging_success_ratio" numeric,
"tmsi_paging_success_ratio" numeric,
"extended_service_request_success_ratio" numeric,
"extended_service_request_establish_timedelay" int8,
"extended_service_request_authentication_success_ratio" numeric,
"extended_service_request_authentication_timedelay" int8,
"extended_service_request_security_success_ratio" numeric,
"extended_service_request_security_timedelay" int8,
"extended_service_request_uecontext_release_timedelay" int8,
"original_service_success_ratio" numeric,
"original_service_timedelay" int8,
"original_service_authentication_success_ratio" numeric,
"original_service_authentication_timedelay" int8,
"original_service_security_success_ratio" numeric,
"original_service_security_timedelay" int8,
"original_service_uecontext_release_timedelay" int8,
"terminal_service_success_ratio" numeric,
"terminal_service_timedelay" int8,
"terminal_service_authentication_success_ratio" numeric,
"terminal_service_authentication_timedelay" int8,
"terminal_service_security_success_ratio" numeric,
"terminal_service_security_timedelay" int8,
"terminal_service_uecontext_release_timedelay" int8,
"emergency_service_success_ratio" numeric,
"emergency_service_timedelay" int8,
"e_rab_establish_success_ratio" numeric,
"e_rab_establish_timedelay" int8,
"e_rab_modify_success_ratio" numeric,
"e_rab_modify_timedelay" int8,
"e_rab_release_success_ratio" numeric,
"e_rab_release_timedelay" int8,
"dedicated_eps_bear_success_ratio" numeric,
"eps_bear_modify_success_ratio" numeric,
"eps_bear_deactivation_success_ratio" numeric,
"eps_bear_resource_allocation_success_ratio" numeric,
"eps_bear_resource_modify_success_ratio" numeric,
"pdn_disconnect_success_ratio" numeric,
"ue_detach_success_ratio" numeric,
"ue_detach_timedelay" int8,
"network_detach_success_ratio" numeric,
"network_detach_timedelay" int8,
"tau_success_ratio" numeric,
"tau_timedelay" int8,
"cycle_tau_success_ratio" numeric,
"cycle_tau_timedelay" int8,
"tau_authentication_success_ratio" numeric,
"tau_authentication_timedelay" int8,
"tau_security_success_ratio" numeric,
"tau_security_timedelay" int8,
"combined_tau_success_ratio" numeric,
"combined_imsi_tau_success_ratio" numeric,
"s1_handover_out_timedelay" int8,
"s1_handover_out_success_ratio" numeric,
"s1_handover_in_timedelay" int8,
"s1_handover_in_success_ratio" numeric,
"x2_handover_timedelay" int8,
"x2_handover_success_ratio" numeric,
"s1_l2u_handover_out_success_ratio" numeric,
"s1_l2u_handover_out_timedelay" int8,
"s1_l2g_handover_out_timedelay" int8,
"s1_l2g_handover_out_success_ratio" numeric,
"s1_u2l_handover_in_success_ratio" numeric,
"s1_u2l_handover_in_timedelay" int8,
"s1_g2l_handover_in_success_ratio" numeric,
"s1_g2l_handover_in_timedelay" int8,
"reset_success_ratio" numeric,
"s1_setup_success_ratio" numeric,
"enb_configuration_update_success_ratio" numeric,
"mme_configuration_update_success_ratio" numeric,
"sms_success_ratio" numeric,
"sms_timedelay" int8,
"sms_send_success_ratio" numeric,
"sms_send_timedelay" int8,
"sms_receive_success_ratio" numeric,
"sms_receive_timedelay" int8,
"csfb_original_success_ratio" numeric,
"csfb_original_authenticationg_success_ratio" numeric,
"csfb_original_authentication_timedelay" int8,
"csfb_original_securityg_success_ratio" numeric,
"csfb_original_security_timedelay" int8,
"csfb_terminal_success_ratio" numeric,
"csfb_terminal_authenticationg_success_ratio" numeric,
"csfb_terminal_authentication_timedelay" int8,
"csfb_terminal_securityg_success_ratio" numeric,
"csfb_terminal_security_timedelay" int8,
"csfb_emergency_success_ratio" numeric
)
;

-- ----------------------------
-- Table structure for gem_auto_alert_s11_kpi_15m_statistics
-- ----------------------------
DROP TABLE IF EXISTS  "gem_auto_alert_s11_kpi_15m_statistics";
CREATE TABLE  "gem_auto_alert_s11_kpi_15m_statistics" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"whole_network" varchar  ,
"mme_code" varchar  ,
"cell_id" varchar  ,
"tac" varchar  ,
"sgw" varchar  ,
"pgw" varchar  ,
"apn" varchar  ,
"datetime" timestamp(6),
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP() ,
"session_establish_success_ratio" numeric,
"session_establish_timedelay" int8,
"session_delete_success_ratio" numeric,
"session_delete_timedelay" int8,
"bearer_creat_success_ratio" numeric,
"bearer_creat_timedelay" int8,
"bearer_modify_success_ratio" numeric,
"bearer_modify_timedelay" int8,
"bearer_modify_command_success_ratio" numeric,
"bearer_delete_command_success_ratio" numeric,
"bearer_resource_command_success_ratio" numeric,
"bearer_update_success_ratio" numeric,
"bearer_update_timedelay" int8,
"bearer_delete_success_ratio" numeric,
"bearer_delete_timedelay" int8,
"release_access_bearer_success_ratio" numeric,
"release_access_bearer_timedelay" int8,
"modify_access_bearer_success_ratio" numeric,
"modify_access_bearer_timedelay" int8,
"change_notification_success_ratio" numeric,
"change_notification_timedelay" int8,
"suspend_notification_success_ratio" numeric,
"suspend_notification_timedelay" int8,
"resume_notification_success_ratio" numeric,
"resume_notification_timedelay" int8,
"downlink_data_notification_success_ratio" numeric,
"downlink_data_notification_timedelay" int8,
"create_indirect_data_forward_tunnel_success_ratio" numeric,
"create_indirect_data_forward_tunnel_timedelay" int8,
"delete_indirect_data_forward_tunnel_success_ratio" numeric,
"delete_indirect_data_forward_tunnel_timedelay" int8,
"pgw_restart_notification_success_ratio" numeric,
"pgw_restart_notification_timedelay" int8,
"delete_pdn_connect_set_success_ratio" numeric,
"delete_pdn_connect_set_timedelay" int8
)
;

-- ----------------------------
-- Table structure for gem_auto_alert_s11_kpi_30m_statistics
-- ----------------------------
DROP TABLE IF EXISTS  "gem_auto_alert_s11_kpi_30m_statistics";
CREATE TABLE  "gem_auto_alert_s11_kpi_30m_statistics" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"whole_network" varchar  ,
"mme_code" varchar  ,
"cell_id" varchar  ,
"tac" varchar  ,
"sgw" varchar  ,
"pgw" varchar  ,
"apn" varchar  ,
"datetime" timestamp(6),
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP(),
"session_establish_success_ratio" numeric,
"session_establish_timedelay" int8,
"session_delete_success_ratio" numeric,
"session_delete_timedelay" int8,
"bearer_creat_success_ratio" numeric,
"bearer_creat_timedelay" int8,
"bearer_modify_success_ratio" numeric,
"bearer_modify_timedelay" int8,
"bearer_modify_command_success_ratio" numeric,
"bearer_delete_command_success_ratio" numeric,
"bearer_resource_command_success_ratio" numeric,
"bearer_update_success_ratio" numeric,
"bearer_update_timedelay" int8,
"bearer_delete_success_ratio" numeric,
"bearer_delete_timedelay" int8,
"release_access_bearer_success_ratio" numeric,
"release_access_bearer_timedelay" int8,
"modify_access_bearer_success_ratio" numeric,
"modify_access_bearer_timedelay" int8,
"change_notification_success_ratio" numeric,
"change_notification_timedelay" int8,
"suspend_notification_success_ratio" numeric,
"suspend_notification_timedelay" int8,
"resume_notification_success_ratio" numeric,
"resume_notification_timedelay" int8,
"downlink_data_notification_success_ratio" numeric,
"downlink_data_notification_timedelay" int8,
"create_indirect_data_forward_tunnel_success_ratio" numeric,
"create_indirect_data_forward_tunnel_timedelay" int8,
"delete_indirect_data_forward_tunnel_success_ratio" numeric,
"delete_indirect_data_forward_tunnel_timedelay" int8,
"pgw_restart_notification_success_ratio" numeric,
"pgw_restart_notification_timedelay" int8,
"delete_pdn_connect_set_success_ratio" numeric,
"delete_pdn_connect_set_timedelay" float8
)
;

-- ----------------------------
-- Table structure for gem_auto_alert_s11_kpi_5m_statistics
-- ----------------------------
DROP TABLE IF EXISTS  "gem_auto_alert_s11_kpi_5m_statistics";
CREATE TABLE  "gem_auto_alert_s11_kpi_5m_statistics" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"whole_network" varchar  ,
"mme_code" varchar  ,
"cell_id" varchar  ,
"tac" varchar  ,
"sgw" varchar  ,
"pgw" varchar  ,
"apn" varchar  ,
"datetime" timestamp(6),
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP(),
"session_establish_success_ratio" numeric,
"session_establish_timedelay" int8,
"session_delete_success_ratio" numeric,
"session_delete_timedelay" int8,
"bearer_creat_success_ratio" numeric,
"bearer_creat_timedelay" int8,
"bearer_modify_success_ratio" numeric,
"bearer_modify_timedelay" int8,
"bearer_modify_command_success_ratio" numeric,
"bearer_delete_command_success_ratio" numeric,
"bearer_resource_command_success_ratio" numeric,
"bearer_update_success_ratio" numeric,
"bearer_update_timedelay" int8,
"bearer_delete_success_ratio" numeric,
"bearer_delete_timedelay" int8,
"release_access_bearer_success_ratio" numeric,
"release_access_bearer_timedelay" int8,
"modify_access_bearer_success_ratio" numeric,
"modify_access_bearer_timedelay" int8,
"change_notification_success_ratio" numeric,
"change_notification_timedelay" int8,
"suspend_notification_success_ratio" numeric,
"suspend_notification_timedelay" int8,
"resume_notification_success_ratio" numeric,
"resume_notification_timedelay" int8,
"downlink_data_notification_success_ratio" numeric,
"downlink_data_notification_timedelay" int8,
"create_indirect_data_forward_tunnel_success_ratio" numeric,
"create_indirect_data_forward_tunnel_timedelay" int8,
"delete_indirect_data_forward_tunnel_success_ratio" numeric,
"delete_indirect_data_forward_tunnel_timedelay" int8,
"pgw_restart_notification_success_ratio" numeric,
"pgw_restart_notification_timedelay" int8,
"delete_pdn_connect_set_success_ratio" numeric,
"delete_pdn_connect_set_timedelay" int8
)
;

-- ----------------------------
-- Table structure for gem_auto_alert_s1u_dns_kpi_15m_statistics
-- ----------------------------
DROP TABLE IF EXISTS  "gem_auto_alert_s1u_dns_kpi_15m_statistics";
CREATE TABLE  "gem_auto_alert_s1u_dns_kpi_15m_statistics" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"whole_network" varchar  ,
"enodeb_id" varchar  ,
"cell_id" varchar  ,
"tac" varchar  ,
"sgw" varchar  ,
"dest_ip" varchar  ,
"datetime" timestamp(6),
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP(),
"tcp_link_timedelay" float8,
"dns_success_ratio" float8,
"dns_query_success_ratio" float8,
"dns_service_success_ratio" float8,
"dns_response_timedelay" float8,
"up_tcp_retrans_ratio" float8,
"dl_tcp_retrans_ratio" float8
);

-- ----------------------------
-- Table structure for gem_auto_alert_s1u_dns_kpi_30m_statistics
-- ----------------------------
DROP TABLE IF EXISTS  "gem_auto_alert_s1u_dns_kpi_30m_statistics";
CREATE TABLE  "gem_auto_alert_s1u_dns_kpi_30m_statistics" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"whole_network" varchar  ,
"enodeb_id" varchar  ,
"cell_id" varchar  ,
"tac" varchar  ,
"sgw" varchar  ,
"dest_ip" varchar  ,
"datetime" timestamp(6),
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP(),
"tcp_link_timedelay" float8,
"dns_success_ratio" float8,
"dns_query_success_ratio" float8,
"dns_service_success_ratio" float8,
"dns_response_timedelay" float8,
"up_tcp_retrans_ratio" float8,
"dl_tcp_retrans_ratio" float8
)
;

-- ----------------------------
-- Table structure for gem_auto_alert_s1u_dns_kpi_5m_statistics
-- ----------------------------
DROP TABLE IF EXISTS  "gem_auto_alert_s1u_dns_kpi_5m_statistics";
CREATE TABLE  "gem_auto_alert_s1u_dns_kpi_5m_statistics" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"whole_network" varchar  ,
"enodeb_id" varchar  ,
"cell_id" varchar  ,
"tac" varchar  ,
"sgw" varchar  ,
"dest_ip" varchar  ,
"datetime" timestamp(6),
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP(),
"tcp_link_timedelay" float8,
"dns_success_ratio" float8,
"dns_query_success_ratio" float8,
"dns_service_success_ratio" float8,
"dns_response_timedelay" float8,
"up_tcp_retrans_ratio" float8,
"dl_tcp_retrans_ratio" float8
)
;

-- ----------------------------
-- Table structure for gem_auto_alert_s1u_http_kpi_15m_statistics
-- ----------------------------
DROP TABLE IF EXISTS  "gem_auto_alert_s1u_http_kpi_15m_statistics";
CREATE TABLE  "gem_auto_alert_s1u_http_kpi_15m_statistics" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"whole_network" varchar  ,
"enodeb_id" varchar  ,
"cell_id" varchar  ,
"tac" varchar  ,
"sgw" varchar  ,
"dest_ip" varchar  ,
"datetime" timestamp(6),
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP(),
"wap1_connect_success_ratio" float8,
"tcp_link_timedelay" float8,
"http_success_ratio" float8,
"http_request_timedelay" float8,
"http_service_timedelay" float8,
"http_service_speed" float8,
"get_success_ratio" float8,
"get_resp_timedelay" float8,
"post_success_ratio" float8,
"post_resp_timedelay" float8,
"brower_service_success_ratio" float8,
"brower_service_resp_timedelay" float8,
"brower_service_dl_speed" float8,
"video_service_success_ratio" float8,
"video_service_resp_timedelay" float8,
"video_service_up_speed" float8,
"video_service_dl_speed" float8,
"ms_reading_success_ratio" float8,
"ms_reading_resp_timedelay" float8,
"ms_reading_up_speed" float8,
"ms_reading_dl_speed" float8,
"game_service_success_ratio" float8,
"game_service_resp_timedelay" float8,
"game_service_up_speed" float8,
"game_service_dl_speed" float8,
"ms_email_success_ratio" float8,
"ms_email_resp_timedelay" float8,
"ms_email_up_speed" float8,
"ms_email_dl_speed" float8,
"im_success_ratio" float8,
"im_resp_timedelay" float8,
"im_up_speed" float8,
"im_dl_speed" float8,
"email_139_success_ratio" float8,
"email_139_resp_timedelay" float8,
"email_139_up_speed" float8,
"email_139_dl_speed" float8,
"session_dl_speed1" float8,
"session_dl_speed2" float8,
"session_dl_speed3" float8,
"session_dl_speed4" float8,
"session_speed1" float8,
"session_speed2" float8,
"session_speed3" float8,
"session_speed4" float8,
"total_speed1" float8,
"total_speed2" float8,
"total_speed3" float8,
"up_tcp_retrans_ratio" float8,
"dl_tcp_retrans_ratio" float8
)
;

-- ----------------------------
-- Table structure for gem_auto_alert_s1u_http_kpi_30m_statistics
-- ----------------------------
DROP TABLE IF EXISTS  "gem_auto_alert_s1u_http_kpi_30m_statistics";
CREATE TABLE  "gem_auto_alert_s1u_http_kpi_30m_statistics" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"whole_network" varchar  ,
"enodeb_id" varchar  ,
"cell_id" varchar  ,
"tac" varchar  ,
"sgw" varchar  ,
"dest_ip" varchar  ,
"datetime" timestamp(6),
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP(),
"wap1_connect_success_ratio" float8,
"tcp_link_timedelay" float8,
"http_success_ratio" float8,
"http_request_timedelay" float8,
"http_service_timedelay" float8,
"http_service_speed" float8,
"get_success_ratio" float8,
"get_resp_timedelay" float8,
"post_success_ratio" float8,
"post_resp_timedelay" float8,
"brower_service_success_ratio" float8,
"brower_service_resp_timedelay" float8,
"brower_service_dl_speed" float8,
"video_service_success_ratio" float8,
"video_service_resp_timedelay" float8,
"video_service_up_speed" float8,
"video_service_dl_speed" float8,
"ms_reading_success_ratio" float8,
"ms_reading_resp_timedelay" float8,
"ms_reading_up_speed" float8,
"ms_reading_dl_speed" float8,
"game_service_success_ratio" float8,
"game_service_resp_timedelay" float8,
"game_service_up_speed" float8,
"game_service_dl_speed" float8,
"ms_email_success_ratio" float8,
"ms_email_resp_timedelay" float8,
"ms_email_up_speed" float8,
"ms_email_dl_speed" float8,
"im_success_ratio" float8,
"im_resp_timedelay" float8,
"im_up_speed" float8,
"im_dl_speed" float8,
"email_139_success_ratio" float8,
"email_139_resp_timedelay" float8,
"email_139_up_speed" float8,
"email_139_dl_speed" float8,
"session_dl_speed1" float8,
"session_dl_speed2" float8,
"session_dl_speed3" float8,
"session_dl_speed4" float8,
"session_speed1" float8,
"session_speed2" float8,
"session_speed3" float8,
"session_speed4" float8,
"total_speed1" float8,
"total_speed2" float8,
"total_speed3" float8,
"up_tcp_retrans_ratio" float8,
"dl_tcp_retrans_ratio" float8
)
;

-- ----------------------------
-- Table structure for gem_auto_alert_s1u_http_kpi_5m_statistics
-- ----------------------------
DROP TABLE IF EXISTS  "gem_auto_alert_s1u_http_kpi_5m_statistics";
CREATE TABLE  "gem_auto_alert_s1u_http_kpi_5m_statistics" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"whole_network" varchar  ,
"enodeb_id" varchar  ,
"cell_id" varchar  ,
"tac" varchar  ,
"sgw" varchar  ,
"dest_ip" varchar  ,
"datetime" timestamp(6),
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP(),
"wap1_connect_success_ratio" float8,
"tcp_link_timedelay" float8,
"http_success_ratio" float8,
"http_request_timedelay" float8,
"http_service_timedelay" float8,
"http_service_speed" float8,
"get_success_ratio" float8,
"get_resp_timedelay" float8,
"post_success_ratio" float8,
"post_resp_timedelay" float8,
"brower_service_success_ratio" float8,
"brower_service_resp_timedelay" float8,
"brower_service_dl_speed" float8,
"video_service_success_ratio" float8,
"video_service_resp_timedelay" float8,
"video_service_up_speed" float8,
"video_service_dl_speed" float8,
"ms_reading_success_ratio" float8,
"ms_reading_resp_timedelay" float8,
"ms_reading_up_speed" float8,
"ms_reading_dl_speed" float8,
"game_service_success_ratio" float8,
"game_service_resp_timedelay" float8,
"game_service_up_speed" float8,
"game_service_dl_speed" float8,
"ms_email_success_ratio" float8,
"ms_email_resp_timedelay" float8,
"ms_email_up_speed" float8,
"ms_email_dl_speed" float8,
"im_success_ratio" float8,
"im_resp_timedelay" float8,
"im_up_speed" float8,
"im_dl_speed" float8,
"email_139_success_ratio" float8,
"email_139_resp_timedelay" float8,
"email_139_up_speed" float8,
"email_139_dl_speed" float8,
"session_dl_speed1" float8,
"session_dl_speed2" float8,
"session_dl_speed3" float8,
"session_dl_speed4" float8,
"session_speed1" float8,
"session_speed2" float8,
"session_speed3" float8,
"session_speed4" float8,
"total_speed1" float8,
"total_speed2" float8,
"total_speed3" float8,
"up_tcp_retrans_ratio" float8,
"dl_tcp_retrans_ratio" float8
)
;

-- ----------------------------
-- Table structure for gem_auto_alert_s1u_kpi_15m_statistics
-- ----------------------------
DROP TABLE IF EXISTS  "gem_auto_alert_s1u_kpi_15m_statistics";
CREATE TABLE  "gem_auto_alert_s1u_kpi_15m_statistics" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"whole_network" varchar  ,
"enodeb_id" varchar  ,
"cell_id" varchar  ,
"tac" varchar  ,
"sgw" varchar  ,
"dest_ip" varchar  ,
"datetime" timestamp(6),
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP(),
"tcp_link_success_ratio" float8,
"tcp_link_confirm_success_ratio" float8,
"tcp_link_request_repeat_ratio" float8,
"tcp_link_response_timedelay" float8,
"tcp_link_confirm_timedelay" float8,
"tcp_link_timedelay" float8,
"mms_mo_success_ratio" float8,
"mms_mt_success_ratio" float8,
"up_tcp_retrans_ratio" float8,
"dl_tcp_retrans_ratio" float8
)
;

-- ----------------------------
-- Table structure for gem_auto_alert_s1u_kpi_30m_statistics
-- ----------------------------
DROP TABLE IF EXISTS  "gem_auto_alert_s1u_kpi_30m_statistics";
CREATE TABLE  "gem_auto_alert_s1u_kpi_30m_statistics" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"whole_network" varchar  ,
"enodeb_id" varchar  ,
"cell_id" varchar  ,
"tac" varchar  ,
"sgw" varchar  ,
"dest_ip" varchar  ,
"datetime" timestamp(6),
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP(),
"tcp_link_success_ratio" float8,
"tcp_link_confirm_success_ratio" float8,
"tcp_link_request_repeat_ratio" float8,
"tcp_link_response_timedelay" float8,
"tcp_link_confirm_timedelay" float8,
"tcp_link_timedelay" float8,
"mms_mo_success_ratio" float8,
"mms_mt_success_ratio" float8,
"up_tcp_retrans_ratio" float8,
"dl_tcp_retrans_ratio" float8
)
;

-- ----------------------------
-- Table structure for gem_auto_alert_s1u_kpi_5m_statistics
-- ----------------------------
DROP TABLE IF EXISTS  "gem_auto_alert_s1u_kpi_5m_statistics";
CREATE TABLE  "gem_auto_alert_s1u_kpi_5m_statistics" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"whole_network" varchar  ,
"enodeb_id" varchar  ,
"cell_id" varchar  ,
"tac" varchar  ,
"sgw" varchar  ,
"dest_ip" varchar  ,
"datetime" timestamp(6),
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP(),
"tcp_link_success_ratio" float8,
"tcp_link_confirm_success_ratio" float8,
"tcp_link_request_repeat_ratio" float8,
"tcp_link_response_timedelay" float8,
"tcp_link_confirm_timedelay" float8,
"tcp_link_timedelay" float8,
"mms_mo_success_ratio" float8,
"mms_mt_success_ratio" float8,
"up_tcp_retrans_ratio" float8,
"dl_tcp_retrans_ratio" float8
)
;

-- ----------------------------
-- Table structure for gem_auto_alert_s6a_kpi_15m_statistics
-- ----------------------------
DROP TABLE IF EXISTS  "gem_auto_alert_s6a_kpi_15m_statistics";
CREATE TABLE  "gem_auto_alert_s6a_kpi_15m_statistics" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"datetime" timestamp(6),
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP(),
"mme_code" varchar  ,
"hss" varchar  ,
"update_location_success_ratio" float8,
"update_location_timedelay" float8,
"cancel_location_success_ratio" float8,
"cancel_location_timedelay" float8,
"authentication_information_success_ratio" float8,
"authentication_information_timedelay" float8,
"insert_subscriber_success_ratio" float8,
"insert_subscriber_timedelay" float8,
"delete_subscriber_success_ratio" float8,
"delete_subscriber_timedelay" float8,
"purge_ue_success_ratio" float8,
"purge_ue_timedelay" float8,
"reset_success_ratio" float8,
"reset_timedelay" float8,
"notification_success_ratio" float8,
"notification_timedelay" float8
)
;


-- ----------------------------
-- Table structure for gem_auto_alert_s6a_kpi_30m_statistics
-- ----------------------------
DROP TABLE IF EXISTS  "gem_auto_alert_s6a_kpi_30m_statistics";
CREATE TABLE  "gem_auto_alert_s6a_kpi_30m_statistics" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"datetime" timestamp(6),
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP(),
"mme_code" varchar  ,
"hss" varchar  ,
"update_location_success_ratio" float8,
"update_location_timedelay" float8,
"cancel_location_success_ratio" float8,
"cancel_location_timedelay" float8,
"authentication_information_success_ratio" float8,
"authentication_information_timedelay" float8,
"insert_subscriber_success_ratio" float8,
"insert_subscriber_timedelay" float8,
"delete_subscriber_success_ratio" float8,
"delete_subscriber_timedelay" float8,
"purge_ue_success_ratio" float8,
"purge_ue_timedelay" float8,
"reset_success_ratio" float8,
"reset_timedelay" float8,
"notification_success_ratio" float8,
"notification_timedelay" float8
)
;

-- ----------------------------
-- Table structure for gem_auto_alert_s6a_kpi_5m_statistics
-- ----------------------------
DROP TABLE IF EXISTS  "gem_auto_alert_s6a_kpi_5m_statistics";
CREATE TABLE  "gem_auto_alert_s6a_kpi_5m_statistics" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"datetime" timestamp(6),
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP(),
"mme_code" varchar  ,
"hss" varchar  ,
"update_location_success_ratio" float8,
"update_location_timedelay" float8,
"cancel_location_success_ratio" float8,
"cancel_location_timedelay" float8,
"authentication_information_success_ratio" float8,
"authentication_information_timedelay" float8,
"insert_subscriber_success_ratio" float8,
"insert_subscriber_timedelay" float8,
"delete_subscriber_success_ratio" float8,
"delete_subscriber_timedelay" float8,
"purge_ue_success_ratio" float8,
"purge_ue_timedelay" float8,
"reset_success_ratio" float8,
"reset_timedelay" float8,
"notification_success_ratio" float8,
"notification_timedelay" float8
)
;

-- ----------------------------
-- Table structure for gem_auto_alert_sgs_kpi_15m_statistics
-- ----------------------------
DROP TABLE IF EXISTS  "gem_auto_alert_sgs_kpi_15m_statistics";
CREATE TABLE  "gem_auto_alert_sgs_kpi_15m_statistics" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"datetime" timestamp(6),
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP(),
"whole_network" varchar  ,
"mme_code" varchar  ,
"msc" varchar  ,
"tac" varchar  ,
"paging_success_ratio" float8,
"paging_timedelay" float8,
"cs_paging_success_ratio" float8,
"cs_paging_timedelay" float8,
"sms_paging_success_ratio" float8,
"sms_paging_timedelay" float8,
"sgsap_location_update_success_ratio" float8,
"sgsap_location_update_timedelay" float8,
"sgsap_alter_success_ratio" float8,
"sgsap_alter_timedelay" float8,
"sgsap_eps_detach_success_ratio" float8,
"sgsap_imsi_detach_success_ratio" float8,
"sgsap_ue_reset_success_ratio" float8,
"sms_success_ratio" float8,
"sms_timedelay" float8,
"sms_mo_success_ratio" float8,
"sms_mo_timedelay" float8,
"sms_mt_success_ratio" float8,
"sms_mt_timedelay" float8
)
;

-- ----------------------------
-- Table structure for gem_auto_alert_sgs_kpi_30m_statistics
-- ----------------------------
DROP TABLE IF EXISTS  "gem_auto_alert_sgs_kpi_30m_statistics";
CREATE TABLE  "gem_auto_alert_sgs_kpi_30m_statistics" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"datetime" timestamp(6),
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP(),
"whole_network" varchar  ,
"mme_code" varchar  ,
"msc" varchar  ,
"tac" varchar  ,
"paging_success_ratio" float8,
"paging_timedelay" float8,
"cs_paging_success_ratio" float8,
"cs_paging_timedelay" float8,
"sms_paging_success_ratio" float8,
"sms_paging_timedelay" float8,
"sgsap_location_update_success_ratio" float8,
"sgsap_location_update_timedelay" float8,
"sgsap_alter_success_ratio" float8,
"sgsap_alter_timedelay" float8,
"sgsap_eps_detach_success_ratio" float8,
"sgsap_imsi_detach_success_ratio" float8,
"sgsap_ue_reset_success_ratio" float8,
"sms_success_ratio" float8,
"sms_timedelay" float8,
"sms_mo_success_ratio" float8,
"sms_mo_timedelay" float8,
"sms_mt_success_ratio" float8,
"sms_mt_timedelay" float8
)
;

-- ----------------------------
-- Table structure for gem_auto_alert_sgs_kpi_5m_statistics
-- ----------------------------
DROP TABLE IF EXISTS  "gem_auto_alert_sgs_kpi_5m_statistics";
CREATE TABLE  "gem_auto_alert_sgs_kpi_5m_statistics" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"datetime" timestamp(6),
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP(),
"whole_network" varchar  ,
"mme_code" varchar  ,
"msc" varchar  ,
"tac" varchar  ,
"paging_success_ratio" float8,
"paging_timedelay" float8,
"cs_paging_success_ratio" float8,
"cs_paging_timedelay" float8,
"sms_paging_success_ratio" float8,
"sms_paging_timedelay" float8,
"sgsap_location_update_success_ratio" float8,
"sgsap_location_update_timedelay" float8,
"sgsap_alter_success_ratio" float8,
"sgsap_alter_timedelay" float8,
"sgsap_eps_detach_success_ratio" float8,
"sgsap_imsi_detach_success_ratio" float8,
"sgsap_ue_reset_success_ratio" float8,
"sms_success_ratio" float8,
"sms_timedelay" float8,
"sms_mo_success_ratio" float8,
"sms_mo_timedelay" float8,
"sms_mt_success_ratio" float8,
"sms_mt_timedelay" float8
)
;

-- ----------------------------
-- Table structure for gem_auto_alert_uu_kpi_15m_statistics
-- ----------------------------
DROP TABLE IF EXISTS  "gem_auto_alert_uu_kpi_15m_statistics";
CREATE TABLE  "gem_auto_alert_uu_kpi_15m_statistics" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"datetime" timestamp(6),
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP(),
"whole_network" varchar  ,
"mme_code" varchar  ,
"tac" varchar  ,
"paging_success_ratio" float8,
"paging_timedelay" int8,
"cspaging_success_ratio" float8,
"cspaging_timedelay" int8,
"pspaging_success_ratio" float8,
"pspaging_timedelay" int8,
"rrc_establish_success_ratio" float8,
"rrc_establish_timedelay" int8,
"rrc_emergency_establish_success_ratio" float8,
"rrc_emergency_establish_timedelay" int8,
"rrc_highpriorityaccess_establish_success_ratio" float8,
"rrc_highpriorityaccess_establish_timedelay" int8,
"rrc_establish_mt_access_success_ratio" float8,
"rrc_establish_mt_access_timedelay" int8,
"rrc_establish_mo_signal_success_ratio" float8,
"rrc_establish_mo_signal_timedelay" int8,
"rrc_establish_mo_data_success_ratio" float8,
"rrc_establish_mo_data_timedelay" int8,
"rrc_reestablish_success_ratio" float8,
"rrc_reestablish_timedelay" int8,
"rrc_reestablish_reconfigurationfailure_success_ratio" float8,
"rrc_reestablish_reconfigurationfailure_timedelay" int8,
"rrc_reestablish_handoverfailure_success_ratio" float8,
"rrc_reestablish_handoverfailure_timedelay" int8,
"rrc_reestablish_otherfailure_success_ratio" float8,
"rrc_reestablish_otherfailure_timedelay" int8,
"rrc_reconfiguration_success_ratio" float8,
"rrc_reconfiguration_timedelay" int8,
"countercheck_success_ratio" float8,
"countercheck_timedelay" int8,
"security_model_success_ratio" float8,
"security_model_timedelay" int8,
"ue_ability_qurey_success_ratio" float8,
"ue_ability_qurey_timedelay" int8,
"ue_information_success_ratio" float8,
"ue_information_timedelay" int8,
"handover_out_inter_systerm_success_ratio" float8,
"handover_in_inter_systerm_success_ratio" float8,
"handover_out_csfb_success_ratio" float8,
"cdma_csfb_parameter_response_ratio" float8,
"cdma_csfb_parameter_response_timedelay" int8,
"mbms_user_response_ratio" float8,
"mbms_user_response_timedelay" int8,
"rn_subframe_reconfiguration_ratio" float8,
"rn_subframe_reconfigurationt_imedelay" float8
)
;

-- ----------------------------
-- Table structure for gem_auto_alert_uu_kpi_30m_statistics
-- ----------------------------
DROP TABLE IF EXISTS  "gem_auto_alert_uu_kpi_30m_statistics";
CREATE TABLE  "gem_auto_alert_uu_kpi_30m_statistics" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"datetime" timestamp(6),
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP(),
"whole_network" varchar  ,
"mme_code" varchar  ,
"tac" varchar  ,
"paging_success_ratio" float8,
"paging_timedelay" int8,
"cspaging_success_ratio" float8,
"cspaging_timedelay" int8,
"pspaging_success_ratio" float8,
"pspaging_timedelay" int8,
"rrc_establish_success_ratio" float8,
"rrc_establish_timedelay" int8,
"rrc_emergency_establish_success_ratio" float8,
"rrc_emergency_establish_timedelay" int8,
"rrc_highpriorityaccess_establish_success_ratio" float8,
"rrc_highpriorityaccess_establish_timedelay" int8,
"rrc_establish_mt_access_success_ratio" float8,
"rrc_establish_mt_access_timedelay" int8,
"rrc_establish_mo_signal_success_ratio" float8,
"rrc_establish_mo_signal_timedelay" int8,
"rrc_establish_mo_data_success_ratio" float8,
"rrc_establish_mo_data_timedelay" int8,
"rrc_reestablish_success_ratio" float8,
"rrc_reestablish_timedelay" int8,
"rrc_reestablish_reconfigurationfailure_success_ratio" float8,
"rrc_reestablish_reconfigurationfailure_timedelay" int8,
"rrc_reestablish_handoverfailure_success_ratio" float8,
"rrc_reestablish_handoverfailure_timedelay" int8,
"rrc_reestablish_otherfailure_success_ratio" float8,
"rrc_reestablish_otherfailure_timedelay" int8,
"rrc_reconfiguration_success_ratio" float8,
"rrc_reconfiguration_timedelay" int8,
"countercheck_success_ratio" float8,
"countercheck_timedelay" int8,
"security_model_success_ratio" float8,
"security_model_timedelay" int8,
"ue_ability_qurey_success_ratio" float8,
"ue_ability_qurey_timedelay" int8,
"ue_information_success_ratio" float8,
"ue_information_timedelay" int8,
"handover_out_inter_systerm_success_ratio" float8,
"handover_in_inter_systerm_success_ratio" float8,
"handover_out_csfb_success_ratio" float8,
"cdma_csfb_parameter_response_ratio" float8,
"cdma_csfb_parameter_response_timedelay" int8,
"mbms_user_response_ratio" float8,
"mbms_user_response_timedelay" int8,
"rn_subframe_reconfiguration_ratio" float8,
"rn_subframe_reconfigurationt_imedelay" float8
)
;

-- ----------------------------
-- Table structure for gem_auto_alert_uu_kpi_5m_statistics
-- ----------------------------
DROP TABLE IF EXISTS  "gem_auto_alert_uu_kpi_5m_statistics";
CREATE TABLE  "gem_auto_alert_uu_kpi_5m_statistics" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"datetime" timestamp(6),
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP(),
"whole_network" varchar  ,
"mme_code" varchar  ,
"tac" varchar  ,
"paging_success_ratio" float8,
"paging_timedelay" int8,
"cspaging_success_ratio" float8,
"cspaging_timedelay" int8,
"pspaging_success_ratio" float8,
"pspaging_timedelay" int8,
"rrc_establish_success_ratio" float8,
"rrc_establish_timedelay" int8,
"rrc_emergency_establish_success_ratio" float8,
"rrc_emergency_establish_timedelay" int8,
"rrc_highpriorityaccess_establish_success_ratio" float8,
"rrc_highpriorityaccess_establish_timedelay" int8,
"rrc_establish_mt_access_success_ratio" float8,
"rrc_establish_mt_access_timedelay" int8,
"rrc_establish_mo_signal_success_ratio" float8,
"rrc_establish_mo_signal_timedelay" int8,
"rrc_establish_mo_data_success_ratio" float8,
"rrc_establish_mo_data_timedelay" int8,
"rrc_reestablish_success_ratio" float8,
"rrc_reestablish_timedelay" int8,
"rrc_reestablish_reconfigurationfailure_success_ratio" float8,
"rrc_reestablish_reconfigurationfailure_timedelay" int8,
"rrc_reestablish_handoverfailure_success_ratio" float8,
"rrc_reestablish_handoverfailure_timedelay" int8,
"rrc_reestablish_otherfailure_success_ratio" float8,
"rrc_reestablish_otherfailure_timedelay" int8,
"rrc_reconfiguration_success_ratio" float8,
"rrc_reconfiguration_timedelay" int8,
"countercheck_success_ratio" float8,
"countercheck_timedelay" int8,
"security_model_success_ratio" float8,
"security_model_timedelay" int8,
"ue_ability_qurey_success_ratio" float8,
"ue_ability_qurey_timedelay" int8,
"ue_information_success_ratio" float8,
"ue_information_timedelay" int8,
"handover_out_inter_systerm_success_ratio" float8,
"handover_in_inter_systerm_success_ratio" float8,
"handover_out_csfb_success_ratio" float8,
"cdma_csfb_parameter_response_ratio" float8,
"cdma_csfb_parameter_response_timedelay" int8,
"mbms_user_response_ratio" float8,
"mbms_user_response_timedelay" int8,
"rn_subframe_reconfiguration_ratio" float8,
"rn_subframe_reconfigurationt_imedelay" float8
);

-- ----------------------------
-- Table structure for gem_business_map
-- ----------------------------
DROP TABLE IF EXISTS  "gem_business_map";
CREATE TABLE  "gem_business_map" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"exam_service_oid" varchar  ,
"exam_intwruleid" varchar  ,
"exam_intaruleid" varchar  ,
"exam_service_name" varchar  ,
"exam_service_type" varchar
)
;

-- ----------------------------
-- Table structure for gem_dimension_name_relations
-- ----------------------------
DROP TABLE IF EXISTS  "gem_dimension_name_relations";
CREATE TABLE  "gem_dimension_name_relations" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"dimension_name" varchar  ,
"network_interface" varchar(32)  ,
"next_level_dimension_name" varchar
)
;


-- ----------------------------
-- Table structure for gem_dimension_names_tree
-- ----------------------------
DROP TABLE IF EXISTS  "gem_dimension_names_tree";
CREATE TABLE  "gem_dimension_names_tree" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"name" varchar ,
"parent_id" varchar  ,
"level" int4
)
;

-- ----------------------------
-- Table structure for gem_dimensions
-- ----------------------------
DROP TABLE IF EXISTS  "gem_dimensions";
CREATE TABLE  "gem_dimensions" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"name" varchar  ,
"dimension_name" varchar  ,
"parent_id" varchar  ,
"level" int4,
"description" varchar  ,
"has_next_level" varchar  ,
"parameter" varchar  ,
"parameter_type" varchar  ,
"value" varchar
)
;

-- ----------------------------
-- Table structure for gem_dns_domain_statistics
-- ----------------------------
DROP TABLE IF EXISTS  "gem_dns_domain_statistics";
CREATE TABLE  "gem_dns_domain_statistics" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"domain" varchar ,
"failure_count" varchar  ,
"request_count" varchar
)
;

-- ----------------------------
-- Table structure for gem_dns_ip_statistics
-- ----------------------------
DROP TABLE IF EXISTS  "gem_dns_ip_statistics";
CREATE TABLE  "gem_dns_ip_statistics" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"ip" varchar ,
"failure_count" varchar  ,
"request_count" varchar
)
;

-- ----------------------------
-- Table structure for gem_event_brd_to_fs
-- ----------------------------
DROP TABLE IF EXISTS  "gem_event_brd_to_fs";
CREATE TABLE  "gem_event_brd_to_fs" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"network_interface" varchar(8)  ,
"brd_code" varchar(8)  ,
"fs_code" varchar(8)
)
;

-- ----------------------------
-- Table structure for gem_event_relative_indicators_for_division
-- ----------------------------
DROP TABLE IF EXISTS  "gem_event_relative_indicators_for_division";
CREATE TABLE  "gem_event_relative_indicators_for_division" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"event_code" varchar  ,
"network_interface" varchar  ,
"ind_divisor" varchar  ,
"ind_dividend" varchar
)
;

-- ----------------------------
-- Table structure for gem_event_statistics_indicators
-- ----------------------------
DROP TABLE IF EXISTS  "gem_event_statistics_indicators";
CREATE TABLE  "gem_event_statistics_indicators" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"name" varchar  ,
"value" varchar  ,
"level" varchar  ,
"parent_id" varchar
)
;

-- ----------------------------
-- Table structure for gem_event_types
-- ----------------------------
DROP TABLE IF EXISTS  "gem_event_types";
CREATE TABLE  "gem_event_types" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"name" varchar  ,
"event_code" varchar  ,
"network_interface" varchar(32)  ,
"dimension_id" varchar
)
;

-- ----------------------------
-- Table structure for gem_failure_dimension_name_relations
-- ----------------------------
DROP TABLE IF EXISTS  "gem_failure_dimension_name_relations";
CREATE TABLE  "gem_failure_dimension_name_relations" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"dimension_name" varchar  ,
"network_interface" varchar(32)  ,
"next_level_dimension_name" varchar  ,
"next_level_dimension_column" varchar  ,
"next_level_dimension_name_index" varchar  ,
"next_level_dimension_name_type" varchar
)
;

-- ----------------------------
-- Table structure for gem_http_status_codes
-- ----------------------------
DROP TABLE IF EXISTS  "gem_http_status_codes";
CREATE TABLE  "gem_http_status_codes" (
"http_status_code" varchar(4)   PRIMARY KEY,
"comment" varchar
)
;

DROP TABLE IF EXISTS gem_dimension_relative_indicators CASCADE;

CREATE TABLE gem_dimension_relative_indicators
(
   id                 varchar       DEFAULT next_id() NOT NULL,
   indicator_id       varchar,
   network_interface  varchar(32),
   dimension          varchar
);

DROP TABLE IF EXISTS gem_event_relative_indicators CASCADE;

CREATE TABLE gem_event_relative_indicators
(
   id                 varchar       DEFAULT next_id() NOT NULL,
   network_interface  varchar(32),
   event_type_code    varchar,
   indicator_id       varchar,
   time_interval      integer,
   dimension_name     varchar,
   source_table       varchar
);


-- ----------------------------
-- Table structure for gem_indicators
-- ----------------------------
DROP TABLE IF EXISTS  "gem_indicators";
CREATE TABLE  "gem_indicators" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"name" varchar  ,
"network_interface" varchar(32)  ,
"parent_id" varchar  ,
"level" int4,
"description" varchar  ,
"has_next_level" varchar  ,
"factor" varchar  ,
"parameter" varchar
)
;

-- ----------------------------
-- Table structure for gem_interface_interval_tables
-- ----------------------------
DROP TABLE IF EXISTS  "gem_interface_interval_tables";
CREATE TABLE  "gem_interface_interval_tables" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"network_interface" varchar  ,
"interval" int4,
"table_name" varchar  ,
"scope" varchar
)
;

-- ----------------------------
-- Table structure for gem_mr_distinct_kpi_1d_statistics_by_tac
-- ----------------------------
DROP TABLE IF EXISTS  "gem_mr_distinct_kpi_1d_statistics_by_tac";
CREATE TABLE  "gem_mr_distinct_kpi_1d_statistics_by_tac" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"datetime" timestamp(6),
"whole_network" varchar  ,
"tac" int4,
"weak_rsrp_cover_imsi" int8,
"imsi_count" int8,
"weak_rsrq_imsi" int8,
"high_phr_imsi" int8,
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP()
);


-- ----------------------------
-- Table structure for gem_mr_distinct_kpi_1d_statistics_by_te
-- ----------------------------
DROP TABLE IF EXISTS  "gem_mr_distinct_kpi_1d_statistics_by_te";
CREATE TABLE  "gem_mr_distinct_kpi_1d_statistics_by_te" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"datetime" timestamp(6),
"whole_network" varchar  ,
"tac" int4,
"enodeb_id" int4,
"weak_rsrp_cover_imsi" int8,
"imsi_count" int8,
"weak_rsrq_imsi" int8,
"high_phr_imsi" int8,
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP()
)
;

-- ----------------------------
-- Table structure for gem_mr_distinct_kpi_1d_statistics_by_tec
-- ----------------------------
DROP TABLE IF EXISTS  "gem_mr_distinct_kpi_1d_statistics_by_tec";
CREATE TABLE  "gem_mr_distinct_kpi_1d_statistics_by_tec" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"datetime" timestamp(6),
"whole_network" varchar  ,
"tac" int4,
"enodeb_id" int4,
"cell_id" int4,
"weak_rsrp_cover_imsi" int8,
"imsi_count" int8,
"weak_rsrq_imsi" int8,
"high_phr_imsi" int8,
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP()
)
;

-- ----------------------------
-- Table structure for gem_mr_distinct_kpi_1d_statistics_by_ue_type
-- ----------------------------
DROP TABLE IF EXISTS  "gem_mr_distinct_kpi_1d_statistics_by_ue_type";
CREATE TABLE  "gem_mr_distinct_kpi_1d_statistics_by_ue_type" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"datetime" timestamp(6),
"whole_network" varchar  ,
"tac" int4,
"enodeb_id" int4,
"cell_id" int4,
"ue_brand" varchar  ,
"ue_type" varchar(32)  ,
"weak_rsrp_cover_imsi" int8,
"imsi_count" int8,
"weak_rsrq_imsi" int8,
"high_phr_imsi" int8,
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP()
)
;

-- ----------------------------
-- Table structure for gem_mr_distinct_kpi_1h_statistics_by_tac
-- ----------------------------
DROP TABLE IF EXISTS  "gem_mr_distinct_kpi_1h_statistics_by_tac";
CREATE TABLE  "gem_mr_distinct_kpi_1h_statistics_by_tac" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"datetime" timestamp(6),
"whole_network" varchar  ,
"tac" int4,
"weak_rsrp_cover_imsi" int8,
"imsi_count" int8,
"weak_rsrq_imsi" int8,
"high_phr_imsi" int8,
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP()
)
;

-- ----------------------------
-- Table structure for gem_mr_distinct_kpi_1h_statistics_by_te
-- ----------------------------
DROP TABLE IF EXISTS  "gem_mr_distinct_kpi_1h_statistics_by_te";
CREATE TABLE  "gem_mr_distinct_kpi_1h_statistics_by_te" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"datetime" timestamp(6),
"whole_network" varchar  ,
"tac" int4,
"enodeb_id" int4,
"weak_rsrp_cover_imsi" int8,
"imsi_count" int8,
"weak_rsrq_imsi" int8,
"high_phr_imsi" int8,
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP()
)
;

-- ----------------------------
-- Table structure for gem_mr_distinct_kpi_1h_statistics_by_tec
-- ----------------------------
DROP TABLE IF EXISTS  "gem_mr_distinct_kpi_1h_statistics_by_tec";
CREATE TABLE  "gem_mr_distinct_kpi_1h_statistics_by_tec" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"datetime" timestamp(6),
"whole_network" varchar  ,
"tac" int4,
"enodeb_id" int4,
"cell_id" int4,
"weak_rsrp_cover_imsi" int8,
"imsi_count" int8,
"weak_rsrq_imsi" int8,
"high_phr_imsi" int8,
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP()
)
;

-- ----------------------------
-- Table structure for gem_mr_distinct_kpi_1h_statistics_by_ue_type
-- ----------------------------
DROP TABLE IF EXISTS  "gem_mr_distinct_kpi_1h_statistics_by_ue_type";
CREATE TABLE  "gem_mr_distinct_kpi_1h_statistics_by_ue_type" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"datetime" timestamp(6),
"whole_network" varchar  ,
"tac" int4,
"enodeb_id" int4,
"cell_id" int4,
"ue_brand" varchar  ,
"ue_type" varchar(32)  ,
"weak_rsrp_cover_imsi" int8,
"imsi_count" int8,
"weak_rsrq_imsi" int8,
"high_phr_imsi" int8,
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP()
)
;

-- ----------------------------
-- Table structure for gem_mr_distinct_kpi_5m_statistics_by_tac
-- ----------------------------
DROP TABLE IF EXISTS  "gem_mr_distinct_kpi_5m_statistics_by_tac";
CREATE TABLE  "gem_mr_distinct_kpi_5m_statistics_by_tac" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"datetime" timestamp(6),
"whole_network" varchar  ,
"tac" int4,
"weak_rsrp_cover_imsi" int8,
"imsi_count" int8,
"weak_rsrq_imsi" int8,
"high_phr_imsi" int8,
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP()
)
;

-- ----------------------------
-- Table structure for gem_mr_distinct_kpi_5m_statistics_by_te
-- ----------------------------
DROP TABLE IF EXISTS  "gem_mr_distinct_kpi_5m_statistics_by_te";
CREATE TABLE  "gem_mr_distinct_kpi_5m_statistics_by_te" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"datetime" timestamp(6),
"whole_network" varchar  ,
"tac" int4,
"enodeb_id" int4,
"weak_rsrp_cover_imsi" int8,
"imsi_count" int8,
"weak_rsrq_imsi" int8,
"high_phr_imsi" int8,
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP()
)
;

-- ----------------------------
-- Table structure for gem_mr_distinct_kpi_5m_statistics_by_tec
-- ----------------------------
DROP TABLE IF EXISTS  "gem_mr_distinct_kpi_5m_statistics_by_tec";
CREATE TABLE  "gem_mr_distinct_kpi_5m_statistics_by_tec" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"datetime" timestamp(6),
"whole_network" varchar  ,
"tac" int4,
"enodeb_id" int4,
"cell_id" int4,
"weak_rsrp_cover_imsi" int8,
"imsi_count" int8,
"weak_rsrq_imsi" int8,
"high_phr_imsi" int8,
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP()
)
;

-- ----------------------------
-- Table structure for gem_mr_distinct_kpi_5m_statistics_by_ue_type
-- ----------------------------
DROP TABLE IF EXISTS  "gem_mr_distinct_kpi_5m_statistics_by_ue_type";
CREATE TABLE  "gem_mr_distinct_kpi_5m_statistics_by_ue_type" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"datetime" timestamp(6),
"whole_network" varchar  ,
"tac" int4,
"enodeb_id" int4,
"cell_id" int4,
"ue_brand" varchar  ,
"ue_type" varchar(32)  ,
"weak_rsrp_cover_imsi" int8,
"imsi_count" int8,
"weak_rsrq_imsi" int8,
"high_phr_imsi" int8,
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP()
)
;

-- ----------------------------
-- Table structure for gem_mr_kpi_1d_statistics
-- ----------------------------
DROP TABLE IF EXISTS  "gem_mr_kpi_1d_statistics";
CREATE TABLE  "gem_mr_kpi_1d_statistics" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"datetime" timestamp(6),
"whole_network" varchar  ,
"tac" int4,
"enodeb_id" int4,
"cell_id" int4,
"ue_brand" varchar  ,
"ue_type" varchar  ,
"mr_report_count" int8,
"serving_rsrp_count" int8,
"serving_rsrp_sum" int8,
"serving_rsrq_count" int8,
"serving_rsrq_sum" int8,
"ta_count" int8,
"ta_sum" int8,
"enodeb_received_interfere_count" int8,
"enodeb_received_interfere_sum" int8,
"ul_interfere_rate_count" int8,
"ul_interfere_rate_sum" int8,
"aoa_count" int8,
"aoa_sum" int8,
"phr_count" int8,
"phr_sum" int8,
"ul_sinr_count" int8,
"ul_sinr_sum" int8,
"enodeb_received_power_count" int8,
"enodeb_received_power_sum" int8,
"weak_serving_rsrp_count" int8,
"good_serving_rsrp_count" int8,
"weak_rsrp_cover_imsi" int8,
"imsi_count" int8,
"weak_serving_rsrq_count" int8,
"weak_rsrq_imsi" int8,
"high_phr_count" int8,
"high_phr_imsi" int8,
"satisfied_coverage_rsrp_count" int8,
"overlapping_coverage_count" int8,
"edge_weak_coverage_count" int8,
"edge_coverage_count" int8,
"mode_3_interfere_rsrp_count" int8,
"mode_3_neighbor_cell_measure_count" int8,
"neighbor_cell_over_coverage_count" int8,
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP(),
"weak_rsrq_user_rate" int8
)
;

-- ----------------------------
-- Table structure for gem_mr_kpi_1d_statistics_by_imsi
-- ----------------------------
DROP TABLE IF EXISTS  "gem_mr_kpi_1d_statistics_by_imsi";
CREATE TABLE  "gem_mr_kpi_1d_statistics_by_imsi" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"datetime" timestamp(6),
"imsi" int8,
"enodeb_id" int4,
"cell_id" int4,
"ue_type" varchar  ,
"mr_report_count" int8,
"serving_rsrp_count" int8,
"serving_rsrp_sum" int8,
"serving_rsrq_count" int8,
"serving_rsrq_sum" int8,
"ta_count" int8,
"ta_sum" int8,
"enodeb_received_interfere_count" int8,
"enodeb_received_interfere_sum" int8,
"ul_interfere_rate_count" int8,
"ul_interfere_rate_sum" int8,
"aoa_count" int8,
"aoa_sum" int8,
"phr_count" int8,
"phr_sum" int8,
"ul_sinr_count" int8,
"ul_sinr_sum" int8,
"enodeb_received_power_count" int8,
"enodeb_received_power_sum" int8,
"weak_serving_rsrp_count" int8,
"good_serving_rsrp_count" int8,
"weak_rsrp_cover_imsi" int8,
"imsi_count" int8,
"weak_serving_rsrq_count" int8,
"weak_rsrq_imsi" int8,
"high_phr_count" int8,
"high_phr_imsi" int8,
"satisfied_coverage_rsrp_count" int8,
"overlapping_coverage_count" int8,
"edge_weak_coverage_count" int8,
"edge_coverage_count" int8,
"mode_3_interfere_rsrp_count" int8,
"mode_3_neighbor_cell_measure_count" int8,
"neighbor_cell_over_coverage_count" int8,
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP(),
"weak_rsrq_user_rate" int8
)
;

-- ----------------------------
-- Table structure for gem_mr_kpi_1h_statistics
-- ----------------------------
DROP TABLE IF EXISTS  "gem_mr_kpi_1h_statistics";
CREATE TABLE  "gem_mr_kpi_1h_statistics" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"datetime" timestamp(6),
"whole_network" varchar  ,
"tac" int4,
"enodeb_id" int4,
"cell_id" int4,
"ue_brand" varchar  ,
"ue_type" varchar  ,
"mr_report_count" int8,
"serving_rsrp_count" int8,
"serving_rsrp_sum" int8,
"serving_rsrq_count" int8,
"serving_rsrq_sum" int8,
"ta_count" int8,
"ta_sum" int8,
"enodeb_received_interfere_count" int8,
"enodeb_received_interfere_sum" int8,
"ul_interfere_rate_count" int8,
"ul_interfere_rate_sum" int8,
"aoa_count" int8,
"aoa_sum" int8,
"phr_count" int8,
"phr_sum" int8,
"ul_sinr_count" int8,
"ul_sinr_sum" int8,
"enodeb_received_power_count" int8,
"enodeb_received_power_sum" int8,
"weak_serving_rsrp_count" int8,
"good_serving_rsrp_count" int8,
"weak_rsrp_cover_imsi" int8,
"imsi_count" int8,
"weak_serving_rsrq_count" int8,
"weak_rsrq_imsi" int8,
"high_phr_count" int8,
"high_phr_imsi" int8,
"satisfied_coverage_rsrp_count" int8,
"overlapping_coverage_count" int8,
"edge_weak_coverage_count" int8,
"edge_coverage_count" int8,
"mode_3_interfere_rsrp_count" int8,
"mode_3_neighbor_cell_measure_count" int8,
"neighbor_cell_over_coverage_count" int8,
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP(),
"weak_rsrq_user_rate" int8
)
;

-- ----------------------------
-- Table structure for gem_mr_kpi_1h_statistics_by_imsi
-- ----------------------------
DROP TABLE IF EXISTS  "gem_mr_kpi_1h_statistics_by_imsi";
CREATE TABLE  "gem_mr_kpi_1h_statistics_by_imsi" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"datetime" timestamp(6),
"imsi" int8,
"enodeb_id" int4,
"cell_id" int4,
"ue_type" varchar  ,
"mr_report_count" int8,
"serving_rsrp_count" int8,
"serving_rsrp_sum" int8,
"serving_rsrq_count" int8,
"serving_rsrq_sum" int8,
"ta_count" int8,
"ta_sum" int8,
"enodeb_received_interfere_count" int8,
"enodeb_received_interfere_sum" int8,
"ul_interfere_rate_count" int8,
"ul_interfere_rate_sum" int8,
"aoa_count" int8,
"aoa_sum" int8,
"phr_count" int8,
"phr_sum" int8,
"ul_sinr_count" int8,
"ul_sinr_sum" int8,
"enodeb_received_power_count" int8,
"enodeb_received_power_sum" int8,
"weak_serving_rsrp_count" int8,
"good_serving_rsrp_count" int8,
"weak_rsrp_cover_imsi" int8,
"imsi_count" int8,
"weak_serving_rsrq_count" int8,
"weak_rsrq_imsi" int8,
"high_phr_count" int8,
"high_phr_imsi" int8,
"satisfied_coverage_rsrp_count" int8,
"overlapping_coverage_count" int8,
"edge_weak_coverage_count" int8,
"edge_coverage_count" int8,
"mode_3_interfere_rsrp_count" int8,
"mode_3_neighbor_cell_measure_count" int8,
"neighbor_cell_over_coverage_count" int8,
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP(),
"weak_rsrq_user_rate" int8
)
;

-- ----------------------------
-- Table structure for gem_mr_kpi_5m_statistics
-- ----------------------------
DROP TABLE IF EXISTS  "gem_mr_kpi_5m_statistics";
CREATE TABLE  "gem_mr_kpi_5m_statistics" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"datetime" timestamp(6),
"whole_network" varchar  ,
"tac" int4,
"enodeb_id" int4,
"cell_id" int4,
"ue_brand" varchar  ,
"ue_type" varchar  ,
"mr_report_count" int8,
"serving_rsrp_count" int8,
"serving_rsrp_sum" int8,
"serving_rsrq_count" int8,
"serving_rsrq_sum" int8,
"ta_count" int8,
"ta_sum" int8,
"enodeb_received_interfere_count" int8,
"enodeb_received_interfere_sum" int8,
"ul_interfere_rate_count" int8,
"ul_interfere_rate_sum" int8,
"aoa_count" int8,
"aoa_sum" int8,
"phr_count" int8,
"phr_sum" int8,
"ul_sinr_count" int8,
"ul_sinr_sum" int8,
"enodeb_received_power_count" int8,
"enodeb_received_power_sum" int8,
"weak_serving_rsrp_count" int8,
"good_serving_rsrp_count" int8,
"weak_rsrp_cover_imsi" int8,
"imsi_count" int8,
"weak_serving_rsrq_count" int8,
"weak_rsrq_imsi" int8,
"high_phr_count" int8,
"high_phr_imsi" int8,
"satisfied_coverage_rsrp_count" int8,
"overlapping_coverage_count" int8,
"edge_weak_coverage_count" int8,
"edge_coverage_count" int8,
"mode_3_interfere_rsrp_count" int8,
"mode_3_neighbor_cell_measure_count" int8,
"neighbor_cell_over_coverage_count" int8,
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP(),
"weak_rsrq_user_rate" int8
)
;

-- ----------------------------
-- Table structure for gem_mr_kpi_5m_statistics_by_imsi
-- ----------------------------
DROP TABLE IF EXISTS  "gem_mr_kpi_5m_statistics_by_imsi";
CREATE TABLE  "gem_mr_kpi_5m_statistics_by_imsi" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"datetime" timestamp(6),
"imsi" int8,
"enodeb_id" int4,
"cell_id" int4,
"ue_type" varchar  ,
"mr_report_count" int8,
"serving_rsrp_count" int8,
"serving_rsrp_sum" int8,
"serving_rsrq_count" int8,
"serving_rsrq_sum" int8,
"ta_count" int8,
"ta_sum" int8,
"enodeb_received_interfere_count" int8,
"enodeb_received_interfere_sum" int8,
"ul_interfere_rate_count" int8,
"ul_interfere_rate_sum" int8,
"aoa_count" int8,
"aoa_sum" int8,
"phr_count" int8,
"phr_sum" int8,
"ul_sinr_count" int8,
"ul_sinr_sum" int8,
"enodeb_received_power_count" int8,
"enodeb_received_power_sum" int8,
"weak_serving_rsrp_count" int8,
"good_serving_rsrp_count" int8,
"weak_rsrp_cover_imsi" int8,
"imsi_count" int8,
"weak_serving_rsrq_count" int8,
"weak_rsrq_imsi" int8,
"high_phr_count" int8,
"high_phr_imsi" int8,
"satisfied_coverage_rsrp_count" int8,
"overlapping_coverage_count" int8,
"edge_weak_coverage_count" int8,
"edge_coverage_count" int8,
"mode_3_interfere_rsrp_count" int8,
"mode_3_neighbor_cell_measure_count" int8,
"neighbor_cell_over_coverage_count" int8,
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP(),
"weak_rsrq_user_rate" int8
)
;

-- ----------------------------
-- Table structure for gem_query_templates
-- ----------------------------
DROP TABLE IF EXISTS  "gem_query_templates";
CREATE TABLE  "gem_query_templates" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"name" varchar  ,
"scope" varchar  ,
"template" varchar
)
;

-- ----------------------------
-- Table structure for gem_realtime_monitoring_indicator_dimensions
-- ----------------------------
DROP TABLE IF EXISTS  "gem_realtime_monitoring_indicator_dimensions";
CREATE TABLE  "gem_realtime_monitoring_indicator_dimensions" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"indicator_id" varchar  ,
"network_interface" varchar  ,
"dimension_name" varchar
)
;

-- ----------------------------
-- Table structure for gem_realtime_monitoring_indicator_rules
-- ----------------------------
DROP TABLE IF EXISTS  "gem_realtime_monitoring_indicator_rules";
CREATE TABLE  "gem_realtime_monitoring_indicator_rules" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"name" varchar  ,
"parameter" varchar  ,
"operator" varchar  ,
"threshold" int4,
"dimension_values"  varchar ,
"dimension_name" varchar  ,
"network_interface" varchar  ,
"unit" varchar  ,
"datetime" timestamp(6),
"interval" varchar  ,
"show" boolean,
"rule_name" varchar
)
;

-- ----------------------------
-- Table structure for gem_realtime_monitoring_mr_kpi_15m_statistics
-- ----------------------------
DROP TABLE IF EXISTS  "gem_realtime_monitoring_mr_kpi_15m_statistics";
CREATE TABLE  "gem_realtime_monitoring_mr_kpi_15m_statistics" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"whole_network" varchar  ,
"mme_group_id" varchar  ,
"mme_code" varchar  ,
"cell_id" varchar  ,
"imsi" varchar  ,
"ue_type" varchar  ,
"datetime" timestamp(6),
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP(),
"serving_rsrp_count" int8,
"serving_rsrp_30_count" int8
)
;

-- ----------------------------
-- Table structure for gem_realtime_monitoring_mr_kpi_30m_statistics
-- ----------------------------
DROP TABLE IF EXISTS  "gem_realtime_monitoring_mr_kpi_30m_statistics";
CREATE TABLE  "gem_realtime_monitoring_mr_kpi_30m_statistics" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"whole_network" varchar  ,
"mme_group_id" varchar  ,
"mme_code" varchar  ,
"cell_id" varchar  ,
"imsi" varchar  ,
"ue_type" varchar  ,
"datetime" timestamp(6),
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP(),
"serving_rsrp_count" int8,
"serving_rsrp_30_count" int8
)
;

-- ----------------------------
-- Table structure for gem_realtime_monitoring_mr_kpi_5m_statistics
-- ----------------------------
DROP TABLE IF EXISTS  "gem_realtime_monitoring_mr_kpi_5m_statistics";
CREATE TABLE  "gem_realtime_monitoring_mr_kpi_5m_statistics" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"whole_network" varchar  ,
"mme_group_id" varchar  ,
"mme_code" varchar  ,
"cell_id" varchar  ,
"imsi" varchar  ,
"ue_type" varchar  ,
"datetime" timestamp(6),
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP(),
"serving_rsrp_count" int8,
"serving_rsrp_30_count" int8
)
;

-- ----------------------------
-- Table structure for gem_realtime_monitoring_rule_relative_kpis
-- ----------------------------
DROP TABLE IF EXISTS  "gem_realtime_monitoring_rule_relative_kpis";
CREATE TABLE  "gem_realtime_monitoring_rule_relative_kpis" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"rule_id" varchar  ,
"parameter" varchar  ,
"expression" varchar
)
;

-- ----------------------------
-- Table structure for gem_realtime_monitoring_rules_relative_dimension
-- ----------------------------
DROP TABLE IF EXISTS  "gem_realtime_monitoring_rules_relative_dimension";
CREATE TABLE  "gem_realtime_monitoring_rules_relative_dimension" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"dimension_name" varchar  ,
"rule_id" varchar
)
;

-- ----------------------------
-- Table structure for gem_realtime_monitoring_s1_mme_kpi_15m_statistics
-- ----------------------------
DROP TABLE IF EXISTS  "gem_realtime_monitoring_s1_mme_kpi_15m_statistics";
CREATE TABLE  "gem_realtime_monitoring_s1_mme_kpi_15m_statistics" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"whole_network" varchar  ,
"mme_group_id" varchar  ,
"mme_code" varchar  ,
"cell_id" varchar  ,
"imsi" varchar  ,
"ue_type" varchar  ,
"tac" varchar  ,
"datetime" timestamp(6),
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP(),
"internet_user_qoe_score" float8,
"eps_attach_request_count" int8,
"eps_attach_success_count" int8,
"default_eps_bear_request_count" int8,
"default_eps_bear_success_count" int8,
"s1_handover_request_count" int8,
"s1_handover_success_count" int8,
"tau_request_count" int8,
"tau_success_count" int8
)
;

-- ----------------------------
-- Table structure for gem_realtime_monitoring_s1_mme_kpi_30m_statistics
-- ----------------------------
DROP TABLE IF EXISTS  "gem_realtime_monitoring_s1_mme_kpi_30m_statistics";
CREATE TABLE  "gem_realtime_monitoring_s1_mme_kpi_30m_statistics" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"whole_network" varchar  ,
"mme_group_id" varchar  ,
"mme_code" varchar  ,
"cell_id" varchar  ,
"imsi" varchar  ,
"ue_type" varchar  ,
"tac" varchar  ,
"datetime" timestamp(6),
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP(),
"internet_user_qoe_score" float8,
"eps_attach_request_count" int8,
"eps_attach_success_count" int8,
"default_eps_bear_request_count" int8,
"default_eps_bear_success_count" int8,
"s1_handover_request_count" int8,
"s1_handover_success_count" int8,
"tau_request_count" int8,
"tau_success_count" int8
)
;

-- ----------------------------
-- Table structure for gem_realtime_monitoring_s1_mme_kpi_5m_statistics
-- ----------------------------
DROP TABLE IF EXISTS  "gem_realtime_monitoring_s1_mme_kpi_5m_statistics";
CREATE TABLE  "gem_realtime_monitoring_s1_mme_kpi_5m_statistics" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"whole_network" varchar  ,
"mme_group_id" varchar  ,
"mme_code" varchar  ,
"cell_id" varchar  ,
"imsi" varchar  ,
"ue_type" varchar  ,
"tac" varchar  ,
"datetime" timestamp(6),
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP(),
"internet_user_qoe_score" float8,
"eps_attach_request_count" int8,
"eps_attach_success_count" int8,
"default_eps_bear_request_count" int8,
"default_eps_bear_success_count" int8,
"s1_handover_request_count" int8,
"s1_handover_success_count" int8,
"tau_request_count" int8,
"tau_success_count" int8
)
;

-- ----------------------------
-- Table structure for gem_realtime_monitoring_s1u_dns_kpi_15m_statistics
-- ----------------------------
DROP TABLE IF EXISTS  "gem_realtime_monitoring_s1u_dns_kpi_15m_statistics";
CREATE TABLE  "gem_realtime_monitoring_s1u_dns_kpi_15m_statistics" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"whole_network" varchar  ,
"mme_group_id" varchar  ,
"mme_code" varchar  ,
"tac" varchar  ,
"cell_id" varchar  ,
"imsi" varchar  ,
"ue_type" varchar  ,
"datetime" timestamp(6),
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP(),
"dns_request_count" int8,
"dns_success_count" int8,
"tcp_link_request_count" int8,
"tcp_link_success_count" int8
)
;

-- ----------------------------
-- Table structure for gem_realtime_monitoring_s1u_dns_kpi_30m_statistics
-- ----------------------------
DROP TABLE IF EXISTS  "gem_realtime_monitoring_s1u_dns_kpi_30m_statistics";
CREATE TABLE  "gem_realtime_monitoring_s1u_dns_kpi_30m_statistics" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"whole_network" varchar  ,
"mme_group_id" varchar  ,
"mme_code" varchar  ,
"tac" varchar  ,
"cell_id" varchar  ,
"imsi" varchar  ,
"ue_type" varchar  ,
"datetime" timestamp(6),
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP(),
"dns_request_count" int8,
"dns_success_count" int8,
"tcp_link_request_count" int8,
"tcp_link_success_count" int8
)
;

-- ----------------------------
-- Table structure for gem_realtime_monitoring_s1u_dns_kpi_5m_statistics
-- ----------------------------
DROP TABLE IF EXISTS  "gem_realtime_monitoring_s1u_dns_kpi_5m_statistics";
CREATE TABLE  "gem_realtime_monitoring_s1u_dns_kpi_5m_statistics" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"whole_network" varchar  ,
"mme_group_id" varchar  ,
"mme_code" varchar  ,
"tac" varchar  ,
"cell_id" varchar  ,
"imsi" varchar  ,
"ue_type" varchar  ,
"datetime" timestamp(6),
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP(),
"dns_request_count" int8,
"dns_success_count" int8,
"tcp_link_request_count" int8,
"tcp_link_success_count" int8
)
;

-- ----------------------------
-- Table structure for gem_realtime_monitoring_s1u_http_kpi_15m_statistics
-- ----------------------------
DROP TABLE IF EXISTS  "gem_realtime_monitoring_s1u_http_kpi_15m_statistics";
CREATE TABLE  "gem_realtime_monitoring_s1u_http_kpi_15m_statistics" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"whole_network" varchar  ,
"mme_group_id" varchar  ,
"mme_code" varchar  ,
"tac" varchar  ,
"cell_id" varchar  ,
"imsi" varchar  ,
"sgw_ggsn_ip_add" varchar  ,
"ue_type" varchar  ,
"datetime" timestamp(6),
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP(),
"tcp_link_request_count" int8,
"tcp_link_success_count" int8,
"http_request_count" int8,
"http_success_count" int8,
"im_request_count" int8,
"im_success_count" int8,
"game_service_request_count" int8,
"game_service_success_count" int8,
"browser_service_dlup_data" numeric,
"browser_dl_data" numeric,
"browser_delay" int8,
"video_service_dlup_data" numeric,
"video_dl_data" numeric,
"video_delay" int8,
"dl_data" numeric
)
;

-- ----------------------------
-- Table structure for gem_realtime_monitoring_s1u_http_kpi_30m_statistics
-- ----------------------------
DROP TABLE IF EXISTS  "gem_realtime_monitoring_s1u_http_kpi_30m_statistics";
CREATE TABLE  "gem_realtime_monitoring_s1u_http_kpi_30m_statistics" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"whole_network" varchar  ,
"mme_group_id" varchar  ,
"mme_code" varchar  ,
"tac" varchar  ,
"cell_id" varchar  ,
"imsi" varchar  ,
"sgw_ggsn_ip_add" varchar  ,
"ue_type" varchar  ,
"datetime" timestamp(6),
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP(),
"tcp_link_request_count" int8,
"tcp_link_success_count" int8,
"http_request_count" int8,
"http_success_count" int8,
"im_request_count" int8,
"im_success_count" int8,
"game_service_request_count" int8,
"game_service_success_count" int8,
"browser_service_dlup_data" numeric,
"browser_dl_data" numeric,
"browser_delay" int8,
"video_service_dlup_data" numeric,
"video_dl_data" numeric,
"video_delay" int8,
"dl_data" numeric
)
;

-- ----------------------------
-- Table structure for gem_realtime_monitoring_s1u_http_kpi_5m_statistics
-- ----------------------------
DROP TABLE IF EXISTS  "gem_realtime_monitoring_s1u_http_kpi_5m_statistics";
CREATE TABLE  "gem_realtime_monitoring_s1u_http_kpi_5m_statistics" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"whole_network" varchar  ,
"mme_group_id" varchar  ,
"mme_code" varchar  ,
"tac" varchar  ,
"cell_id" varchar  ,
"imsi" varchar  ,
"sgw_ggsn_ip_add" varchar  ,
"ue_type" varchar  ,
"datetime" timestamp(6),
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP(),
"tcp_link_request_count" int8,
"tcp_link_success_count" int8,
"http_request_count" int8,
"http_success_count" int8,
"im_request_count" int8,
"im_success_count" int8,
"game_service_request_count" int8,
"game_service_success_count" int8,
"browser_service_dlup_data" numeric,
"browser_dl_data" numeric,
"browser_delay" int8,
"video_service_dlup_data" numeric,
"video_dl_data" numeric,
"video_delay" int8,
"dl_data" numeric
)
;

-- ----------------------------
-- Table structure for gem_realtime_monitoring_s1u_kpi_15m_statistics
-- ----------------------------
DROP TABLE IF EXISTS  "gem_realtime_monitoring_s1u_kpi_15m_statistics";
CREATE TABLE  "gem_realtime_monitoring_s1u_kpi_15m_statistics" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"whole_network" varchar  ,
"mme_group_id" varchar  ,
"mme_code" varchar  ,
"tac" varchar  ,
"cell_id" varchar  ,
"imsi" varchar  ,
"ue_type" varchar  ,
"datetime" timestamp(6),
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP(),
"tcp_link_request_count" int8,
"tcp_link_success_count" int8
)
;

-- ----------------------------
-- Table structure for gem_realtime_monitoring_s1u_kpi_30m_statistics
-- ----------------------------
DROP TABLE IF EXISTS  "gem_realtime_monitoring_s1u_kpi_30m_statistics";
CREATE TABLE  "gem_realtime_monitoring_s1u_kpi_30m_statistics" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"whole_network" varchar  ,
"mme_group_id" varchar  ,
"mme_code" varchar  ,
"tac" varchar  ,
"cell_id" varchar  ,
"imsi" varchar  ,
"ue_type" varchar  ,
"datetime" timestamp(6),
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP(),
"tcp_link_request_count" int8,
"tcp_link_success_count" int8
)
;

-- ----------------------------
-- Table structure for gem_realtime_monitoring_s1u_kpi_5m_statistics
-- ----------------------------
DROP TABLE IF EXISTS  "gem_realtime_monitoring_s1u_kpi_5m_statistics";
CREATE TABLE  "gem_realtime_monitoring_s1u_kpi_5m_statistics" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"whole_network" varchar  ,
"mme_group_id" varchar  ,
"mme_code" varchar  ,
"tac" varchar  ,
"cell_id" varchar  ,
"imsi" varchar  ,
"ue_type" varchar  ,
"datetime" timestamp(6),
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP(),
"tcp_link_request_count" int8,
"tcp_link_success_count" int8
)
;

-- ----------------------------
-- Table structure for gem_realtime_monitoring_s6a_kpi_15m_statistics
-- ----------------------------
DROP TABLE IF EXISTS  "gem_realtime_monitoring_s6a_kpi_15m_statistics";
CREATE TABLE  "gem_realtime_monitoring_s6a_kpi_15m_statistics" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"whole_network" varchar  ,
"mme_code" varchar  ,
"imsi" varchar  ,
"ue_type" varchar  ,
"datetime" timestamp(6),
"create_time" timestamp(6),
"hss_authentication_information_request_count" int8,
"hss_authentication_information_success_count" int8,
"hss_update_location_request_count" int8,
"hss_update_location_success_count" int8
)
;

-- ----------------------------
-- Table structure for gem_realtime_monitoring_s6a_kpi_30m_statistics
-- ----------------------------
DROP TABLE IF EXISTS  "gem_realtime_monitoring_s6a_kpi_30m_statistics";
CREATE TABLE  "gem_realtime_monitoring_s6a_kpi_30m_statistics" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"whole_network" varchar  ,
"mme_code" varchar  ,
"imsi" varchar  ,
"ue_type" varchar  ,
"datetime" timestamp(6),
"create_time" timestamp(6),
"hss_authentication_information_request_count" int8,
"hss_authentication_information_success_count" int8,
"hss_update_location_request_count" int8,
"hss_update_location_success_count" int8
)
;

-- ----------------------------
-- Table structure for gem_realtime_monitoring_s6a_kpi_5m_statistics
-- ----------------------------
DROP TABLE IF EXISTS  "gem_realtime_monitoring_s6a_kpi_5m_statistics";
CREATE TABLE  "gem_realtime_monitoring_s6a_kpi_5m_statistics" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"whole_network" varchar  ,
"mme_code" varchar  ,
"imsi" varchar  ,
"ue_type" varchar  ,
"datetime" timestamp(6),
"create_time" timestamp(6),
"hss_authentication_information_request_count" int8,
"hss_authentication_information_success_count" int8,
"hss_update_location_request_count" int8,
"hss_update_location_success_count" int8
)
;

-- ----------------------------
-- Table structure for gem_realtime_monitoring_sgs_kpi_15m_statistics
-- ----------------------------
DROP TABLE IF EXISTS  "gem_realtime_monitoring_sgs_kpi_15m_statistics";
CREATE TABLE  "gem_realtime_monitoring_sgs_kpi_15m_statistics" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"whole_network" varchar  ,
"mme_group_id" varchar  ,
"mme_code" varchar  ,
"tac" varchar  ,
"cell_id" varchar  ,
"imsi" varchar  ,
"ue_type" varchar  ,
"datetime" timestamp(6),
"create_time" timestamp(6),
"sgsap_location_update_request_count" int8,
"sgsap_location_update_success_count" int8,
"cs_paging_request_count" int8,
"cs_paging_success_count" int8
)
;

-- ----------------------------
-- Table structure for gem_realtime_monitoring_sgs_kpi_30m_statistics
-- ----------------------------
DROP TABLE IF EXISTS  "gem_realtime_monitoring_sgs_kpi_30m_statistics";
CREATE TABLE  "gem_realtime_monitoring_sgs_kpi_30m_statistics" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"whole_network" varchar  ,
"mme_group_id" varchar  ,
"mme_code" varchar  ,
"tac" varchar  ,
"cell_id" varchar  ,
"imsi" varchar  ,
"ue_type" varchar  ,
"datetime" timestamp(6),
"create_time" timestamp(6),
"sgsap_location_update_request_count" int8,
"sgsap_location_update_success_count" int8,
"cs_paging_request_count" int8,
"cs_paging_success_count" int8
)
;

-- ----------------------------
-- Table structure for gem_realtime_monitoring_sgs_kpi_5m_statistics
-- ----------------------------
DROP TABLE IF EXISTS  "gem_realtime_monitoring_sgs_kpi_5m_statistics";
CREATE TABLE  "gem_realtime_monitoring_sgs_kpi_5m_statistics" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"whole_network" varchar  ,
"mme_group_id" varchar  ,
"mme_code" varchar  ,
"tac" varchar  ,
"cell_id" varchar  ,
"imsi" varchar  ,
"ue_type" varchar  ,
"datetime" timestamp(6),
"create_time" timestamp(6),
"sgsap_location_update_request_count" int8,
"sgsap_location_update_success_count" int8,
"cs_paging_request_count" int8,
"cs_paging_success_count" int8
)
;

-- ----------------------------
-- Table structure for gem_realtime_monitoring_uu_kpi_15m_statistics
-- ----------------------------
DROP TABLE IF EXISTS  "gem_realtime_monitoring_uu_kpi_15m_statistics";
CREATE TABLE  "gem_realtime_monitoring_uu_kpi_15m_statistics" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"whole_network" varchar  ,
"mme_group_id" varchar  ,
"mme_code" varchar  ,
"cell_id" varchar  ,
"imsi" varchar  ,
"ue_type" varchar  ,
"datetime" timestamp(6),
"create_time" timestamp(6),
"rrc_connection_setup_request_count" int8,
"rrc_connection_setup_success_count" int8,
"ps_paging_success_request_count" int8,
"ps_paging_success_success_count" int8
)
;

-- ----------------------------
-- Table structure for gem_realtime_monitoring_uu_kpi_30m_statistics
-- ----------------------------
DROP TABLE IF EXISTS  "gem_realtime_monitoring_uu_kpi_30m_statistics";
CREATE TABLE  "gem_realtime_monitoring_uu_kpi_30m_statistics" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"whole_network" varchar  ,
"mme_group_id" varchar  ,
"mme_code" varchar  ,
"cell_id" varchar  ,
"imsi" varchar  ,
"ue_type" varchar  ,
"datetime" timestamp(6),
"create_time" timestamp(6),
"rrc_connection_setup_request_count" int8,
"rrc_connection_setup_success_count" int8,
"ps_paging_success_request_count" int8,
"ps_paging_success_success_count" int8
)
;

-- ----------------------------
-- Table structure for gem_realtime_monitoring_uu_kpi_5m_statistics
-- ----------------------------
DROP TABLE IF EXISTS  "gem_realtime_monitoring_uu_kpi_5m_statistics";
CREATE TABLE  "gem_realtime_monitoring_uu_kpi_5m_statistics" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"whole_network" varchar  ,
"mme_group_id" varchar  ,
"mme_code" varchar  ,
"cell_id" varchar  ,
"imsi" varchar  ,
"ue_type" varchar  ,
"datetime" timestamp(6),
"create_time" timestamp(6),
"rrc_connection_setup_request_count" int8,
"rrc_connection_setup_success_count" int8,
"ps_paging_success_request_count" int8,
"ps_paging_success_success_count" int8
)
;

-- ----------------------------
-- Table structure for gem_realtime_monitoring_x2_kpi_15m_statistics
-- ----------------------------
DROP TABLE IF EXISTS  "gem_realtime_monitoring_x2_kpi_15m_statistics";
CREATE TABLE  "gem_realtime_monitoring_x2_kpi_15m_statistics" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"whole_network" varchar  ,
"mme_group_id" varchar  ,
"mme_code" varchar  ,
"cell_id" varchar  ,
"imsi" varchar  ,
"ue_type" varchar  ,
"datetime" timestamp(6),
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP(),
"x2_establish_request_count" int8,
"x2_establish_success_count" int8,
"handover_prepare_request_count" int8,
"handover_prepare_success_count" int8,
"cell_activation_request_count" int8,
"cell_activation_success_count" int8
)
;

-- ----------------------------
-- Table structure for gem_realtime_monitoring_x2_kpi_30m_statistics
-- ----------------------------
DROP TABLE IF EXISTS  "gem_realtime_monitoring_x2_kpi_30m_statistics";
CREATE TABLE  "gem_realtime_monitoring_x2_kpi_30m_statistics" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"whole_network" varchar  ,
"mme_group_id" varchar  ,
"mme_code" varchar  ,
"cell_id" varchar  ,
"imsi" varchar  ,
"ue_type" varchar  ,
"datetime" timestamp(6),
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP(),
"x2_establish_request_count" int8,
"x2_establish_success_count" int8,
"handover_prepare_request_count" int8,
"handover_prepare_success_count" int8,
"cell_activation_request_count" int8,
"cell_activation_success_count" int8
)
;

-- ----------------------------
-- Table structure for gem_realtime_monitoring_x2_kpi_5m_statistics
-- ----------------------------
DROP TABLE IF EXISTS  "gem_realtime_monitoring_x2_kpi_5m_statistics";
CREATE TABLE  "gem_realtime_monitoring_x2_kpi_5m_statistics" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"whole_network" varchar  ,
"mme_group_id" varchar  ,
"mme_code" varchar  ,
"cell_id" varchar  ,
"imsi" varchar  ,
"ue_type" varchar  ,
"datetime" timestamp(6),
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP(),
"x2_establish_request_count" int8,
"x2_establish_success_count" int8,
"handover_prepare_request_count" int8,
"handover_prepare_success_count" int8,
"cell_activation_request_count" int8,
"cell_activation_success_count" int8
)
;

-- ----------------------------
-- Table structure for gem_road_info
-- ----------------------------
DROP TABLE IF EXISTS  "gem_road_info";
CREATE TABLE  "gem_road_info" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"name" varchar  ,
"type_id" varchar
)
;

-- ----------------------------
-- Table structure for gem_road_types
-- ----------------------------
DROP TABLE IF EXISTS  "gem_road_types";
CREATE TABLE  "gem_road_types" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"name" varchar  ,
"code" varchar
)
;

-- ----------------------------
-- Table structure for gem_rules_relative_dimension
-- ----------------------------
DROP TABLE IF EXISTS  "gem_rules_relative_dimension";
CREATE TABLE  "gem_rules_relative_dimension" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"scope" varchar  ,
"dimension_name" varchar  ,
"rule_id" varchar
)
;

-- ----------------------------
-- Table structure for gem_s1_mme_event_5m_statistics_by_imsi
-- ----------------------------
DROP TABLE IF EXISTS  "gem_s1_mme_event_5m_statistics_by_imsi";
CREATE TABLE  "gem_s1_mme_event_5m_statistics_by_imsi" (
"datetime" timestamp(6),
"imsi" varchar  ,
"msisdn" varchar  ,
"event_type" varchar  ,
"request_count" int4,
"success_count" int4 ,
"abnormal_count" int4,
"response_delay_time" int8,
"no_resp_count" int4,
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP()
)
;

-- ----------------------------
-- Table structure for gem_s1_mme_kpi_1d_failure_statistics
-- ----------------------------
DROP TABLE IF EXISTS  "gem_s1_mme_kpi_1d_failure_statistics";
CREATE TABLE  "gem_s1_mme_kpi_1d_failure_statistics" (
"datetime" timestamp(6),
"whole_network" varchar  ,
"mme_group_id" varchar  ,
"mme_code" varchar  ,
"tac" int4,
"enodeb_id" int4,
"cell_id" int4,
"event_type" varchar  ,
"abnormal_type" int4,
"abnormal_reason" int4,
"abnormal_reason_count" int8,
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP()
)
;

-- ----------------------------
-- Table structure for gem_s1_mme_kpi_1d_statistics
-- ----------------------------
DROP TABLE IF EXISTS  "gem_s1_mme_kpi_1d_statistics";
CREATE TABLE  "gem_s1_mme_kpi_1d_statistics" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"whole_network" varchar  ,
"mme_group_id" varchar  ,
"mme_code" varchar  ,
"tac" varchar  ,
"enodeb_id" varchar  ,
"cell_id" varchar  ,
"datetime" timestamp(6),
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP(),
"eps_attach_request" int8,
"eps_attach_success" int8,
"eps_attach_failure" int8,
"eps_attach_timedelay" int8,
"combined_attach_request" int8,
"combined_attach_success" int8,
"combined_attach_failure" int8,
"authentication_request" int8,
"authentication_success" int8,
"authentication_timedelay" int8,
"security_request" int8,
"security_success" int8,
"security_timedelay" int8,
"default_eps_bear_request" int8,
"default_eps_bear_success" int8,
"default_eps_bear_failure" int8,
"ue_pdn_request" int8,
"ue_pdn_success" int8,
"ue_pdn_failure" int8,
"ue_pdn_establish_timedelay" int8,
"service_request" int8,
"service_request_success" int8,
"service_request_failure" int8,
"service_request_establish_timedelay" int8,
"service_request_authentication_request" int8,
"service_request_authentication_success" int8,
"service_request_authentication_timedelay" int8,
"service_request_security_request" int8,
"service_request_security_success" int8,
"service_request_security_timedelay" int8,
"service_request_uecontext_release" int8,
"service_request_uecontext_release_failure" int8,
"service_request_uecontext_release_success" int8,
"service_request_uecontext_release_timedelay" int8,
"paging_request" int8,
"paging_success" int8,
"paging_failure" int8,
"paging_failure_casue" varchar  ,
"paging_timedelay" int8,
"ps_paging_request" int8,
"ps_paging_success" int8,
"ps_paging_timedelay" int8,
"cs_paging_request" int8,
"cs_paging_success" int8,
"cs_paging_timedelay" int8,
"imsi_paging_request" int8,
"imsi_paging_success" int8,
"tmsi_paging_request" int8,
"tmsi_paging_success" int8,
"extended_service_request" int8,
"extended_service_request_success" int8,
"extended_service_request_failure" int8,
"extended_service_request_establish_timedelay" int8,
"extended_service_request_authentication_request" int8,
"extended_service_request_authentication_success" int8,
"extended_service_request_authentication_timedelay" int8,
"extended_service_request_security_request" int8,
"extended_service_request_security_success" int8,
"extended_service_request_security_timedelay" int8,
"extended_service_request_uecontext_release" int8,
"extended_service_request_uecontext_release_failure" int8,
"extended_service_request_uecontext_release_success" int8,
"extended_service_request_uecontext_release_timedelay" int8,
"original_service_request" int8,
"original_service_success" int8,
"original_service_failure" int8,
"original_service_timedelay" int8,
"original_service_authentication_request" int8,
"original_service_authentication_success" int8,
"original_service_authentication_timedelay" int8,
"original_service_security_request" int8,
"original_service_security_success" int8,
"original_service_security_timedelay" int8,
"terminal_service_request" int8,
"terminal_service_success" int8,
"terminal_service_failure" int8,
"terminal_service_timedelay" int8,
"terminal_service_authentication_request" int8,
"terminal_service_authentication_success" int8,
"terminal_service_authentication_timedelay" int8,
"terminal_service_security_request" int8,
"terminal_service_security_success" int8,
"terminal_service_security_timedelay" int8,
"emergency_service_request" int8,
"emergency_service_success" int8,
"emergency_service_failure" int8,
"emergency_service_timedelay" int8,
"e_rab_establish_request" int8,
"e_rab_establish_success" int8,
"e_rab_establish_timedelay" int8,
"e_rab_establish_failure" int8,
"e_rab_modify_request" int8,
"e_rab_modify_success" int8,
"e_rab_modify_timedelay" int8,
"e_rab_modify_failure" int8,
"e_rab_release_request" int8,
"e_rab_release_success" int8,
"e_rab_release_timedelay" int8,
"e_rab_release_failure" int8,
"dedicated_eps_bear_request" int8,
"dedicated_eps_bear_success" int8,
"dedicated_eps_bear_failure" int8,
"eps_bear_modify_request" int8,
"eps_bear_modify_success" int8,
"eps_bear_modify_failure" int8,
"eps_bear_deactivation_request" int8,
"eps_bear_deactivation_success" int8,
"eps_bear_deactivation_failure" int8,
"eps_bear_resource_allocation_request" int8,
"eps_bear_resource_allocation_success" int8,
"eps_bear_resource_allocation_failure" int8,
"eps_bear_resource_modify_request" int8,
"eps_bear_resource_modify_success" int8,
"eps_bear_resource_modify_failure" int8,
"eps_qci1_establish_success" int8,
"eps_qci2_establish_success" int8,
"eps_qci3_establish_success" int8,
"eps_qci4_establish_success" int8,
"eps_qci5_establish_success" int8,
"eps_qci6_establish_success" int8,
"eps_qci7_establish_success" int8,
"eps_qci8_establish_success" int8,
"pdn_disconnect_request" int8,
"pdn_disconnect_success" int8,
"pdn_disconnect_failure" int8,
"pdn_disconnect_timedelay" int8,
"ue_imsi_detach_request" int8,
"ue_combined_detach_request" int8,
"ue_eps_off_detach_request" int8,
"ue_imsi_off_detach_request" int8,
"ue_combined_off_detach_request" int8,
"reattach_required_detach_request" int8,
"reattach_not_required_detach_request" int8,
"network_imsi_detach_request" int8,
"ue_detach_request" int8,
"ue_detach_success" int8,
"ue_detach_timedelay" int8,
"network_detach_request" int8,
"network_detach_success" int8,
"network_detach_timedelay" int8,
"tau_request" int8,
"tau_success" int8,
"tau_failure" int8,
"tau_timedelay" int8,
"cycle_tau_request" int8,
"cycle_tau_success" int8,
"cycle_tau_failure" int8,
"cycle_tau_timedelay" int8,
"tau_authentication_request" int8,
"tau_authentication_success" int8,
"tau_authentication_timedelay" int8,
"tau_security_request" int8,
"tau_security_success" int8,
"tau_security_timedelay" int8,
"combined_tau_request" int8,
"combined_tau_success" int8,
"combined_tau_failure" int8,
"combined_imsi_tau_request" int8,
"combined_imsi_tau_success" int8,
"combined_imsi_tau_failure" int8,
"s1_handover_out_request" int8,
"s1_handover_out_success" int8,
"s1_handover_out_timedelay" int8,
"s1_handover_out_failure" int8,
"s1_handover_in_request" int8,
"s1_handover_in_success" int8,
"s1_handover_in_timedelay" int8,
"s1_handover_in_failure" int8,
"x2_handover_request" int8,
"x2_handover_success" int8,
"x2_handover_timedelay" int8,
"x2_handover_failure" int8,
"s1_l2u_handover_out_request" int8,
"s1_l2u_handover_out_success" int8,
"s1_l2u_handover_out_failure" int8,
"s1_l2u_handover_out_timedelay" int8,
"s1_l2g_handover_out_timedelay" int8,
"s1_l2g_handover_out_request" int8,
"s1_l2g_handover_out_success" int8,
"s1_l2g_handover_out_failure" int8,
"s1_u2l_handover_in_request" int8,
"s1_u2l_handover_in_success" int8,
"s1_u2l_handover_in_failure" int8,
"s1_u2l_handover_in_timedelay" int8,
"s1_g2l_handover_in_request" int8,
"s1_g2l_handover_in_success" int8,
"s1_g2l_handover_in_failure" int8,
"s1_g2l_handover_in_timedelay" int8,
"reset_request" int8,
"reset_success" int8,
"s1_setup_request" int8,
"s1_setup_success" int8,
"s1_setup_timedelay" int8,
"s1_setup_failure" int8,
"enb_configuration_update_request" int8,
"enb_configuration_update_success" int8,
"enb_configuration_update_timedelay" int8,
"enb_configuration_update_failure" int8,
"mme_configuration_update_request" int8,
"mme_configuration_update_success" int8,
"mme_configuration_update_timedelay" int8,
"mme_configuration_update_failure" int8,
"error_indication_request" varchar  ,
"error_indication_cause" varchar  ,
"overload_start_request" int8,
"overload_stop_request" int8,
"sms_request" int8,
"sms_success" int8,
"sms_failure" int8,
"sms_timedelay" int8,
"sms_send_request" int8,
"sms_send_success" int8,
"sms_send_failure" int8,
"sms_send_timedelay" int8,
"sms_receive_request" int8,
"sms_receive_success" int8,
"sms_receive_failure" int8,
"sms_receive_timedelay" int8,
"csfb_original_request" int8,
"csfb_original_success" int8,
"csfb_original_failure" int8,
"csfb_original_authentication_request" int8,
"csfb_original_authenticationg_success" int8,
"csfb_original_authentication_timedelay" int8,
"csfb_original_security_request" int8,
"csfb_original_securityg_success" int8,
"csfb_original_security_timedelay" int8,
"csfb_terminal_request" int8,
"csfb_terminal_success" int8,
"csfb_terminal_failure" int8,
"csfb_terminal_authentication_request" int8,
"csfb_terminal_authenticationg_success" int8,
"csfb_terminal_authentication_timedelay" int8,
"csfb_terminal_security_request" int8,
"csfb_terminal_securityg_success" int8,
"csfb_terminal_security_timedelay" int8,
"csfb_emergency_request" int8,
"csfb_emergency_success" int8,
"csfb_emergency_failure" int8
)
;

-- ----------------------------
-- Table structure for gem_s1_mme_kpi_1h_failure_statistics
-- ----------------------------
DROP TABLE IF EXISTS  "gem_s1_mme_kpi_1h_failure_statistics";
CREATE TABLE  "gem_s1_mme_kpi_1h_failure_statistics" (
"datetime" timestamp(6),
"whole_network" varchar  ,
"mme_group_id" varchar  ,
"mme_code" varchar  ,
"tac" int4,
"enodeb_id" int4,
"cell_id" int4,
"event_type" varchar  ,
"abnormal_type" int4,
"abnormal_reason" int4,
"abnormal_reason_count" int8,
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP()
)
;

-- ----------------------------
-- Table structure for gem_s1_mme_kpi_1h_statistics
-- ----------------------------
DROP TABLE IF EXISTS  "gem_s1_mme_kpi_1h_statistics";
CREATE TABLE  "gem_s1_mme_kpi_1h_statistics" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"whole_network" varchar  ,
"mme_group_id" varchar  ,
"mme_code" varchar  ,
"tac" varchar  ,
"enodeb_id" varchar  ,
"cell_id" varchar  ,
"datetime" timestamp(6),
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP(),
"eps_attach_request" int8,
"eps_attach_success" int8,
"eps_attach_failure" int8,
"eps_attach_timedelay" int8,
"combined_attach_request" int8,
"combined_attach_success" int8,
"combined_attach_failure" int8,
"authentication_request" int8,
"authentication_success" int8,
"authentication_timedelay" int8,
"security_request" int8,
"security_success" int8,
"security_timedelay" int8,
"default_eps_bear_request" int8,
"default_eps_bear_success" int8,
"default_eps_bear_failure" int8,
"ue_pdn_request" int8,
"ue_pdn_success" int8,
"ue_pdn_failure" int8,
"ue_pdn_establish_timedelay" int8,
"service_request" int8,
"service_request_success" int8,
"service_request_failure" int8,
"service_request_establish_timedelay" int8,
"service_request_authentication_request" int8,
"service_request_authentication_success" int8,
"service_request_authentication_timedelay" int8,
"service_request_security_request" int8,
"service_request_security_success" int8,
"service_request_security_timedelay" int8,
"service_request_uecontext_release" int8,
"service_request_uecontext_release_failure" int8,
"service_request_uecontext_release_success" int8,
"service_request_uecontext_release_timedelay" int8,
"paging_request" int8,
"paging_success" int8,
"paging_failure" int8,
"paging_failure_casue" varchar  ,
"paging_timedelay" int8,
"ps_paging_request" int8,
"ps_paging_success" int8,
"ps_paging_timedelay" int8,
"cs_paging_request" int8,
"cs_paging_success" int8,
"cs_paging_timedelay" int8,
"imsi_paging_request" int8,
"imsi_paging_success" int8,
"tmsi_paging_request" int8,
"tmsi_paging_success" int8,
"extended_service_request" int8,
"extended_service_request_success" int8,
"extended_service_request_failure" int8,
"extended_service_request_establish_timedelay" int8,
"extended_service_request_authentication_request" int8,
"extended_service_request_authentication_success" int8,
"extended_service_request_authentication_timedelay" int8,
"extended_service_request_security_request" int8,
"extended_service_request_security_success" int8,
"extended_service_request_security_timedelay" int8,
"extended_service_request_uecontext_release" int8,
"extended_service_request_uecontext_release_failure" int8,
"extended_service_request_uecontext_release_success" int8,
"extended_service_request_uecontext_release_timedelay" int8,
"original_service_request" int8,
"original_service_success" int8,
"original_service_failure" int8,
"original_service_timedelay" int8,
"original_service_authentication_request" int8,
"original_service_authentication_success" int8,
"original_service_authentication_timedelay" int8,
"original_service_security_request" int8,
"original_service_security_success" int8,
"original_service_security_timedelay" int8,
"terminal_service_request" int8,
"terminal_service_success" int8,
"terminal_service_failure" int8,
"terminal_service_timedelay" int8,
"terminal_service_authentication_request" int8,
"terminal_service_authentication_success" int8,
"terminal_service_authentication_timedelay" int8,
"terminal_service_security_request" int8,
"terminal_service_security_success" int8,
"terminal_service_security_timedelay" int8,
"emergency_service_request" int8,
"emergency_service_success" int8,
"emergency_service_failure" int8,
"emergency_service_timedelay" int8,
"e_rab_establish_request" int8,
"e_rab_establish_success" int8,
"e_rab_establish_timedelay" int8,
"e_rab_establish_failure" int8,
"e_rab_modify_request" int8,
"e_rab_modify_success" int8,
"e_rab_modify_timedelay" int8,
"e_rab_modify_failure" int8,
"e_rab_release_request" int8,
"e_rab_release_success" int8,
"e_rab_release_timedelay" int8,
"e_rab_release_failure" int8,
"dedicated_eps_bear_request" int8,
"dedicated_eps_bear_success" int8,
"dedicated_eps_bear_failure" int8,
"eps_bear_modify_request" int8,
"eps_bear_modify_success" int8,
"eps_bear_modify_failure" int8,
"eps_bear_deactivation_request" int8,
"eps_bear_deactivation_success" int8,
"eps_bear_deactivation_failure" int8,
"eps_bear_resource_allocation_request" int8,
"eps_bear_resource_allocation_success" int8,
"eps_bear_resource_allocation_failure" int8,
"eps_bear_resource_modify_request" int8,
"eps_bear_resource_modify_success" int8,
"eps_bear_resource_modify_failure" int8,
"eps_qci1_establish_success" int8,
"eps_qci2_establish_success" int8,
"eps_qci3_establish_success" int8,
"eps_qci4_establish_success" int8,
"eps_qci5_establish_success" int8,
"eps_qci6_establish_success" int8,
"eps_qci7_establish_success" int8,
"eps_qci8_establish_success" int8,
"pdn_disconnect_request" int8,
"pdn_disconnect_success" int8,
"pdn_disconnect_failure" int8,
"pdn_disconnect_timedelay" int8,
"ue_imsi_detach_request" int8,
"ue_combined_detach_request" int8,
"ue_eps_off_detach_request" int8,
"ue_imsi_off_detach_request" int8,
"ue_combined_off_detach_request" int8,
"reattach_required_detach_request" int8,
"reattach_not_required_detach_request" int8,
"network_imsi_detach_request" int8,
"ue_detach_request" int8,
"ue_detach_success" int8,
"ue_detach_timedelay" int8,
"network_detach_request" int8,
"network_detach_success" int8,
"network_detach_timedelay" int8,
"tau_request" int8,
"tau_success" int8,
"tau_failure" int8,
"tau_timedelay" int8,
"cycle_tau_request" int8,
"cycle_tau_success" int8,
"cycle_tau_failure" int8,
"cycle_tau_timedelay" int8,
"tau_authentication_request" int8,
"tau_authentication_success" int8,
"tau_authentication_timedelay" int8,
"tau_security_request" int8,
"tau_security_success" int8,
"tau_security_timedelay" int8,
"combined_tau_request" int8,
"combined_tau_success" int8,
"combined_tau_failure" int8,
"combined_imsi_tau_request" int8,
"combined_imsi_tau_success" int8,
"combined_imsi_tau_failure" int8,
"s1_handover_out_request" int8,
"s1_handover_out_success" int8,
"s1_handover_out_timedelay" int8,
"s1_handover_out_failure" int8,
"s1_handover_in_request" int8,
"s1_handover_in_success" int8,
"s1_handover_in_timedelay" int8,
"s1_handover_in_failure" int8,
"x2_handover_request" int8,
"x2_handover_success" int8,
"x2_handover_timedelay" int8,
"x2_handover_failure" int8,
"s1_l2u_handover_out_request" int8,
"s1_l2u_handover_out_success" int8,
"s1_l2u_handover_out_failure" int8,
"s1_l2u_handover_out_timedelay" int8,
"s1_l2g_handover_out_timedelay" int8,
"s1_l2g_handover_out_request" int8,
"s1_l2g_handover_out_success" int8,
"s1_l2g_handover_out_failure" int8,
"s1_u2l_handover_in_request" int8,
"s1_u2l_handover_in_success" int8,
"s1_u2l_handover_in_failure" int8,
"s1_u2l_handover_in_timedelay" int8,
"s1_g2l_handover_in_request" int8,
"s1_g2l_handover_in_success" int8,
"s1_g2l_handover_in_failure" int8,
"s1_g2l_handover_in_timedelay" int8,
"reset_request" int8,
"reset_success" int8,
"s1_setup_request" int8,
"s1_setup_success" int8,
"s1_setup_timedelay" int8,
"s1_setup_failure" int8,
"enb_configuration_update_request" int8,
"enb_configuration_update_success" int8,
"enb_configuration_update_timedelay" int8,
"enb_configuration_update_failure" int8,
"mme_configuration_update_request" int8,
"mme_configuration_update_success" int8,
"mme_configuration_update_timedelay" int8,
"mme_configuration_update_failure" int8,
"error_indication_request" varchar  ,
"error_indication_cause" varchar  ,
"overload_start_request" int8,
"overload_stop_request" int8,
"sms_request" int8,
"sms_success" int8,
"sms_failure" int8,
"sms_timedelay" int8,
"sms_send_request" int8,
"sms_send_success" int8,
"sms_send_failure" int8,
"sms_send_timedelay" int8,
"sms_receive_request" int8,
"sms_receive_success" int8,
"sms_receive_failure" int8,
"sms_receive_timedelay" int8,
"csfb_original_request" int8,
"csfb_original_success" int8,
"csfb_original_failure" int8,
"csfb_original_authentication_request" int8,
"csfb_original_authenticationg_success" int8,
"csfb_original_authentication_timedelay" int8,
"csfb_original_security_request" int8,
"csfb_original_securityg_success" int8,
"csfb_original_security_timedelay" int8,
"csfb_terminal_request" int8,
"csfb_terminal_success" int8,
"csfb_terminal_failure" int8,
"csfb_terminal_authentication_request" int8,
"csfb_terminal_authenticationg_success" int8,
"csfb_terminal_authentication_timedelay" int8,
"csfb_terminal_security_request" int8,
"csfb_terminal_securityg_success" int8,
"csfb_terminal_security_timedelay" int8,
"csfb_emergency_request" int8,
"csfb_emergency_success" int8,
"csfb_emergency_failure" int8
)
;

-- ----------------------------
-- Table structure for gem_s1_mme_kpi_5m_failure_statistics
-- ----------------------------
DROP TABLE IF EXISTS  "gem_s1_mme_kpi_5m_failure_statistics";
CREATE TABLE  "gem_s1_mme_kpi_5m_failure_statistics" (
"datetime" timestamp(6),
"whole_network" varchar  ,
"mme_group_id" varchar  ,
"mme_code" varchar  ,
"tac" int4,
"enodeb_id" int4,
"cell_id" int4,
"event_type" varchar  ,
"abnormal_type" int4,
"abnormal_reason" int4,
"abnormal_reason_count" int8,
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP()
)
;

-- ----------------------------
-- Table structure for gem_s1_mme_kpi_5m_statistics
-- ----------------------------
DROP TABLE IF EXISTS  "gem_s1_mme_kpi_5m_statistics";
CREATE TABLE  "gem_s1_mme_kpi_5m_statistics" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"whole_network" varchar  ,
"mme_group_id" varchar  ,
"mme_code" varchar  ,
"tac" varchar  ,
"enodeb_id" varchar  ,
"cell_id" varchar  ,
"datetime" timestamp(6),
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP(),
"eps_attach_request" int8,
"eps_attach_success" int8,
"eps_attach_failure" int8,
"eps_attach_timedelay" int8,
"combined_attach_request" int8,
"combined_attach_success" int8,
"combined_attach_failure" int8,
"authentication_request" int8,
"authentication_success" int8,
"authentication_timedelay" int8,
"security_request" int8,
"security_success" int8,
"security_timedelay" int8,
"default_eps_bear_request" int8,
"default_eps_bear_success" int8,
"default_eps_bear_failure" int8,
"ue_pdn_request" int8,
"ue_pdn_success" int8,
"ue_pdn_failure" int8,
"ue_pdn_establish_timedelay" int8,
"service_request" int8,
"service_request_success" int8,
"service_request_failure" int8,
"service_request_establish_timedelay" int8,
"service_request_authentication_request" int8,
"service_request_authentication_success" int8,
"service_request_authentication_timedelay" int8,
"service_request_security_request" int8,
"service_request_security_success" int8,
"service_request_security_timedelay" int8,
"service_request_uecontext_release" int8,
"service_request_uecontext_release_failure" int8,
"service_request_uecontext_release_success" int8,
"service_request_uecontext_release_timedelay" int8,
"paging_request" int8,
"paging_success" int8,
"paging_failure" int8,
"paging_failure_casue" varchar  ,
"paging_timedelay" int8,
"ps_paging_request" int8,
"ps_paging_success" int8,
"ps_paging_timedelay" int8,
"cs_paging_request" int8,
"cs_paging_success" int8,
"cs_paging_timedelay" int8,
"imsi_paging_request" int8,
"imsi_paging_success" int8,
"tmsi_paging_request" int8,
"tmsi_paging_success" int8,
"extended_service_request" int8,
"extended_service_request_success" int8,
"extended_service_request_failure" int8,
"extended_service_request_establish_timedelay" int8,
"extended_service_request_authentication_request" int8,
"extended_service_request_authentication_success" int8,
"extended_service_request_authentication_timedelay" int8,
"extended_service_request_security_request" int8,
"extended_service_request_security_success" int8,
"extended_service_request_security_timedelay" int8,
"extended_service_request_uecontext_release" int8,
"extended_service_request_uecontext_release_failure" int8,
"extended_service_request_uecontext_release_success" int8,
"extended_service_request_uecontext_release_timedelay" int8,
"original_service_request" int8,
"original_service_success" int8,
"original_service_failure" int8,
"original_service_timedelay" int8,
"original_service_authentication_request" int8,
"original_service_authentication_success" int8,
"original_service_authentication_timedelay" int8,
"original_service_security_request" int8,
"original_service_security_success" int8,
"original_service_security_timedelay" int8,
"terminal_service_request" int8,
"terminal_service_success" int8,
"terminal_service_failure" int8,
"terminal_service_timedelay" int8,
"terminal_service_authentication_request" int8,
"terminal_service_authentication_success" int8,
"terminal_service_authentication_timedelay" int8,
"terminal_service_security_request" int8,
"terminal_service_security_success" int8,
"terminal_service_security_timedelay" int8,
"emergency_service_request" int8,
"emergency_service_success" int8,
"emergency_service_failure" int8,
"emergency_service_timedelay" int8,
"e_rab_establish_request" int8,
"e_rab_establish_success" int8,
"e_rab_establish_timedelay" int8,
"e_rab_establish_failure" int8,
"e_rab_modify_request" int8,
"e_rab_modify_success" int8,
"e_rab_modify_timedelay" int8,
"e_rab_modify_failure" int8,
"e_rab_release_request" int8,
"e_rab_release_success" int8,
"e_rab_release_timedelay" int8,
"e_rab_release_failure" int8,
"dedicated_eps_bear_request" int8,
"dedicated_eps_bear_success" int8,
"dedicated_eps_bear_failure" int8,
"eps_bear_modify_request" int8,
"eps_bear_modify_success" int8,
"eps_bear_modify_failure" int8,
"eps_bear_deactivation_request" int8,
"eps_bear_deactivation_success" int8,
"eps_bear_deactivation_failure" int8,
"eps_bear_resource_allocation_request" int8,
"eps_bear_resource_allocation_success" int8,
"eps_bear_resource_allocation_failure" int8,
"eps_bear_resource_modify_request" int8,
"eps_bear_resource_modify_success" int8,
"eps_bear_resource_modify_failure" int8,
"eps_qci1_establish_success" int8,
"eps_qci2_establish_success" int8,
"eps_qci3_establish_success" int8,
"eps_qci4_establish_success" int8,
"eps_qci5_establish_success" int8,
"eps_qci6_establish_success" int8,
"eps_qci7_establish_success" int8,
"eps_qci8_establish_success" int8,
"pdn_disconnect_request" int8,
"pdn_disconnect_success" int8,
"pdn_disconnect_failure" int8,
"pdn_disconnect_timedelay" int8,
"ue_imsi_detach_request" int8,
"ue_combined_detach_request" int8,
"ue_eps_off_detach_request" int8,
"ue_imsi_off_detach_request" int8,
"ue_combined_off_detach_request" int8,
"reattach_required_detach_request" int8,
"reattach_not_required_detach_request" int8,
"network_imsi_detach_request" int8,
"ue_detach_request" int8,
"ue_detach_success" int8,
"ue_detach_timedelay" int8,
"network_detach_request" int8,
"network_detach_success" int8,
"network_detach_timedelay" int8,
"tau_request" int8,
"tau_success" int8,
"tau_failure" int8,
"tau_timedelay" int8,
"cycle_tau_request" int8,
"cycle_tau_success" int8,
"cycle_tau_failure" int8,
"cycle_tau_timedelay" int8,
"tau_authentication_request" int8,
"tau_authentication_success" int8,
"tau_authentication_timedelay" int8,
"tau_security_request" int8,
"tau_security_success" int8,
"tau_security_timedelay" int8,
"combined_tau_request" int8,
"combined_tau_success" int8,
"combined_tau_failure" int8,
"combined_imsi_tau_request" int8,
"combined_imsi_tau_success" int8,
"combined_imsi_tau_failure" int8,
"s1_handover_out_request" int8,
"s1_handover_out_success" int8,
"s1_handover_out_timedelay" int8,
"s1_handover_out_failure" int8,
"s1_handover_in_request" int8,
"s1_handover_in_success" int8,
"s1_handover_in_timedelay" int8,
"s1_handover_in_failure" int8,
"x2_handover_request" int8,
"x2_handover_success" int8,
"x2_handover_timedelay" int8,
"x2_handover_failure" int8,
"s1_l2u_handover_out_request" int8,
"s1_l2u_handover_out_success" int8,
"s1_l2u_handover_out_failure" int8,
"s1_l2u_handover_out_timedelay" int8,
"s1_l2g_handover_out_timedelay" int8,
"s1_l2g_handover_out_request" int8,
"s1_l2g_handover_out_success" int8,
"s1_l2g_handover_out_failure" int8,
"s1_u2l_handover_in_request" int8,
"s1_u2l_handover_in_success" int8,
"s1_u2l_handover_in_failure" int8,
"s1_u2l_handover_in_timedelay" int8,
"s1_g2l_handover_in_request" int8,
"s1_g2l_handover_in_success" int8,
"s1_g2l_handover_in_failure" int8,
"s1_g2l_handover_in_timedelay" int8,
"reset_request" int8,
"reset_success" int8,
"s1_setup_request" int8,
"s1_setup_success" int8,
"s1_setup_timedelay" int8,
"s1_setup_failure" int8,
"enb_configuration_update_request" int8,
"enb_configuration_update_success" int8,
"enb_configuration_update_timedelay" int8,
"enb_configuration_update_failure" int8,
"mme_configuration_update_request" int8,
"mme_configuration_update_success" int8,
"mme_configuration_update_timedelay" int8,
"mme_configuration_update_failure" int8,
"error_indication_request" varchar  ,
"error_indication_cause" varchar  ,
"overload_start_request" int8,
"overload_stop_request" int8,
"sms_request" int8,
"sms_success" int8,
"sms_failure" int8,
"sms_timedelay" int8,
"sms_send_request" int8,
"sms_send_success" int8,
"sms_send_failure" int8,
"sms_send_timedelay" int8,
"sms_receive_request" int8,
"sms_receive_success" int8,
"sms_receive_failure" int8,
"sms_receive_timedelay" int8,
"csfb_original_request" int8,
"csfb_original_success" int8,
"csfb_original_failure" int8,
"csfb_original_authentication_request" int8,
"csfb_original_authenticationg_success" int8,
"csfb_original_authentication_timedelay" int8,
"csfb_original_security_request" int8,
"csfb_original_securityg_success" int8,
"csfb_original_security_timedelay" int8,
"csfb_terminal_request" int8,
"csfb_terminal_success" int8,
"csfb_terminal_failure" int8,
"csfb_terminal_authentication_request" int8,
"csfb_terminal_authenticationg_success" int8,
"csfb_terminal_authentication_timedelay" int8,
"csfb_terminal_security_request" int8,
"csfb_terminal_securityg_success" int8,
"csfb_terminal_security_timedelay" int8,
"csfb_emergency_request" int8,
"csfb_emergency_success" int8,
"csfb_emergency_failure" int8
)
;

-- ----------------------------
-- Table structure for gem_s11_event_5m_statistics_by_imsi
-- ----------------------------
DROP TABLE IF EXISTS  "gem_s11_event_5m_statistics_by_imsi";
CREATE TABLE  "gem_s11_event_5m_statistics_by_imsi" (
"datetime" timestamp(6),
"imsi" varchar  ,
"msisdn" varchar  ,
"event_type" varchar(8)  ,
"request_count" int4 ,
"success_count" int4,
"abnormal_count" int4 ,
"response_delay_time" int8,
"no_resp_count" int4,
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP()
)
;

-- ----------------------------
-- Table structure for gem_s11_kpi_1d_failure_statistics
-- ----------------------------
DROP TABLE IF EXISTS  "gem_s11_kpi_1d_failure_statistics";
CREATE TABLE  "gem_s11_kpi_1d_failure_statistics" (
"datetime" timestamp(6),
"whole_network" varchar  ,
"mme_code" varchar  ,
"sgw" varchar  ,
"pgw" varchar  ,
"tac" varchar  ,
"cell_id" varchar  ,
"apn" varchar  ,
"event_type" varchar  ,
"abnormal_type" int4,
"abnormal_reason" int4,
"abnormal_reason_count" int8,
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP()
)
;

-- ----------------------------
-- Table structure for gem_s11_kpi_1d_statistics
-- ----------------------------
DROP TABLE IF EXISTS  "gem_s11_kpi_1d_statistics";
CREATE TABLE  "gem_s11_kpi_1d_statistics" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"whole_network" varchar  ,
"mme_code" varchar  ,
"sgw" varchar  ,
"pgw" varchar  ,
"tac" varchar  ,
"cell_id" varchar  ,
"apn" varchar  ,
"datetime" timestamp(6),
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP(),
"session_establish_request" int8,
"session_establish_success" int8,
"session_establish_success_ratio" numeric,
"session_establish_timedelay" int8,
"session_establish_failure" int8,
"session_delete_request" int8,
"session_delete_success" int8,
"session_delete_success_ratio" numeric,
"session_delete_timedelay" int8,
"session_delete_failure" int8,
"bearer_creat_request" int8,
"bearer_creat_success" int8,
"bearer_creat_success_ratio" numeric,
"bearer_creat_timedelay" int8,
"bearer_creat_failure" int8,
"bearer_modify_request" int8,
"bearer_modify_success" int8,
"bearer_modify_success_ratio" numeric,
"bearer_modify_timedelay" int8,
"bearer_modify_failure" int8,
"bearer_modify_command_request" int8,
"bearer_modify_command_success" int8,
"bearer_modify_command_success_ratio" numeric,
"bearer_modify_command_failure" int8,
"bearer_delete_command_request" int8,
"bearer_delete_command_success" int8,
"bearer_delete_command_success_ratio" numeric,
"bearer_delete_command_failure" int8,
"bearer_resource_command_request" int8,
"bearer_resource_command_success" int8,
"bearer_resource_command_success_ratio" numeric,
"bearer_resource_command_failure" int8,
"bearer_update_request" int8,
"bearer_update_success" int8,
"bearer_update_success_ratio" numeric,
"bearer_update_timedelay" int8,
"bearer_update_failure" int8,
"bearer_delete_request" int8,
"bearer_delete_success" int8,
"bearer_delete_success_ratio" numeric,
"bearer_delete_timedelay" int8,
"bearer_delete_failure" int8,
"release_access_bearer_request" int8,
"release_access_bearer_success" int8,
"release_access_bearer_success_ratio" numeric,
"release_access_bearer_timedelay" int8,
"release_access_bearer_failure" int8,
"modify_access_bearer_request" int8,
"modify_access_bearer_success" int8,
"modify_access_bearer_success_ratio" numeric,
"modify_access_bearer_timedelay" int8,
"modify_access_bearer_failure" int8,
"change_notification_request" int8,
"change_notification_success" int8,
"change_notification_success_ratio" numeric,
"change_notification_timedelay" int8,
"change_notification_failure" int8,
"suspend_notification_request" int8,
"suspend_notification_success" int8,
"suspend_notification_success_ratio" numeric,
"suspend_notification_timedelay" int8,
"suspend_notification_failure" int8,
"resume_notification_request" int8,
"resume_notification_success" int8,
"resume_notification_success_ratio" numeric,
"resume_notification_timedelay" int8,
"resume_notification_failure" int8,
"downlink_data_notification_request" int8,
"downlink_data_notification_success" int8,
"downlink_data_notification_success_ratio" numeric,
"downlink_data_notification_timedelay" int8,
"downlink_data_notification_failure" int8,
"downlink_data_notification_failure_indication_request" int8,
"create_indirect_data_forward_tunnel_request" int8,
"create_indirect_data_forward_tunnel_success" int8,
"create_indirect_data_forward_tunnel_success_ratio" numeric,
"create_indirect_data_forward_tunnel_timedelay" int8,
"create_indirect_data_forward_tunnel_failure" int8,
"delete_indirect_data_forward_tunnel_request" int8,
"delete_indirect_data_forward_tunnel_success" int8,
"delete_indirect_data_forward_tunnel_success_ratio" numeric,
"delete_indirect_data_forward_tunnel_timedelay" int8,
"delete_indirect_data_forward_tunnel_failure" int8,
"stop_paging_indication_request" int8,
"pgw_restart_notification_request" int8,
"pgw_restart_notification_success" int8,
"pgw_restart_notification_success_ratio" numeric,
"pgw_restart_notification_timedelay" int8,
"pgw_restart_notification_failure" int8,
"delete_pdn_connect_set_request" int8,
"delete_pdn_connect_set_success" int8,
"delete_pdn_connect_set_success_ratio" numeric,
"delete_pdn_connect_set_timedelay" int8,
"delete_pdn_connect_set_failure" int8,
"trace_session_activation_request" int8,
"trace_session_deactivation_request" int8
)
;

-- ----------------------------
-- Table structure for gem_s11_kpi_1h_failure_statistics
-- ----------------------------
DROP TABLE IF EXISTS  "gem_s11_kpi_1h_failure_statistics";
CREATE TABLE  "gem_s11_kpi_1h_failure_statistics" (
"datetime" timestamp(6),
"whole_network" varchar  ,
"mme_code" varchar  ,
"sgw" varchar  ,
"pgw" varchar  ,
"tac" varchar  ,
"cell_id" varchar  ,
"apn" varchar  ,
"event_type" varchar  ,
"abnormal_type" int4,
"abnormal_reason" int4,
"abnormal_reason_count" int8,
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP()
)
;

-- ----------------------------
-- Table structure for gem_s11_kpi_1h_statistics
-- ----------------------------
DROP TABLE IF EXISTS  "gem_s11_kpi_1h_statistics";
CREATE TABLE  "gem_s11_kpi_1h_statistics" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"whole_network" varchar  ,
"mme_code" varchar  ,
"sgw" varchar  ,
"pgw" varchar  ,
"tac" varchar  ,
"cell_id" varchar  ,
"apn" varchar  ,
"datetime" timestamp(6),
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP(),
"session_establish_request" int8,
"session_establish_success" int8,
"session_establish_success_ratio" numeric,
"session_establish_timedelay" int8,
"session_establish_failure" int8,
"session_delete_request" int8,
"session_delete_success" int8,
"session_delete_success_ratio" numeric,
"session_delete_timedelay" int8,
"session_delete_failure" int8,
"bearer_creat_request" int8,
"bearer_creat_success" int8,
"bearer_creat_success_ratio" numeric,
"bearer_creat_timedelay" int8,
"bearer_creat_failure" int8,
"bearer_modify_request" int8,
"bearer_modify_success" int8,
"bearer_modify_success_ratio" numeric,
"bearer_modify_timedelay" int8,
"bearer_modify_failure" int8,
"bearer_modify_command_request" int8,
"bearer_modify_command_success" int8,
"bearer_modify_command_success_ratio" numeric,
"bearer_modify_command_failure" int8,
"bearer_delete_command_request" int8,
"bearer_delete_command_success" int8,
"bearer_delete_command_success_ratio" numeric,
"bearer_delete_command_failure" int8,
"bearer_resource_command_request" int8,
"bearer_resource_command_success" int8,
"bearer_resource_command_success_ratio" numeric,
"bearer_resource_command_failure" int8,
"bearer_update_request" int8,
"bearer_update_success" int8,
"bearer_update_success_ratio" numeric,
"bearer_update_timedelay" int8,
"bearer_update_failure" int8,
"bearer_delete_request" int8,
"bearer_delete_success" int8,
"bearer_delete_success_ratio" numeric,
"bearer_delete_timedelay" int8,
"bearer_delete_failure" int8,
"release_access_bearer_request" int8,
"release_access_bearer_success" int8,
"release_access_bearer_success_ratio" numeric,
"release_access_bearer_timedelay" int8,
"release_access_bearer_failure" int8,
"modify_access_bearer_request" int8,
"modify_access_bearer_success" int8,
"modify_access_bearer_success_ratio" numeric,
"modify_access_bearer_timedelay" int8,
"modify_access_bearer_failure" int8,
"change_notification_request" int8,
"change_notification_success" int8,
"change_notification_success_ratio" numeric,
"change_notification_timedelay" int8,
"change_notification_failure" int8,
"suspend_notification_request" int8,
"suspend_notification_success" int8,
"suspend_notification_success_ratio" numeric,
"suspend_notification_timedelay" int8,
"suspend_notification_failure" int8,
"resume_notification_request" int8,
"resume_notification_success" int8,
"resume_notification_success_ratio" numeric,
"resume_notification_timedelay" int8,
"resume_notification_failure" int8,
"downlink_data_notification_request" int8,
"downlink_data_notification_success" int8,
"downlink_data_notification_success_ratio" numeric,
"downlink_data_notification_timedelay" int8,
"downlink_data_notification_failure" int8,
"downlink_data_notification_failure_indication_request" int8,
"create_indirect_data_forward_tunnel_request" int8,
"create_indirect_data_forward_tunnel_success" int8,
"create_indirect_data_forward_tunnel_success_ratio" numeric,
"create_indirect_data_forward_tunnel_timedelay" int8,
"create_indirect_data_forward_tunnel_failure" int8,
"delete_indirect_data_forward_tunnel_request" int8,
"delete_indirect_data_forward_tunnel_success" int8,
"delete_indirect_data_forward_tunnel_success_ratio" numeric,
"delete_indirect_data_forward_tunnel_timedelay" int8,
"delete_indirect_data_forward_tunnel_failure" int8,
"stop_paging_indication_request" int8,
"pgw_restart_notification_request" int8,
"pgw_restart_notification_success" int8,
"pgw_restart_notification_success_ratio" numeric,
"pgw_restart_notification_timedelay" int8,
"pgw_restart_notification_failure" int8,
"delete_pdn_connect_set_request" int8,
"delete_pdn_connect_set_success" int8,
"delete_pdn_connect_set_success_ratio" numeric,
"delete_pdn_connect_set_timedelay" int8,
"delete_pdn_connect_set_failure" int8,
"trace_session_activation_request" int8,
"trace_session_deactivation_request" int8
)
;

-- ----------------------------
-- Table structure for gem_s11_kpi_5m_failure_statistics
-- ----------------------------
DROP TABLE IF EXISTS  "gem_s11_kpi_5m_failure_statistics";
CREATE TABLE  "gem_s11_kpi_5m_failure_statistics" (
"datetime" timestamp(6),
"whole_network" varchar  ,
"mme_code" varchar  ,
"sgw" varchar  ,
"pgw" varchar  ,
"tac" varchar  ,
"cell_id" varchar  ,
"apn" varchar  ,
"event_type" varchar  ,
"abnormal_type" int4,
"abnormal_reason" int4,
"abnormal_reason_count" int8,
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP()
)
;

-- ----------------------------
-- Table structure for gem_s11_kpi_5m_statistics
-- ----------------------------
DROP TABLE IF EXISTS  "gem_s11_kpi_5m_statistics";
CREATE TABLE  "gem_s11_kpi_5m_statistics" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"whole_network" varchar  ,
"mme_code" varchar  ,
"sgw" varchar  ,
"pgw" varchar  ,
"tac" varchar  ,
"cell_id" varchar  ,
"apn" varchar  ,
"datetime" timestamp(6),
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP(),
"session_establish_request" int8,
"session_establish_success" int8,
"session_establish_success_ratio" numeric,
"session_establish_timedelay" int8,
"session_establish_failure" int8,
"session_delete_request" int8,
"session_delete_success" int8,
"session_delete_success_ratio" numeric,
"session_delete_timedelay" int8,
"session_delete_failure" int8,
"bearer_creat_request" int8,
"bearer_creat_success" int8,
"bearer_creat_success_ratio" numeric,
"bearer_creat_timedelay" int8,
"bearer_creat_failure" int8,
"bearer_modify_request" int8,
"bearer_modify_success" int8,
"bearer_modify_success_ratio" numeric,
"bearer_modify_timedelay" int8,
"bearer_modify_failure" int8,
"bearer_modify_command_request" int8,
"bearer_modify_command_success" int8,
"bearer_modify_command_success_ratio" numeric,
"bearer_modify_command_failure" int8,
"bearer_delete_command_request" int8,
"bearer_delete_command_success" int8,
"bearer_delete_command_success_ratio" numeric,
"bearer_delete_command_failure" int8,
"bearer_resource_command_request" int8,
"bearer_resource_command_success" int8,
"bearer_resource_command_success_ratio" numeric,
"bearer_resource_command_failure" int8,
"bearer_update_request" int8,
"bearer_update_success" int8,
"bearer_update_success_ratio" numeric,
"bearer_update_timedelay" int8,
"bearer_update_failure" int8,
"bearer_delete_request" int8,
"bearer_delete_success" int8,
"bearer_delete_success_ratio" numeric,
"bearer_delete_timedelay" int8,
"bearer_delete_failure" int8,
"release_access_bearer_request" int8,
"release_access_bearer_success" int8,
"release_access_bearer_success_ratio" numeric,
"release_access_bearer_timedelay" int8,
"release_access_bearer_failure" int8,
"modify_access_bearer_request" int8,
"modify_access_bearer_success" int8,
"modify_access_bearer_success_ratio" numeric,
"modify_access_bearer_timedelay" int8,
"modify_access_bearer_failure" int8,
"change_notification_request" int8,
"change_notification_success" int8,
"change_notification_success_ratio" numeric,
"change_notification_timedelay" int8,
"change_notification_failure" int8,
"suspend_notification_request" int8,
"suspend_notification_success" int8,
"suspend_notification_success_ratio" numeric,
"suspend_notification_timedelay" int8,
"suspend_notification_failure" int8,
"resume_notification_request" int8,
"resume_notification_success" int8,
"resume_notification_success_ratio" numeric,
"resume_notification_timedelay" int8,
"resume_notification_failure" int8,
"downlink_data_notification_request" int8,
"downlink_data_notification_success" int8,
"downlink_data_notification_success_ratio" numeric,
"downlink_data_notification_timedelay" int8,
"downlink_data_notification_failure" int8,
"downlink_data_notification_failure_indication_request" int8,
"create_indirect_data_forward_tunnel_request" int8,
"create_indirect_data_forward_tunnel_success" int8,
"create_indirect_data_forward_tunnel_success_ratio" numeric,
"create_indirect_data_forward_tunnel_timedelay" int8,
"create_indirect_data_forward_tunnel_failure" int8,
"delete_indirect_data_forward_tunnel_request" int8,
"delete_indirect_data_forward_tunnel_success" int8,
"delete_indirect_data_forward_tunnel_success_ratio" numeric,
"delete_indirect_data_forward_tunnel_timedelay" int8,
"delete_indirect_data_forward_tunnel_failure" int8,
"stop_paging_indication_request" int8,
"pgw_restart_notification_request" int8,
"pgw_restart_notification_success" int8,
"pgw_restart_notification_success_ratio" numeric,
"pgw_restart_notification_timedelay" int8,
"pgw_restart_notification_failure" int8,
"delete_pdn_connect_set_request" int8,
"delete_pdn_connect_set_success" int8,
"delete_pdn_connect_set_success_ratio" numeric,
"delete_pdn_connect_set_timedelay" int8,
"delete_pdn_connect_set_failure" int8,
"trace_session_activation_request" int8,
"trace_session_deactivation_request" int8
)
;

-- ----------------------------
-- Table structure for gem_s1u_dns_event_5m_statistics_by_imsi
-- ----------------------------
DROP TABLE IF EXISTS  "gem_s1u_dns_event_5m_statistics_by_imsi";
CREATE TABLE  "gem_s1u_dns_event_5m_statistics_by_imsi" (
"datetime" timestamp(6),
"imsi" varchar  ,
"msisdn" varchar  ,
"event_type" varchar  ,
"request_count" int4,
"success_count" int4,
"abnormal_count" int4,
"response_delay_time" int8,
"ul_ip_packet_count" int4,
"dl_ip_packet_count" int4,
"ul_data_sum" float4,
"dl_data_sum" float4,
"no_resp_count" int4,
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP()
)
;

-- ----------------------------
-- Table structure for gem_s1u_dns_kpi_1d_failure_statistics
-- ----------------------------
DROP TABLE IF EXISTS  "gem_s1u_dns_kpi_1d_failure_statistics";
CREATE TABLE  "gem_s1u_dns_kpi_1d_failure_statistics" (
"datetime" timestamp(6),
"whole_network" varchar  ,
"sgw" varchar  ,
"tac" varchar  ,
"enodeb_id" varchar  ,
"cell_id" varchar  ,
"imsi" varchar  ,
"ue_brand" varchar  ,
"ue_type" varchar  ,
"business_type" varchar  ,
"detail_business" varchar  ,
"event_type" varchar  ,
"abnormal_type" int4,
"abnormal_reason" int4,
"abnormal_reason_count" int8,
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP()
)
;

-- ----------------------------
-- Table structure for gem_s1u_dns_kpi_1d_statistics
-- ----------------------------
DROP TABLE IF EXISTS  "gem_s1u_dns_kpi_1d_statistics";
CREATE TABLE  "gem_s1u_dns_kpi_1d_statistics" (
"whole_network" varchar  ,
"sgw" varchar  ,
"tac" varchar  ,
"enodeb_id" varchar  ,
"cell_id" varchar  ,
"imsi" varchar  ,
"ue_brand" varchar  ,
"ue_type" varchar  ,
"business_type" varchar  ,
"detail_business" varchar  ,
"datetime" timestamp(6),
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP(),
"tcp_up_link_request_count" int8,
"tcp_up_link_success_count" int8,
"tcp_up_link_success_ratio" numeric,
"tcp_up_link_timedelay" int8,
"tcp_dl_link_request_count" int8,
"tcp_dl_link_success_count" int8,
"tcp_dl_link_success_ratio" numeric,
"tcp_dl_link_timedelay" int8,
"tcp_link_success_ratio" numeric,
"tcp_link_timedelay" int8,
"dns_request_count" int8,
"dns_failure_count" int8,
"dns_system_success_count" int8,
"dns_service_success_count" int8,
"dns_no_response_count" int8,
"dns_failure_ratio" numeric,
"dns_system_success_ratio" numeric,
"dns_service_success_ratio" numeric,
"dns_no_response_ratio" numeric
)
;

-- ----------------------------
-- Table structure for gem_s1u_dns_kpi_1h_failure_statistics
-- ----------------------------
DROP TABLE IF EXISTS  "gem_s1u_dns_kpi_1h_failure_statistics";
CREATE TABLE  "gem_s1u_dns_kpi_1h_failure_statistics" (
"datetime" timestamp(6),
"whole_network" varchar  ,
"sgw" varchar  ,
"tac" varchar  ,
"enodeb_id" varchar  ,
"cell_id" varchar  ,
"imsi" varchar  ,
"ue_brand" varchar  ,
"ue_type" varchar  ,
"business_type" varchar  ,
"detail_business" varchar  ,
"event_type" varchar  ,
"abnormal_type" int4,
"abnormal_reason" int4,
"abnormal_reason_count" int8,
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP()
)
;

-- ----------------------------
-- Table structure for gem_s1u_dns_kpi_1h_statistics
-- ----------------------------
DROP TABLE IF EXISTS  "gem_s1u_dns_kpi_1h_statistics";
CREATE TABLE  "gem_s1u_dns_kpi_1h_statistics" (
"whole_network" varchar  ,
"sgw" varchar  ,
"tac" varchar  ,
"enodeb_id" varchar  ,
"cell_id" varchar  ,
"imsi" varchar  ,
"ue_brand" varchar  ,
"ue_type" varchar  ,
"business_type" varchar  ,
"detail_business" varchar  ,
"datetime" timestamp(6),
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP(),
"tcp_up_link_request_count" int8,
"tcp_up_link_success_count" int8,
"tcp_up_link_success_ratio" numeric,
"tcp_up_link_timedelay" int8,
"tcp_dl_link_request_count" int8,
"tcp_dl_link_success_count" int8,
"tcp_dl_link_success_ratio" numeric,
"tcp_dl_link_timedelay" int8,
"tcp_link_success_ratio" numeric,
"tcp_link_timedelay" int8,
"dns_request_count" int8,
"dns_failure_count" int8,
"dns_system_success_count" int8,
"dns_service_success_count" int8,
"dns_no_response_count" int8,
"dns_failure_ratio" numeric,
"dns_system_success_ratio" numeric,
"dns_service_success_ratio" numeric,
"dns_no_response_ratio" numeric
)
;

-- ----------------------------
-- Table structure for gem_s1u_dns_kpi_5m_failure_statistics
-- ----------------------------
DROP TABLE IF EXISTS  "gem_s1u_dns_kpi_5m_failure_statistics";
CREATE TABLE  "gem_s1u_dns_kpi_5m_failure_statistics" (
"datetime" timestamp(6),
"whole_network" varchar  ,
"sgw" varchar  ,
"tac" varchar  ,
"enodeb_id" varchar  ,
"cell_id" varchar  ,
"imsi" varchar  ,
"ue_brand" varchar  ,
"ue_type" varchar  ,
"business_type" varchar  ,
"detail_business" varchar  ,
"event_type" varchar  ,
"abnormal_type" int4,
"abnormal_reason" int4,
"abnormal_reason_count" int8,
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP()
)
;

-- ----------------------------
-- Table structure for gem_s1u_dns_kpi_5m_statistics
-- ----------------------------
DROP TABLE IF EXISTS  "gem_s1u_dns_kpi_5m_statistics";
CREATE TABLE  "gem_s1u_dns_kpi_5m_statistics" (
"whole_network" varchar  ,
"sgw" varchar  ,
"tac" varchar  ,
"enodeb_id" varchar  ,
"cell_id" varchar  ,
"imsi" varchar  ,
"ue_brand" varchar  ,
"ue_type" varchar  ,
"business_type" varchar  ,
"detail_business" varchar  ,
"datetime" timestamp(6),
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP(),
"tcp_up_link_request_count" int8,
"tcp_up_link_success_count" int8,
"tcp_up_link_success_ratio" numeric,
"tcp_up_link_timedelay" int8,
"tcp_dl_link_request_count" int8,
"tcp_dl_link_success_count" int8,
"tcp_dl_link_success_ratio" numeric,
"tcp_dl_link_timedelay" int8,
"tcp_link_success_ratio" numeric,
"tcp_link_timedelay" int8,
"dns_request_count" int8,
"dns_failure_count" int8,
"dns_system_success_count" int8,
"dns_service_success_count" int8,
"dns_no_response_count" int8,
"dns_failure_ratio" numeric,
"dns_system_success_ratio" numeric,
"dns_service_success_ratio" numeric,
"dns_no_response_ratio" numeric
)
;

-- ----------------------------
-- Table structure for gem_s1u_event_5m_statistics_by_imsi
-- ----------------------------
DROP TABLE IF EXISTS  "gem_s1u_event_5m_statistics_by_imsi";
CREATE TABLE  "gem_s1u_event_5m_statistics_by_imsi" (
"datetime" timestamp(6),
"imsi" varchar  ,
"msisdn" varchar  ,
"event_type" varchar  ,
"request_count" int4,
"success_count" int4,
"abnormal_count" int4,
"response_delay_time" int8,
"no_resp_count" int4,
"ul_ip_packet_count" int4,
"dl_ip_packet_count" int4,
"ul_data_sum" float8,
"dl_data_sum" float8,
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP()
)
;

-- ----------------------------
-- Table structure for gem_s1u_http_event_5m_statistics_by_imsi
-- ----------------------------
DROP TABLE IF EXISTS  "gem_s1u_http_event_5m_statistics_by_imsi";
CREATE TABLE  "gem_s1u_http_event_5m_statistics_by_imsi" (
"datetime" timestamp(6),
"imsi" varchar  ,
"msisdn" varchar  ,
"event_type" varchar  ,
"request_count" int4,
"success_count" int4,
"abnormal_count" int4,
"response_delay_time" int8,
"ul_ip_packet_count" int4,
"dl_ip_packet_count" int4,
"ul_data_sum" float8,
"dl_data_sum" float8,
"http_lastpacket_1streq_delay" int8,
"up_tcp_retrans_num" int4,
"down_tcp_retrans_num" int4,
"up_tcp_lost_num" int4,
"down_tcp_lost_num" int4,
"up_tcp_disorder_num" int4,
"down_tcp_disorder_num" int4,
"ul_ip_frag_packets" int4,
"dl_ip_frag_packets" int4,
"ul_rtt_total_delay" int4,
"ul_rtt_times" int4,
"dl_rtt_total_delay" int4,
"dl_rtt_times" int4,
"tcp_drop_count" int4,
"uereset_count" int4,
"serverreset_count" int4,
"ul_zero_window_count" int4,
"dl_zero_window_count" int4,
"ul_zero_window_total_time" int4,
"dl_zero_window_total_time" int4,
"no_resp_count" int4,
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP()
)
;

-- ----------------------------
-- Table structure for gem_s1u_http_kpi_1d_failure_statistics
-- ----------------------------
DROP TABLE IF EXISTS  "gem_s1u_http_kpi_1d_failure_statistics";
CREATE TABLE  "gem_s1u_http_kpi_1d_failure_statistics" (
"datetime" timestamp(6),
"whole_network" varchar  ,
"sgw" varchar  ,
"tac" varchar  ,
"enodeb_id" varchar  ,
"cell_id" varchar  ,
"imsi" varchar  ,
"ue_brand" varchar  ,
"ue_type" varchar  ,
"business_type" varchar  ,
"detail_business" varchar  ,
"event_type" varchar  ,
"abnormal_type" int4,
"abnormal_reason" int4,
"abnormal_reason_count" int8,
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP()
)
;

-- ----------------------------
-- Table structure for gem_s1u_http_kpi_1d_statistics
-- ----------------------------
DROP TABLE IF EXISTS  "gem_s1u_http_kpi_1d_statistics";
CREATE TABLE  "gem_s1u_http_kpi_1d_statistics" (
"whole_network" varchar  ,
"sgw" varchar  ,
"tac" varchar  ,
"enodeb_id" varchar  ,
"cell_id" varchar  ,
"imsi" varchar  ,
"ue_brand" varchar  ,
"ue_type" varchar  ,
"business_type" varchar  ,
"detail_business" varchar  ,
"datetime" timestamp(6),
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP(),
"tcp_up_link_request_count" int8,
"tcp_up_link_success_count" int8,
"tcp_up_link_success_ratio" numeric,
"tcp_up_link_timedelay" int8,
"tcp_dl_link_request_count" int8,
"tcp_dl_link_success_count" int8,
"tcp_dl_link_success_ratio" numeric,
"tcp_dl_link_timedelay" int8,
"tcp_link_success_ratio" numeric,
"tcp_link_timedelay" int8,
"up_tcp_retrans_count" int8,
"up_tcp_retrans_ratio" numeric,
"dl_tcp_retrans_count" int8,
"dl_tcp_retrans_ratio" numeric,
"up_ip_packet_slicing_count" int8,
"up_ip_packet_slicing_ratio" numeric,
"dl_ip_packet_slicing_count" int8,
"dl_ip_packet_slicing_ratio" numeric,
"up_tcp_disorder_count" int8,
"up_tcp_disorder_ratio" numeric,
"dl_tcp_disorder_count" int8,
"dl_tcp_disorder_ratio" numeric,
"tcp_dropping_count" int8,
"tcp_dropping_ratio" numeric,
"get_request_count" int8,
"get_success_count" int8,
"get_success_ratio" numeric,
"get_resp_timedelay" int8,
"post_request_count" int8,
"post_success_count" int8,
"post_success_ratio" numeric,
"post_resp_timedelay" int8,
"http_request_count" int8,
"http_success_count" int8,
"http_success_ratio" numeric,
"http_resp_timedelay" int8,
"http_dlup_data_more_than_500k" int8,
"http_timedelay_more_than_500k" int8,
"http_speed_more_than_500k" int8,
"rtsp_playing_request_count" int8,
"rtsp_playing_success_count" int8,
"rtsp_playing_success_ratio" numeric,
"rtsp_playing_waiting_time" int8
)
;

-- ----------------------------
-- Table structure for gem_s1u_http_kpi_1h_failure_statistics
-- ----------------------------
DROP TABLE IF EXISTS  "gem_s1u_http_kpi_1h_failure_statistics";
CREATE TABLE  "gem_s1u_http_kpi_1h_failure_statistics" (
"datetime" timestamp(6),
"whole_network" varchar  ,
"sgw" varchar  ,
"tac" varchar  ,
"enodeb_id" varchar  ,
"cell_id" varchar  ,
"imsi" varchar  ,
"ue_brand" varchar  ,
"ue_type" varchar  ,
"business_type" varchar  ,
"detail_business" varchar  ,
"event_type" varchar  ,
"abnormal_type" int4,
"abnormal_reason" int4,
"abnormal_reason_count" int8,
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP()
)
;

-- ----------------------------
-- Table structure for gem_s1u_http_kpi_1h_statistics
-- ----------------------------
DROP TABLE IF EXISTS  "gem_s1u_http_kpi_1h_statistics";
CREATE TABLE  "gem_s1u_http_kpi_1h_statistics" (
"whole_network" varchar  ,
"sgw" varchar  ,
"tac" varchar  ,
"enodeb_id" varchar  ,
"cell_id" varchar  ,
"imsi" varchar  ,
"ue_brand" varchar  ,
"ue_type" varchar  ,
"business_type" varchar  ,
"detail_business" varchar  ,
"datetime" timestamp(6),
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP(),
"tcp_up_link_request_count" int8,
"tcp_up_link_success_count" int8,
"tcp_up_link_success_ratio" numeric,
"tcp_up_link_timedelay" int8,
"tcp_dl_link_request_count" int8,
"tcp_dl_link_success_count" int8,
"tcp_dl_link_success_ratio" numeric,
"tcp_dl_link_timedelay" int8,
"tcp_link_success_ratio" numeric,
"tcp_link_timedelay" int8,
"up_tcp_retrans_count" int8,
"up_tcp_retrans_ratio" numeric,
"dl_tcp_retrans_count" int8,
"dl_tcp_retrans_ratio" numeric,
"up_ip_packet_slicing_count" int8,
"up_ip_packet_slicing_ratio" numeric,
"dl_ip_packet_slicing_count" int8,
"dl_ip_packet_slicing_ratio" numeric,
"up_tcp_disorder_count" int8,
"up_tcp_disorder_ratio" numeric,
"dl_tcp_disorder_count" int8,
"dl_tcp_disorder_ratio" numeric,
"tcp_dropping_count" int8,
"tcp_dropping_ratio" numeric,
"get_request_count" int8,
"get_success_count" int8,
"get_success_ratio" numeric,
"get_resp_timedelay" int8,
"post_request_count" int8,
"post_success_count" int8,
"post_success_ratio" numeric,
"post_resp_timedelay" int8,
"http_request_count" int8,
"http_success_count" int8,
"http_success_ratio" numeric,
"http_resp_timedelay" int8,
"http_dlup_data_more_than_500k" int8,
"http_timedelay_more_than_500k" int8,
"http_speed_more_than_500k" int8,
"rtsp_playing_request_count" int8,
"rtsp_playing_success_count" int8,
"rtsp_playing_success_ratio" numeric,
"rtsp_playing_waiting_time" int8
)
;

-- ----------------------------
-- Table structure for gem_s1u_http_kpi_5m_failure_statistics
-- ----------------------------
DROP TABLE IF EXISTS  "gem_s1u_http_kpi_5m_failure_statistics";
CREATE TABLE  "gem_s1u_http_kpi_5m_failure_statistics" (
"datetime" timestamp(6),
"whole_network" varchar  ,
"sgw" varchar  ,
"tac" varchar  ,
"enodeb_id" varchar  ,
"cell_id" varchar  ,
"imsi" varchar  ,
"ue_brand" varchar  ,
"ue_type" varchar  ,
"business_type" varchar  ,
"detail_business" varchar  ,
"event_type" varchar  ,
"abnormal_type" int4,
"abnormal_reason" int4,
"abnormal_reason_count" int8,
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP()
)
;

-- ----------------------------
-- Table structure for gem_s1u_http_kpi_5m_statistics
-- ----------------------------
DROP TABLE IF EXISTS  "gem_s1u_http_kpi_5m_statistics";
CREATE TABLE  "gem_s1u_http_kpi_5m_statistics" (
"whole_network" varchar  ,
"sgw" varchar  ,
"tac" varchar  ,
"enodeb_id" varchar  ,
"cell_id" varchar  ,
"imsi" varchar  ,
"ue_brand" varchar  ,
"ue_type" varchar  ,
"business_type" varchar  ,
"detail_business" varchar  ,
"datetime" timestamp(6),
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP(),
"tcp_up_link_request_count" int8,
"tcp_up_link_success_count" int8,
"tcp_up_link_success_ratio" numeric,
"tcp_up_link_timedelay" int8,
"tcp_dl_link_request_count" int8,
"tcp_dl_link_success_count" int8,
"tcp_dl_link_success_ratio" numeric,
"tcp_dl_link_timedelay" int8,
"tcp_link_success_ratio" numeric,
"tcp_link_timedelay" int8,
"up_tcp_retrans_count" int8,
"up_tcp_retrans_ratio" numeric,
"dl_tcp_retrans_count" int8,
"dl_tcp_retrans_ratio" numeric,
"up_ip_packet_slicing_count" int8,
"up_ip_packet_slicing_ratio" numeric,
"dl_ip_packet_slicing_count" int8,
"dl_ip_packet_slicing_ratio" numeric,
"up_tcp_disorder_count" int8,
"up_tcp_disorder_ratio" numeric,
"dl_tcp_disorder_count" int8,
"dl_tcp_disorder_ratio" numeric,
"tcp_dropping_count" int8,
"tcp_dropping_ratio" numeric,
"get_request_count" int8,
"get_success_count" int8,
"get_success_ratio" numeric,
"get_resp_timedelay" int8,
"post_request_count" int8,
"post_success_count" int8,
"post_success_ratio" numeric,
"post_resp_timedelay" int8,
"http_request_count" int8,
"http_success_count" int8,
"http_success_ratio" numeric,
"http_resp_timedelay" int8,
"http_dlup_data_more_than_500k" int8,
"http_timedelay_more_than_500k" int8,
"http_speed_more_than_500k" int8,
"rtsp_playing_request_count" int8,
"rtsp_playing_success_count" int8,
"rtsp_playing_success_ratio" numeric,
"rtsp_playing_waiting_time" int8
)
;

-- ----------------------------
-- Table structure for gem_s1u_im_kpi_1d_failure_statistics
-- ----------------------------
DROP TABLE IF EXISTS  "gem_s1u_im_kpi_1d_failure_statistics";
CREATE TABLE  "gem_s1u_im_kpi_1d_failure_statistics" (
"datetime" timestamp(6),
"whole_network" varchar  ,
"sgw" varchar  ,
"tac" varchar  ,
"enodeb_id" varchar  ,
"cell_id" varchar  ,
"imsi" varchar  ,
"ue_brand" varchar  ,
"ue_type" varchar  ,
"business_type" varchar  ,
"detail_business" varchar  ,
"event_type" varchar  ,
"abnormal_type" int4,
"abnormal_reason" int4,
"abnormal_reason_count" int8,
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP()
)
;

-- ----------------------------
-- Table structure for gem_s1u_im_kpi_1d_statistics
-- ----------------------------
DROP TABLE IF EXISTS  "gem_s1u_im_kpi_1d_statistics";
CREATE TABLE  "gem_s1u_im_kpi_1d_statistics" (
"whole_network" varchar  ,
"sgw" varchar  ,
"tac" varchar  ,
"enodeb_id" varchar  ,
"cell_id" varchar  ,
"imsi" varchar  ,
"ue_brand" varchar  ,
"ue_type" varchar  ,
"business_type" varchar  ,
"detail_business" varchar  ,
"datetime" timestamp(6),
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP(),
"tcp_up_link_request_count" int8,
"tcp_up_link_success_count" int8,
"tcp_up_link_success_ratio" numeric,
"tcp_up_link_timedelay" int8,
"tcp_dl_link_request_count" int8,
"tcp_dl_link_success_count" int8,
"tcp_dl_link_success_ratio" numeric,
"tcp_dl_link_timedelay" int8,
"tcp_link_success_ratio" numeric,
"tcp_link_timedelay" int8,
"im_login_request_count" int8,
"im_login_success_count" int8,
"im_login_success_ratio" numeric,
"im_login_timedelay" int8
)
;

-- ----------------------------
-- Table structure for gem_s1u_im_kpi_1h_failure_statistics
-- ----------------------------
DROP TABLE IF EXISTS  "gem_s1u_im_kpi_1h_failure_statistics";
CREATE TABLE  "gem_s1u_im_kpi_1h_failure_statistics" (
"datetime" timestamp(6),
"whole_network" varchar  ,
"sgw" varchar  ,
"tac" varchar  ,
"enodeb_id" varchar  ,
"cell_id" varchar  ,
"imsi" varchar  ,
"ue_brand" varchar  ,
"ue_type" varchar  ,
"business_type" varchar  ,
"detail_business" varchar  ,
"event_type" varchar  ,
"abnormal_type" int4,
"abnormal_reason" int4,
"abnormal_reason_count" int8,
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP()
)
;

-- ----------------------------
-- Table structure for gem_s1u_im_kpi_1h_statistics
-- ----------------------------
DROP TABLE IF EXISTS  "gem_s1u_im_kpi_1h_statistics";
CREATE TABLE  "gem_s1u_im_kpi_1h_statistics" (
"whole_network" varchar  ,
"sgw" varchar  ,
"tac" varchar  ,
"enodeb_id" varchar  ,
"cell_id" varchar  ,
"imsi" varchar  ,
"ue_brand" varchar  ,
"ue_type" varchar  ,
"business_type" varchar  ,
"detail_business" varchar  ,
"datetime" timestamp(6),
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP(),
"tcp_up_link_request_count" int8,
"tcp_up_link_success_count" int8,
"tcp_up_link_success_ratio" numeric,
"tcp_up_link_timedelay" int8,
"tcp_dl_link_request_count" int8,
"tcp_dl_link_success_count" int8,
"tcp_dl_link_success_ratio" numeric,
"tcp_dl_link_timedelay" int8,
"tcp_link_success_ratio" numeric,
"tcp_link_timedelay" int8,
"im_login_request_count" int8,
"im_login_success_count" int8,
"im_login_success_ratio" numeric,
"im_login_timedelay" int8
)
;

-- ----------------------------
-- Table structure for gem_s1u_im_kpi_5m_failure_statistics
-- ----------------------------
DROP TABLE IF EXISTS  "gem_s1u_im_kpi_5m_failure_statistics";
CREATE TABLE  "gem_s1u_im_kpi_5m_failure_statistics" (
"datetime" timestamp(6),
"whole_network" varchar  ,
"sgw" varchar  ,
"tac" varchar  ,
"enodeb_id" varchar  ,
"cell_id" varchar  ,
"imsi" varchar  ,
"ue_brand" varchar  ,
"ue_type" varchar  ,
"business_type" varchar  ,
"detail_business" varchar  ,
"event_type" varchar  ,
"abnormal_type" int4,
"abnormal_reason" int4,
"abnormal_reason_count" int8,
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP()
)
;

-- ----------------------------
-- Table structure for gem_s1u_im_kpi_5m_statistics
-- ----------------------------
DROP TABLE IF EXISTS  "gem_s1u_im_kpi_5m_statistics";
CREATE TABLE  "gem_s1u_im_kpi_5m_statistics" (
"whole_network" varchar  ,
"sgw" varchar  ,
"tac" varchar  ,
"enodeb_id" varchar  ,
"cell_id" varchar  ,
"imsi" varchar  ,
"ue_brand" varchar  ,
"ue_type" varchar  ,
"business_type" varchar  ,
"detail_business" varchar  ,
"datetime" timestamp(6),
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP(),
"tcp_up_link_request_count" int8,
"tcp_up_link_success_count" int8,
"tcp_up_link_success_ratio" numeric,
"tcp_up_link_timedelay" int8,
"tcp_dl_link_request_count" int8,
"tcp_dl_link_success_count" int8,
"tcp_dl_link_success_ratio" numeric,
"tcp_dl_link_timedelay" int8,
"tcp_link_success_ratio" numeric,
"tcp_link_timedelay" int8,
"im_login_request_count" int8,
"im_login_success_count" int8,
"im_login_success_ratio" numeric,
"im_login_timedelay" int8
)
;

DROP TABLE IF EXISTS gem_s1u_bad_quality_apns CASCADE;

CREATE TABLE gem_s1u_bad_quality_apns
(
   id                     varchar     DEFAULT next_id() NOT NULL,
   statistical_time       timestamp,
   apn                    varchar,
   speed                  varchar,
   success_rate           varchar,
   http_dl_avg_speed_all  varchar,
   created_time           timestamp   DEFAULT now()
);

ALTER TABLE gem_s1u_bad_quality_apns
   ADD CONSTRAINT gem_s1u_bad_quality_apns_pkey
   PRIMARY KEY (id);

COMMENT ON TABLE gem_s1u_bad_quality_apns IS 'S1U质差APN表';
COMMENT ON COLUMN gem_s1u_bad_quality_apns.statistical_time IS '统计时间点';
COMMENT ON COLUMN gem_s1u_bad_quality_apns.apn IS '接入点名';
COMMENT ON COLUMN gem_s1u_bad_quality_apns.speed IS '速率';

COMMIT;

DROP TABLE IF EXISTS gem_s1u_bad_quality_applications CASCADE;
CREATE TABLE gem_s1u_bad_quality_applications
(
   id                varchar     DEFAULT next_id() NOT NULL,
   statistical_time  timestamp,
   intwruleid        varchar,
   speed             varchar,
   success_rate      varchar,
   created_time      timestamp   DEFAULT now()
);

ALTER TABLE gem_s1u_bad_quality_applications
   ADD CONSTRAINT gem_s1u_bad_quality_applications_pkey
   PRIMARY KEY (id);

COMMENT ON TABLE gem_s1u_bad_quality_applications IS 'S1U质差业务表';
COMMIT;


-- ----------------------------
-- Table structure for gem_s1u_bad_quality_enodeb
-- ----------------------------
DROP TABLE IF EXISTS gem_s1u_bad_quality_enodeb CASCADE;

CREATE TABLE gem_s1u_bad_quality_enodeb
(
   id                     varchar     DEFAULT next_id() NOT NULL,
   statistical_time       timestamp,
   enb_sgsn_ip_add        varchar,
   speed                  varchar,
   success_rate           varchar,
   http_dl_avg_speed_all  varchar,
   created_time           timestamp   DEFAULT now()
);

ALTER TABLE gem_s1u_bad_quality_enodeb
   ADD CONSTRAINT gem_s1u_bad_quality_enodeb_pkey
   PRIMARY KEY (id);

COMMENT ON TABLE gem_s1u_bad_quality_enodeb IS 'S1U质差enb表';
COMMIT;

;

-- ----------------------------
-- Table structure for gem_s1u_bad_quality_ipv4
-- ----------------------------
DROP TABLE IF EXISTS gem_s1u_bad_quality_ipv4 CASCADE;

CREATE TABLE gem_s1u_bad_quality_ipv4
(
   id                     varchar     DEFAULT next_id() NOT NULL,
   statistical_time       timestamp,
   app_server_ipv4        varchar,
   speed                  varchar,
   success_rate           varchar,
   http_dl_avg_speed_all  varchar,
   created_time           timestamp   DEFAULT now()
);

ALTER TABLE gem_s1u_bad_quality_ipv4
   ADD CONSTRAINT gem_s1u_bad_quality_ipv4_pkey
   PRIMARY KEY (id);

COMMENT ON TABLE gem_s1u_bad_quality_ipv4 IS 'S1U质差IP表';
COMMIT;



-- ----------------------------
-- Table structure for gem_s1u_bad_quality_pre_ipv4
-- ----------------------------
DROP TABLE IF EXISTS gem_s1u_bad_quality_pre_ipv4 CASCADE;

CREATE TABLE gem_s1u_bad_quality_pre_ipv4
(
   id                     varchar     DEFAULT next_id() NOT NULL,
   datetime               timestamp,
   pre_user_ipv4          varchar,
   speed                  varchar,
   success_rate           varchar,
   http_dl_avg_speed_all  varchar,
   created_time           timestamp   DEFAULT now()
);

ALTER TABLE gem_s1u_bad_quality_pre_ipv4
   ADD CONSTRAINT gem_s1u_bad_quality_pre_ipv4_pkey
   PRIMARY KEY (id);

COMMENT ON TABLE gem_s1u_bad_quality_pre_ipv4 IS '质差用户IP段表';
COMMIT;


-- ----------------------------
-- Table structure for gem_s1u_bad_quality_sgw
-- ----------------------------
DROP TABLE IF EXISTS gem_s1u_bad_quality_sgw CASCADE;

CREATE TABLE gem_s1u_bad_quality_sgw
(
   id                     varchar     DEFAULT next_id() NOT NULL,
   statistical_time       timestamp,
   sgw_ggsn_ip_add        varchar,
   speed                  varchar,
   success_rate           varchar,
   http_dl_avg_speed_all  varchar,
   created_time           timestamp   DEFAULT now()
);

ALTER TABLE gem_s1u_bad_quality_sgw
   ADD CONSTRAINT gem_s1u_bad_quality_sgw_pkey
   PRIMARY KEY (id);

COMMENT ON TABLE gem_s1u_bad_quality_sgw IS 'S1U质差SGW表';
COMMIT;



-- ----------------------------
-- Table structure for gem_s1u_bad_quality_terminals
-- ----------------------------
DROP TABLE IF EXISTS gem_s1u_bad_quality_terminals CASCADE;

CREATE TABLE gem_s1u_bad_quality_terminals
(
   id                varchar     DEFAULT next_id() NOT NULL,
   statistical_time  timestamp,
   imei              varchar,
   speed             varchar,
   success_rate      varchar,
   created_time      timestamp   DEFAULT now()
);

ALTER TABLE gem_s1u_bad_quality_terminals
   ADD CONSTRAINT gem_s1u_bad_quality_terminals_pkey
   PRIMARY KEY (id);

COMMENT ON TABLE gem_s1u_bad_quality_terminals IS 'S1U质差终端表';
COMMIT;



-- ----------------------------
-- Table structure for gem_s1u_bad_quality_terminal_applications
-- ----------------------------
DROP TABLE IF EXISTS gem_s1u_bad_quality_terminal_applications CASCADE;

CREATE TABLE gem_s1u_bad_quality_terminal_applications
(
   id                     varchar     DEFAULT next_id() NOT NULL,
   statistical_time       timestamp,
   intwruleid             varchar,
   imei                   varchar,
   speed                  varchar,
   success_rate           varchar,
   http_dl_avg_speed_all  float8,
   created_time           timestamp
);

ALTER TABLE gem_s1u_bad_quality_terminal_applications
   ADD CONSTRAINT gem_s1u_bad_quality_terminal_applications_pkey
   PRIMARY KEY (id);

COMMENT ON TABLE gem_s1u_bad_quality_terminal_applications IS 'S1U终端表现质差业务表';
COMMIT;



-- ----------------------------
-- Table structure for gem_s1u_bad_quality_terminal_ipv4
-- ----------------------------
DROP TABLE IF EXISTS gem_s1u_bad_quality_terminal_ipv4 CASCADE;

CREATE TABLE gem_s1u_bad_quality_terminal_ipv4
(
   id                     varchar     DEFAULT next_id() NOT NULL,
   statistical_time       timestamp,
   app_server_ipv4        varchar,
   imei                   varchar,
   speed                  varchar,
   success_rate           varchar,
   http_dl_avg_speed_all  varchar,
   created_time           timestamp   DEFAULT now()
);

ALTER TABLE gem_s1u_bad_quality_terminal_ipv4
   ADD CONSTRAINT gem_s1u_bad_quality_terminal_ipv4_pkey
   PRIMARY KEY (id);

COMMENT ON TABLE gem_s1u_bad_quality_terminal_ipv4 IS 'S1U终端表现质差业务IP表';
COMMIT;

-- ----------------------------
-- Table structure for gem_s1u_bad_quality_uri_main
-- ----------------------------
DROP TABLE IF EXISTS gem_s1u_bad_quality_uri_main CASCADE;

CREATE TABLE gem_s1u_bad_quality_uri_main
(
   id                     varchar     DEFAULT next_id() NOT NULL,
   statistical_time       timestamp,
   host                   varchar,
   speed                  varchar,
   success_rate           varchar,
   http_dl_avg_speed_all  varchar,
   created_time           timestamp   DEFAULT now()
);

ALTER TABLE gem_s1u_bad_quality_uri_main
   ADD CONSTRAINT gem_s1u_bad_quality_uri_main_pkey
   PRIMARY KEY (id);

COMMENT ON TABLE gem_s1u_bad_quality_uri_main IS 'S1U质差uri_main表';
COMMIT;



-- ----------------------------
-- Table structure for gem_s6a_event_5m_statistics_by_imsi
-- ----------------------------
DROP TABLE IF EXISTS  "gem_s6a_event_5m_statistics_by_imsi";
CREATE TABLE  "gem_s6a_event_5m_statistics_by_imsi" (
"datetime" timestamp(6),
"imsi" varchar  ,
"msisdn" varchar  ,
"event_type" varchar(8)  ,
"request_count" int4 ,
"success_count" int4 ,
"abnormal_count" int4 ,
"response_delay_time" int8,
"no_resp_count" int4 ,
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP()
)
;

-- ----------------------------
-- Table structure for gem_s6a_kpi_1d_failure_statistics
-- ----------------------------
DROP TABLE IF EXISTS  "gem_s6a_kpi_1d_failure_statistics";
CREATE TABLE  "gem_s6a_kpi_1d_failure_statistics" (
"datetime" timestamp(6),
"whole_network" varchar  ,
"mme_code" varchar  ,
"hss" varchar  ,
"event_type" varchar  ,
"abnormal_type" int4,
"abnormal_reason" int4,
"abnormal_reason_count" int8,
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP()
)
;

-- ----------------------------
-- Table structure for gem_s6a_kpi_1d_statistics
-- ----------------------------
DROP TABLE IF EXISTS  "gem_s6a_kpi_1d_statistics";
CREATE TABLE  "gem_s6a_kpi_1d_statistics" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"whole_network" varchar  ,
"mme_code" varchar  ,
"hss" varchar  ,
"datetime" timestamp(6),
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP(),
"update_location_request" int8,
"update_location_success" int8,
"update_location_success_ratio" numeric,
"update_location_timedelay" int8,
"cancel_location_request" int8,
"cancel_location_success" int8,
"cancel_location_success_ratio" numeric,
"cancel_location_timedelay" int8,
"authentication_information_request" int8,
"authentication_information_success" int8,
"authentication_information_success_ratio" numeric,
"authentication_information_timedelay" int8,
"insert_subscriber_request" int8,
"insert_subscriber_success" int8,
"insert_subscriber_success_ratio" numeric,
"insert_subscriber_timedelay" int8,
"delete_subscriber_request" int8,
"delete_subscriber_success" int8,
"delete_subscriber_success_ratio" numeric,
"delete_subscriber_timedelay" int8,
"purge_ue_request" int8,
"purge_ue_success" int8,
"purge_ue_success_ratio" numeric,
"purge_ue_timedelay" int8,
"reset_request" int8,
"reset_success" int8,
"reset_success_ratio" numeric,
"reset_timedelay" int8,
"notification_request" int8,
"notification_success" int8,
"notification_success_ratio" numeric,
"notification_timedelay" int8
)
;

-- ----------------------------
-- Table structure for gem_s6a_kpi_1h_failure_statistics
-- ----------------------------
DROP TABLE IF EXISTS  "gem_s6a_kpi_1h_failure_statistics";
CREATE TABLE  "gem_s6a_kpi_1h_failure_statistics" (
"datetime" timestamp(6),
"whole_network" varchar  ,
"mme_code" varchar  ,
"hss" varchar  ,
"event_type" varchar  ,
"abnormal_type" int4,
"abnormal_reason" int4,
"abnormal_reason_count" int8,
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP()
)
;

-- ----------------------------
-- Table structure for gem_s6a_kpi_1h_statistics
-- ----------------------------
DROP TABLE IF EXISTS  "gem_s6a_kpi_1h_statistics";
CREATE TABLE  "gem_s6a_kpi_1h_statistics" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"whole_network" varchar  ,
"mme_code" varchar  ,
"hss" varchar  ,
"datetime" timestamp(6),
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP(),
"update_location_request" int8,
"update_location_success" int8,
"update_location_success_ratio" numeric,
"update_location_timedelay" int8,
"cancel_location_request" int8,
"cancel_location_success" int8,
"cancel_location_success_ratio" numeric,
"cancel_location_timedelay" int8,
"authentication_information_request" int8,
"authentication_information_success" int8,
"authentication_information_success_ratio" numeric,
"authentication_information_timedelay" int8,
"insert_subscriber_request" int8,
"insert_subscriber_success" int8,
"insert_subscriber_success_ratio" numeric,
"insert_subscriber_timedelay" int8,
"delete_subscriber_request" int8,
"delete_subscriber_success" int8,
"delete_subscriber_success_ratio" numeric,
"delete_subscriber_timedelay" int8,
"purge_ue_request" int8,
"purge_ue_success" int8,
"purge_ue_success_ratio" numeric,
"purge_ue_timedelay" int8,
"reset_request" int8,
"reset_success" int8,
"reset_success_ratio" numeric,
"reset_timedelay" int8,
"notification_request" int8,
"notification_success" int8,
"notification_success_ratio" numeric,
"notification_timedelay" int8
)
;

-- ----------------------------
-- Table structure for gem_s6a_kpi_5m_failure_statistics
-- ----------------------------
DROP TABLE IF EXISTS  "gem_s6a_kpi_5m_failure_statistics";
CREATE TABLE  "gem_s6a_kpi_5m_failure_statistics" (
"datetime" timestamp(6),
"whole_network" varchar  ,
"mme_code" varchar  ,
"hss" varchar  ,
"event_type" varchar  ,
"abnormal_type" int4,
"abnormal_reason" int4,
"abnormal_reason_count" int8,
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP()
)
;

-- ----------------------------
-- Table structure for gem_s6a_kpi_5m_statistics
-- ----------------------------
DROP TABLE IF EXISTS  "gem_s6a_kpi_5m_statistics";
CREATE TABLE  "gem_s6a_kpi_5m_statistics" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"whole_network" varchar  ,
"mme_code" varchar  ,
"hss" varchar  ,
"datetime" timestamp(6),
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP(),
"update_location_request" int8,
"update_location_success" int8,
"update_location_success_ratio" numeric,
"update_location_timedelay" int8,
"cancel_location_request" int8,
"cancel_location_success" int8,
"cancel_location_success_ratio" numeric,
"cancel_location_timedelay" int8,
"authentication_information_request" int8,
"authentication_information_success" int8,
"authentication_information_success_ratio" numeric,
"authentication_information_timedelay" int8,
"insert_subscriber_request" int8,
"insert_subscriber_success" int8,
"insert_subscriber_success_ratio" numeric,
"insert_subscriber_timedelay" int8,
"delete_subscriber_request" int8,
"delete_subscriber_success" int8,
"delete_subscriber_success_ratio" numeric,
"delete_subscriber_timedelay" int8,
"purge_ue_request" int8,
"purge_ue_success" int8,
"purge_ue_success_ratio" numeric,
"purge_ue_timedelay" int8,
"reset_request" int8,
"reset_success" int8,
"reset_success_ratio" numeric,
"reset_timedelay" int8,
"notification_request" int8,
"notification_success" int8,
"notification_success_ratio" numeric,
"notification_timedelay" int8
)
;

-- ----------------------------
-- Table structure for gem_session_analysis_abnormal_reason
-- ----------------------------
DROP TABLE IF EXISTS  "gem_session_analysis_abnormal_reason";
CREATE TABLE  "gem_session_analysis_abnormal_reason" (
"id" varchar   DEFAULT next_id() ,
"network_interface" varchar(8),
"procedure_type" varchar(8),
"reject_cause" varchar(8)  ,
"cause_type" varchar(8)  ,
"failure_cause" varchar(8)  ,
"linked_interface" varchar(8)  ,
"linked_event_type" varchar(8)  ,
"linked_failure_cause" varchar(8)  ,
"reason" varchar  ,
"description" varchar
)
;


-- ----------------------------
-- Table structure for gem_session_analysis_indicators
-- ----------------------------
DROP TABLE IF EXISTS  "gem_session_analysis_indicators";
CREATE TABLE  "gem_session_analysis_indicators" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"name" varchar  ,
"value" varchar  ,
"level" varchar  ,
"parent_id" varchar
)
;

-- ----------------------------
-- Table structure for gem_session_failure_causes
-- ----------------------------
DROP TABLE IF EXISTS  "gem_session_failure_causes";
CREATE TABLE  "gem_session_failure_causes" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"code" varchar  ,
"description" varchar  ,
"network_interface" varchar  ,
"abnormal_type" varchar
)
;

-- ----------------------------
-- Table structure for gem_sgs_event_5m_statistics_by_imsi
-- ----------------------------
DROP TABLE IF EXISTS  "gem_sgs_event_5m_statistics_by_imsi";
CREATE TABLE  "gem_sgs_event_5m_statistics_by_imsi" (
"datetime" timestamp(6),
"imsi" varchar  ,
"msisdn" varchar  ,
"event_type" varchar(8)  ,
"request_count" int4 ,
"success_count" int4,
"abnormal_count" int4 ,
"response_delay_time" int8,
"no_resp_count" int4,
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP()
)
;

-- ----------------------------
-- Table structure for gem_sgs_kpi_1d_failure_statistics
-- ----------------------------
DROP TABLE IF EXISTS  "gem_sgs_kpi_1d_failure_statistics";
CREATE TABLE  "gem_sgs_kpi_1d_failure_statistics" (
"datetime" timestamp(6),
"whole_network" varchar  ,
"mme_code" varchar  ,
"msc" varchar  ,
"event_type" varchar  ,
"abnormal_type" int4,
"abnormal_reason" int4,
"abnormal_reason_count" int8,
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP()
)
;

-- ----------------------------
-- Table structure for gem_sgs_kpi_1d_statistics
-- ----------------------------
DROP TABLE IF EXISTS  "gem_sgs_kpi_1d_statistics";
CREATE TABLE  "gem_sgs_kpi_1d_statistics" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"whole_network" varchar  ,
"mme_code" varchar  ,
"msc" varchar  ,
"datetime" timestamp(6),
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP(),
"paging_request" int8,
"paging_success" int8,
"paging_failure" int8,
"paging_success_ratio" numeric,
"paging_failure_ratio" numeric,
"paging_time_delay" int8,
"cs_paging_request" int8,
"cs_paging_success" int8,
"cs_paging_failure" int8,
"cs_paging_success_ratio" numeric,
"cs_paging_failure_ratio" numeric,
"cs_paging_time_delay" int8,
"sms_paging_request" int8,
"sms_paging_success" int8,
"sms_paging_failure" int8,
"sms_paging_success_ratio" numeric,
"sms_paging_failure_ratio" numeric,
"sms_paging_time_delay" int8,
"sgs_ap_location_update_request" int8,
"sgs_ap_location_update_success" int8,
"sgs_ap_location_update_failure" int8,
"sgs_ap_location_update_success_ratio" numeric,
"sgs_ap_location_update_time_delay" int8,
"sgs_ap_alter_request" int8,
"sgs_ap_alter_success" int8,
"sgs_ap_alter_failure" int8,
"sgs_ap_alter_success_ratio" numeric,
"sgs_ap_alter_time_delay" int8,
"sgs_ap_eps_detach_request" int8,
"sgs_ap_eps_detach_success" int8,
"sgs_ap_eps_detach_success_ratio" numeric,
"sgs_ap_imsi_detach_request" int8,
"sgs_ap_imsi_detach_success" int8,
"sgs_ap_imsi_detach_success_ratio" numeric,
"sgs_ap_service_abort_request" int8,
"sgs_ap_ue_activity_request" int8,
"sgs_ap_release_request" int8,
"sgs_ap_release_cause" numeric,
"sgs_ap_ue_reset_request" int8,
"sgs_ap_ue_reset_success" int8,
"sgs_ap_ue_reset_success_ratio" numeric,
"sgs_ap_mm_information_request" int8,
"sgs_ap_tmsi_allocation_request" int8,
"sms_request" int8,
"sms_success" int8,
"sms_failure" int8,
"sms_success_ratio" numeric,
"sms_time_delay" int8,
"sms_mo_request" int8,
"sms_mo_success" int8,
"sms_mo_failure" int8,
"sms_mo_success_ratio" numeric,
"sms_mo_time_delay" int8,
"sms_mt_request" int8,
"sms_mt_success" int8,
"sms_mt_failure" int8,
"sms_mt_success_ratio" numeric,
"sms_mt_time_delay" int8
)
;

-- ----------------------------
-- Table structure for gem_sgs_kpi_1h_failure_statistics
-- ----------------------------
DROP TABLE IF EXISTS  "gem_sgs_kpi_1h_failure_statistics";
CREATE TABLE  "gem_sgs_kpi_1h_failure_statistics" (
"datetime" timestamp(6),
"whole_network" varchar  ,
"mme_code" varchar  ,
"msc" varchar  ,
"event_type" varchar  ,
"abnormal_type" int4,
"abnormal_reason" int4,
"abnormal_reason_count" int8,
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP()
)
;

-- ----------------------------
-- Table structure for gem_sgs_kpi_1h_statistics
-- ----------------------------
DROP TABLE IF EXISTS  "gem_sgs_kpi_1h_statistics";
CREATE TABLE  "gem_sgs_kpi_1h_statistics" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"whole_network" varchar  ,
"mme_code" varchar  ,
"msc" varchar  ,
"datetime" timestamp(6),
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP(),
"paging_request" int8,
"paging_success" int8,
"paging_failure" int8,
"paging_success_ratio" numeric,
"paging_failure_ratio" numeric,
"paging_time_delay" int8,
"cs_paging_request" int8,
"cs_paging_success" int8,
"cs_paging_failure" int8,
"cs_paging_success_ratio" numeric,
"cs_paging_failure_ratio" numeric,
"cs_paging_time_delay" int8,
"sms_paging_request" int8,
"sms_paging_success" int8,
"sms_paging_failure" int8,
"sms_paging_success_ratio" numeric,
"sms_paging_failure_ratio" numeric,
"sms_paging_time_delay" int8,
"sgs_ap_location_update_request" int8,
"sgs_ap_location_update_success" int8,
"sgs_ap_location_update_failure" int8,
"sgs_ap_location_update_success_ratio" numeric,
"sgs_ap_location_update_time_delay" int8,
"sgs_ap_alter_request" int8,
"sgs_ap_alter_success" int8,
"sgs_ap_alter_failure" int8,
"sgs_ap_alter_success_ratio" numeric,
"sgs_ap_alter_time_delay" int8,
"sgs_ap_eps_detach_request" int8,
"sgs_ap_eps_detach_success" int8,
"sgs_ap_eps_detach_success_ratio" numeric,
"sgs_ap_imsi_detach_request" int8,
"sgs_ap_imsi_detach_success" int8,
"sgs_ap_imsi_detach_success_ratio" numeric,
"sgs_ap_service_abort_request" int8,
"sgs_ap_ue_activity_request" int8,
"sgs_ap_release_request" int8,
"sgs_ap_release_cause" numeric,
"sgs_ap_ue_reset_request" int8,
"sgs_ap_ue_reset_success" int8,
"sgs_ap_ue_reset_success_ratio" numeric,
"sgs_ap_mm_information_request" int8,
"sgs_ap_tmsi_allocation_request" int8,
"sms_request" int8,
"sms_success" int8,
"sms_failure" int8,
"sms_success_ratio" numeric,
"sms_time_delay" int8,
"sms_mo_request" int8,
"sms_mo_success" int8,
"sms_mo_failure" int8,
"sms_mo_success_ratio" numeric,
"sms_mo_time_delay" int8,
"sms_mt_request" int8,
"sms_mt_success" int8,
"sms_mt_failure" int8,
"sms_mt_success_ratio" numeric,
"sms_mt_time_delay" int8
)
;

-- ----------------------------
-- Table structure for gem_sgs_kpi_5m_failure_statistics
-- ----------------------------
DROP TABLE IF EXISTS  "gem_sgs_kpi_5m_failure_statistics";
CREATE TABLE  "gem_sgs_kpi_5m_failure_statistics" (
"datetime" timestamp(6),
"whole_network" varchar  ,
"mme_code" varchar  ,
"msc" varchar  ,
"event_type" varchar  ,
"abnormal_type" int4,
"abnormal_reason" int4,
"abnormal_reason_count" int8,
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP()
)
;

-- ----------------------------
-- Table structure for gem_sgs_kpi_5m_statistics
-- ----------------------------
DROP TABLE IF EXISTS  "gem_sgs_kpi_5m_statistics";
CREATE TABLE  "gem_sgs_kpi_5m_statistics" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"whole_network" varchar  ,
"mme_code" varchar  ,
"msc" varchar  ,
"datetime" timestamp(6),
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP(),
"paging_request" int8,
"paging_success" int8,
"paging_failure" int8,
"paging_success_ratio" numeric,
"paging_failure_ratio" numeric,
"paging_time_delay" int8,
"cs_paging_request" int8,
"cs_paging_success" int8,
"cs_paging_failure" int8,
"cs_paging_success_ratio" numeric,
"cs_paging_failure_ratio" numeric,
"cs_paging_time_delay" int8,
"sms_paging_request" int8,
"sms_paging_success" int8,
"sms_paging_failure" int8,
"sms_paging_success_ratio" numeric,
"sms_paging_failure_ratio" numeric,
"sms_paging_time_delay" int8,
"sgs_ap_location_update_request" int8,
"sgs_ap_location_update_success" int8,
"sgs_ap_location_update_failure" int8,
"sgs_ap_location_update_success_ratio" numeric,
"sgs_ap_location_update_time_delay" int8,
"sgs_ap_alter_request" int8,
"sgs_ap_alter_success" int8,
"sgs_ap_alter_failure" int8,
"sgs_ap_alter_success_ratio" numeric,
"sgs_ap_alter_time_delay" int8,
"sgs_ap_eps_detach_request" int8,
"sgs_ap_eps_detach_success" int8,
"sgs_ap_eps_detach_success_ratio" numeric,
"sgs_ap_imsi_detach_request" int8,
"sgs_ap_imsi_detach_success" int8,
"sgs_ap_imsi_detach_success_ratio" numeric,
"sgs_ap_service_abort_request" int8,
"sgs_ap_ue_activity_request" int8,
"sgs_ap_release_request" int8,
"sgs_ap_release_cause" numeric,
"sgs_ap_ue_reset_request" int8,
"sgs_ap_ue_reset_success" int8,
"sgs_ap_ue_reset_success_ratio" numeric,
"sgs_ap_mm_information_request" int8,
"sgs_ap_tmsi_allocation_request" int8,
"sms_request" int8,
"sms_success" int8,
"sms_failure" int8,
"sms_success_ratio" numeric,
"sms_time_delay" int8,
"sms_mo_request" int8,
"sms_mo_success" int8,
"sms_mo_failure" int8,
"sms_mo_success_ratio" numeric,
"sms_mo_time_delay" int8,
"sms_mt_request" int8,
"sms_mt_success" int8,
"sms_mt_failure" int8,
"sms_mt_success_ratio" numeric,
"sms_mt_time_delay" int8
)
;

-- ----------------------------
-- Table structure for gem_ue_dimensions
-- ----------------------------
DROP TABLE IF EXISTS  "gem_ue_dimensions";
CREATE TABLE  "gem_ue_dimensions" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"value" varchar  ,
"ue_brand" varchar  ,
"ue_type" varchar  ,
"description" varchar
)
;

-- ----------------------------
-- Table structure for gem_uu_event_5m_statistics_by_imsi
-- ----------------------------
DROP TABLE IF EXISTS  "gem_uu_event_5m_statistics_by_imsi";
CREATE TABLE  "gem_uu_event_5m_statistics_by_imsi" (
"datetime" timestamp(6),
"imsi" varchar  ,
"msisdn" varchar  ,
"event_type" varchar(32)  ,
"request_count" int4,
"success_count" int4,
"abnormal_count" int4,
"response_delay_time" int8,
"no_resp_count" int4,
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP()
)
;


-- ----------------------------
-- Table structure for gem_uu_kpi_1d_statistics
-- ----------------------------
DROP TABLE IF EXISTS  "gem_uu_kpi_1d_statistics";
CREATE TABLE  "gem_uu_kpi_1d_statistics" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"datetime" timestamp(6),
"whole_network" varchar  ,
"mme_group_id" varchar  ,
"mme_code" varchar  ,
"tac" int4,
"enodeb_id" int4,
"cell_id" int4,
"target_cell_id" int4,
"ue_brand" varchar  ,
"ue_type" varchar  ,
"rrc_paging_count" int8,
"rrc_paging_success_count" int8,
"rrc_paging_delay_sum" int8,
"rrc_cs_paging_count" int8,
"rrc_cs_paging_success_count" int8,
"rrc_cs_paging_delay_sum" int8,
"rrc_ps_paging_count" int8,
"rrc_ps_paging_success_count" int8,
"rrc_ps_paging_delay_sum" int8,
"rrc_connection_setup_count" int8,
"rrc_connection_setup_success_count" int8,
"rrc_connection_setup_delay_sum" int8,
"rrc_connection_setup_emergency_count" int8,
"rrc_connection_setup_emergency_success_count" int8,
"rrc_connection_setup_emergency_delay_sum" int8,
"rrc_connection_setup_high_priority_access_count" int8,
"rrc_connection_setup_high_priority_access_success_count" int8,
"rrc_connection_setup_high_priority_access_delay_sum" int8,
"rrc_connection_setup_mt_access_count" int8,
"rrc_connection_setup_mt_access_success_count" int8,
"rrc_connection_setup_mt_access_delay_sum" int8,
"rrc_connection_setup_mo_signalling_count" int8,
"rrc_connection_setup_mo_signalling_success_count" int8,
"rrc_connection_setup_mo_signalling_delay_sum" int8,
"rrc_connection_setup_mo_data_count" int8,
"rrc_connection_setup_mo_data_success_count" int8,
"rrc_connection_setup_mo_data_delay_sum" int8,
"rrc_connection_reestablishment_count" int8,
"rrc_connection_reestablishment_success_count" int8,
"rrc_connection_reestablishment_delay_sum" int8,
"rrc_connection_reestablishment_reconfig_failure_count" int8,
"rrc_connection_reestablishment_reconfig_failure_success_count" int8,
"rrc_connection_reestablishment_reconfig_failure_delay_sum" int8,
"rrc_connection_reestablishment_handover_failure_count" int8,
"rrc_connection_reestablishment_handover_failure_success_count" int8,
"rrc_connection_reestablishment_handover_failure_delay_sum" int8,
"rrc_connection_reestablishment_other_failure_count" int8,
"rrc_connection_reestablishment_other_failure_success_count" int8,
"rrc_connection_reestablishment_other_failure_delay_sum" int8,
"rrc_connection_release_count" int8,
"rrc_connection_rest_count" int8,
"rrc_connection_reconfig_count" int8,
"rrc_connection_reconfig_success_count" int8,
"rrc_connection_reconfig_delay_sum" int8,
"rrc_safe_mode_count" int8,
"rrc_safe_mode_success_count" int8,
"rrc_safe_mode_delay_sum" int8,
"rrc_lte_handover_out_count" int8,
"rrc_lte_handover_out_success_count" int8,
"rrc_lte_handover_out_delay_sum" int8,
"rrc_lte_handover_in_count" int8,
"rrc_lte_handover_in_success_count" int8,
"rrc_lte_handover_in_delay_sum" int8,
"rrc_csfb_handover_out_count" int8,
"rrc_csfb_handover_out_success_count" int8,
"rrc_csfb_handover_out_delay_sum" int8,
"rrc_handover_intra_cell_count" int8,
"rrc_handover_intra_cell_success_count" int8,
"rrc_handover_intra_cell_delay_sum" int8,
"rrc_connection_abnormal_release_count" int8,
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP(),
"rrc_intra_enodeb_handover_count" int8,
"rrc_intra_enodeb_handover_success_count" int8,
"rrc_intra_enodeb_handover_delay_sum" int8,
"rrc_inter_enodeb_handover_count" int8,
"rrc_inter_enodeb_handover_success_count" int8,
"rrc_inter_enodeb_handover_delay_sum" int8,
"rrc_connection_setup_modata_count" int8,
"rrc_connection_setup_modata_success_count" int8,
"rrc_connection_setup_modata_delay_sum" int8
)
;
-- ----------------------------
-- Table structure for gem_uu_kpi_1d_statistics_by_imsi
-- ----------------------------
DROP TABLE IF EXISTS  "gem_uu_kpi_1d_statistics_by_imsi";
CREATE TABLE  "gem_uu_kpi_1d_statistics_by_imsi" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"datetime" timestamp(6),
"imsi" int8,
"enodeb_id" int4,
"cell_id" int4,
"ue_type" varchar  ,
"rrc_paging_count" int8,
"rrc_paging_success_count" int8,
"rrc_paging_delay_sum" int8,
"rrc_cs_paging_count" int8,
"rrc_cs_paging_success_count" int8,
"rrc_cs_paging_delay_sum" int8,
"rrc_ps_paging_count" int8,
"rrc_ps_paging_success_count" int8,
"rrc_ps_paging_delay_sum" int8,
"rrc_connection_setup_count" int8,
"rrc_connection_setup_success_count" int8,
"rrc_connection_setup_delay_sum" int8,
"rrc_connection_setup_emergency_count" int8,
"rrc_connection_setup_emergency_success_count" int8,
"rrc_connection_setup_emergency_delay_sum" int8,
"rrc_connection_setup_high_priority_access_count" int8,
"rrc_connection_setup_high_priority_access_success_count" int8,
"rrc_connection_setup_high_priority_access_delay_sum" int8,
"rrc_connection_setup_mt_access_count" int8,
"rrc_connection_setup_mt_access_success_count" int8,
"rrc_connection_setup_mt_access_delay_sum" int8,
"rrc_connection_setup_mo_signalling_count" int8,
"rrc_connection_setup_mo_signalling_success_count" int8,
"rrc_connection_setup_mo_signalling_delay_sum" int8,
"rrc_connection_setup_mo_data_count" int8,
"rrc_connection_setup_mo_data_success_count" int8,
"rrc_connection_setup_mo_data_delay_sum" int8,
"rrc_connection_reestablishment_count" int8,
"rrc_connection_reestablishment_success_count" int8,
"rrc_connection_reestablishment_delay_sum" int8,
"rrc_connection_reestablishment_reconfig_failure_count" int8,
"rrc_connection_reestablishment_reconfig_failure_success_count" int8,
"rrc_connection_reestablishment_reconfig_failure_delay_sum" int8,
"rrc_connection_reestablishment_handover_failure_count" int8,
"rrc_connection_reestablishment_handover_failure_success_count" int8,
"rrc_connection_reestablishment_handover_failure_delay_sum" int8,
"rrc_connection_reestablishment_other_failure_count" int8,
"rrc_connection_reestablishment_other_failure_success_count" int8,
"rrc_connection_reestablishment_other_failure_delay_sum" int8,
"rrc_connection_release_count" int8,
"rrc_connection_rest_count" int8,
"rrc_connection_reconfig_count" int8,
"rrc_connection_reconfig_success_count" int8,
"rrc_connection_reconfig_delay_sum" int8,
"rrc_safe_mode_count" int8,
"rrc_safe_mode_success_count" int8,
"rrc_safe_mode_delay_sum" int8,
"rrc_lte_handover_out_count" int8,
"rrc_lte_handover_out_success_count" int8,
"rrc_lte_handover_out_delay_sum" int8,
"rrc_lte_handover_in_count" int8,
"rrc_lte_handover_in_success_count" int8,
"rrc_lte_handover_in_delay_sum" int8,
"rrc_csfb_handover_out_count" int8,
"rrc_csfb_handover_out_success_count" int8,
"rrc_csfb_handover_out_delay_sum" int8,
"rrc_handover_intra_cell_count" int8,
"rrc_handover_intra_cell_success_count" int8,
"rrc_handover_intra_cell_delay_sum" int8,
"rrc_connection_abnormal_release_count" int8,
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP(),
"rrc_intra_enodeb_handover_count" int8,
"rrc_intra_enodeb_handover_success_count" int8,
"rrc_intra_enodeb_handover_delay_sum" int8,
"rrc_inter_enodeb_handover_count" int8,
"rrc_inter_enodeb_handover_success_count" int8,
"rrc_inter_enodeb_handover_delay_sum" int8,
"rrc_connection_setup_modata_count" int8,
"rrc_connection_setup_modata_success_count" int8,
"rrc_connection_setup_modata_delay_sum" int8
)
;

-- ----------------------------
-- Table structure for gem_uu_kpi_1h_statistics
-- ----------------------------
DROP TABLE IF EXISTS  "gem_uu_kpi_1h_statistics";
CREATE TABLE  "gem_uu_kpi_1h_statistics" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"datetime" timestamp(6),
"whole_network" varchar  ,
"mme_group_id" varchar  ,
"mme_code" varchar  ,
"tac" int4,
"enodeb_id" int4,
"cell_id" int4,
"target_cell_id" int4,
"ue_brand" varchar  ,
"ue_type" varchar  ,
"rrc_paging_count" int8,
"rrc_paging_success_count" int8,
"rrc_paging_delay_sum" int8,
"rrc_cs_paging_count" int8,
"rrc_cs_paging_success_count" int8,
"rrc_cs_paging_delay_sum" int8,
"rrc_ps_paging_count" int8,
"rrc_ps_paging_success_count" int8,
"rrc_ps_paging_delay_sum" int8,
"rrc_connection_setup_count" int8,
"rrc_connection_setup_success_count" int8,
"rrc_connection_setup_delay_sum" int8,
"rrc_connection_setup_emergency_count" int8,
"rrc_connection_setup_emergency_success_count" int8,
"rrc_connection_setup_emergency_delay_sum" int8,
"rrc_connection_setup_high_priority_access_count" int8,
"rrc_connection_setup_high_priority_access_success_count" int8,
"rrc_connection_setup_high_priority_access_delay_sum" int8,
"rrc_connection_setup_mt_access_count" int8,
"rrc_connection_setup_mt_access_success_count" int8,
"rrc_connection_setup_mt_access_delay_sum" int8,
"rrc_connection_setup_mo_signalling_count" int8,
"rrc_connection_setup_mo_signalling_success_count" int8,
"rrc_connection_setup_mo_signalling_delay_sum" int8,
"rrc_connection_setup_mo_data_count" int8,
"rrc_connection_setup_mo_data_success_count" int8,
"rrc_connection_setup_mo_data_delay_sum" int8,
"rrc_connection_reestablishment_count" int8,
"rrc_connection_reestablishment_success_count" int8,
"rrc_connection_reestablishment_delay_sum" int8,
"rrc_connection_reestablishment_reconfig_failure_count" int8,
"rrc_connection_reestablishment_reconfig_failure_success_count" int8,
"rrc_connection_reestablishment_reconfig_failure_delay_sum" int8,
"rrc_connection_reestablishment_handover_failure_count" int8,
"rrc_connection_reestablishment_handover_failure_success_count" int8,
"rrc_connection_reestablishment_handover_failure_delay_sum" int8,
"rrc_connection_reestablishment_other_failure_count" int8,
"rrc_connection_reestablishment_other_failure_success_count" int8,
"rrc_connection_reestablishment_other_failure_delay_sum" int8,
"rrc_connection_release_count" int8,
"rrc_connection_rest_count" int8,
"rrc_connection_reconfig_count" int8,
"rrc_connection_reconfig_success_count" int8,
"rrc_connection_reconfig_delay_sum" int8,
"rrc_safe_mode_count" int8,
"rrc_safe_mode_success_count" int8,
"rrc_safe_mode_delay_sum" int8,
"rrc_lte_handover_out_count" int8,
"rrc_lte_handover_out_success_count" int8,
"rrc_lte_handover_out_delay_sum" int8,
"rrc_lte_handover_in_count" int8,
"rrc_lte_handover_in_success_count" int8,
"rrc_lte_handover_in_delay_sum" int8,
"rrc_csfb_handover_out_count" int8,
"rrc_csfb_handover_out_success_count" int8,
"rrc_csfb_handover_out_delay_sum" int8,
"rrc_handover_intra_cell_count" int8,
"rrc_handover_intra_cell_success_count" int8,
"rrc_handover_intra_cell_delay_sum" int8,
"rrc_connection_abnormal_release_count" int8,
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP(),
"rrc_intra_enodeb_handover_count" int8,
"rrc_intra_enodeb_handover_success_count" int8,
"rrc_intra_enodeb_handover_delay_sum" int8,
"rrc_inter_enodeb_handover_count" int8,
"rrc_inter_enodeb_handover_success_count" int8,
"rrc_inter_enodeb_handover_delay_sum" int8,
"rrc_connection_setup_modata_count" int8,
"rrc_connection_setup_modata_success_count" int8,
"rrc_connection_setup_modata_delay_sum" int8
)
;

-- ----------------------------
-- Table structure for gem_uu_kpi_1h_statistics_by_imsi
-- ----------------------------
DROP TABLE IF EXISTS  "gem_uu_kpi_1h_statistics_by_imsi";
CREATE TABLE  "gem_uu_kpi_1h_statistics_by_imsi" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"datetime" timestamp(6),
"imsi" int8,
"enodeb_id" int4,
"cell_id" int4,
"ue_type" varchar  ,
"rrc_paging_count" int8,
"rrc_paging_success_count" int8,
"rrc_paging_delay_sum" int8,
"rrc_cs_paging_count" int8,
"rrc_cs_paging_success_count" int8,
"rrc_cs_paging_delay_sum" int8,
"rrc_ps_paging_count" int8,
"rrc_ps_paging_success_count" int8,
"rrc_ps_paging_delay_sum" int8,
"rrc_connection_setup_count" int8,
"rrc_connection_setup_success_count" int8,
"rrc_connection_setup_delay_sum" int8,
"rrc_connection_setup_emergency_count" int8,
"rrc_connection_setup_emergency_success_count" int8,
"rrc_connection_setup_emergency_delay_sum" int8,
"rrc_connection_setup_high_priority_access_count" int8,
"rrc_connection_setup_high_priority_access_success_count" int8,
"rrc_connection_setup_high_priority_access_delay_sum" int8,
"rrc_connection_setup_mt_access_count" int8,
"rrc_connection_setup_mt_access_success_count" int8,
"rrc_connection_setup_mt_access_delay_sum" int8,
"rrc_connection_setup_mo_signalling_count" int8,
"rrc_connection_setup_mo_signalling_success_count" int8,
"rrc_connection_setup_mo_signalling_delay_sum" int8,
"rrc_connection_setup_mo_data_count" int8,
"rrc_connection_setup_mo_data_success_count" int8,
"rrc_connection_setup_mo_data_delay_sum" int8,
"rrc_connection_reestablishment_count" int8,
"rrc_connection_reestablishment_success_count" int8,
"rrc_connection_reestablishment_delay_sum" int8,
"rrc_connection_reestablishment_reconfig_failure_count" int8,
"rrc_connection_reestablishment_reconfig_failure_success_count" int8,
"rrc_connection_reestablishment_reconfig_failure_delay_sum" int8,
"rrc_connection_reestablishment_handover_failure_count" int8,
"rrc_connection_reestablishment_handover_failure_success_count" int8,
"rrc_connection_reestablishment_handover_failure_delay_sum" int8,
"rrc_connection_reestablishment_other_failure_count" int8,
"rrc_connection_reestablishment_other_failure_success_count" int8,
"rrc_connection_reestablishment_other_failure_delay_sum" int8,
"rrc_connection_release_count" int8,
"rrc_connection_rest_count" int8,
"rrc_connection_reconfig_count" int8,
"rrc_connection_reconfig_success_count" int8,
"rrc_connection_reconfig_delay_sum" int8,
"rrc_safe_mode_count" int8,
"rrc_safe_mode_success_count" int8,
"rrc_safe_mode_delay_sum" int8,
"rrc_lte_handover_out_count" int8,
"rrc_lte_handover_out_success_count" int8,
"rrc_lte_handover_out_delay_sum" int8,
"rrc_lte_handover_in_count" int8,
"rrc_lte_handover_in_success_count" int8,
"rrc_lte_handover_in_delay_sum" int8,
"rrc_csfb_handover_out_count" int8,
"rrc_csfb_handover_out_success_count" int8,
"rrc_csfb_handover_out_delay_sum" int8,
"rrc_handover_intra_cell_count" int8,
"rrc_handover_intra_cell_success_count" int8,
"rrc_handover_intra_cell_delay_sum" int8,
"rrc_connection_abnormal_release_count" int8,
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP(),
"rrc_intra_enodeb_handover_count" int8,
"rrc_intra_enodeb_handover_success_count" int8,
"rrc_intra_enodeb_handover_delay_sum" int8,
"rrc_inter_enodeb_handover_count" int8,
"rrc_inter_enodeb_handover_success_count" int8,
"rrc_inter_enodeb_handover_delay_sum" int8,
"rrc_connection_setup_modata_count" int8,
"rrc_connection_setup_modata_success_count" int8,
"rrc_connection_setup_modata_delay_sum" int8
)
;

-- ----------------------------
-- Table structure for gem_uu_kpi_5m_statistics
-- ----------------------------
DROP TABLE IF EXISTS  "gem_uu_kpi_5m_statistics";
CREATE TABLE  "gem_uu_kpi_5m_statistics" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"datetime" timestamp(6),
"whole_network" varchar  ,
"mme_group_id" varchar  ,
"mme_code" varchar  ,
"tac" int4,
"enodeb_id" int4,
"cell_id" int4,
"target_cell_id" int4,
"ue_brand" varchar  ,
"ue_type" varchar  ,
"rrc_paging_count" int8,
"rrc_paging_success_count" int8,
"rrc_paging_delay_sum" int8,
"rrc_cs_paging_count" int8,
"rrc_cs_paging_success_count" int8,
"rrc_cs_paging_delay_sum" int8,
"rrc_ps_paging_count" int8,
"rrc_ps_paging_success_count" int8,
"rrc_ps_paging_delay_sum" int8,
"rrc_connection_setup_count" int8,
"rrc_connection_setup_success_count" int8,
"rrc_connection_setup_delay_sum" int8,
"rrc_connection_setup_emergency_count" int8,
"rrc_connection_setup_emergency_success_count" int8,
"rrc_connection_setup_emergency_delay_sum" int8,
"rrc_connection_setup_high_priority_access_count" int8,
"rrc_connection_setup_high_priority_access_success_count" int8,
"rrc_connection_setup_high_priority_access_delay_sum" int8,
"rrc_connection_setup_mt_access_count" int8,
"rrc_connection_setup_mt_access_success_count" int8,
"rrc_connection_setup_mt_access_delay_sum" int8,
"rrc_connection_setup_mo_signalling_count" int8,
"rrc_connection_setup_mo_signalling_success_count" int8,
"rrc_connection_setup_mo_signalling_delay_sum" int8,
"rrc_connection_setup_mo_data_count" int8,
"rrc_connection_setup_mo_data_success_count" int8,
"rrc_connection_setup_mo_data_delay_sum" int8,
"rrc_connection_reestablishment_count" int8,
"rrc_connection_reestablishment_success_count" int8,
"rrc_connection_reestablishment_delay_sum" int8,
"rrc_connection_reestablishment_reconfig_failure_count" int8,
"rrc_connection_reestablishment_reconfig_failure_success_count" int8,
"rrc_connection_reestablishment_reconfig_failure_delay_sum" int8,
"rrc_connection_reestablishment_handover_failure_count" int8,
"rrc_connection_reestablishment_handover_failure_success_count" int8,
"rrc_connection_reestablishment_handover_failure_delay_sum" int8,
"rrc_connection_reestablishment_other_failure_count" int8,
"rrc_connection_reestablishment_other_failure_success_count" int8,
"rrc_connection_reestablishment_other_failure_delay_sum" int8,
"rrc_connection_release_count" int8,
"rrc_connection_rest_count" int8,
"rrc_connection_reconfig_count" int8,
"rrc_connection_reconfig_success_count" int8,
"rrc_connection_reconfig_delay_sum" int8,
"rrc_safe_mode_count" int8,
"rrc_safe_mode_success_count" int8,
"rrc_safe_mode_delay_sum" int8,
"rrc_lte_handover_out_count" int8,
"rrc_lte_handover_out_success_count" int8,
"rrc_lte_handover_out_delay_sum" int8,
"rrc_lte_handover_in_count" int8,
"rrc_lte_handover_in_success_count" int8,
"rrc_lte_handover_in_delay_sum" int8,
"rrc_csfb_handover_out_count" int8,
"rrc_csfb_handover_out_success_count" int8,
"rrc_csfb_handover_out_delay_sum" int8,
"rrc_handover_intra_cell_count" int8,
"rrc_handover_intra_cell_success_count" int8,
"rrc_handover_intra_cell_delay_sum" int8,
"rrc_connection_abnormal_release_count" int8,
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP(),
"rrc_intra_enodeb_handover_count" int8,
"rrc_intra_enodeb_handover_success_count" int8,
"rrc_intra_enodeb_handover_delay_sum" int8,
"rrc_inter_enodeb_handover_count" int8,
"rrc_inter_enodeb_handover_success_count" int8,
"rrc_inter_enodeb_handover_delay_sum" int8,
"rrc_connection_setup_modata_count" int8,
"rrc_connection_setup_modata_success_count" int8,
"rrc_connection_setup_modata_delay_sum" int8
)
;

-- ----------------------------
-- Table structure for gem_uu_kpi_5m_statistics_by_imsi
-- ----------------------------
DROP TABLE IF EXISTS  "gem_uu_kpi_5m_statistics_by_imsi";
CREATE TABLE  "gem_uu_kpi_5m_statistics_by_imsi" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"datetime" timestamp(6),
"imsi" int8,
"enodeb_id" int4,
"cell_id" int4,
"ue_type" varchar  ,
"rrc_paging_count" int8,
"rrc_paging_success_count" int8,
"rrc_paging_delay_sum" int8,
"rrc_cs_paging_count" int8,
"rrc_cs_paging_success_count" int8,
"rrc_cs_paging_delay_sum" int8,
"rrc_ps_paging_count" int8,
"rrc_ps_paging_success_count" int8,
"rrc_ps_paging_delay_sum" int8,
"rrc_connection_setup_count" int8,
"rrc_connection_setup_success_count" int8,
"rrc_connection_setup_delay_sum" int8,
"rrc_connection_setup_emergency_count" int8,
"rrc_connection_setup_emergency_success_count" int8,
"rrc_connection_setup_emergency_delay_sum" int8,
"rrc_connection_setup_high_priority_access_count" int8,
"rrc_connection_setup_high_priority_access_success_count" int8,
"rrc_connection_setup_high_priority_access_delay_sum" int8,
"rrc_connection_setup_mt_access_count" int8,
"rrc_connection_setup_mt_access_success_count" int8,
"rrc_connection_setup_mt_access_delay_sum" int8,
"rrc_connection_setup_mo_signalling_count" int8,
"rrc_connection_setup_mo_signalling_success_count" int8,
"rrc_connection_setup_mo_signalling_delay_sum" int8,
"rrc_connection_setup_mo_data_count" int8,
"rrc_connection_setup_mo_data_success_count" int8,
"rrc_connection_setup_mo_data_delay_sum" int8,
"rrc_connection_reestablishment_count" int8,
"rrc_connection_reestablishment_success_count" int8,
"rrc_connection_reestablishment_delay_sum" int8,
"rrc_connection_reestablishment_reconfig_failure_count" int8,
"rrc_connection_reestablishment_reconfig_failure_success_count" int8,
"rrc_connection_reestablishment_reconfig_failure_delay_sum" int8,
"rrc_connection_reestablishment_handover_failure_count" int8,
"rrc_connection_reestablishment_handover_failure_success_count" int8,
"rrc_connection_reestablishment_handover_failure_delay_sum" int8,
"rrc_connection_reestablishment_other_failure_count" int8,
"rrc_connection_reestablishment_other_failure_success_count" int8,
"rrc_connection_reestablishment_other_failure_delay_sum" int8,
"rrc_connection_release_count" int8,
"rrc_connection_rest_count" int8,
"rrc_connection_reconfig_count" int8,
"rrc_connection_reconfig_success_count" int8,
"rrc_connection_reconfig_delay_sum" int8,
"rrc_safe_mode_count" int8,
"rrc_safe_mode_success_count" int8,
"rrc_safe_mode_delay_sum" int8,
"rrc_lte_handover_out_count" int8,
"rrc_lte_handover_out_success_count" int8,
"rrc_lte_handover_out_delay_sum" int8,
"rrc_lte_handover_in_count" int8,
"rrc_lte_handover_in_success_count" int8,
"rrc_lte_handover_in_delay_sum" int8,
"rrc_csfb_handover_out_count" int8,
"rrc_csfb_handover_out_success_count" int8,
"rrc_csfb_handover_out_delay_sum" int8,
"rrc_handover_intra_cell_count" int8,
"rrc_handover_intra_cell_success_count" int8,
"rrc_handover_intra_cell_delay_sum" int8,
"rrc_connection_abnormal_release_count" int8,
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP(),
"rrc_intra_enodeb_handover_count" int8,
"rrc_intra_enodeb_handover_success_count" int8,
"rrc_intra_enodeb_handover_delay_sum" int8,
"rrc_inter_enodeb_handover_count" int8,
"rrc_inter_enodeb_handover_success_count" int8,
"rrc_inter_enodeb_handover_delay_sum" int8,
"rrc_connection_setup_modata_count" int8,
"rrc_connection_setup_modata_success_count" int8,
"rrc_connection_setup_modata_delay_sum" int8
)
;

-- ----------------------------
-- Table structure for gem_vdt_analysis_indicators
-- ----------------------------
DROP TABLE IF EXISTS  "gem_vdt_analysis_indicators";
CREATE TABLE  "gem_vdt_analysis_indicators" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"name" varchar  ,
"value" varchar  ,
"level" varchar  ,
"parent_id" varchar  ,
"source_table" varchar  ,
"parameter" varchar  ,
"expression" varchar  ,
"network_interface" varchar
)
;

-- ----------------------------
-- Table structure for gem_vdt_road_analysis_mr_5m_imsi
-- ----------------------------
DROP TABLE IF EXISTS  "gem_vdt_road_analysis_mr_5m_imsi";
CREATE TABLE  "gem_vdt_road_analysis_mr_5m_imsi" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"road_type_id" varchar  ,
"road_id" varchar  ,
"imsi" varchar  ,
"datetime" timestamp(6),
"serving_rsrp_sum" int4 DEFAULT 0 ,
"serving_rsrp_count" int4 DEFAULT 0 ,
"serving_rsrq_sum" int4 DEFAULT 0 ,
"serving_rsrq_count" int4 DEFAULT 0,
"ta_sum" int4 DEFAULT 0,
"ta_count" int4 DEFAULT 0 ,
"ul_sinr_sum" int4 DEFAULT 0 ,
"ul_sinr_count" int4 DEFAULT 0 ,
"overlapping_coverage_count" int4 DEFAULT 0,
"longitude" varchar  ,
"latitude" varchar
)
;

-- ----------------------------
-- Table structure for gem_vdt_road_analysis_s1u_http_5m_imsi
-- ----------------------------
DROP TABLE IF EXISTS  "gem_vdt_road_analysis_s1u_http_5m_imsi";
CREATE TABLE  "gem_vdt_road_analysis_s1u_http_5m_imsi" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"road_type_id" varchar  ,
"road_id" varchar  ,
"imsi" varchar  ,
"datetime" timestamp(6),
"longitude" varchar  ,
"latitude" varchar  ,
"ul_data" float8 DEFAULT 0 ,
"dl_data" float8 DEFAULT 0 ,
"http_lastpacket_1streq_delay" int8 DEFAULT 0 ,
"ul_ip_packet" int4 DEFAULT 0 ,
"dl_ip_packet" int4 DEFAULT 0 ,
"up_tcp_disorder_num" int4 DEFAULT 0 ,
"down_tcp_disorder_num" int4 DEFAULT 0 ,
"up_tcp_retrans_num" int4 DEFAULT 0 ,
"down_tcp_retrans_num" int4 DEFAULT 0 ,
"up_tcp_lost_num" int4 DEFAULT 0 ,
"down_tcp_lost_num" int4 DEFAULT 0 ,
"ul_ip_frag_packets" int4 DEFAULT 0 ,
"dl_ip_frag_packets" int4 DEFAULT 0 ,
"tcp_drop_count" int4 DEFAULT 0 ,
"tcp_total_count" int4 DEFAULT 0 ,
"ul_rtt_times" int4 DEFAULT 0 ,
"dl_rtt_times" int4 DEFAULT 0 ,
"ul_rtt_total_delay" int4 DEFAULT 0 ,
"dl_rtt_total_delay" int4 DEFAULT 0 ,
"ul_zero_window_times" int4 DEFAULT 0,
"dl_zero_window_times" int4 DEFAULT 0 ,
"ul_zero_window_total_time" int4 DEFAULT 0 ,
"dl_zero_window_total_time" int4 DEFAULT 0
)
;

-- ----------------------------
-- Table structure for gem_vdt_road_analysis_uu_5m_imsi
-- ----------------------------
DROP TABLE IF EXISTS  "gem_vdt_road_analysis_uu_5m_imsi";
CREATE TABLE  "gem_vdt_road_analysis_uu_5m_imsi" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"road_type_id" varchar  ,
"road_id" varchar  ,
"imsi" varchar  ,
"datetime" timestamp(6),
"handover_count" int4 DEFAULT 0 ,
"handover_success_count" int4 DEFAULT 0,
"rrc_connection_setup_count" int4 DEFAULT 0,
"rrc_connection_setup_success_count" int4 DEFAULT 0 ,
"rrc_connection_reconfig_count" int4 DEFAULT 0 ,
"rrc_connection_reconfig_success_count" int4 DEFAULT 0 ,
"rrc_connection_reestablishment_count" int4 DEFAULT 0 ,
"rrc_connection_reestablishment_success_count" int4 DEFAULT 0 ,
"longitude" varchar  ,
"latitude" varchar
)
;

-- ----------------------------
-- Table structure for gem_vdt_road_analysis_x2_5m_imsi
-- ----------------------------
DROP TABLE IF EXISTS  "gem_vdt_road_analysis_x2_5m_imsi";
CREATE TABLE  "gem_vdt_road_analysis_x2_5m_imsi" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"road_type_id" varchar  ,
"road_id" varchar  ,
"imsi" varchar  ,
"datetime" timestamp(6),
"handover_preparation_count" int4 DEFAULT 0 ,
"handover_preparation_success_count" int4 DEFAULT 0,
"longitude" varchar  ,
"latitude" varchar
)
;

-- ----------------------------
-- Table structure for gem_vdt_road_filter
-- ----------------------------
DROP TABLE IF EXISTS  "gem_vdt_road_filter";
CREATE TABLE  "gem_vdt_road_filter" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"road_id" varchar  ,
"datetime" timestamp(6),
"imsi" varchar  ,
"sample_count" int4 DEFAULT 0 ,
"distance" float8 DEFAULT 0 ,
"serving_rsrp_count" int4 DEFAULT 0 ,
"serving_rsrp_30_count" int4 DEFAULT 0 ,
"duration" int4 DEFAULT 0 ,
"overlapping_coverage_count" int4 DEFAULT 0
)
;

-- ----------------------------
-- Table structure for gem_virtual_analysis_indicators
-- ----------------------------
DROP TABLE IF EXISTS  "gem_virtual_analysis_indicators";
CREATE TABLE  "gem_virtual_analysis_indicators" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"name" varchar  ,
"value" varchar  ,
"level" varchar  ,
"parent_id" varchar  ,
"source_table" varchar
)
;

-- ----------------------------
-- Table structure for gem_x2_event_5m_statistics_by_imsi
-- ----------------------------
DROP TABLE IF EXISTS  "gem_x2_event_5m_statistics_by_imsi";
CREATE TABLE  "gem_x2_event_5m_statistics_by_imsi" (
"datetime" timestamp(6),
"imsi" varchar  ,
"msisdn" varchar  ,
"event_type" varchar(32)  ,
"request_count" int4,
"success_count" int4,
"abnormal_count" int4,
"response_delay_time" int8,
"no_resp_count" int4,
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP()
)
;


-- ----------------------------
-- Table structure for gem_x2_kpi_1d_failure_statistics
-- ----------------------------
DROP TABLE IF EXISTS  "gem_x2_kpi_1d_failure_statistics";
CREATE TABLE  "gem_x2_kpi_1d_failure_statistics" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"datetime" timestamp(6),
"whole_network" varchar  ,
"mme_group_id" varchar  ,
"mme_code" varchar  ,
"tac" int4,
"enodeb_id" int4,
"target_enodeb_id" varchar  ,
"cell_id" int4,
"ue_brand" varchar  ,
"ue_type" varchar  ,
"event_type" varchar  ,
"abnormal_type" int4,
"abnormal_reason" int4,
"abnormal_reason_count" int8,
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP()
)
;

-- ----------------------------
-- Table structure for gem_x2_kpi_1d_failure_statistics_by_imsi
-- ----------------------------
DROP TABLE IF EXISTS  "gem_x2_kpi_1d_failure_statistics_by_imsi";
CREATE TABLE  "gem_x2_kpi_1d_failure_statistics_by_imsi" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"datetime" timestamp(6),
"imsi" int8,
"event_type" varchar  ,
"abnormal_type" int4,
"abnormal_reason" int4,
"abnormal_reason_count" int8,
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP()
)
;

-- ----------------------------
-- Table structure for gem_x2_kpi_1d_statistics
-- ----------------------------
DROP TABLE IF EXISTS  "gem_x2_kpi_1d_statistics";
CREATE TABLE  "gem_x2_kpi_1d_statistics" (
"datetime" timestamp(6),
"whole_network" varchar  ,
"mme_group_id" varchar  ,
"mme_code" varchar  ,
"tac" int4,
"enodeb_id" int4,
"target_enodeb_id" varchar  ,
"cell_id" int4,
"ue_brand" varchar  ,
"ue_type" varchar  ,
"handover_preparation_count" int8,
"handover_preparation_success_count" int8,
"handover_preparation_delay_sum" int8,
"reset_count" int8,
"reset_success_count" int8,
"reset_delay_sum" int8,
"x2_setup_count" int8,
"x2_setup_success_count" int8,
"x2_setup_delay_sum" int8,
"enodeb_config_update_count" int8,
"enodeb_config_update_success_count" int8,
"enodeb_config_update_delay_sum" int8,
"resource_status_count" int8,
"resource_status_success_count" int8,
"resource_status_delay_sum" int8,
"mobility_settings_count" int8,
"mobility_settings_success_count" int8,
"mobility_settings_delay_sum" int8,
"cell_activation_count" int8,
"cell_activation_success_count" int8,
"cell_activation_delay_sum" int8,
"load_indication_count" int8,
"handover_cancel_count" int8,
"resource_status_update_count" int8,
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP()
)
;

-- ----------------------------
-- Table structure for gem_x2_kpi_1d_statistics_by_imsi
-- ----------------------------
DROP TABLE IF EXISTS  "gem_x2_kpi_1d_statistics_by_imsi";
CREATE TABLE  "gem_x2_kpi_1d_statistics_by_imsi" (
"datetime" timestamp(6),
"imsi" int8,
"enodeb_id" int4,
"cell_id" int4,
"ue_type" varchar  ,
"handover_preparation_count" int8,
"handover_preparation_success_count" int8,
"handover_preparation_delay_sum" int8,
"reset_count" int8,
"reset_success_count" int8,
"reset_delay_sum" int8,
"x2_setup_count" int8,
"x2_setup_success_count" int8,
"x2_setup_delay_sum" int8,
"enodeb_config_update_count" int8,
"enodeb_config_update_success_count" int8,
"enodeb_config_update_delay_sum" int8,
"resource_status_count" int8,
"resource_status_success_count" int8,
"resource_status_delay_sum" int8,
"mobility_settings_count" int8,
"mobility_settings_success_count" int8,
"mobility_settings_delay_sum" int8,
"cell_activation_count" int8,
"cell_activation_success_count" int8,
"cell_activation_delay_sum" int8,
"load_indication_count" int8,
"handover_cancel_count" int8,
"resource_status_update_count" int8,
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP()
)
;

-- ----------------------------
-- Table structure for gem_x2_kpi_1h_failure_statistics
-- ----------------------------
DROP TABLE IF EXISTS  "gem_x2_kpi_1h_failure_statistics";
CREATE TABLE  "gem_x2_kpi_1h_failure_statistics" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"datetime" timestamp(6),
"whole_network" varchar  ,
"mme_group_id" varchar  ,
"mme_code" varchar  ,
"tac" int4,
"enodeb_id" int4,
"target_enodeb_id" varchar  ,
"cell_id" int4,
"ue_brand" varchar  ,
"ue_type" varchar  ,
"event_type" varchar  ,
"abnormal_type" int4,
"abnormal_reason" int4,
"abnormal_reason_count" int8,
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP()
)
;

-- ----------------------------
-- Table structure for gem_x2_kpi_1h_failure_statistics_by_imsi
-- ----------------------------
DROP TABLE IF EXISTS  "gem_x2_kpi_1h_failure_statistics_by_imsi";
CREATE TABLE  "gem_x2_kpi_1h_failure_statistics_by_imsi" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"datetime" timestamp(6),
"imsi" int8,
"event_type" varchar  ,
"abnormal_type" int4,
"abnormal_reason" int4,
"abnormal_reason_count" int8,
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP()
)
;

-- ----------------------------
-- Table structure for gem_x2_kpi_1h_statistics
-- ----------------------------
DROP TABLE IF EXISTS  "gem_x2_kpi_1h_statistics";
CREATE TABLE  "gem_x2_kpi_1h_statistics" (
"datetime" timestamp(6),
"whole_network" varchar  ,
"mme_group_id" varchar  ,
"mme_code" varchar  ,
"tac" int4,
"enodeb_id" int4,
"target_enodeb_id" varchar  ,
"cell_id" int4,
"ue_brand" varchar  ,
"ue_type" varchar  ,
"handover_preparation_count" int8,
"handover_preparation_success_count" int8,
"handover_preparation_delay_sum" int8,
"reset_count" int8,
"reset_success_count" int8,
"reset_delay_sum" int8,
"x2_setup_count" int8,
"x2_setup_success_count" int8,
"x2_setup_delay_sum" int8,
"enodeb_config_update_count" int8,
"enodeb_config_update_success_count" int8,
"enodeb_config_update_delay_sum" int8,
"resource_status_count" int8,
"resource_status_success_count" int8,
"resource_status_delay_sum" int8,
"mobility_settings_count" int8,
"mobility_settings_success_count" int8,
"mobility_settings_delay_sum" int8,
"cell_activation_count" int8,
"cell_activation_success_count" int8,
"cell_activation_delay_sum" int8,
"load_indication_count" int8,
"handover_cancel_count" int8,
"resource_status_update_count" int8,
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP()
)
;

-- ----------------------------
-- Table structure for gem_x2_kpi_1h_statistics_by_imsi
-- ----------------------------
DROP TABLE IF EXISTS  "gem_x2_kpi_1h_statistics_by_imsi";
CREATE TABLE  "gem_x2_kpi_1h_statistics_by_imsi" (
"datetime" timestamp(6),
"imsi" int8,
"enodeb_id" int4,
"cell_id" int4,
"ue_type" varchar  ,
"handover_preparation_count" int8,
"handover_preparation_success_count" int8,
"handover_preparation_delay_sum" int8,
"reset_count" int8,
"reset_success_count" int8,
"reset_delay_sum" int8,
"x2_setup_count" int8,
"x2_setup_success_count" int8,
"x2_setup_delay_sum" int8,
"enodeb_config_update_count" int8,
"enodeb_config_update_success_count" int8,
"enodeb_config_update_delay_sum" int8,
"resource_status_count" int8,
"resource_status_success_count" int8,
"resource_status_delay_sum" int8,
"mobility_settings_count" int8,
"mobility_settings_success_count" int8,
"mobility_settings_delay_sum" int8,
"cell_activation_count" int8,
"cell_activation_success_count" int8,
"cell_activation_delay_sum" int8,
"load_indication_count" int8,
"handover_cancel_count" int8,
"resource_status_update_count" int8,
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP()
)
;

-- ----------------------------
-- Table structure for gem_x2_kpi_5m_failure_statistics
-- ----------------------------
DROP TABLE IF EXISTS  "gem_x2_kpi_5m_failure_statistics";
CREATE TABLE  "gem_x2_kpi_5m_failure_statistics" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"datetime" timestamp(6),
"whole_network" varchar  ,
"mme_group_id" varchar  ,
"mme_code" varchar  ,
"tac" int4,
"enodeb_id" int4,
"target_enodeb_id" varchar  ,
"cell_id" int4,
"ue_brand" varchar  ,
"ue_type" varchar  ,
"event_type" varchar  ,
"abnormal_type" int4,
"abnormal_reason" int4,
"abnormal_reason_count" int8,
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP()
)
;

-- ----------------------------
-- Table structure for gem_x2_kpi_5m_failure_statistics_by_imsi
-- ----------------------------
DROP TABLE IF EXISTS  "gem_x2_kpi_5m_failure_statistics_by_imsi";
CREATE TABLE  "gem_x2_kpi_5m_failure_statistics_by_imsi" (
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"datetime" timestamp(6),
"imsi" int8,
"event_type" varchar  ,
"abnormal_type" int4,
"abnormal_reason" int4,
"abnormal_reason_count" int8,
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP()
)
;

-- ----------------------------
-- Table structure for gem_x2_kpi_5m_statistics
-- ----------------------------
DROP TABLE IF EXISTS  "gem_x2_kpi_5m_statistics";
CREATE TABLE  "gem_x2_kpi_5m_statistics" (
"datetime" timestamp(6),
"whole_network" varchar  ,
"mme_group_id" varchar  ,
"mme_code" varchar  ,
"tac" varchar  ,
"enodeb_id" int4,
"target_enodeb_id" varchar  ,
"cell_id" int4,
"ue_brand" varchar  ,
"ue_type" varchar  ,
"handover_preparation_count" int8,
"handover_preparation_success_count" int8,
"handover_preparation_delay_sum" int8,
"reset_count" int8,
"reset_success_count" int8,
"reset_delay_sum" int8,
"x2_setup_count" int8,
"x2_setup_success_count" int8,
"x2_setup_delay_sum" int8,
"enodeb_config_update_count" int8,
"enodeb_config_update_success_count" int8,
"enodeb_config_update_delay_sum" int8,
"resource_status_count" int8,
"resource_status_success_count" int8,
"resource_status_delay_sum" int8,
"mobility_settings_count" int8,
"mobility_settings_success_count" int8,
"mobility_settings_delay_sum" int8,
"cell_activation_count" int8,
"cell_activation_success_count" int8,
"cell_activation_delay_sum" int8,
"load_indication_count" int8,
"handover_cancel_count" int8,
"resource_status_update_count" int8,
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP()
)
;

-- ----------------------------
-- Table structure for gem_x2_kpi_5m_statistics_by_imsi
-- ----------------------------
DROP TABLE IF EXISTS  "gem_x2_kpi_5m_statistics_by_imsi";
CREATE TABLE  "gem_x2_kpi_5m_statistics_by_imsi" (
"datetime" timestamp(6),
"imsi" int8,
"enodeb_id" int4,
"cell_id" int4,
"ue_type" varchar  ,
"handover_preparation_count" int8,
"handover_preparation_success_count" int8,
"handover_preparation_delay_sum" int8,
"reset_count" int8,
"reset_success_count" int8,
"reset_delay_sum" int8,
"x2_setup_count" int8,
"x2_setup_success_count" int8,
"x2_setup_delay_sum" int8,
"enodeb_config_update_count" int8,
"enodeb_config_update_success_count" int8,
"enodeb_config_update_delay_sum" int8,
"resource_status_count" int8,
"resource_status_success_count" int8,
"resource_status_delay_sum" int8,
"mobility_settings_count" int8,
"mobility_settings_success_count" int8,
"mobility_settings_delay_sum" int8,
"cell_activation_count" int8,
"cell_activation_success_count" int8,
"cell_activation_delay_sum" int8,
"load_indication_count" int8,
"handover_cancel_count" int8,
"resource_status_update_count" int8,
"id" varchar   DEFAULT next_id() PRIMARY KEY,
"create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP()
)
;

-- ----------------------------
-- Table structure for pathman_config
-- ----------------------------
DROP TABLE IF EXISTS  "pathman_config";
CREATE TABLE  "pathman_config" (
"partrel" varchar PRIMARY KEY,
"attname" varchar,
"parttype" int4 ,
"range_interval" varchar
)
;

-- ----------------------------
-- Table structure for pathman_config_params
-- ----------------------------
DROP TABLE IF EXISTS  "pathman_config_params";
CREATE TABLE  "pathman_config_params" (
"partrel" varchar PRIMARY KEY,
"enable_parent" boolean DEFAULT false ,
"auto" boolean DEFAULT true ,
"init_callback" INTEGER DEFAULT 0
)
;

ALTER TABLE  "gem_abnormal_reasons" ADD UNIQUE ("abnormal_type_id", "name", "abnormal_reason_code");


ALTER TABLE  "gem_dimension_name_relations" ADD UNIQUE ("dimension_name", "network_interface", "next_level_dimension_name");

ALTER TABLE  "gem_event_types" ADD UNIQUE ("name", "event_code", "network_interface");


ALTER TABLE  "gem_indicators" ADD UNIQUE ("name", "network_interface", "parameter");

COMMIT;