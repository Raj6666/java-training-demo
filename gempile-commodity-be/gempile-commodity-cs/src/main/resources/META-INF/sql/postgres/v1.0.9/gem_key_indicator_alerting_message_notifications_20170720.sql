/**
description：该脚本用于更新gem_key_indicator_alerting_message_notifications表
author：liangzheng
date：2017-07-20
*/
/*添加三个字段*/
ALTER TABLE gem_key_indicator_alerting_message_notifications ADD group_name VARCHAR;
ALTER TABLE gem_key_indicator_alerting_message_notifications ADD group_user VARCHAR;
ALTER TABLE gem_key_indicator_alerting_message_notifications ADD group_config_ids VARCHAR;
