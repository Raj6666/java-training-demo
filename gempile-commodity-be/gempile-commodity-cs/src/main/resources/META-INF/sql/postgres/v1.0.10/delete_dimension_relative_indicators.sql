DELETE
FROM
	gem_dimension_relative_indicators
WHERE
	indicator_id IN (
		SELECT
			"id"
		FROM
			gem_indicators
		WHERE
			(
				factor LIKE '%eps_qci1_establish_success%'
			)
		OR (
			factor LIKE '%eps_qci2_establish_success%'
		)
		OR (
			factor LIKE '%eps_qci2_establish_success%'
		)
		OR (
			factor LIKE '%eps_qci3_establish_success%'
		)
		OR (
			factor LIKE '%eps_qci4_establish_success%'
		)
		OR (
			factor LIKE '%eps_qci5_establish_success%'
		)
		OR (
			factor LIKE '%eps_qci6_establish_success%'
		)
		OR (
			factor LIKE '%eps_qci7_establish_success%'
		)
		OR (
			factor LIKE '%eps_qci8_establish_success%'
		)
		OR (
			factor LIKE '%enb_configuration_update_request%'
		)
		OR (
			factor LIKE '%enb_configuration_update_success%'
		)
		OR (
			factor LIKE '%enb_configuration_update_timedelay%'
		)
		OR (
			factor LIKE '%mme_configuration_update_request%'
		)
		OR (
			factor LIKE '%mme_configuration_update_success%'
		)
		OR (
			factor LIKE '%mme_configuration_update_timedelay%'
		)
		OR (
			factor LIKE '%error_indication_request%'
		)
		OR (
			factor LIKE '%overload_start_request%'
		)
		OR (
			factor LIKE '%overload_stop_request%'
		)
		OR (factor LIKE '%sms_request%')
		OR (factor LIKE '%sms_success%')
		OR (
			factor LIKE '%sms_timedelay%'
		)
		OR (
			factor LIKE '%sms_send_request%'
		)
		OR (
			factor LIKE '%sms_send_success%'
		)
		OR (
			factor LIKE '%sms_send_timedelay%'
		)
		OR (
			factor LIKE '%sms_receive_request%'
		)
		OR (
			factor LIKE '%sms_receive_success%'
		)
		OR (
			factor LIKE '%sms_receive_timedelay%'
		)
		OR (
			factor LIKE '%dns_system_success_count%'
		)
		OR (
			factor LIKE '%sms_paging_request%'
		)
		OR (
			factor LIKE '%sms_paging_success%'
		)
		OR (
			factor LIKE '%sms_paging_time_delay%'
		)
		OR (
			factor LIKE '%sgs_ap_location_update_request%'
		)
		OR (
			factor LIKE '%sgs_ap_location_update_success%'
		)
		OR (
			factor LIKE '%sgs_ap_location_update_time_delay%'
		)
		OR (
			factor LIKE '%sgs_ap_alter_request%'
		)
		OR (
			factor LIKE '%sgs_ap_alter_success%'
		)
		OR (
			factor LIKE '%sgs_ap_alter_time_delay%'
		)
		OR (
			factor LIKE '%sgs_ap_service_abort_request%'
		)
		OR (
			factor LIKE '%sgs_ap_ue_activity_request%'
		)
		OR (
			factor LIKE '%sgs_ap_release_request%'
		)
		OR (
			factor LIKE '%sgs_ap_ue_reset_request%'
		)
		OR (
			factor LIKE '%sgs_ap_ue_reset_success%'
		)
		OR (
			factor LIKE '%sgs_ap_mm_information_request%'
		)
		OR (
			factor LIKE '%sgs_ap_tmsi_allocation_request%'
		)
		OR (factor LIKE '%sms_request%')
		OR (factor LIKE '%sms_success%')
		OR (
			factor LIKE '%sms_time_delay%'
		)
		OR (
			factor LIKE '%sms_mo_request%'
		)
		OR (
			factor LIKE '%sms_mo_success%'
		)
		OR (
			factor LIKE '%sms_mo_time_delay%'
		)
		OR (
			factor LIKE '%sms_mt_request%'
		)
		OR (
			factor LIKE '%sms_mt_success%'
		)
		OR (
			factor LIKE '%sms_mt_time_delay%'
		)
		OR (
			factor LIKE '%rtsp_playing_request_count%'
		)
		OR (
			factor LIKE '%rtsp_playing_success_count%'
		)
		OR (
			factor LIKE '%rtsp_playing_waiting_time%'
		)
		OR (
			factor LIKE '%purge_ue_request%'
		)
		OR (
			factor LIKE '%purge_ue_success%'
		)
		OR (
			factor LIKE '%purge_ue_timedelay%'
		)
		OR (
			factor LIKE '%notification_request%'
		)
		OR (
			factor LIKE '%notification_success%'
		)
		OR (
			factor LIKE '%notification_timedelay%'
		)
		OR (
			factor LIKE '%release_access_bearer_request%'
		)
		OR (
			factor LIKE '%release_access_bearer_success%'
		)
		OR (
			factor LIKE '%release_access_bearer_timedelay%'
		)
		OR (
			factor LIKE '%modify_access_bearer_request%'
		)
		OR (
			factor LIKE '%modify_access_bearer_success%'
		)
		OR (
			factor LIKE '%modify_access_bearer_timedelay%'
		)
		OR (
			factor LIKE '%change_notification_request%'
		)
		OR (
			factor LIKE '%change_notification_success%'
		)
		OR (
			factor LIKE '%change_notification_timedelay%'
		)
		OR (
			factor LIKE '%suspend_notification_request%'
		)
		OR (
			factor LIKE '%suspend_notification_success%'
		)
		OR (
			factor LIKE '%suspend_notification_timedelay%'
		)
		OR (
			factor LIKE '%resume_notification_request%'
		)
		OR (
			factor LIKE '%resume_notification_success%'
		)
		OR (
			factor LIKE '%resume_notification_timedelay%'
		)
		OR (
			factor LIKE '%downlink_data_notification_request%'
		)
		OR (
			factor LIKE '%downlink_data_notification_success%'
		)
		OR (
			factor LIKE '%downlink_data_notification_timedelay%'
		)
		OR (
			factor LIKE '%downlink_data_notification_failure_indication_request%'
		)
		OR (
			factor LIKE '%create_indirect_data_forward_tunnel_request%'
		)
		OR (
			factor LIKE '%create_indirect_data_forward_tunnel_success%'
		)
		OR (
			factor LIKE '%create_indirect_data_forward_tunnel_timedelay%'
		)
		OR (
			factor LIKE '%delete_indirect_data_forward_tunnel_request%'
		)
		OR (
			factor LIKE '%delete_indirect_data_forward_tunnel_success%'
		)
		OR (
			factor LIKE '%delete_indirect_data_forward_tunnel_timedelay%'
		)
		OR (
			factor LIKE '%stop_paging_indication_request%'
		)
		OR (
			factor LIKE '%pgw_restart_notification_request%'
		)
		OR (
			factor LIKE '%pgw_restart_notification_success%'
		)
		OR (
			factor LIKE '%pgw_restart_notification_timedelay%'
		)
		OR (
			factor LIKE '%trace_session_activation_request%'
		)
		OR (
			factor LIKE '%trace_session_deactivation_request%'
		)
	);