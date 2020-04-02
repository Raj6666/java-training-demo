/**
description：该版本的SQL改动如下：
     1.添加用于S1U汇总事件的配置数据
     2.创建S1U汇总的故障 kpi 表
     3.添加S1U,S1U_TOTAL 用于下钻的配置数据
     4.添加 S1U_DNS  abnormal_reason 数据
author：sunjinpeng
date：2017-07-25

*/

/*  在gem_failure_dimension_name_relations表添加用于S1U汇总事件的配置数据 */
INSERT INTO "public"."gem_failure_dimension_name_relations" ("dimension_name", "network_interface", "next_level_dimension_name", "next_level_dimension_column", "next_level_dimension_name_index", "next_level_dimension_name_type") VALUES ('whole_network', 'S1U_TOTAL', 'sgw', 'sgw', '1', '');
INSERT INTO "public"."gem_failure_dimension_name_relations" ("dimension_name", "network_interface", "next_level_dimension_name", "next_level_dimension_column", "next_level_dimension_name_index", "next_level_dimension_name_type") VALUES ('whole_network', 'S1U_TOTAL', 'tac', 'tac', '2', '');
INSERT INTO "public"."gem_failure_dimension_name_relations" ("dimension_name", "network_interface", "next_level_dimension_name", "next_level_dimension_column", "next_level_dimension_name_index", "next_level_dimension_name_type") VALUES ('whole_network', 'S1U_TOTAL', 'enodeb_id', 'enodeb_id', '3', '');
INSERT INTO "public"."gem_failure_dimension_name_relations" ("dimension_name", "network_interface", "next_level_dimension_name", "next_level_dimension_column", "next_level_dimension_name_index", "next_level_dimension_name_type") VALUES ('whole_network', 'S1U_TOTAL', 'cell_id', 'cell_id', '4', '');
INSERT INTO "public"."gem_failure_dimension_name_relations" ("dimension_name", "network_interface", "next_level_dimension_name", "next_level_dimension_column", "next_level_dimension_name_index", "next_level_dimension_name_type") VALUES ('whole_network', 'S1U_TOTAL', 'business_type', 'business_type', '8', '');
INSERT INTO "public"."gem_failure_dimension_name_relations" ("dimension_name", "network_interface", "next_level_dimension_name", "next_level_dimension_column", "next_level_dimension_name_index", "next_level_dimension_name_type") VALUES ('whole_network', 'S1U_TOTAL', 'detail_business', 'detail_business', '9', '');
INSERT INTO "public"."gem_failure_dimension_name_relations" ("dimension_name", "network_interface", "next_level_dimension_name", "next_level_dimension_column", "next_level_dimension_name_index", "next_level_dimension_name_type") VALUES ('sgw', 'S1U_TOTAL', 'tac', 'tac', '1', '');
INSERT INTO "public"."gem_failure_dimension_name_relations" ("dimension_name", "network_interface", "next_level_dimension_name", "next_level_dimension_column", "next_level_dimension_name_index", "next_level_dimension_name_type") VALUES ('sgw', 'S1U_TOTAL', 'enodeb_id', 'enodeb_id', '2', '');
INSERT INTO "public"."gem_failure_dimension_name_relations" ("dimension_name", "network_interface", "next_level_dimension_name", "next_level_dimension_column", "next_level_dimension_name_index", "next_level_dimension_name_type") VALUES ('sgw', 'S1U_TOTAL', 'cell_id', 'cell_id', '3', '');
INSERT INTO "public"."gem_failure_dimension_name_relations" ("dimension_name", "network_interface", "next_level_dimension_name", "next_level_dimension_column", "next_level_dimension_name_index", "next_level_dimension_name_type") VALUES ('sgw', 'S1U_TOTAL', 'business_type', 'business_type', '7', '');
INSERT INTO "public"."gem_failure_dimension_name_relations" ("dimension_name", "network_interface", "next_level_dimension_name", "next_level_dimension_column", "next_level_dimension_name_index", "next_level_dimension_name_type") VALUES ('sgw', 'S1U_TOTAL', 'detail_business', 'detail_business', '8', '');
INSERT INTO "public"."gem_failure_dimension_name_relations" ("dimension_name", "network_interface", "next_level_dimension_name", "next_level_dimension_column", "next_level_dimension_name_index", "next_level_dimension_name_type") VALUES ('tac', 'S1U_TOTAL', 'enodeb_id', 'enodeb_id', '1', '');
INSERT INTO "public"."gem_failure_dimension_name_relations" ("dimension_name", "network_interface", "next_level_dimension_name", "next_level_dimension_column", "next_level_dimension_name_index", "next_level_dimension_name_type") VALUES ('tac', 'S1U_TOTAL', 'cell_id', 'cell_id', '2', '');
INSERT INTO "public"."gem_failure_dimension_name_relations" ("dimension_name", "network_interface", "next_level_dimension_name", "next_level_dimension_column", "next_level_dimension_name_index", "next_level_dimension_name_type") VALUES ('tac', 'S1U_TOTAL', 'business_type', 'business_type', '6', '');
INSERT INTO "public"."gem_failure_dimension_name_relations" ("dimension_name", "network_interface", "next_level_dimension_name", "next_level_dimension_column", "next_level_dimension_name_index", "next_level_dimension_name_type") VALUES ('tac', 'S1U_TOTAL', 'detail_business', 'detail_business', '7', '');
INSERT INTO "public"."gem_failure_dimension_name_relations" ("dimension_name", "network_interface", "next_level_dimension_name", "next_level_dimension_column", "next_level_dimension_name_index", "next_level_dimension_name_type") VALUES ('enodeb_id', 'S1U_TOTAL', 'cell_id', 'cell_id', '1', '');
INSERT INTO "public"."gem_failure_dimension_name_relations" ("dimension_name", "network_interface", "next_level_dimension_name", "next_level_dimension_column", "next_level_dimension_name_index", "next_level_dimension_name_type") VALUES ('enodeb_id', 'S1U_TOTAL', 'business_type', 'business_type', '5', '');
INSERT INTO "public"."gem_failure_dimension_name_relations" ("dimension_name", "network_interface", "next_level_dimension_name", "next_level_dimension_column", "next_level_dimension_name_index", "next_level_dimension_name_type") VALUES ('enodeb_id', 'S1U_TOTAL', 'detail_business', 'detail_business', '6', '');
INSERT INTO "public"."gem_failure_dimension_name_relations" ("dimension_name", "network_interface", "next_level_dimension_name", "next_level_dimension_column", "next_level_dimension_name_index", "next_level_dimension_name_type") VALUES ('cell_id', 'S1U_TOTAL', 'business_type', 'business_type', '4', '');
INSERT INTO "public"."gem_failure_dimension_name_relations" ("dimension_name", "network_interface", "next_level_dimension_name", "next_level_dimension_column", "next_level_dimension_name_index", "next_level_dimension_name_type") VALUES ('cell_id', 'S1U_TOTAL', 'detail_business', 'detail_business', '5', '');
INSERT INTO "public"."gem_failure_dimension_name_relations" ("dimension_name", "network_interface", "next_level_dimension_name", "next_level_dimension_column", "next_level_dimension_name_index", "next_level_dimension_name_type") VALUES ('imsi', 'S1U_TOTAL', 'business_type', 'business_type', '3', '');
INSERT INTO "public"."gem_failure_dimension_name_relations" ("dimension_name", "network_interface", "next_level_dimension_name", "next_level_dimension_column", "next_level_dimension_name_index", "next_level_dimension_name_type") VALUES ('imsi', 'S1U_TOTAL', 'detail_business', 'detail_business', '4', '');
INSERT INTO "public"."gem_failure_dimension_name_relations" ("dimension_name", "network_interface", "next_level_dimension_name", "next_level_dimension_column", "next_level_dimension_name_index", "next_level_dimension_name_type") VALUES ('ue_brand', 'S1U_TOTAL', 'business_type', 'business_type', '2', '');
INSERT INTO "public"."gem_failure_dimension_name_relations" ("dimension_name", "network_interface", "next_level_dimension_name", "next_level_dimension_column", "next_level_dimension_name_index", "next_level_dimension_name_type") VALUES ('ue_brand', 'S1U_TOTAL', 'detail_business', 'detail_business', '3', '');
INSERT INTO "public"."gem_failure_dimension_name_relations" ("dimension_name", "network_interface", "next_level_dimension_name", "next_level_dimension_column", "next_level_dimension_name_index", "next_level_dimension_name_type") VALUES ('ue_type', 'S1U_TOTAL', 'business_type', 'business_type', '1', '');
INSERT INTO "public"."gem_failure_dimension_name_relations" ("dimension_name", "network_interface", "next_level_dimension_name", "next_level_dimension_column", "next_level_dimension_name_index", "next_level_dimension_name_type") VALUES ('ue_type', 'S1U_TOTAL', 'detail_business', 'detail_business', '2', '');
INSERT INTO "public"."gem_failure_dimension_name_relations" ("dimension_name", "network_interface", "next_level_dimension_name", "next_level_dimension_column", "next_level_dimension_name_index", "next_level_dimension_name_type") VALUES ('business_type', 'S1U_TOTAL', 'detail_business', 'detail_business', '1', '');

INSERT INTO "public"."gem_event_types" ("name", "event_code", "network_interface", "dimension_id") VALUES ('TCP事件', '100', 'S1U_TOTAL', NULL);
INSERT INTO "public"."gem_event_relative_indicators_for_division" ("event_code", "network_interface", "ind_divisor", "ind_dividend") VALUES ('100', 'S1U_TOTAL', 'tcp_up_link_request_count', 'tcp_dl_link_success_count');

INSERT INTO "public"."gem_abnormal_types" ("name", "abnormal_type_code", "network_interface") VALUES ('用户原因', '1', 'S1U_TOTAL');
INSERT INTO "public"."gem_abnormal_types" ("name", "abnormal_type_code", "network_interface") VALUES ('服务提供商原因', '3', 'S1U_TOTAL');

INSERT INTO "public"."gem_interface_interval_tables" ("network_interface", "interval", "table_name", "scope") VALUES ('S1U_TOTAL', '60', 'gem_s1u_total_kpi_1h_failure_statistics', 'failure');
INSERT INTO "public"."gem_interface_interval_tables" ("network_interface", "interval", "table_name", "scope") VALUES ('S1U_TOTAL', '60', 'gem_s1u_total_kpi_1h_statistics', 'kpi');

INSERT INTO "public"."gem_session_failure_causes" ("code", "description", "network_interface", "abnormal_type") VALUES ('701', '用户发起TCP连接重置', 'S1U_TOTAL', '1');
INSERT INTO "public"."gem_session_failure_causes" ("code", "description", "network_interface", "abnormal_type") VALUES ('702', '服务提供商发起TCP连接重置', 'S1U_TOTAL', '3');

INSERT INTO "public"."gem_interface_interval_tables" ("network_interface", "interval", "table_name", "scope") VALUES ('S1U_TOTAL', '5', 'gem_s1u_total_kpi_5m_failure_statistics', 'failure');
INSERT INTO "public"."gem_interface_interval_tables" ("network_interface", "interval", "table_name", "scope") VALUES ('S1U_TOTAL', '5', 'gem_s1u_total_kpi_5m_statistics', 'kpi');
INSERT INTO "public"."gem_interface_interval_tables" ("network_interface", "interval", "table_name", "scope") VALUES ('S1U_TOTAL', '1440', 'gem_s1u_total_kpi_1d_failure_statistics', 'failure');
INSERT INTO "public"."gem_interface_interval_tables" ("network_interface", "interval", "table_name", "scope") VALUES ('S1U_TOTAL', '1440', 'gem_s1u_total_kpi_1d_statistics', 'kpi');

INSERT INTO "public"."gem_interface_interval_tables" ("network_interface", "interval", "table_name", "scope") VALUES ('S1U', '1440', 'gem_s1u_kpi_1d_failure_statistics', 'failure');
INSERT INTO "public"."gem_interface_interval_tables" ("network_interface", "interval", "table_name", "scope") VALUES ('S1U', '1440', 'gem_s1u_kpi_1d_statistics', 'kpi');
INSERT INTO "public"."gem_interface_interval_tables" ("network_interface", "interval", "table_name", "scope") VALUES ('S1U', '5', 'gem_s1u_kpi_5m_failure_statistics', 'failure');
INSERT INTO "public"."gem_interface_interval_tables" ("network_interface", "interval", "table_name", "scope") VALUES ('S1U', '5', 'gem_s1u_kpi_5m_statistics', 'kpi');

/*  创建S1U汇总的故障 kpi 表 */
CREATE TABLE "public"."gem_s1u_total_kpi_5m_failure_statistics" (
"statistical_time" timestamp(6) NOT NULL,
"whole_network" varchar COLLATE "default",
"sgw" varchar COLLATE "default",
"tac" varchar COLLATE "default",
"enodeb_id" varchar COLLATE "default",
"cell_id" varchar COLLATE "default",
"imsi" varchar COLLATE "default",
"ue_brand" varchar COLLATE "default",
"ue_type" varchar COLLATE "default",
"business_type" varchar COLLATE "default",
"detail_business" varchar COLLATE "default",
"event_type" varchar COLLATE "default",
"abnormal_type" int4,
"abnormal_reason" int4,
"abnormal_reason_count" int8,
"created_time" timestamp(6) DEFAULT now()
)
WITH (OIDS=FALSE)

;

CREATE TABLE "public"."gem_s1u_total_kpi_1h_failure_statistics" (
"statistical_time" timestamp(6) NOT NULL,
"whole_network" varchar COLLATE "default",
"sgw" varchar COLLATE "default",
"tac" varchar COLLATE "default",
"enodeb_id" varchar COLLATE "default",
"cell_id" varchar COLLATE "default",
"imsi" varchar COLLATE "default",
"ue_brand" varchar COLLATE "default",
"ue_type" varchar COLLATE "default",
"business_type" varchar COLLATE "default",
"detail_business" varchar COLLATE "default",
"event_type" varchar COLLATE "default",
"abnormal_type" int4,
"abnormal_reason" int4,
"abnormal_reason_count" int8,
"created_time" timestamp(6) DEFAULT now()
)
WITH (OIDS=FALSE)

;

CREATE TABLE "public"."gem_s1u_total_kpi_1d_failure_statistics" (
"statistical_time" timestamp(6) NOT NULL,
"whole_network" varchar COLLATE "default",
"sgw" varchar COLLATE "default",
"tac" varchar COLLATE "default",
"enodeb_id" varchar COLLATE "default",
"cell_id" varchar COLLATE "default",
"imsi" varchar COLLATE "default",
"ue_brand" varchar COLLATE "default",
"ue_type" varchar COLLATE "default",
"business_type" varchar COLLATE "default",
"detail_business" varchar COLLATE "default",
"event_type" varchar COLLATE "default",
"abnormal_type" int4,
"abnormal_reason" int4,
"abnormal_reason_count" int8,
"created_time" timestamp(6) DEFAULT now()
)
WITH (OIDS=FALSE)

;

/* 添加S1U,S1U_TOTAL 用于下钻的配置数据 */
INSERT INTO "public"."gem_dimension_name_relations" ("dimension_name", "network_interface", "next_level_dimension_name") VALUES ('whole_network', 'S1U', 'sgw');
INSERT INTO "public"."gem_dimension_name_relations" ("dimension_name", "network_interface", "next_level_dimension_name") VALUES ('whole_network', 'S1U', 'tac');
INSERT INTO "public"."gem_dimension_name_relations" ("dimension_name", "network_interface", "next_level_dimension_name") VALUES ('whole_network', 'S1U', 'enodeb_id');
INSERT INTO "public"."gem_dimension_name_relations" ("dimension_name", "network_interface", "next_level_dimension_name") VALUES ('whole_network', 'S1U', 'cell_id');
INSERT INTO "public"."gem_dimension_name_relations" ("dimension_name", "network_interface", "next_level_dimension_name") VALUES ('whole_network', 'S1U', 'imsi');
INSERT INTO "public"."gem_dimension_name_relations" ("dimension_name", "network_interface", "next_level_dimension_name") VALUES ('whole_network', 'S1U', 'ue_brand');
INSERT INTO "public"."gem_dimension_name_relations" ("dimension_name", "network_interface", "next_level_dimension_name") VALUES ('whole_network', 'S1U', 'ue_type');
INSERT INTO "public"."gem_dimension_name_relations" ("dimension_name", "network_interface", "next_level_dimension_name") VALUES ('whole_network', 'S1U', 'business_type');
INSERT INTO "public"."gem_dimension_name_relations" ("dimension_name", "network_interface", "next_level_dimension_name") VALUES ('whole_network', 'S1U', 'detail_business');
INSERT INTO "public"."gem_dimension_name_relations" ("dimension_name", "network_interface", "next_level_dimension_name") VALUES ('sgw', 'S1U', 'tac');
INSERT INTO "public"."gem_dimension_name_relations" ("dimension_name", "network_interface", "next_level_dimension_name") VALUES ('sgw', 'S1U', 'enodeb_id');
INSERT INTO "public"."gem_dimension_name_relations" ("dimension_name", "network_interface", "next_level_dimension_name") VALUES ('sgw', 'S1U', 'cell_id');
INSERT INTO "public"."gem_dimension_name_relations" ("dimension_name", "network_interface", "next_level_dimension_name") VALUES ('sgw', 'S1U', 'imsi');
INSERT INTO "public"."gem_dimension_name_relations" ("dimension_name", "network_interface", "next_level_dimension_name") VALUES ('sgw', 'S1U', 'ue_brand');
INSERT INTO "public"."gem_dimension_name_relations" ("dimension_name", "network_interface", "next_level_dimension_name") VALUES ('sgw', 'S1U', 'ue_type');
INSERT INTO "public"."gem_dimension_name_relations" ("dimension_name", "network_interface", "next_level_dimension_name") VALUES ('sgw', 'S1U', 'business_type');
INSERT INTO "public"."gem_dimension_name_relations" ("dimension_name", "network_interface", "next_level_dimension_name") VALUES ('sgw', 'S1U', 'detail_business');
INSERT INTO "public"."gem_dimension_name_relations" ("dimension_name", "network_interface", "next_level_dimension_name") VALUES ('tac', 'S1U', 'enodeb_id');
INSERT INTO "public"."gem_dimension_name_relations" ("dimension_name", "network_interface", "next_level_dimension_name") VALUES ('tac', 'S1U', 'cell_id');
INSERT INTO "public"."gem_dimension_name_relations" ("dimension_name", "network_interface", "next_level_dimension_name") VALUES ('tac', 'S1U', 'imsi');
INSERT INTO "public"."gem_dimension_name_relations" ("dimension_name", "network_interface", "next_level_dimension_name") VALUES ('tac', 'S1U', 'ue_brand');
INSERT INTO "public"."gem_dimension_name_relations" ("dimension_name", "network_interface", "next_level_dimension_name") VALUES ('tac', 'S1U', 'ue_type');
INSERT INTO "public"."gem_dimension_name_relations" ("dimension_name", "network_interface", "next_level_dimension_name") VALUES ('tac', 'S1U', 'business_type');
INSERT INTO "public"."gem_dimension_name_relations" ("dimension_name", "network_interface", "next_level_dimension_name") VALUES ('tac', 'S1U', 'detail_business');
INSERT INTO "public"."gem_dimension_name_relations" ("dimension_name", "network_interface", "next_level_dimension_name") VALUES ('enodeb_id', 'S1U', 'cell_id');
INSERT INTO "public"."gem_dimension_name_relations" ("dimension_name", "network_interface", "next_level_dimension_name") VALUES ('enodeb_id', 'S1U', 'imsi');
INSERT INTO "public"."gem_dimension_name_relations" ("dimension_name", "network_interface", "next_level_dimension_name") VALUES ('enodeb_id', 'S1U', 'ue_brand');
INSERT INTO "public"."gem_dimension_name_relations" ("dimension_name", "network_interface", "next_level_dimension_name") VALUES ('enodeb_id', 'S1U', 'ue_type');
INSERT INTO "public"."gem_dimension_name_relations" ("dimension_name", "network_interface", "next_level_dimension_name") VALUES ('enodeb_id', 'S1U', 'business_type');
INSERT INTO "public"."gem_dimension_name_relations" ("dimension_name", "network_interface", "next_level_dimension_name") VALUES ('enodeb_id', 'S1U', 'detail_business');
INSERT INTO "public"."gem_dimension_name_relations" ("dimension_name", "network_interface", "next_level_dimension_name") VALUES ('cell_id', 'S1U', 'imsi');
INSERT INTO "public"."gem_dimension_name_relations" ("dimension_name", "network_interface", "next_level_dimension_name") VALUES ('cell_id', 'S1U', 'ue_brand');
INSERT INTO "public"."gem_dimension_name_relations" ("dimension_name", "network_interface", "next_level_dimension_name") VALUES ('cell_id', 'S1U', 'ue_type');
INSERT INTO "public"."gem_dimension_name_relations" ("dimension_name", "network_interface", "next_level_dimension_name") VALUES ('cell_id', 'S1U', 'business_type');
INSERT INTO "public"."gem_dimension_name_relations" ("dimension_name", "network_interface", "next_level_dimension_name") VALUES ('cell_id', 'S1U', 'detail_business');
INSERT INTO "public"."gem_dimension_name_relations" ("dimension_name", "network_interface", "next_level_dimension_name") VALUES ('imsi', 'S1U', 'ue_brand');
INSERT INTO "public"."gem_dimension_name_relations" ("dimension_name", "network_interface", "next_level_dimension_name") VALUES ('imsi', 'S1U', 'ue_type');
INSERT INTO "public"."gem_dimension_name_relations" ("dimension_name", "network_interface", "next_level_dimension_name") VALUES ('imsi', 'S1U', 'business_type');
INSERT INTO "public"."gem_dimension_name_relations" ("dimension_name", "network_interface", "next_level_dimension_name") VALUES ('imsi', 'S1U', 'detail_business');
INSERT INTO "public"."gem_dimension_name_relations" ("dimension_name", "network_interface", "next_level_dimension_name") VALUES ('ue_brand', 'S1U', 'ue_type');
INSERT INTO "public"."gem_dimension_name_relations" ("dimension_name", "network_interface", "next_level_dimension_name") VALUES ('ue_brand', 'S1U', 'business_type');
INSERT INTO "public"."gem_dimension_name_relations" ("dimension_name", "network_interface", "next_level_dimension_name") VALUES ('ue_brand', 'S1U', 'detail_business');
INSERT INTO "public"."gem_dimension_name_relations" ("dimension_name", "network_interface", "next_level_dimension_name") VALUES ('ue_type', 'S1U', 'business_type');
INSERT INTO "public"."gem_dimension_name_relations" ("dimension_name", "network_interface", "next_level_dimension_name") VALUES ('ue_type', 'S1U', 'detail_business');
INSERT INTO "public"."gem_dimension_name_relations" ("dimension_name", "network_interface", "next_level_dimension_name") VALUES ('business_type', 'S1U', 'detail_business');

INSERT INTO "public"."gem_dimension_name_relations" ("dimension_name", "network_interface", "next_level_dimension_name") VALUES ('whole_network', 'S1U_TOTAL', 'sgw');
INSERT INTO "public"."gem_dimension_name_relations" ("dimension_name", "network_interface", "next_level_dimension_name") VALUES ('whole_network', 'S1U_TOTAL', 'tac');
INSERT INTO "public"."gem_dimension_name_relations" ("dimension_name", "network_interface", "next_level_dimension_name") VALUES ('whole_network', 'S1U_TOTAL', 'enodeb_id');
INSERT INTO "public"."gem_dimension_name_relations" ("dimension_name", "network_interface", "next_level_dimension_name") VALUES ('whole_network', 'S1U_TOTAL', 'cell_id');
INSERT INTO "public"."gem_dimension_name_relations" ("dimension_name", "network_interface", "next_level_dimension_name") VALUES ('whole_network', 'S1U_TOTAL', 'imsi');
INSERT INTO "public"."gem_dimension_name_relations" ("dimension_name", "network_interface", "next_level_dimension_name") VALUES ('whole_network', 'S1U_TOTAL', 'ue_brand');
INSERT INTO "public"."gem_dimension_name_relations" ("dimension_name", "network_interface", "next_level_dimension_name") VALUES ('whole_network', 'S1U_TOTAL', 'ue_type');
INSERT INTO "public"."gem_dimension_name_relations" ("dimension_name", "network_interface", "next_level_dimension_name") VALUES ('whole_network', 'S1U_TOTAL', 'business_type');
INSERT INTO "public"."gem_dimension_name_relations" ("dimension_name", "network_interface", "next_level_dimension_name") VALUES ('whole_network', 'S1U_TOTAL', 'detail_business');
INSERT INTO "public"."gem_dimension_name_relations" ("dimension_name", "network_interface", "next_level_dimension_name") VALUES ('sgw', 'S1U_TOTAL', 'tac');
INSERT INTO "public"."gem_dimension_name_relations" ("dimension_name", "network_interface", "next_level_dimension_name") VALUES ('sgw', 'S1U_TOTAL', 'enodeb_id');
INSERT INTO "public"."gem_dimension_name_relations" ("dimension_name", "network_interface", "next_level_dimension_name") VALUES ('sgw', 'S1U_TOTAL', 'cell_id');
INSERT INTO "public"."gem_dimension_name_relations" ("dimension_name", "network_interface", "next_level_dimension_name") VALUES ('sgw', 'S1U_TOTAL', 'imsi');
INSERT INTO "public"."gem_dimension_name_relations" ("dimension_name", "network_interface", "next_level_dimension_name") VALUES ('sgw', 'S1U_TOTAL', 'ue_brand');
INSERT INTO "public"."gem_dimension_name_relations" ("dimension_name", "network_interface", "next_level_dimension_name") VALUES ('sgw', 'S1U_TOTAL', 'ue_type');
INSERT INTO "public"."gem_dimension_name_relations" ("dimension_name", "network_interface", "next_level_dimension_name") VALUES ('sgw', 'S1U_TOTAL', 'business_type');
INSERT INTO "public"."gem_dimension_name_relations" ("dimension_name", "network_interface", "next_level_dimension_name") VALUES ('sgw', 'S1U_TOTAL', 'detail_business');
INSERT INTO "public"."gem_dimension_name_relations" ("dimension_name", "network_interface", "next_level_dimension_name") VALUES ('tac', 'S1U_TOTAL', 'enodeb_id');
INSERT INTO "public"."gem_dimension_name_relations" ("dimension_name", "network_interface", "next_level_dimension_name") VALUES ('tac', 'S1U_TOTAL', 'cell_id');
INSERT INTO "public"."gem_dimension_name_relations" ("dimension_name", "network_interface", "next_level_dimension_name") VALUES ('tac', 'S1U_TOTAL', 'imsi');
INSERT INTO "public"."gem_dimension_name_relations" ("dimension_name", "network_interface", "next_level_dimension_name") VALUES ('tac', 'S1U_TOTAL', 'ue_brand');
INSERT INTO "public"."gem_dimension_name_relations" ("dimension_name", "network_interface", "next_level_dimension_name") VALUES ('tac', 'S1U_TOTAL', 'ue_type');
INSERT INTO "public"."gem_dimension_name_relations" ("dimension_name", "network_interface", "next_level_dimension_name") VALUES ('tac', 'S1U_TOTAL', 'business_type');
INSERT INTO "public"."gem_dimension_name_relations" ("dimension_name", "network_interface", "next_level_dimension_name") VALUES ('tac', 'S1U_TOTAL', 'detail_business');
INSERT INTO "public"."gem_dimension_name_relations" ("dimension_name", "network_interface", "next_level_dimension_name") VALUES ('enodeb_id', 'S1U_TOTAL', 'cell_id');
INSERT INTO "public"."gem_dimension_name_relations" ("dimension_name", "network_interface", "next_level_dimension_name") VALUES ('enodeb_id', 'S1U_TOTAL', 'imsi');
INSERT INTO "public"."gem_dimension_name_relations" ("dimension_name", "network_interface", "next_level_dimension_name") VALUES ('enodeb_id', 'S1U_TOTAL', 'ue_brand');
INSERT INTO "public"."gem_dimension_name_relations" ("dimension_name", "network_interface", "next_level_dimension_name") VALUES ('enodeb_id', 'S1U_TOTAL', 'ue_type');
INSERT INTO "public"."gem_dimension_name_relations" ("dimension_name", "network_interface", "next_level_dimension_name") VALUES ('enodeb_id', 'S1U_TOTAL', 'business_type');
INSERT INTO "public"."gem_dimension_name_relations" ("dimension_name", "network_interface", "next_level_dimension_name") VALUES ('enodeb_id', 'S1U_TOTAL', 'detail_business');
INSERT INTO "public"."gem_dimension_name_relations" ("dimension_name", "network_interface", "next_level_dimension_name") VALUES ('cell_id', 'S1U_TOTAL', 'imsi');
INSERT INTO "public"."gem_dimension_name_relations" ("dimension_name", "network_interface", "next_level_dimension_name") VALUES ('cell_id', 'S1U_TOTAL', 'ue_brand');
INSERT INTO "public"."gem_dimension_name_relations" ("dimension_name", "network_interface", "next_level_dimension_name") VALUES ('cell_id', 'S1U_TOTAL', 'ue_type');
INSERT INTO "public"."gem_dimension_name_relations" ("dimension_name", "network_interface", "next_level_dimension_name") VALUES ('cell_id', 'S1U_TOTAL', 'business_type');
INSERT INTO "public"."gem_dimension_name_relations" ("dimension_name", "network_interface", "next_level_dimension_name") VALUES ('cell_id', 'S1U_TOTAL', 'detail_business');
INSERT INTO "public"."gem_dimension_name_relations" ("dimension_name", "network_interface", "next_level_dimension_name") VALUES ('imsi', 'S1U_TOTAL', 'ue_brand');
INSERT INTO "public"."gem_dimension_name_relations" ("dimension_name", "network_interface", "next_level_dimension_name") VALUES ('imsi', 'S1U_TOTAL', 'ue_type');
INSERT INTO "public"."gem_dimension_name_relations" ("dimension_name", "network_interface", "next_level_dimension_name") VALUES ('imsi', 'S1U_TOTAL', 'business_type');
INSERT INTO "public"."gem_dimension_name_relations" ("dimension_name", "network_interface", "next_level_dimension_name") VALUES ('imsi', 'S1U_TOTAL', 'detail_business');
INSERT INTO "public"."gem_dimension_name_relations" ("dimension_name", "network_interface", "next_level_dimension_name") VALUES ('ue_brand', 'S1U_TOTAL', 'ue_type');
INSERT INTO "public"."gem_dimension_name_relations" ("dimension_name", "network_interface", "next_level_dimension_name") VALUES ('ue_brand', 'S1U_TOTAL', 'business_type');
INSERT INTO "public"."gem_dimension_name_relations" ("dimension_name", "network_interface", "next_level_dimension_name") VALUES ('ue_brand', 'S1U_TOTAL', 'detail_business');
INSERT INTO "public"."gem_dimension_name_relations" ("dimension_name", "network_interface", "next_level_dimension_name") VALUES ('ue_type', 'S1U_TOTAL', 'business_type');
INSERT INTO "public"."gem_dimension_name_relations" ("dimension_name", "network_interface", "next_level_dimension_name") VALUES ('ue_type', 'S1U_TOTAL', 'detail_business');
INSERT INTO "public"."gem_dimension_name_relations" ("dimension_name", "network_interface", "next_level_dimension_name") VALUES ('business_type', 'S1U_TOTAL', 'detail_business');

/* 4.添加 S1U_DNS  abnormal_reason 数据 */
INSERT INTO "public"."gem_session_failure_causes" ("code", "description", "network_interface", "abnormal_type") VALUES ('1', '请求格式错误(001)', 'S1U_DNS', '2');
INSERT INTO "public"."gem_session_failure_causes" ("code", "description", "network_interface", "abnormal_type") VALUES ('2', '服务器失败(002)', 'S1U_DNS', '2');
INSERT INTO "public"."gem_session_failure_causes" ("code", "description", "network_interface", "abnormal_type") VALUES ('6', '域名存在(006)', 'S1U_DNS', '2');
INSERT INTO "public"."gem_session_failure_causes" ("code", "description", "network_interface", "abnormal_type") VALUES ('4', '相关功能未实现(004)', 'S1U_DNS', '2');
INSERT INTO "public"."gem_session_failure_causes" ("code", "description", "network_interface", "abnormal_type") VALUES ('5', 'DNS请求被拒绝(005)', 'S1U_DNS', '2');
INSERT INTO "public"."gem_session_failure_causes" ("code", "description", "network_interface", "abnormal_type") VALUES ('3', '域名不存在(003)', 'S1U_DNS', '1');
INSERT INTO "public"."gem_session_failure_causes" ("code", "description", "network_interface", "abnormal_type") VALUES ('7', 'RRset存在(007)', 'S1U_DNS', '2');
INSERT INTO "public"."gem_session_failure_causes" ("code", "description", "network_interface", "abnormal_type") VALUES ('8', 'Rrset不存在(008)', 'S1U_DNS', '2');
INSERT INTO "public"."gem_session_failure_causes" ("code", "description", "network_interface", "abnormal_type") VALUES ('9', '无法从主服务器得到数据（009）', 'S1U_DNS', '2');