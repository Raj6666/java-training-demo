ALTER TABLE gem_key_indicator_alerting_message_notifications ADD rule_id VARCHAR;
ALTER TABLE gem_key_indicator_alerting_message_notification_configs ADD rule_id VARCHAR;
ALTER TABLE gem_key_indicator_alerting_rules ADD enabled bool DEFAULT true;