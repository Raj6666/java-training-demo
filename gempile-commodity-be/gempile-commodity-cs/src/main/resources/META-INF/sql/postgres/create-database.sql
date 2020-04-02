/*
Navicat PGSQL Data Transfer

Source Server         : 192.168.6.97_5432
Source Server Version : 90601
Source Host           : 192.168.6.97:5432
Source Database       : GEMPILE_DATA
Source Schema         : public

Target Server Type    : PGSQL
Target Server Version : 90601
File Encoding         : 65001

Date: 2017-02-24 17:51:42
*/


-- ----------------------------
-- Sequence structure for gem_auto_alert_records_15m_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."gem_auto_alert_records_15m_seq";
CREATE SEQUENCE "public"."gem_auto_alert_records_15m_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;

-- ----------------------------
-- Sequence structure for gem_auto_alert_records_30m_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."gem_auto_alert_records_30m_seq";
CREATE SEQUENCE "public"."gem_auto_alert_records_30m_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;

-- ----------------------------
-- Sequence structure for gem_auto_alert_records_5m_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."gem_auto_alert_records_5m_seq";
CREATE SEQUENCE "public"."gem_auto_alert_records_5m_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;

-- ----------------------------
-- Sequence structure for gem_dimensions_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."gem_dimensions_id_seq";
CREATE SEQUENCE "public"."gem_dimensions_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 105508
 CACHE 1;
SELECT setval('"public"."gem_dimensions_id_seq"', 105508, true);

-- ----------------------------
-- Sequence structure for gem_network_elements_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."gem_network_elements_id_seq";
CREATE SEQUENCE "public"."gem_network_elements_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;

-- ----------------------------
-- Sequence structure for gem_s1_mme_kpi_5m_statistics_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."gem_s1_mme_kpi_5m_statistics_seq";
CREATE SEQUENCE "public"."gem_s1_mme_kpi_5m_statistics_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 8640
 CACHE 1;
SELECT setval('"public"."gem_s1_mme_kpi_5m_statistics_seq"', 8640, true);

-- ----------------------------
-- Sequence structure for gem_s11_kpi_5m_statistics_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."gem_s11_kpi_5m_statistics_seq";
CREATE SEQUENCE "public"."gem_s11_kpi_5m_statistics_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 8640
 CACHE 1;
SELECT setval('"public"."gem_s11_kpi_5m_statistics_seq"', 8640, true);

-- ----------------------------
-- Sequence structure for table_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."table_id_seq";
CREATE SEQUENCE "public"."table_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 490605638
 CACHE 1;
SELECT setval('"public"."table_id_seq"', 490605638, true);


CREATE OR REPLACE FUNCTION "public"."next_id"(OUT "result" int8)
  RETURNS "pg_catalog"."int8" AS $BODY$
DECLARE
    our_epoch bigint := 1314220021721;
    seq_id bigint;
    now_millis bigint;
    shard_id int := 5;
BEGIN
    SELECT nextval('public.table_id_seq') % 1024 INTO seq_id;

    SELECT FLOOR(EXTRACT(EPOCH FROM clock_timestamp()) * 1000) INTO now_millis;
    result := (now_millis - our_epoch) << 23;
    result := result | (shard_id << 10);
    result := result | (seq_id);
END;
$BODY$
  LANGUAGE 'plpgsql' VOLATILE COST 100
;

ALTER FUNCTION "public"."next_id"(OUT "result" int8) OWNER TO "postgres";

-- ----------------------------
-- Table structure for gem_abnormal_reasons
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_abnormal_reasons";
CREATE TABLE "public"."gem_abnormal_reasons" (
"id" varchar COLLATE "default" DEFAULT next_id() NOT NULL,
"abnormal_type_id" varchar COLLATE "default",
"name" varchar COLLATE "default",
"abnormal_reason_code" int4
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."gem_abnormal_reasons" IS '故障原因配置表';

-- ----------------------------
-- Table structure for gem_abnormal_types
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_abnormal_types";
CREATE TABLE "public"."gem_abnormal_types" (
"id" varchar COLLATE "default" DEFAULT next_id() NOT NULL,
"name" varchar COLLATE "default",
"abnormal_type_code" int4,
"network_interface" varchar COLLATE "default"
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."gem_abnormal_types" IS '故障原因类型配置表';

-- ----------------------------
-- Table structure for gem_application_type_mapping
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_application_type_mapping";
CREATE TABLE "public"."gem_application_type_mapping" (
"id" varchar COLLATE "default" DEFAULT next_id() NOT NULL,
"intsid1" varchar COLLATE "default",
"intwruleid" varchar COLLATE "default",
"intaruleid" varchar COLLATE "default",
"service_sub_name" varchar COLLATE "default",
"service_name" varchar COLLATE "default"
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."gem_application_type_mapping" IS '业务映射表';
COMMENT ON COLUMN "public"."gem_application_type_mapping"."intsid1" IS '网站一级业务ID';
COMMENT ON COLUMN "public"."gem_application_type_mapping"."intwruleid" IS '网站识别ID';
COMMENT ON COLUMN "public"."gem_application_type_mapping"."intaruleid" IS 'APP识别ID';
COMMENT ON COLUMN "public"."gem_application_type_mapping"."service_sub_name" IS '应用小类中文名称';
COMMENT ON COLUMN "public"."gem_application_type_mapping"."service_name" IS '应用大类中文名称';

-- ----------------------------
-- Table structure for gem_auto_alert_history_15m_statistics
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_auto_alert_history_15m_statistics";
CREATE TABLE "public"."gem_auto_alert_history_15m_statistics" (
"id" varchar COLLATE "default" DEFAULT next_id() NOT NULL,
"rule_id" varchar COLLATE "default",
"value" numeric,
"statistical_time" timestamp(6),
"created_time" timestamp(6) DEFAULT now()
)
WITH (OIDS=FALSE)

;
COMMENT ON COLUMN "public"."gem_auto_alert_history_15m_statistics"."id" IS '主键Id';
COMMENT ON COLUMN "public"."gem_auto_alert_history_15m_statistics"."rule_id" IS '规则Id';
COMMENT ON COLUMN "public"."gem_auto_alert_history_15m_statistics"."value" IS '统计的值';
COMMENT ON COLUMN "public"."gem_auto_alert_history_15m_statistics"."statistical_time" IS '统计时间';
COMMENT ON COLUMN "public"."gem_auto_alert_history_15m_statistics"."created_time" IS '插入记录的时间';

-- ----------------------------
-- Table structure for gem_auto_alert_history_30m_statistics
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_auto_alert_history_30m_statistics";
CREATE TABLE "public"."gem_auto_alert_history_30m_statistics" (
"id" varchar COLLATE "default" DEFAULT next_id() NOT NULL,
"rule_id" varchar COLLATE "default",
"value" numeric,
"statistical_time" timestamp(6),
"created_time" timestamp(6) DEFAULT now()
)
WITH (OIDS=FALSE)

;
COMMENT ON COLUMN "public"."gem_auto_alert_history_30m_statistics"."id" IS '主键Id';
COMMENT ON COLUMN "public"."gem_auto_alert_history_30m_statistics"."rule_id" IS '规则Id';
COMMENT ON COLUMN "public"."gem_auto_alert_history_30m_statistics"."value" IS '统计的值';
COMMENT ON COLUMN "public"."gem_auto_alert_history_30m_statistics"."statistical_time" IS '统计时间';
COMMENT ON COLUMN "public"."gem_auto_alert_history_30m_statistics"."created_time" IS '插入记录的时间';

-- ----------------------------
-- Table structure for gem_auto_alert_history_5m_statistics
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_auto_alert_history_5m_statistics";
CREATE TABLE "public"."gem_auto_alert_history_5m_statistics" (
"id" varchar COLLATE "default" DEFAULT next_id() NOT NULL,
"rule_id" varchar COLLATE "default",
"value" numeric,
"statistical_time" timestamp(6),
"created_time" timestamp(6) DEFAULT now()
)
WITH (OIDS=FALSE)

;
COMMENT ON COLUMN "public"."gem_auto_alert_history_5m_statistics"."id" IS '主键Id';
COMMENT ON COLUMN "public"."gem_auto_alert_history_5m_statistics"."rule_id" IS '规则Id';
COMMENT ON COLUMN "public"."gem_auto_alert_history_5m_statistics"."value" IS '统计的值';
COMMENT ON COLUMN "public"."gem_auto_alert_history_5m_statistics"."statistical_time" IS '统计时间';
COMMENT ON COLUMN "public"."gem_auto_alert_history_5m_statistics"."created_time" IS '插入记录的时间';

-- ----------------------------
-- Table structure for gem_auto_alert_indicator_dimensions
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_auto_alert_indicator_dimensions";
CREATE TABLE "public"."gem_auto_alert_indicator_dimensions" (
"id" varchar COLLATE "default" DEFAULT next_id() NOT NULL,
"indicator_id" varchar COLLATE "default",
"network_interface" varchar COLLATE "default",
"dimension_name" varchar COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for gem_auto_alert_indicator_rules
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_auto_alert_indicator_rules";
CREATE TABLE "public"."gem_auto_alert_indicator_rules" (
"id" varchar COLLATE "default" DEFAULT next_id() NOT NULL,
"name" varchar COLLATE "default",
"type_id" varchar COLLATE "default",
"parameter" varchar COLLATE "default",
"level1_first_relational_operator" varchar COLLATE "default",
"level1_first_threshold" int4,
"level2_first_relational_operator" varchar COLLATE "default",
"level2_first_threshold" int4,
"level3_first_relational_operator" varchar COLLATE "default",
"level3_first_threshold" int4,
"unit" varchar COLLATE "default",
"network_element_values" text COLLATE "default",
"dimension_name" varchar COLLATE "default",
"network_interface" varchar COLLATE "default",
"modified_time" timestamp(6),
"interval" varchar COLLATE "default",
"active" bool,
"created_time" timestamp(6) DEFAULT now(),
"rule_name" varchar COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for gem_auto_alert_indicators
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_auto_alert_indicators";
CREATE TABLE "public"."gem_auto_alert_indicators" (
"id" varchar COLLATE "default" DEFAULT next_id() NOT NULL,
"name" varchar COLLATE "default",
"parameter" varchar COLLATE "default",
"parent_id" varchar COLLATE "default",
"level" int4,
"network_interface" varchar COLLATE "default",
"unit" varchar COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for gem_auto_alert_records_15m_statistics
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_auto_alert_records_15m_statistics";
CREATE TABLE "public"."gem_auto_alert_records_15m_statistics" (
"id" varchar COLLATE "default" DEFAULT next_id() NOT NULL,
"sequence" varchar COLLATE "default" DEFAULT nextval('gem_auto_alert_records_15m_seq'::regclass) NOT NULL,
"rule_id" varchar COLLATE "default",
"network_element_values" varchar COLLATE "default",
"dimension_name" varchar COLLATE "default",
"network_interface" varchar COLLATE "default",
"triggered_time" timestamp(6),
"modified_time" timestamp(6),
"created_time" timestamp(6) DEFAULT now(),
"alert_level" int4,
"triggered_count" int4,
"active" bool DEFAULT true NOT NULL,
"operation_type" varchar COLLATE "default",
"cancelable" bool DEFAULT true NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for gem_auto_alert_records_30m_statistics
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_auto_alert_records_30m_statistics";
CREATE TABLE "public"."gem_auto_alert_records_30m_statistics" (
"id" varchar COLLATE "default" DEFAULT next_id() NOT NULL,
"sequence" varchar COLLATE "default" DEFAULT nextval('gem_auto_alert_records_30m_seq'::regclass) NOT NULL,
"rule_id" varchar COLLATE "default",
"network_element_values" varchar COLLATE "default",
"dimension_name" varchar COLLATE "default",
"network_interface" varchar COLLATE "default",
"triggered_time" timestamp(6),
"modified_time" timestamp(6),
"created_time" timestamp(6) DEFAULT now(),
"alert_level" int4,
"triggered_count" int4,
"active" bool DEFAULT true NOT NULL,
"operation_type" varchar COLLATE "default",
"cancelable" bool DEFAULT true NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for gem_auto_alert_records_5m_statistics
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_auto_alert_records_5m_statistics";
CREATE TABLE "public"."gem_auto_alert_records_5m_statistics" (
"id" varchar COLLATE "default" DEFAULT next_id() NOT NULL,
"sequence" varchar COLLATE "default" DEFAULT nextval('gem_auto_alert_records_5m_seq'::regclass) NOT NULL,
"rule_id" varchar COLLATE "default",
"network_element_values" varchar COLLATE "default",
"dimension_name" varchar COLLATE "default",
"network_interface" varchar COLLATE "default",
"triggered_time" timestamp(6),
"modified_time" timestamp(6),
"created_time" timestamp(6) DEFAULT now(),
"alert_level" int4,
"triggered_count" int4,
"active" bool DEFAULT true NOT NULL,
"operation_type" varchar COLLATE "default",
"cancelable" bool DEFAULT true NOT NULL
)
WITH (OIDS=FALSE)

;
COMMENT ON COLUMN "public"."gem_auto_alert_records_5m_statistics"."rule_id" IS '规则ID';
COMMENT ON COLUMN "public"."gem_auto_alert_records_5m_statistics"."network_element_values" IS '维度Value';
COMMENT ON COLUMN "public"."gem_auto_alert_records_5m_statistics"."dimension_name" IS '维度名';
COMMENT ON COLUMN "public"."gem_auto_alert_records_5m_statistics"."network_interface" IS '接口';
COMMENT ON COLUMN "public"."gem_auto_alert_records_5m_statistics"."triggered_time" IS '触发时间';
COMMENT ON COLUMN "public"."gem_auto_alert_records_5m_statistics"."modified_time" IS '修改时间';
COMMENT ON COLUMN "public"."gem_auto_alert_records_5m_statistics"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."gem_auto_alert_records_5m_statistics"."alert_level" IS '告警等级,high:1/middle:2/low:3';
COMMENT ON COLUMN "public"."gem_auto_alert_records_5m_statistics"."triggered_count" IS '触发次数';
COMMENT ON COLUMN "public"."gem_auto_alert_records_5m_statistics"."operation_type" IS '自动(1)/手动(2)取消告警';
COMMENT ON COLUMN "public"."gem_auto_alert_records_5m_statistics"."cancelable" IS '是否可撤销';

-- ----------------------------
-- Table structure for gem_dimension
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_dimension";
CREATE TABLE "public"."gem_dimension" (
"name" varchar COLLATE "default" NOT NULL,
"network_interface" varchar(32) COLLATE "default" NOT NULL,
"source_table" varchar COLLATE "default",
"top_level" varchar(8) COLLATE "default",
"value" varchar COLLATE "default",
"level" int4
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."gem_dimension" IS '网络维度类型';
COMMENT ON COLUMN "public"."gem_dimension"."network_interface" IS 'X2,MR,UU';

-- ----------------------------
-- Table structure for gem_dimension_name_relations
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_dimension_name_relations";
CREATE TABLE "public"."gem_dimension_name_relations" (
"id" varchar COLLATE "default" DEFAULT next_id() NOT NULL,
"dimension_name" varchar COLLATE "default",
"network_interface" varchar(32) COLLATE "default",
"next_level_dimension_name" varchar COLLATE "default"
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."gem_dimension_name_relations" IS '网元对应的下级网元表';
COMMENT ON COLUMN "public"."gem_dimension_name_relations"."dimension_name" IS '网元名称';
COMMENT ON COLUMN "public"."gem_dimension_name_relations"."network_interface" IS 'X2,MR,UU';
COMMENT ON COLUMN "public"."gem_dimension_name_relations"."next_level_dimension_name" IS '当前网元的下层网元名称';

-- ----------------------------
-- Table structure for gem_dimension_names_tree
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_dimension_names_tree";
CREATE TABLE "public"."gem_dimension_names_tree" (
"id" varchar COLLATE "default" DEFAULT next_id() NOT NULL,
"name" varchar COLLATE "default" NOT NULL,
"parent_id" varchar COLLATE "default",
"level" int4
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."gem_dimension_names_tree" IS '网络维度类型树结构表';

-- ----------------------------
-- Table structure for gem_dimension_relative_indicators
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_dimension_relative_indicators";
CREATE TABLE "public"."gem_dimension_relative_indicators" (
"id" varchar COLLATE "default" DEFAULT next_id() NOT NULL,
"indicator_id" varchar COLLATE "default",
"network_interface" varchar(32) COLLATE "default",
"dimension" varchar COLLATE "default"
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."gem_dimension_relative_indicators" IS '维度指标中间表';
COMMENT ON COLUMN "public"."gem_dimension_relative_indicators"."indicator_id" IS '指标id';
COMMENT ON COLUMN "public"."gem_dimension_relative_indicators"."network_interface" IS 'X2,MR,UU';
COMMENT ON COLUMN "public"."gem_dimension_relative_indicators"."dimension" IS '维度';

-- ----------------------------
-- Table structure for gem_dimension_to_sub_dimensions
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_dimension_to_sub_dimensions";
CREATE TABLE "public"."gem_dimension_to_sub_dimensions" (
"id" varchar COLLATE "default" DEFAULT next_id() NOT NULL,
"dimension_id" varchar COLLATE "default",
"sub_dimension_ids" varchar COLLATE "default",
"sub_dimension_column_name" varchar COLLATE "default",
"sub_dimension_source_table" varchar COLLATE "default",
"sub_dimension_name" varchar COLLATE "default",
"time_interval" varchar COLLATE "default"
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."gem_dimension_to_sub_dimensions" IS '下钻维度配置表';

-- ----------------------------
-- Table structure for gem_dns_domain_statistics
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_dns_domain_statistics";
CREATE TABLE "public"."gem_dns_domain_statistics" (
"id" varchar COLLATE "default" DEFAULT next_id() NOT NULL,
"domain" varchar COLLATE "default" NOT NULL,
"failure_count" varchar COLLATE "default",
"request_count" varchar COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for gem_dns_ip_statistics
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_dns_ip_statistics";
CREATE TABLE "public"."gem_dns_ip_statistics" (
"id" varchar COLLATE "default" DEFAULT next_id() NOT NULL,
"ip" varchar COLLATE "default" NOT NULL,
"failure_count" varchar COLLATE "default",
"request_count" varchar COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for gem_event_brd_to_fs
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_event_brd_to_fs";
CREATE TABLE "public"."gem_event_brd_to_fs" (
"id" varchar COLLATE "default" DEFAULT next_id() NOT NULL,
"network_interface" varchar(8) COLLATE "default",
"brd_code" varchar(8) COLLATE "default",
"fs_code" varchar(8) COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for gem_event_relative_indicators
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_event_relative_indicators";
CREATE TABLE "public"."gem_event_relative_indicators" (
"id" varchar COLLATE "default" DEFAULT next_id() NOT NULL,
"network_interface" varchar(32) COLLATE "default",
"event_type_code" varchar COLLATE "default",
"indicator_id" varchar COLLATE "default",
"interval" int4,
"dimension" varchar COLLATE "default",
"source_table" varchar COLLATE "default"
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."gem_event_relative_indicators" IS '维度指标与事件类型配置表';

-- ----------------------------
-- Table structure for gem_event_relative_indicators_for_division
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_event_relative_indicators_for_division";
CREATE TABLE "public"."gem_event_relative_indicators_for_division" (
"id" varchar COLLATE "default" DEFAULT next_id() NOT NULL,
"event_code" varchar COLLATE "default",
"network_interface" varchar COLLATE "default",
"ind_divisor" varchar COLLATE "default",
"ind_dividend" varchar COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for gem_event_statistics_indicators
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_event_statistics_indicators";
CREATE TABLE "public"."gem_event_statistics_indicators" (
"id" varchar COLLATE "default" DEFAULT next_id() NOT NULL,
"name" varchar COLLATE "default",
"value" varchar COLLATE "default",
"level" varchar COLLATE "default",
"parent_id" varchar COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for gem_event_types
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_event_types";
CREATE TABLE "public"."gem_event_types" (
"id" varchar COLLATE "default" DEFAULT next_id() NOT NULL,
"name" varchar COLLATE "default",
"event_code" varchar COLLATE "default",
"network_interface" varchar(32) COLLATE "default",
"dimension_id" varchar COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for gem_failure_dimension_name_relations
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_failure_dimension_name_relations";
CREATE TABLE "public"."gem_failure_dimension_name_relations" (
"id" varchar COLLATE "default" DEFAULT next_id() NOT NULL,
"dimension_name" varchar COLLATE "default",
"network_interface" varchar(32) COLLATE "default",
"next_level_dimension_name" varchar COLLATE "default",
"next_level_dimension_column" varchar COLLATE "default",
"next_level_dimension_name_index" varchar COLLATE "default",
"next_level_dimension_name_type" varchar COLLATE "default"
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."gem_failure_dimension_name_relations" IS '网元对应的下级网元表';
COMMENT ON COLUMN "public"."gem_failure_dimension_name_relations"."dimension_name" IS '网元名称';
COMMENT ON COLUMN "public"."gem_failure_dimension_name_relations"."network_interface" IS 'X2,MR,UU';
COMMENT ON COLUMN "public"."gem_failure_dimension_name_relations"."next_level_dimension_name" IS '当前网元的下层网元名称';
COMMENT ON COLUMN "public"."gem_failure_dimension_name_relations"."next_level_dimension_column" IS '当前网元的下层网元column';
COMMENT ON COLUMN "public"."gem_failure_dimension_name_relations"."next_level_dimension_name_index" IS '第几个下钻维度';
COMMENT ON COLUMN "public"."gem_failure_dimension_name_relations"."next_level_dimension_name_type" IS '下层网元的值的类型';

-- ----------------------------
-- Table structure for gem_http_status_codes
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_http_status_codes";
CREATE TABLE "public"."gem_http_status_codes" (
"http_status_code" varchar(4) COLLATE "default" NOT NULL,
"comment" varchar COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for gem_indicators
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_indicators";
CREATE TABLE "public"."gem_indicators" (
"id" varchar COLLATE "default" DEFAULT next_id() NOT NULL,
"name" varchar COLLATE "default",
"network_interface" varchar(32) COLLATE "default",
"parent_id" varchar COLLATE "default",
"level" int4,
"description" varchar COLLATE "default",
"has_next_level" varchar COLLATE "default",
"factor" text COLLATE "default",
"parameter" varchar COLLATE "default"
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."gem_indicators" IS '网络指标';
COMMENT ON COLUMN "public"."gem_indicators"."network_interface" IS '1:X2,2:MR,3:UU';
COMMENT ON COLUMN "public"."gem_indicators"."parent_id" IS '上层指标id';
COMMENT ON COLUMN "public"."gem_indicators"."level" IS '当前指标等级';
COMMENT ON COLUMN "public"."gem_indicators"."has_next_level" IS '是否有下层维度(Y/N)';
COMMENT ON COLUMN "public"."gem_indicators"."factor" IS '指标因素,对应类';
COMMENT ON COLUMN "public"."gem_indicators"."parameter" IS '指标参数';

-- ----------------------------
-- Table structure for gem_interface_interval_tables
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_interface_interval_tables";
CREATE TABLE "public"."gem_interface_interval_tables" (
"id" varchar COLLATE "default" DEFAULT next_id() NOT NULL,
"network_interface" varchar COLLATE "default",
"interval" int4,
"table_name" varchar COLLATE "default",
"scope" varchar COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for gem_mr_distinct_kpi_1d_statistics_by_tac
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_mr_distinct_kpi_1d_statistics_by_tac";
CREATE TABLE "public"."gem_mr_distinct_kpi_1d_statistics_by_tac" (
"id" varchar COLLATE "default" DEFAULT next_id() NOT NULL,
"statistical_time" timestamp(6),
"whole_network" varchar COLLATE "default",
"tac" varchar COLLATE "default",
"weak_rsrp_cover_imsi" int8,
"imsi_count" int8,
"weak_rsrq_imsi" int8,
"high_phr_imsi" int8,
"created_time" timestamp(6) DEFAULT now() NOT NULL
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."gem_mr_distinct_kpi_1d_statistics_by_tac" IS 'MR_KPI接口查询表';
COMMENT ON COLUMN "public"."gem_mr_distinct_kpi_1d_statistics_by_tac"."statistical_time" IS '时间';
COMMENT ON COLUMN "public"."gem_mr_distinct_kpi_1d_statistics_by_tac"."whole_network" IS '全网维度';
COMMENT ON COLUMN "public"."gem_mr_distinct_kpi_1d_statistics_by_tac"."tac" IS 'TAC维度';
COMMENT ON COLUMN "public"."gem_mr_distinct_kpi_1d_statistics_by_tac"."weak_rsrp_cover_imsi" IS '弱覆盖用户数';
COMMENT ON COLUMN "public"."gem_mr_distinct_kpi_1d_statistics_by_tac"."imsi_count" IS '驻留总用户';
COMMENT ON COLUMN "public"."gem_mr_distinct_kpi_1d_statistics_by_tac"."weak_rsrq_imsi" IS '下行RSRQ质差用户数';
COMMENT ON COLUMN "public"."gem_mr_distinct_kpi_1d_statistics_by_tac"."high_phr_imsi" IS '高发射功率用户数';

-- ----------------------------
-- Table structure for gem_mr_distinct_kpi_1d_statistics_by_te
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_mr_distinct_kpi_1d_statistics_by_te";
CREATE TABLE "public"."gem_mr_distinct_kpi_1d_statistics_by_te" (
"id" varchar COLLATE "default" DEFAULT next_id() NOT NULL,
"statistical_time" timestamp(6),
"whole_network" varchar COLLATE "default",
"tac" varchar COLLATE "default",
"enodeb_id" varchar COLLATE "default",
"weak_rsrp_cover_imsi" int8,
"imsi_count" int8,
"weak_rsrq_imsi" int8,
"high_phr_imsi" int8,
"created_time" timestamp(6) DEFAULT now() NOT NULL
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."gem_mr_distinct_kpi_1d_statistics_by_te" IS 'MR_KPI接口查询表';
COMMENT ON COLUMN "public"."gem_mr_distinct_kpi_1d_statistics_by_te"."statistical_time" IS '时间';
COMMENT ON COLUMN "public"."gem_mr_distinct_kpi_1d_statistics_by_te"."whole_network" IS '全网维度';
COMMENT ON COLUMN "public"."gem_mr_distinct_kpi_1d_statistics_by_te"."tac" IS 'TAC维度';
COMMENT ON COLUMN "public"."gem_mr_distinct_kpi_1d_statistics_by_te"."weak_rsrp_cover_imsi" IS '弱覆盖用户数';
COMMENT ON COLUMN "public"."gem_mr_distinct_kpi_1d_statistics_by_te"."imsi_count" IS '驻留总用户';
COMMENT ON COLUMN "public"."gem_mr_distinct_kpi_1d_statistics_by_te"."weak_rsrq_imsi" IS '下行RSRQ质差用户数';
COMMENT ON COLUMN "public"."gem_mr_distinct_kpi_1d_statistics_by_te"."high_phr_imsi" IS '高发射功率用户数';

-- ----------------------------
-- Table structure for gem_mr_distinct_kpi_1d_statistics_by_tec
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_mr_distinct_kpi_1d_statistics_by_tec";
CREATE TABLE "public"."gem_mr_distinct_kpi_1d_statistics_by_tec" (
"id" varchar COLLATE "default" DEFAULT next_id() NOT NULL,
"statistical_time" timestamp(6),
"whole_network" varchar COLLATE "default",
"tac" varchar COLLATE "default",
"enodeb_id" varchar COLLATE "default",
"cell_id" varchar COLLATE "default",
"weak_rsrp_cover_imsi" int8,
"imsi_count" int8,
"weak_rsrq_imsi" int8,
"high_phr_imsi" int8,
"created_time" timestamp(6) DEFAULT now() NOT NULL
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."gem_mr_distinct_kpi_1d_statistics_by_tec" IS 'MR_KPI接口查询表';
COMMENT ON COLUMN "public"."gem_mr_distinct_kpi_1d_statistics_by_tec"."statistical_time" IS '时间';
COMMENT ON COLUMN "public"."gem_mr_distinct_kpi_1d_statistics_by_tec"."whole_network" IS '全网维度';
COMMENT ON COLUMN "public"."gem_mr_distinct_kpi_1d_statistics_by_tec"."tac" IS 'TAC维度';
COMMENT ON COLUMN "public"."gem_mr_distinct_kpi_1d_statistics_by_tec"."weak_rsrp_cover_imsi" IS '弱覆盖用户数';
COMMENT ON COLUMN "public"."gem_mr_distinct_kpi_1d_statistics_by_tec"."imsi_count" IS '驻留总用户';
COMMENT ON COLUMN "public"."gem_mr_distinct_kpi_1d_statistics_by_tec"."weak_rsrq_imsi" IS '下行RSRQ质差用户数';
COMMENT ON COLUMN "public"."gem_mr_distinct_kpi_1d_statistics_by_tec"."high_phr_imsi" IS '高发射功率用户数';

-- ----------------------------
-- Table structure for gem_mr_distinct_kpi_1d_statistics_by_ue_type
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_mr_distinct_kpi_1d_statistics_by_ue_type";
CREATE TABLE "public"."gem_mr_distinct_kpi_1d_statistics_by_ue_type" (
"id" varchar COLLATE "default" DEFAULT next_id() NOT NULL,
"statistical_time" timestamp(6),
"whole_network" varchar COLLATE "default",
"tac" varchar COLLATE "default",
"enodeb_id" varchar COLLATE "default",
"cell_id" varchar COLLATE "default",
"ue_brand" varchar COLLATE "default",
"ue_type" varchar(32) COLLATE "default",
"weak_rsrp_cover_imsi" int8,
"imsi_count" int8,
"weak_rsrq_imsi" int8,
"high_phr_imsi" int8,
"created_time" timestamp(6) DEFAULT now() NOT NULL
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."gem_mr_distinct_kpi_1d_statistics_by_ue_type" IS 'MR_KPI接口查询表';
COMMENT ON COLUMN "public"."gem_mr_distinct_kpi_1d_statistics_by_ue_type"."statistical_time" IS '时间';
COMMENT ON COLUMN "public"."gem_mr_distinct_kpi_1d_statistics_by_ue_type"."whole_network" IS '全网维度';
COMMENT ON COLUMN "public"."gem_mr_distinct_kpi_1d_statistics_by_ue_type"."tac" IS 'TAC维度';
COMMENT ON COLUMN "public"."gem_mr_distinct_kpi_1d_statistics_by_ue_type"."weak_rsrp_cover_imsi" IS '弱覆盖用户数';
COMMENT ON COLUMN "public"."gem_mr_distinct_kpi_1d_statistics_by_ue_type"."imsi_count" IS '驻留总用户';
COMMENT ON COLUMN "public"."gem_mr_distinct_kpi_1d_statistics_by_ue_type"."weak_rsrq_imsi" IS '下行RSRQ质差用户数';
COMMENT ON COLUMN "public"."gem_mr_distinct_kpi_1d_statistics_by_ue_type"."high_phr_imsi" IS '高发射功率用户数';

-- ----------------------------
-- Table structure for gem_mr_distinct_kpi_1h_statistics_by_tac
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_mr_distinct_kpi_1h_statistics_by_tac";
CREATE TABLE "public"."gem_mr_distinct_kpi_1h_statistics_by_tac" (
"id" varchar COLLATE "default" DEFAULT next_id() NOT NULL,
"statistical_time" timestamp(6),
"whole_network" varchar COLLATE "default",
"tac" varchar COLLATE "default",
"weak_rsrp_cover_imsi" int8,
"imsi_count" int8,
"weak_rsrq_imsi" int8,
"high_phr_imsi" int8,
"created_time" timestamp(6) DEFAULT now() NOT NULL
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."gem_mr_distinct_kpi_1h_statistics_by_tac" IS 'MR_KPI接口查询表';
COMMENT ON COLUMN "public"."gem_mr_distinct_kpi_1h_statistics_by_tac"."statistical_time" IS '时间';
COMMENT ON COLUMN "public"."gem_mr_distinct_kpi_1h_statistics_by_tac"."whole_network" IS '全网维度';
COMMENT ON COLUMN "public"."gem_mr_distinct_kpi_1h_statistics_by_tac"."tac" IS 'TAC维度';
COMMENT ON COLUMN "public"."gem_mr_distinct_kpi_1h_statistics_by_tac"."weak_rsrp_cover_imsi" IS '弱覆盖用户数';
COMMENT ON COLUMN "public"."gem_mr_distinct_kpi_1h_statistics_by_tac"."imsi_count" IS '驻留总用户';
COMMENT ON COLUMN "public"."gem_mr_distinct_kpi_1h_statistics_by_tac"."weak_rsrq_imsi" IS '下行RSRQ质差用户数';
COMMENT ON COLUMN "public"."gem_mr_distinct_kpi_1h_statistics_by_tac"."high_phr_imsi" IS '高发射功率用户数';

-- ----------------------------
-- Table structure for gem_mr_distinct_kpi_1h_statistics_by_te
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_mr_distinct_kpi_1h_statistics_by_te";
CREATE TABLE "public"."gem_mr_distinct_kpi_1h_statistics_by_te" (
"id" varchar COLLATE "default" DEFAULT next_id() NOT NULL,
"statistical_time" timestamp(6),
"whole_network" varchar COLLATE "default",
"tac" varchar COLLATE "default",
"enodeb_id" varchar COLLATE "default",
"weak_rsrp_cover_imsi" int8,
"imsi_count" int8,
"weak_rsrq_imsi" int8,
"high_phr_imsi" int8,
"created_time" timestamp(6) DEFAULT now() NOT NULL
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."gem_mr_distinct_kpi_1h_statistics_by_te" IS 'MR_KPI接口查询表';
COMMENT ON COLUMN "public"."gem_mr_distinct_kpi_1h_statistics_by_te"."statistical_time" IS '时间';
COMMENT ON COLUMN "public"."gem_mr_distinct_kpi_1h_statistics_by_te"."whole_network" IS '全网维度';
COMMENT ON COLUMN "public"."gem_mr_distinct_kpi_1h_statistics_by_te"."tac" IS 'TAC维度';
COMMENT ON COLUMN "public"."gem_mr_distinct_kpi_1h_statistics_by_te"."weak_rsrp_cover_imsi" IS '弱覆盖用户数';
COMMENT ON COLUMN "public"."gem_mr_distinct_kpi_1h_statistics_by_te"."imsi_count" IS '驻留总用户';
COMMENT ON COLUMN "public"."gem_mr_distinct_kpi_1h_statistics_by_te"."weak_rsrq_imsi" IS '下行RSRQ质差用户数';
COMMENT ON COLUMN "public"."gem_mr_distinct_kpi_1h_statistics_by_te"."high_phr_imsi" IS '高发射功率用户数';

-- ----------------------------
-- Table structure for gem_mr_distinct_kpi_1h_statistics_by_tec
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_mr_distinct_kpi_1h_statistics_by_tec";
CREATE TABLE "public"."gem_mr_distinct_kpi_1h_statistics_by_tec" (
"id" varchar COLLATE "default" DEFAULT next_id() NOT NULL,
"statistical_time" timestamp(6),
"whole_network" varchar COLLATE "default",
"tac" varchar COLLATE "default",
"enodeb_id" varchar COLLATE "default",
"cell_id" varchar COLLATE "default",
"weak_rsrp_cover_imsi" int8,
"imsi_count" int8,
"weak_rsrq_imsi" int8,
"high_phr_imsi" int8,
"created_time" timestamp(6) DEFAULT now() NOT NULL
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."gem_mr_distinct_kpi_1h_statistics_by_tec" IS 'MR_KPI接口查询表';
COMMENT ON COLUMN "public"."gem_mr_distinct_kpi_1h_statistics_by_tec"."statistical_time" IS '时间';
COMMENT ON COLUMN "public"."gem_mr_distinct_kpi_1h_statistics_by_tec"."whole_network" IS '全网维度';
COMMENT ON COLUMN "public"."gem_mr_distinct_kpi_1h_statistics_by_tec"."tac" IS 'TAC维度';
COMMENT ON COLUMN "public"."gem_mr_distinct_kpi_1h_statistics_by_tec"."weak_rsrp_cover_imsi" IS '弱覆盖用户数';
COMMENT ON COLUMN "public"."gem_mr_distinct_kpi_1h_statistics_by_tec"."imsi_count" IS '驻留总用户';
COMMENT ON COLUMN "public"."gem_mr_distinct_kpi_1h_statistics_by_tec"."weak_rsrq_imsi" IS '下行RSRQ质差用户数';
COMMENT ON COLUMN "public"."gem_mr_distinct_kpi_1h_statistics_by_tec"."high_phr_imsi" IS '高发射功率用户数';

-- ----------------------------
-- Table structure for gem_mr_distinct_kpi_1h_statistics_by_ue_type
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_mr_distinct_kpi_1h_statistics_by_ue_type";
CREATE TABLE "public"."gem_mr_distinct_kpi_1h_statistics_by_ue_type" (
"id" varchar COLLATE "default" DEFAULT next_id() NOT NULL,
"statistical_time" timestamp(6),
"whole_network" varchar COLLATE "default",
"tac" varchar COLLATE "default",
"enodeb_id" varchar COLLATE "default",
"cell_id" varchar COLLATE "default",
"ue_brand" varchar COLLATE "default",
"ue_type" varchar(32) COLLATE "default",
"weak_rsrp_cover_imsi" int8,
"imsi_count" int8,
"weak_rsrq_imsi" int8,
"high_phr_imsi" int8,
"created_time" timestamp(6) DEFAULT now() NOT NULL
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."gem_mr_distinct_kpi_1h_statistics_by_ue_type" IS 'MR_KPI接口查询表';
COMMENT ON COLUMN "public"."gem_mr_distinct_kpi_1h_statistics_by_ue_type"."statistical_time" IS '时间';
COMMENT ON COLUMN "public"."gem_mr_distinct_kpi_1h_statistics_by_ue_type"."whole_network" IS '全网维度';
COMMENT ON COLUMN "public"."gem_mr_distinct_kpi_1h_statistics_by_ue_type"."tac" IS 'TAC维度';
COMMENT ON COLUMN "public"."gem_mr_distinct_kpi_1h_statistics_by_ue_type"."weak_rsrp_cover_imsi" IS '弱覆盖用户数';
COMMENT ON COLUMN "public"."gem_mr_distinct_kpi_1h_statistics_by_ue_type"."imsi_count" IS '驻留总用户';
COMMENT ON COLUMN "public"."gem_mr_distinct_kpi_1h_statistics_by_ue_type"."weak_rsrq_imsi" IS '下行RSRQ质差用户数';
COMMENT ON COLUMN "public"."gem_mr_distinct_kpi_1h_statistics_by_ue_type"."high_phr_imsi" IS '高发射功率用户数';

-- ----------------------------
-- Table structure for gem_mr_distinct_kpi_5m_statistics_by_tac
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_mr_distinct_kpi_5m_statistics_by_tac";
CREATE TABLE "public"."gem_mr_distinct_kpi_5m_statistics_by_tac" (
"id" varchar COLLATE "default" DEFAULT next_id() NOT NULL,
"statistical_time" timestamp(6),
"whole_network" varchar COLLATE "default",
"tac" varchar COLLATE "default",
"weak_rsrp_cover_imsi" int8,
"imsi_count" int8,
"weak_rsrq_imsi" int8,
"high_phr_imsi" int8,
"created_time" timestamp(6) DEFAULT now() NOT NULL
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."gem_mr_distinct_kpi_5m_statistics_by_tac" IS 'MR_KPI接口查询表';
COMMENT ON COLUMN "public"."gem_mr_distinct_kpi_5m_statistics_by_tac"."statistical_time" IS '时间';
COMMENT ON COLUMN "public"."gem_mr_distinct_kpi_5m_statistics_by_tac"."whole_network" IS '全网维度';
COMMENT ON COLUMN "public"."gem_mr_distinct_kpi_5m_statistics_by_tac"."tac" IS 'TAC维度';
COMMENT ON COLUMN "public"."gem_mr_distinct_kpi_5m_statistics_by_tac"."weak_rsrp_cover_imsi" IS '弱覆盖用户数';
COMMENT ON COLUMN "public"."gem_mr_distinct_kpi_5m_statistics_by_tac"."imsi_count" IS '驻留总用户';
COMMENT ON COLUMN "public"."gem_mr_distinct_kpi_5m_statistics_by_tac"."weak_rsrq_imsi" IS '下行RSRQ质差用户数';
COMMENT ON COLUMN "public"."gem_mr_distinct_kpi_5m_statistics_by_tac"."high_phr_imsi" IS '高发射功率用户数';

-- ----------------------------
-- Table structure for gem_mr_distinct_kpi_5m_statistics_by_te
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_mr_distinct_kpi_5m_statistics_by_te";
CREATE TABLE "public"."gem_mr_distinct_kpi_5m_statistics_by_te" (
"id" varchar COLLATE "default" DEFAULT next_id() NOT NULL,
"statistical_time" timestamp(6),
"whole_network" varchar COLLATE "default",
"tac" varchar COLLATE "default",
"enodeb_id" varchar COLLATE "default",
"weak_rsrp_cover_imsi" int8,
"imsi_count" int8,
"weak_rsrq_imsi" int8,
"high_phr_imsi" int8,
"created_time" timestamp(6) DEFAULT now() NOT NULL
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."gem_mr_distinct_kpi_5m_statistics_by_te" IS 'MR_KPI接口查询表';
COMMENT ON COLUMN "public"."gem_mr_distinct_kpi_5m_statistics_by_te"."statistical_time" IS '时间';
COMMENT ON COLUMN "public"."gem_mr_distinct_kpi_5m_statistics_by_te"."whole_network" IS '全网维度';
COMMENT ON COLUMN "public"."gem_mr_distinct_kpi_5m_statistics_by_te"."tac" IS 'TAC维度';
COMMENT ON COLUMN "public"."gem_mr_distinct_kpi_5m_statistics_by_te"."weak_rsrp_cover_imsi" IS '弱覆盖用户数';
COMMENT ON COLUMN "public"."gem_mr_distinct_kpi_5m_statistics_by_te"."imsi_count" IS '驻留总用户';
COMMENT ON COLUMN "public"."gem_mr_distinct_kpi_5m_statistics_by_te"."weak_rsrq_imsi" IS '下行RSRQ质差用户数';
COMMENT ON COLUMN "public"."gem_mr_distinct_kpi_5m_statistics_by_te"."high_phr_imsi" IS '高发射功率用户数';

-- ----------------------------
-- Table structure for gem_mr_distinct_kpi_5m_statistics_by_tec
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_mr_distinct_kpi_5m_statistics_by_tec";
CREATE TABLE "public"."gem_mr_distinct_kpi_5m_statistics_by_tec" (
"id" varchar COLLATE "default" DEFAULT next_id() NOT NULL,
"statistical_time" timestamp(6),
"whole_network" varchar COLLATE "default",
"tac" varchar COLLATE "default",
"enodeb_id" varchar COLLATE "default",
"cell_id" varchar COLLATE "default",
"weak_rsrp_cover_imsi" int8,
"imsi_count" int8,
"weak_rsrq_imsi" int8,
"high_phr_imsi" int8,
"created_time" timestamp(6) DEFAULT now() NOT NULL
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."gem_mr_distinct_kpi_5m_statistics_by_tec" IS 'MR_KPI接口查询表';
COMMENT ON COLUMN "public"."gem_mr_distinct_kpi_5m_statistics_by_tec"."statistical_time" IS '时间';
COMMENT ON COLUMN "public"."gem_mr_distinct_kpi_5m_statistics_by_tec"."whole_network" IS '全网维度';
COMMENT ON COLUMN "public"."gem_mr_distinct_kpi_5m_statistics_by_tec"."tac" IS 'TAC维度';
COMMENT ON COLUMN "public"."gem_mr_distinct_kpi_5m_statistics_by_tec"."weak_rsrp_cover_imsi" IS '弱覆盖用户数';
COMMENT ON COLUMN "public"."gem_mr_distinct_kpi_5m_statistics_by_tec"."imsi_count" IS '驻留总用户';
COMMENT ON COLUMN "public"."gem_mr_distinct_kpi_5m_statistics_by_tec"."weak_rsrq_imsi" IS '下行RSRQ质差用户数';
COMMENT ON COLUMN "public"."gem_mr_distinct_kpi_5m_statistics_by_tec"."high_phr_imsi" IS '高发射功率用户数';

-- ----------------------------
-- Table structure for gem_mr_distinct_kpi_5m_statistics_by_ue_type
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_mr_distinct_kpi_5m_statistics_by_ue_type";
CREATE TABLE "public"."gem_mr_distinct_kpi_5m_statistics_by_ue_type" (
"id" varchar COLLATE "default" DEFAULT next_id() NOT NULL,
"statistical_time" timestamp(6),
"whole_network" varchar COLLATE "default",
"tac" varchar COLLATE "default",
"enodeb_id" varchar COLLATE "default",
"cell_id" varchar COLLATE "default",
"ue_brand" varchar COLLATE "default",
"ue_type" varchar(32) COLLATE "default",
"weak_rsrp_cover_imsi" int8,
"imsi_count" int8,
"weak_rsrq_imsi" int8,
"high_phr_imsi" int8,
"created_time" timestamp(6) DEFAULT now() NOT NULL
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."gem_mr_distinct_kpi_5m_statistics_by_ue_type" IS 'MR_KPI接口查询表';
COMMENT ON COLUMN "public"."gem_mr_distinct_kpi_5m_statistics_by_ue_type"."statistical_time" IS '时间';
COMMENT ON COLUMN "public"."gem_mr_distinct_kpi_5m_statistics_by_ue_type"."whole_network" IS '全网维度';
COMMENT ON COLUMN "public"."gem_mr_distinct_kpi_5m_statistics_by_ue_type"."tac" IS 'TAC维度';
COMMENT ON COLUMN "public"."gem_mr_distinct_kpi_5m_statistics_by_ue_type"."weak_rsrp_cover_imsi" IS '弱覆盖用户数';
COMMENT ON COLUMN "public"."gem_mr_distinct_kpi_5m_statistics_by_ue_type"."imsi_count" IS '驻留总用户';
COMMENT ON COLUMN "public"."gem_mr_distinct_kpi_5m_statistics_by_ue_type"."weak_rsrq_imsi" IS '下行RSRQ质差用户数';
COMMENT ON COLUMN "public"."gem_mr_distinct_kpi_5m_statistics_by_ue_type"."high_phr_imsi" IS '高发射功率用户数';

-- ----------------------------
-- Table structure for gem_mr_kpi_1d_statistics
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_mr_kpi_1d_statistics";
CREATE TABLE "public"."gem_mr_kpi_1d_statistics" (
"id" varchar COLLATE "default" DEFAULT next_id() NOT NULL,
"statistical_time" timestamp(6),
"whole_network" varchar COLLATE "default",
"tac" varchar COLLATE "default",
"enodeb_id" varchar COLLATE "default",
"cell_id" varchar COLLATE "default",
"ue_brand" varchar COLLATE "default",
"ue_type" varchar COLLATE "default",
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
"created_time" timestamp(6) DEFAULT now(),
"weak_rsrq_user_rate" int8
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."gem_mr_kpi_1d_statistics" IS 'MR_KPI接口查询表';
COMMENT ON COLUMN "public"."gem_mr_kpi_1d_statistics"."statistical_time" IS '时间';
COMMENT ON COLUMN "public"."gem_mr_kpi_1d_statistics"."whole_network" IS '全网维度';
COMMENT ON COLUMN "public"."gem_mr_kpi_1d_statistics"."ue_brand" IS '终端品牌维度';
COMMENT ON COLUMN "public"."gem_mr_kpi_1d_statistics"."mr_report_count" IS 'MR采样点总数';
COMMENT ON COLUMN "public"."gem_mr_kpi_1d_statistics"."serving_rsrp_count" IS '参考信号接收功率Count';
COMMENT ON COLUMN "public"."gem_mr_kpi_1d_statistics"."serving_rsrp_sum" IS '参考信号接收功率Sum';
COMMENT ON COLUMN "public"."gem_mr_kpi_1d_statistics"."serving_rsrq_count" IS '参考信号接收质量Count';
COMMENT ON COLUMN "public"."gem_mr_kpi_1d_statistics"."serving_rsrq_sum" IS '参考信号接收质量Sum';
COMMENT ON COLUMN "public"."gem_mr_kpi_1d_statistics"."ta_count" IS '时间提前量COUNT';
COMMENT ON COLUMN "public"."gem_mr_kpi_1d_statistics"."ta_sum" IS '时间提前量SUM';
COMMENT ON COLUMN "public"."gem_mr_kpi_1d_statistics"."enodeb_received_interfere_count" IS 'eNB接收干扰功率Count';
COMMENT ON COLUMN "public"."gem_mr_kpi_1d_statistics"."enodeb_received_interfere_sum" IS 'eNB接收干扰功率Sum';
COMMENT ON COLUMN "public"."gem_mr_kpi_1d_statistics"."ul_interfere_rate_count" IS '上行干扰强度Count';
COMMENT ON COLUMN "public"."gem_mr_kpi_1d_statistics"."ul_interfere_rate_sum" IS '上行干扰强度Sum';
COMMENT ON COLUMN "public"."gem_mr_kpi_1d_statistics"."aoa_count" IS 'eNB天线到达角Count';
COMMENT ON COLUMN "public"."gem_mr_kpi_1d_statistics"."aoa_sum" IS 'eNB天线到达角Sum';
COMMENT ON COLUMN "public"."gem_mr_kpi_1d_statistics"."phr_count" IS 'UE发射功率余量Count';
COMMENT ON COLUMN "public"."gem_mr_kpi_1d_statistics"."phr_sum" IS 'UE发射功率余量Sum';
COMMENT ON COLUMN "public"."gem_mr_kpi_1d_statistics"."ul_sinr_count" IS '上行信噪比Count';
COMMENT ON COLUMN "public"."gem_mr_kpi_1d_statistics"."ul_sinr_sum" IS '上行信噪比Sum';
COMMENT ON COLUMN "public"."gem_mr_kpi_1d_statistics"."enodeb_received_power_count" IS '基站接收功率Count';
COMMENT ON COLUMN "public"."gem_mr_kpi_1d_statistics"."enodeb_received_power_sum" IS '基站接收功率Sum';
COMMENT ON COLUMN "public"."gem_mr_kpi_1d_statistics"."weak_serving_rsrp_count" IS '弱覆盖采样点数';
COMMENT ON COLUMN "public"."gem_mr_kpi_1d_statistics"."good_serving_rsrp_count" IS '良好覆盖采样点数';
COMMENT ON COLUMN "public"."gem_mr_kpi_1d_statistics"."weak_rsrp_cover_imsi" IS '弱覆盖用户数';
COMMENT ON COLUMN "public"."gem_mr_kpi_1d_statistics"."imsi_count" IS '驻留总用户';
COMMENT ON COLUMN "public"."gem_mr_kpi_1d_statistics"."weak_serving_rsrq_count" IS '下行参考信号接收质差采样点数';
COMMENT ON COLUMN "public"."gem_mr_kpi_1d_statistics"."weak_rsrq_imsi" IS '下行RSRQ质差用户数';
COMMENT ON COLUMN "public"."gem_mr_kpi_1d_statistics"."high_phr_count" IS 'UE高发射功率采样点数';
COMMENT ON COLUMN "public"."gem_mr_kpi_1d_statistics"."high_phr_imsi" IS '高发射功率用户数';
COMMENT ON COLUMN "public"."gem_mr_kpi_1d_statistics"."satisfied_coverage_rsrp_count" IS '满足覆盖采样点数 ';
COMMENT ON COLUMN "public"."gem_mr_kpi_1d_statistics"."overlapping_coverage_count" IS '重叠覆盖采样点数';
COMMENT ON COLUMN "public"."gem_mr_kpi_1d_statistics"."edge_weak_coverage_count" IS '边缘弱覆盖采样点数';
COMMENT ON COLUMN "public"."gem_mr_kpi_1d_statistics"."edge_coverage_count" IS '边缘采样点数';
COMMENT ON COLUMN "public"."gem_mr_kpi_1d_statistics"."mode_3_interfere_rsrp_count" IS '模三干扰采样点数';
COMMENT ON COLUMN "public"."gem_mr_kpi_1d_statistics"."mode_3_neighbor_cell_measure_count" IS '邻区测量采样点数';
COMMENT ON COLUMN "public"."gem_mr_kpi_1d_statistics"."neighbor_cell_over_coverage_count" IS '邻区过覆盖采样点数';

-- ----------------------------
-- Table structure for gem_mr_kpi_1d_statistics_by_imsi
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_mr_kpi_1d_statistics_by_imsi";
CREATE TABLE "public"."gem_mr_kpi_1d_statistics_by_imsi" (
"id" varchar COLLATE "default" DEFAULT next_id() NOT NULL,
"statistical_time" timestamp(6),
"imsi" varchar COLLATE "default",
"enodeb_id" varchar COLLATE "default",
"cell_id" varchar COLLATE "default",
"ue_type" varchar COLLATE "default",
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
"created_time" timestamp(6) DEFAULT now(),
"weak_rsrq_user_rate" int8
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."gem_mr_kpi_1d_statistics_by_imsi" IS 'MR_KPI接口查询表';
COMMENT ON COLUMN "public"."gem_mr_kpi_1d_statistics_by_imsi"."statistical_time" IS '时间';
COMMENT ON COLUMN "public"."gem_mr_kpi_1d_statistics_by_imsi"."imsi" IS '用户维度';
COMMENT ON COLUMN "public"."gem_mr_kpi_1d_statistics_by_imsi"."mr_report_count" IS 'MR采样点总数';
COMMENT ON COLUMN "public"."gem_mr_kpi_1d_statistics_by_imsi"."serving_rsrp_count" IS '参考信号接收功率Count';
COMMENT ON COLUMN "public"."gem_mr_kpi_1d_statistics_by_imsi"."serving_rsrp_sum" IS '参考信号接收功率Sum';
COMMENT ON COLUMN "public"."gem_mr_kpi_1d_statistics_by_imsi"."serving_rsrq_count" IS '参考信号接收质量Count';
COMMENT ON COLUMN "public"."gem_mr_kpi_1d_statistics_by_imsi"."serving_rsrq_sum" IS '参考信号接收质量Sum';
COMMENT ON COLUMN "public"."gem_mr_kpi_1d_statistics_by_imsi"."ta_count" IS '时间提前量COUNT';
COMMENT ON COLUMN "public"."gem_mr_kpi_1d_statistics_by_imsi"."ta_sum" IS '时间提前量SUM';
COMMENT ON COLUMN "public"."gem_mr_kpi_1d_statistics_by_imsi"."enodeb_received_interfere_count" IS 'eNB接收干扰功率Count';
COMMENT ON COLUMN "public"."gem_mr_kpi_1d_statistics_by_imsi"."enodeb_received_interfere_sum" IS 'eNB接收干扰功率Sum';
COMMENT ON COLUMN "public"."gem_mr_kpi_1d_statistics_by_imsi"."ul_interfere_rate_count" IS '上行干扰强度Count';
COMMENT ON COLUMN "public"."gem_mr_kpi_1d_statistics_by_imsi"."ul_interfere_rate_sum" IS '上行干扰强度Sum';
COMMENT ON COLUMN "public"."gem_mr_kpi_1d_statistics_by_imsi"."aoa_count" IS 'eNB天线到达角Count';
COMMENT ON COLUMN "public"."gem_mr_kpi_1d_statistics_by_imsi"."aoa_sum" IS 'eNB天线到达角Sum';
COMMENT ON COLUMN "public"."gem_mr_kpi_1d_statistics_by_imsi"."phr_count" IS 'UE发射功率余量Count';
COMMENT ON COLUMN "public"."gem_mr_kpi_1d_statistics_by_imsi"."phr_sum" IS 'UE发射功率余量Sum';
COMMENT ON COLUMN "public"."gem_mr_kpi_1d_statistics_by_imsi"."ul_sinr_count" IS '上行信噪比Count';
COMMENT ON COLUMN "public"."gem_mr_kpi_1d_statistics_by_imsi"."ul_sinr_sum" IS '上行信噪比Sum';
COMMENT ON COLUMN "public"."gem_mr_kpi_1d_statistics_by_imsi"."enodeb_received_power_count" IS '基站接收功率Count';
COMMENT ON COLUMN "public"."gem_mr_kpi_1d_statistics_by_imsi"."enodeb_received_power_sum" IS '基站接收功率Sum';
COMMENT ON COLUMN "public"."gem_mr_kpi_1d_statistics_by_imsi"."weak_serving_rsrp_count" IS '弱覆盖采样点数';
COMMENT ON COLUMN "public"."gem_mr_kpi_1d_statistics_by_imsi"."good_serving_rsrp_count" IS '良好覆盖采样点数';
COMMENT ON COLUMN "public"."gem_mr_kpi_1d_statistics_by_imsi"."weak_rsrp_cover_imsi" IS '弱覆盖用户数';
COMMENT ON COLUMN "public"."gem_mr_kpi_1d_statistics_by_imsi"."imsi_count" IS '驻留总用户';
COMMENT ON COLUMN "public"."gem_mr_kpi_1d_statistics_by_imsi"."weak_serving_rsrq_count" IS '下行参考信号接收质差采样点数';
COMMENT ON COLUMN "public"."gem_mr_kpi_1d_statistics_by_imsi"."weak_rsrq_imsi" IS '下行RSRQ质差用户数';
COMMENT ON COLUMN "public"."gem_mr_kpi_1d_statistics_by_imsi"."high_phr_count" IS 'UE高发射功率采样点数';
COMMENT ON COLUMN "public"."gem_mr_kpi_1d_statistics_by_imsi"."high_phr_imsi" IS '高发射功率用户数';
COMMENT ON COLUMN "public"."gem_mr_kpi_1d_statistics_by_imsi"."satisfied_coverage_rsrp_count" IS '满足覆盖采样点数 ';
COMMENT ON COLUMN "public"."gem_mr_kpi_1d_statistics_by_imsi"."overlapping_coverage_count" IS '重叠覆盖采样点数';
COMMENT ON COLUMN "public"."gem_mr_kpi_1d_statistics_by_imsi"."edge_weak_coverage_count" IS '边缘弱覆盖采样点数';
COMMENT ON COLUMN "public"."gem_mr_kpi_1d_statistics_by_imsi"."edge_coverage_count" IS '边缘采样点数';
COMMENT ON COLUMN "public"."gem_mr_kpi_1d_statistics_by_imsi"."mode_3_interfere_rsrp_count" IS '模三干扰采样点数';
COMMENT ON COLUMN "public"."gem_mr_kpi_1d_statistics_by_imsi"."mode_3_neighbor_cell_measure_count" IS '邻区测量采样点数';
COMMENT ON COLUMN "public"."gem_mr_kpi_1d_statistics_by_imsi"."neighbor_cell_over_coverage_count" IS '邻区过覆盖采样点数';

-- ----------------------------
-- Table structure for gem_mr_kpi_1h_statistics
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_mr_kpi_1h_statistics";
CREATE TABLE "public"."gem_mr_kpi_1h_statistics" (
"id" varchar COLLATE "default" DEFAULT next_id() NOT NULL,
"statistical_time" timestamp(6),
"whole_network" varchar COLLATE "default",
"tac" varchar COLLATE "default",
"enodeb_id" varchar COLLATE "default",
"cell_id" varchar COLLATE "default",
"ue_brand" varchar COLLATE "default",
"ue_type" varchar COLLATE "default",
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
"created_time" timestamp(6) DEFAULT now(),
"weak_rsrq_user_rate" int8
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."gem_mr_kpi_1h_statistics" IS 'MR_KPI接口查询表';
COMMENT ON COLUMN "public"."gem_mr_kpi_1h_statistics"."statistical_time" IS '时间';
COMMENT ON COLUMN "public"."gem_mr_kpi_1h_statistics"."whole_network" IS '全网维度';
COMMENT ON COLUMN "public"."gem_mr_kpi_1h_statistics"."ue_brand" IS '终端品牌维度';
COMMENT ON COLUMN "public"."gem_mr_kpi_1h_statistics"."mr_report_count" IS 'MR采样点总数';
COMMENT ON COLUMN "public"."gem_mr_kpi_1h_statistics"."serving_rsrp_count" IS '参考信号接收功率Count';
COMMENT ON COLUMN "public"."gem_mr_kpi_1h_statistics"."serving_rsrp_sum" IS '参考信号接收功率Sum';
COMMENT ON COLUMN "public"."gem_mr_kpi_1h_statistics"."serving_rsrq_count" IS '参考信号接收质量Count';
COMMENT ON COLUMN "public"."gem_mr_kpi_1h_statistics"."serving_rsrq_sum" IS '参考信号接收质量Sum';
COMMENT ON COLUMN "public"."gem_mr_kpi_1h_statistics"."ta_count" IS '时间提前量COUNT';
COMMENT ON COLUMN "public"."gem_mr_kpi_1h_statistics"."ta_sum" IS '时间提前量SUM';
COMMENT ON COLUMN "public"."gem_mr_kpi_1h_statistics"."enodeb_received_interfere_count" IS 'eNB接收干扰功率Count';
COMMENT ON COLUMN "public"."gem_mr_kpi_1h_statistics"."enodeb_received_interfere_sum" IS 'eNB接收干扰功率Sum';
COMMENT ON COLUMN "public"."gem_mr_kpi_1h_statistics"."ul_interfere_rate_count" IS '上行干扰强度Count';
COMMENT ON COLUMN "public"."gem_mr_kpi_1h_statistics"."ul_interfere_rate_sum" IS '上行干扰强度Sum';
COMMENT ON COLUMN "public"."gem_mr_kpi_1h_statistics"."aoa_count" IS 'eNB天线到达角Count';
COMMENT ON COLUMN "public"."gem_mr_kpi_1h_statistics"."aoa_sum" IS 'eNB天线到达角Sum';
COMMENT ON COLUMN "public"."gem_mr_kpi_1h_statistics"."phr_count" IS 'UE发射功率余量Count';
COMMENT ON COLUMN "public"."gem_mr_kpi_1h_statistics"."phr_sum" IS 'UE发射功率余量Sum';
COMMENT ON COLUMN "public"."gem_mr_kpi_1h_statistics"."ul_sinr_count" IS '上行信噪比Count';
COMMENT ON COLUMN "public"."gem_mr_kpi_1h_statistics"."ul_sinr_sum" IS '上行信噪比Sum';
COMMENT ON COLUMN "public"."gem_mr_kpi_1h_statistics"."enodeb_received_power_count" IS '基站接收功率Count';
COMMENT ON COLUMN "public"."gem_mr_kpi_1h_statistics"."enodeb_received_power_sum" IS '基站接收功率Sum';
COMMENT ON COLUMN "public"."gem_mr_kpi_1h_statistics"."weak_serving_rsrp_count" IS '弱覆盖采样点数';
COMMENT ON COLUMN "public"."gem_mr_kpi_1h_statistics"."good_serving_rsrp_count" IS '良好覆盖采样点数';
COMMENT ON COLUMN "public"."gem_mr_kpi_1h_statistics"."weak_rsrp_cover_imsi" IS '弱覆盖用户数';
COMMENT ON COLUMN "public"."gem_mr_kpi_1h_statistics"."imsi_count" IS '驻留总用户';
COMMENT ON COLUMN "public"."gem_mr_kpi_1h_statistics"."weak_serving_rsrq_count" IS '下行参考信号接收质差采样点数';
COMMENT ON COLUMN "public"."gem_mr_kpi_1h_statistics"."weak_rsrq_imsi" IS '下行RSRQ质差用户数';
COMMENT ON COLUMN "public"."gem_mr_kpi_1h_statistics"."high_phr_count" IS 'UE高发射功率采样点数';
COMMENT ON COLUMN "public"."gem_mr_kpi_1h_statistics"."high_phr_imsi" IS '高发射功率用户数';
COMMENT ON COLUMN "public"."gem_mr_kpi_1h_statistics"."satisfied_coverage_rsrp_count" IS '满足覆盖采样点数 ';
COMMENT ON COLUMN "public"."gem_mr_kpi_1h_statistics"."overlapping_coverage_count" IS '重叠覆盖采样点数';
COMMENT ON COLUMN "public"."gem_mr_kpi_1h_statistics"."edge_weak_coverage_count" IS '边缘弱覆盖采样点数';
COMMENT ON COLUMN "public"."gem_mr_kpi_1h_statistics"."edge_coverage_count" IS '边缘采样点数';
COMMENT ON COLUMN "public"."gem_mr_kpi_1h_statistics"."mode_3_interfere_rsrp_count" IS '模三干扰采样点数';
COMMENT ON COLUMN "public"."gem_mr_kpi_1h_statistics"."mode_3_neighbor_cell_measure_count" IS '邻区测量采样点数';
COMMENT ON COLUMN "public"."gem_mr_kpi_1h_statistics"."neighbor_cell_over_coverage_count" IS '邻区过覆盖采样点数';

-- ----------------------------
-- Table structure for gem_mr_kpi_1h_statistics_by_imsi
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_mr_kpi_1h_statistics_by_imsi";
CREATE TABLE "public"."gem_mr_kpi_1h_statistics_by_imsi" (
"id" varchar COLLATE "default" DEFAULT next_id() NOT NULL,
"statistical_time" timestamp(6),
"imsi" varchar COLLATE "default",
"enodeb_id" varchar COLLATE "default",
"cell_id" varchar COLLATE "default",
"ue_type" varchar COLLATE "default",
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
"created_time" timestamp(6) DEFAULT now(),
"weak_rsrq_user_rate" int8
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."gem_mr_kpi_1h_statistics_by_imsi" IS 'MR_KPI接口查询表';
COMMENT ON COLUMN "public"."gem_mr_kpi_1h_statistics_by_imsi"."statistical_time" IS '时间';
COMMENT ON COLUMN "public"."gem_mr_kpi_1h_statistics_by_imsi"."imsi" IS '用户维度';
COMMENT ON COLUMN "public"."gem_mr_kpi_1h_statistics_by_imsi"."mr_report_count" IS 'MR采样点总数';
COMMENT ON COLUMN "public"."gem_mr_kpi_1h_statistics_by_imsi"."serving_rsrp_count" IS '参考信号接收功率Count';
COMMENT ON COLUMN "public"."gem_mr_kpi_1h_statistics_by_imsi"."serving_rsrp_sum" IS '参考信号接收功率Sum';
COMMENT ON COLUMN "public"."gem_mr_kpi_1h_statistics_by_imsi"."serving_rsrq_count" IS '参考信号接收质量Count';
COMMENT ON COLUMN "public"."gem_mr_kpi_1h_statistics_by_imsi"."serving_rsrq_sum" IS '参考信号接收质量Sum';
COMMENT ON COLUMN "public"."gem_mr_kpi_1h_statistics_by_imsi"."ta_count" IS '时间提前量COUNT';
COMMENT ON COLUMN "public"."gem_mr_kpi_1h_statistics_by_imsi"."ta_sum" IS '时间提前量SUM';
COMMENT ON COLUMN "public"."gem_mr_kpi_1h_statistics_by_imsi"."enodeb_received_interfere_count" IS 'eNB接收干扰功率Count';
COMMENT ON COLUMN "public"."gem_mr_kpi_1h_statistics_by_imsi"."enodeb_received_interfere_sum" IS 'eNB接收干扰功率Sum';
COMMENT ON COLUMN "public"."gem_mr_kpi_1h_statistics_by_imsi"."ul_interfere_rate_count" IS '上行干扰强度Count';
COMMENT ON COLUMN "public"."gem_mr_kpi_1h_statistics_by_imsi"."ul_interfere_rate_sum" IS '上行干扰强度Sum';
COMMENT ON COLUMN "public"."gem_mr_kpi_1h_statistics_by_imsi"."aoa_count" IS 'eNB天线到达角Count';
COMMENT ON COLUMN "public"."gem_mr_kpi_1h_statistics_by_imsi"."aoa_sum" IS 'eNB天线到达角Sum';
COMMENT ON COLUMN "public"."gem_mr_kpi_1h_statistics_by_imsi"."phr_count" IS 'UE发射功率余量Count';
COMMENT ON COLUMN "public"."gem_mr_kpi_1h_statistics_by_imsi"."phr_sum" IS 'UE发射功率余量Sum';
COMMENT ON COLUMN "public"."gem_mr_kpi_1h_statistics_by_imsi"."ul_sinr_count" IS '上行信噪比Count';
COMMENT ON COLUMN "public"."gem_mr_kpi_1h_statistics_by_imsi"."ul_sinr_sum" IS '上行信噪比Sum';
COMMENT ON COLUMN "public"."gem_mr_kpi_1h_statistics_by_imsi"."enodeb_received_power_count" IS '基站接收功率Count';
COMMENT ON COLUMN "public"."gem_mr_kpi_1h_statistics_by_imsi"."enodeb_received_power_sum" IS '基站接收功率Sum';
COMMENT ON COLUMN "public"."gem_mr_kpi_1h_statistics_by_imsi"."weak_serving_rsrp_count" IS '弱覆盖采样点数';
COMMENT ON COLUMN "public"."gem_mr_kpi_1h_statistics_by_imsi"."good_serving_rsrp_count" IS '良好覆盖采样点数';
COMMENT ON COLUMN "public"."gem_mr_kpi_1h_statistics_by_imsi"."weak_rsrp_cover_imsi" IS '弱覆盖用户数';
COMMENT ON COLUMN "public"."gem_mr_kpi_1h_statistics_by_imsi"."imsi_count" IS '驻留总用户';
COMMENT ON COLUMN "public"."gem_mr_kpi_1h_statistics_by_imsi"."weak_serving_rsrq_count" IS '下行参考信号接收质差采样点数';
COMMENT ON COLUMN "public"."gem_mr_kpi_1h_statistics_by_imsi"."weak_rsrq_imsi" IS '下行RSRQ质差用户数';
COMMENT ON COLUMN "public"."gem_mr_kpi_1h_statistics_by_imsi"."high_phr_count" IS 'UE高发射功率采样点数';
COMMENT ON COLUMN "public"."gem_mr_kpi_1h_statistics_by_imsi"."high_phr_imsi" IS '高发射功率用户数';
COMMENT ON COLUMN "public"."gem_mr_kpi_1h_statistics_by_imsi"."satisfied_coverage_rsrp_count" IS '满足覆盖采样点数 ';
COMMENT ON COLUMN "public"."gem_mr_kpi_1h_statistics_by_imsi"."overlapping_coverage_count" IS '重叠覆盖采样点数';
COMMENT ON COLUMN "public"."gem_mr_kpi_1h_statistics_by_imsi"."edge_weak_coverage_count" IS '边缘弱覆盖采样点数';
COMMENT ON COLUMN "public"."gem_mr_kpi_1h_statistics_by_imsi"."edge_coverage_count" IS '边缘采样点数';
COMMENT ON COLUMN "public"."gem_mr_kpi_1h_statistics_by_imsi"."mode_3_interfere_rsrp_count" IS '模三干扰采样点数';
COMMENT ON COLUMN "public"."gem_mr_kpi_1h_statistics_by_imsi"."mode_3_neighbor_cell_measure_count" IS '邻区测量采样点数';
COMMENT ON COLUMN "public"."gem_mr_kpi_1h_statistics_by_imsi"."neighbor_cell_over_coverage_count" IS '邻区过覆盖采样点数';

-- ----------------------------
-- Table structure for gem_mr_kpi_5m_statistics
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_mr_kpi_5m_statistics";
CREATE TABLE "public"."gem_mr_kpi_5m_statistics" (
"id" varchar COLLATE "default" DEFAULT next_id() NOT NULL,
"statistical_time" timestamp(6),
"whole_network" varchar COLLATE "default",
"tac" varchar COLLATE "default",
"enodeb_id" varchar COLLATE "default",
"cell_id" varchar COLLATE "default",
"ue_brand" varchar COLLATE "default",
"ue_type" varchar COLLATE "default",
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
"created_time" timestamp(6) DEFAULT now(),
"weak_rsrq_user_rate" int8
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."gem_mr_kpi_5m_statistics" IS 'MR_KPI接口查询表';
COMMENT ON COLUMN "public"."gem_mr_kpi_5m_statistics"."statistical_time" IS '时间';
COMMENT ON COLUMN "public"."gem_mr_kpi_5m_statistics"."whole_network" IS '全网维度';
COMMENT ON COLUMN "public"."gem_mr_kpi_5m_statistics"."ue_brand" IS '终端品牌维度';
COMMENT ON COLUMN "public"."gem_mr_kpi_5m_statistics"."mr_report_count" IS 'MR采样点总数';
COMMENT ON COLUMN "public"."gem_mr_kpi_5m_statistics"."serving_rsrp_count" IS '参考信号接收功率Count';
COMMENT ON COLUMN "public"."gem_mr_kpi_5m_statistics"."serving_rsrp_sum" IS '参考信号接收功率Sum';
COMMENT ON COLUMN "public"."gem_mr_kpi_5m_statistics"."serving_rsrq_count" IS '参考信号接收质量Count';
COMMENT ON COLUMN "public"."gem_mr_kpi_5m_statistics"."serving_rsrq_sum" IS '参考信号接收质量Sum';
COMMENT ON COLUMN "public"."gem_mr_kpi_5m_statistics"."ta_count" IS '时间提前量COUNT';
COMMENT ON COLUMN "public"."gem_mr_kpi_5m_statistics"."ta_sum" IS '时间提前量SUM';
COMMENT ON COLUMN "public"."gem_mr_kpi_5m_statistics"."enodeb_received_interfere_count" IS 'eNB接收干扰功率Count';
COMMENT ON COLUMN "public"."gem_mr_kpi_5m_statistics"."enodeb_received_interfere_sum" IS 'eNB接收干扰功率Sum';
COMMENT ON COLUMN "public"."gem_mr_kpi_5m_statistics"."ul_interfere_rate_count" IS '上行干扰强度Count';
COMMENT ON COLUMN "public"."gem_mr_kpi_5m_statistics"."ul_interfere_rate_sum" IS '上行干扰强度Sum';
COMMENT ON COLUMN "public"."gem_mr_kpi_5m_statistics"."aoa_count" IS 'eNB天线到达角Count';
COMMENT ON COLUMN "public"."gem_mr_kpi_5m_statistics"."aoa_sum" IS 'eNB天线到达角Sum';
COMMENT ON COLUMN "public"."gem_mr_kpi_5m_statistics"."phr_count" IS 'UE发射功率余量Count';
COMMENT ON COLUMN "public"."gem_mr_kpi_5m_statistics"."phr_sum" IS 'UE发射功率余量Sum';
COMMENT ON COLUMN "public"."gem_mr_kpi_5m_statistics"."ul_sinr_count" IS '上行信噪比Count';
COMMENT ON COLUMN "public"."gem_mr_kpi_5m_statistics"."ul_sinr_sum" IS '上行信噪比Sum';
COMMENT ON COLUMN "public"."gem_mr_kpi_5m_statistics"."enodeb_received_power_count" IS '基站接收功率Count';
COMMENT ON COLUMN "public"."gem_mr_kpi_5m_statistics"."enodeb_received_power_sum" IS '基站接收功率Sum';
COMMENT ON COLUMN "public"."gem_mr_kpi_5m_statistics"."weak_serving_rsrp_count" IS '弱覆盖采样点数';
COMMENT ON COLUMN "public"."gem_mr_kpi_5m_statistics"."good_serving_rsrp_count" IS '良好覆盖采样点数';
COMMENT ON COLUMN "public"."gem_mr_kpi_5m_statistics"."weak_rsrp_cover_imsi" IS '弱覆盖用户数';
COMMENT ON COLUMN "public"."gem_mr_kpi_5m_statistics"."imsi_count" IS '驻留总用户';
COMMENT ON COLUMN "public"."gem_mr_kpi_5m_statistics"."weak_serving_rsrq_count" IS '下行参考信号接收质差采样点数';
COMMENT ON COLUMN "public"."gem_mr_kpi_5m_statistics"."weak_rsrq_imsi" IS '下行RSRQ质差用户数';
COMMENT ON COLUMN "public"."gem_mr_kpi_5m_statistics"."high_phr_count" IS 'UE高发射功率采样点数';
COMMENT ON COLUMN "public"."gem_mr_kpi_5m_statistics"."high_phr_imsi" IS '高发射功率用户数';
COMMENT ON COLUMN "public"."gem_mr_kpi_5m_statistics"."satisfied_coverage_rsrp_count" IS '满足覆盖采样点数 ';
COMMENT ON COLUMN "public"."gem_mr_kpi_5m_statistics"."overlapping_coverage_count" IS '重叠覆盖采样点数';
COMMENT ON COLUMN "public"."gem_mr_kpi_5m_statistics"."edge_weak_coverage_count" IS '边缘弱覆盖采样点数';
COMMENT ON COLUMN "public"."gem_mr_kpi_5m_statistics"."edge_coverage_count" IS '边缘采样点数';
COMMENT ON COLUMN "public"."gem_mr_kpi_5m_statistics"."mode_3_interfere_rsrp_count" IS '模三干扰采样点数';
COMMENT ON COLUMN "public"."gem_mr_kpi_5m_statistics"."mode_3_neighbor_cell_measure_count" IS '邻区测量采样点数';
COMMENT ON COLUMN "public"."gem_mr_kpi_5m_statistics"."neighbor_cell_over_coverage_count" IS '邻区过覆盖采样点数';

-- ----------------------------
-- Table structure for gem_mr_kpi_5m_statistics_by_imsi
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_mr_kpi_5m_statistics_by_imsi";
CREATE TABLE "public"."gem_mr_kpi_5m_statistics_by_imsi" (
"id" varchar COLLATE "default" DEFAULT next_id() NOT NULL,
"statistical_time" timestamp(6),
"imsi" varchar COLLATE "default",
"enodeb_id" varchar COLLATE "default",
"cell_id" varchar COLLATE "default",
"ue_type" varchar COLLATE "default",
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
"created_time" timestamp(6) DEFAULT now(),
"weak_rsrq_user_rate" int8
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."gem_mr_kpi_5m_statistics_by_imsi" IS 'MR_KPI接口查询表';
COMMENT ON COLUMN "public"."gem_mr_kpi_5m_statistics_by_imsi"."statistical_time" IS '时间';
COMMENT ON COLUMN "public"."gem_mr_kpi_5m_statistics_by_imsi"."imsi" IS '用户维度';
COMMENT ON COLUMN "public"."gem_mr_kpi_5m_statistics_by_imsi"."mr_report_count" IS 'MR采样点总数';
COMMENT ON COLUMN "public"."gem_mr_kpi_5m_statistics_by_imsi"."serving_rsrp_count" IS '参考信号接收功率Count';
COMMENT ON COLUMN "public"."gem_mr_kpi_5m_statistics_by_imsi"."serving_rsrp_sum" IS '参考信号接收功率Sum';
COMMENT ON COLUMN "public"."gem_mr_kpi_5m_statistics_by_imsi"."serving_rsrq_count" IS '参考信号接收质量Count';
COMMENT ON COLUMN "public"."gem_mr_kpi_5m_statistics_by_imsi"."serving_rsrq_sum" IS '参考信号接收质量Sum';
COMMENT ON COLUMN "public"."gem_mr_kpi_5m_statistics_by_imsi"."ta_count" IS '时间提前量COUNT';
COMMENT ON COLUMN "public"."gem_mr_kpi_5m_statistics_by_imsi"."ta_sum" IS '时间提前量SUM';
COMMENT ON COLUMN "public"."gem_mr_kpi_5m_statistics_by_imsi"."enodeb_received_interfere_count" IS 'eNB接收干扰功率Count';
COMMENT ON COLUMN "public"."gem_mr_kpi_5m_statistics_by_imsi"."enodeb_received_interfere_sum" IS 'eNB接收干扰功率Sum';
COMMENT ON COLUMN "public"."gem_mr_kpi_5m_statistics_by_imsi"."ul_interfere_rate_count" IS '上行干扰强度Count';
COMMENT ON COLUMN "public"."gem_mr_kpi_5m_statistics_by_imsi"."ul_interfere_rate_sum" IS '上行干扰强度Sum';
COMMENT ON COLUMN "public"."gem_mr_kpi_5m_statistics_by_imsi"."aoa_count" IS 'eNB天线到达角Count';
COMMENT ON COLUMN "public"."gem_mr_kpi_5m_statistics_by_imsi"."aoa_sum" IS 'eNB天线到达角Sum';
COMMENT ON COLUMN "public"."gem_mr_kpi_5m_statistics_by_imsi"."phr_count" IS 'UE发射功率余量Count';
COMMENT ON COLUMN "public"."gem_mr_kpi_5m_statistics_by_imsi"."phr_sum" IS 'UE发射功率余量Sum';
COMMENT ON COLUMN "public"."gem_mr_kpi_5m_statistics_by_imsi"."ul_sinr_count" IS '上行信噪比Count';
COMMENT ON COLUMN "public"."gem_mr_kpi_5m_statistics_by_imsi"."ul_sinr_sum" IS '上行信噪比Sum';
COMMENT ON COLUMN "public"."gem_mr_kpi_5m_statistics_by_imsi"."enodeb_received_power_count" IS '基站接收功率Count';
COMMENT ON COLUMN "public"."gem_mr_kpi_5m_statistics_by_imsi"."enodeb_received_power_sum" IS '基站接收功率Sum';
COMMENT ON COLUMN "public"."gem_mr_kpi_5m_statistics_by_imsi"."weak_serving_rsrp_count" IS '弱覆盖采样点数';
COMMENT ON COLUMN "public"."gem_mr_kpi_5m_statistics_by_imsi"."good_serving_rsrp_count" IS '良好覆盖采样点数';
COMMENT ON COLUMN "public"."gem_mr_kpi_5m_statistics_by_imsi"."weak_rsrp_cover_imsi" IS '弱覆盖用户数';
COMMENT ON COLUMN "public"."gem_mr_kpi_5m_statistics_by_imsi"."imsi_count" IS '驻留总用户';
COMMENT ON COLUMN "public"."gem_mr_kpi_5m_statistics_by_imsi"."weak_serving_rsrq_count" IS '下行参考信号接收质差采样点数';
COMMENT ON COLUMN "public"."gem_mr_kpi_5m_statistics_by_imsi"."weak_rsrq_imsi" IS '下行RSRQ质差用户数';
COMMENT ON COLUMN "public"."gem_mr_kpi_5m_statistics_by_imsi"."high_phr_count" IS 'UE高发射功率采样点数';
COMMENT ON COLUMN "public"."gem_mr_kpi_5m_statistics_by_imsi"."high_phr_imsi" IS '高发射功率用户数';
COMMENT ON COLUMN "public"."gem_mr_kpi_5m_statistics_by_imsi"."satisfied_coverage_rsrp_count" IS '满足覆盖采样点数 ';
COMMENT ON COLUMN "public"."gem_mr_kpi_5m_statistics_by_imsi"."overlapping_coverage_count" IS '重叠覆盖采样点数';
COMMENT ON COLUMN "public"."gem_mr_kpi_5m_statistics_by_imsi"."edge_weak_coverage_count" IS '边缘弱覆盖采样点数';
COMMENT ON COLUMN "public"."gem_mr_kpi_5m_statistics_by_imsi"."edge_coverage_count" IS '边缘采样点数';
COMMENT ON COLUMN "public"."gem_mr_kpi_5m_statistics_by_imsi"."mode_3_interfere_rsrp_count" IS '模三干扰采样点数';
COMMENT ON COLUMN "public"."gem_mr_kpi_5m_statistics_by_imsi"."mode_3_neighbor_cell_measure_count" IS '邻区测量采样点数';
COMMENT ON COLUMN "public"."gem_mr_kpi_5m_statistics_by_imsi"."neighbor_cell_over_coverage_count" IS '邻区过覆盖采样点数';

-- ----------------------------
-- Table structure for gem_network_elements
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_network_elements";
CREATE TABLE "public"."gem_network_elements" (
"id" varchar COLLATE "default" DEFAULT nextval('gem_network_elements_id_seq'::regclass) NOT NULL,
"name" varchar COLLATE "default",
"dimension" varchar COLLATE "default",
"parent_id" varchar COLLATE "default",
"level" int4,
"description" varchar COLLATE "default",
"has_next_level" varchar COLLATE "default",
"parameter_type" varchar COLLATE "default",
"value" varchar COLLATE "default"
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."gem_network_elements" IS '网元配置表';
COMMENT ON COLUMN "public"."gem_network_elements"."dimension" IS '网元名称';
COMMENT ON COLUMN "public"."gem_network_elements"."parent_id" IS '上层网元值id';
COMMENT ON COLUMN "public"."gem_network_elements"."level" IS '当前网元值等级';
COMMENT ON COLUMN "public"."gem_network_elements"."has_next_level" IS '是否有下层网元值(Y/N)';

-- ----------------------------
-- Table structure for gem_network_elements_user_end
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_network_elements_user_end";
CREATE TABLE "public"."gem_network_elements_user_end" (
"id" varchar COLLATE "default" DEFAULT next_id() NOT NULL,
"value" varchar COLLATE "default",
"user_end_brand" varchar COLLATE "default",
"user_end_type" varchar COLLATE "default",
"description" varchar COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for gem_query_templates
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_query_templates";
CREATE TABLE "public"."gem_query_templates" (
"id" varchar COLLATE "default" DEFAULT next_id() NOT NULL,
"name" varchar COLLATE "default",
"scope" varchar COLLATE "default",
"template" json
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for gem_realtime_monitoring_indicator_dimensions
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_realtime_monitoring_indicator_dimensions";
CREATE TABLE "public"."gem_realtime_monitoring_indicator_dimensions" (
"id" varchar COLLATE "default" DEFAULT next_id() NOT NULL,
"indicator_id" varchar COLLATE "default",
"network_interface" varchar COLLATE "default",
"dimension_name" varchar COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for gem_realtime_monitoring_indicator_rules
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_realtime_monitoring_indicator_rules";
CREATE TABLE "public"."gem_realtime_monitoring_indicator_rules" (
"id" varchar COLLATE "default" DEFAULT next_id() NOT NULL,
"name" varchar COLLATE "default",
"parameter" varchar COLLATE "default",
"operator" varchar COLLATE "default",
"threshold" int4,
"network_element_values" text COLLATE "default",
"dimension_name" varchar COLLATE "default",
"network_interface" varchar COLLATE "default",
"unit" varchar COLLATE "default",
"statistical_time" timestamp(6),
"interval" varchar COLLATE "default",
"show" bool,
"rule_name" varchar COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for gem_realtime_monitoring_mr_kpi_15m_statistics
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_realtime_monitoring_mr_kpi_15m_statistics";
CREATE TABLE "public"."gem_realtime_monitoring_mr_kpi_15m_statistics" (
"id" varchar COLLATE "default" DEFAULT next_id() NOT NULL,
"whole_network" varchar COLLATE "default",
"mme_group_id" varchar COLLATE "default",
"mme_code" varchar COLLATE "default",
"cell_id" varchar COLLATE "default",
"imsi" varchar COLLATE "default",
"ue_type" varchar COLLATE "default",
"statistical_time" timestamp(6),
"created_time" timestamp(6) DEFAULT now() NOT NULL,
"serving_rsrp_count" int8,
"serving_rsrp_30_count" int8
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for gem_realtime_monitoring_mr_kpi_30m_statistics
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_realtime_monitoring_mr_kpi_30m_statistics";
CREATE TABLE "public"."gem_realtime_monitoring_mr_kpi_30m_statistics" (
"id" varchar COLLATE "default" DEFAULT next_id() NOT NULL,
"whole_network" varchar COLLATE "default",
"mme_group_id" varchar COLLATE "default",
"mme_code" varchar COLLATE "default",
"cell_id" varchar COLLATE "default",
"imsi" varchar COLLATE "default",
"ue_type" varchar COLLATE "default",
"statistical_time" timestamp(6),
"created_time" timestamp(6) DEFAULT now() NOT NULL,
"serving_rsrp_count" int8,
"serving_rsrp_30_count" int8
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for gem_realtime_monitoring_mr_kpi_5m_statistics
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_realtime_monitoring_mr_kpi_5m_statistics";
CREATE TABLE "public"."gem_realtime_monitoring_mr_kpi_5m_statistics" (
"id" varchar COLLATE "default" DEFAULT next_id() NOT NULL,
"whole_network" varchar COLLATE "default",
"mme_group_id" varchar COLLATE "default",
"mme_code" varchar COLLATE "default",
"cell_id" varchar COLLATE "default",
"imsi" varchar COLLATE "default",
"ue_type" varchar COLLATE "default",
"statistical_time" timestamp(6),
"created_time" timestamp(6) DEFAULT now() NOT NULL,
"serving_rsrp_count" int8,
"serving_rsrp_30_count" int8
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for gem_realtime_monitoring_rule_relative_kpis
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_realtime_monitoring_rule_relative_kpis";
CREATE TABLE "public"."gem_realtime_monitoring_rule_relative_kpis" (
"id" varchar COLLATE "default" DEFAULT next_id() NOT NULL,
"rule_id" varchar COLLATE "default",
"parameter" varchar COLLATE "default",
"expression" varchar COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for gem_realtime_monitoring_s1_mme_kpi_15m_statistics
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_realtime_monitoring_s1_mme_kpi_15m_statistics";
CREATE TABLE "public"."gem_realtime_monitoring_s1_mme_kpi_15m_statistics" (
"id" varchar COLLATE "default" DEFAULT next_id() NOT NULL,
"whole_network" varchar COLLATE "default",
"mme_group_id" varchar COLLATE "default",
"mme_code" varchar COLLATE "default",
"cell_id" varchar COLLATE "default",
"imsi" varchar COLLATE "default",
"ue_type" varchar COLLATE "default",
"tac" varchar COLLATE "default",
"statistical_time" timestamp(6),
"created_time" timestamp(6) DEFAULT now() NOT NULL,
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
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for gem_realtime_monitoring_s1_mme_kpi_30m_statistics
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_realtime_monitoring_s1_mme_kpi_30m_statistics";
CREATE TABLE "public"."gem_realtime_monitoring_s1_mme_kpi_30m_statistics" (
"id" varchar COLLATE "default" DEFAULT next_id() NOT NULL,
"whole_network" varchar COLLATE "default",
"mme_group_id" varchar COLLATE "default",
"mme_code" varchar COLLATE "default",
"cell_id" varchar COLLATE "default",
"imsi" varchar COLLATE "default",
"ue_type" varchar COLLATE "default",
"tac" varchar COLLATE "default",
"statistical_time" timestamp(6),
"created_time" timestamp(6) DEFAULT now() NOT NULL,
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
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for gem_realtime_monitoring_s1_mme_kpi_5m_statistics
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_realtime_monitoring_s1_mme_kpi_5m_statistics";
CREATE TABLE "public"."gem_realtime_monitoring_s1_mme_kpi_5m_statistics" (
"id" varchar COLLATE "default" DEFAULT next_id() NOT NULL,
"whole_network" varchar COLLATE "default",
"mme_group_id" varchar COLLATE "default",
"mme_code" varchar COLLATE "default",
"cell_id" varchar COLLATE "default",
"imsi" varchar COLLATE "default",
"ue_type" varchar COLLATE "default",
"tac" varchar COLLATE "default",
"statistical_time" timestamp(6),
"created_time" timestamp(6) DEFAULT now() NOT NULL,
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
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for gem_realtime_monitoring_s1u_dns_kpi_15m_statistics
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_realtime_monitoring_s1u_dns_kpi_15m_statistics";
CREATE TABLE "public"."gem_realtime_monitoring_s1u_dns_kpi_15m_statistics" (
"id" varchar COLLATE "default" DEFAULT next_id() NOT NULL,
"whole_network" varchar COLLATE "default",
"mme_group_id" varchar COLLATE "default",
"mme_code" varchar COLLATE "default",
"tac" varchar COLLATE "default",
"cell_id" varchar COLLATE "default",
"imsi" varchar COLLATE "default",
"ue_type" varchar COLLATE "default",
"statistical_time" timestamp(6),
"created_time" timestamp(6) DEFAULT now() NOT NULL,
"dns_request_count" int8,
"dns_success_count" int8,
"tcp_link_request_count" int8,
"tcp_link_success_count" int8
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for gem_realtime_monitoring_s1u_dns_kpi_30m_statistics
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_realtime_monitoring_s1u_dns_kpi_30m_statistics";
CREATE TABLE "public"."gem_realtime_monitoring_s1u_dns_kpi_30m_statistics" (
"id" varchar COLLATE "default" DEFAULT next_id() NOT NULL,
"whole_network" varchar COLLATE "default",
"mme_group_id" varchar COLLATE "default",
"mme_code" varchar COLLATE "default",
"tac" varchar COLLATE "default",
"cell_id" varchar COLLATE "default",
"imsi" varchar COLLATE "default",
"ue_type" varchar COLLATE "default",
"statistical_time" timestamp(6),
"created_time" timestamp(6) DEFAULT now() NOT NULL,
"dns_request_count" int8,
"dns_success_count" int8,
"tcp_link_request_count" int8,
"tcp_link_success_count" int8
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for gem_realtime_monitoring_s1u_dns_kpi_5m_statistics
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_realtime_monitoring_s1u_dns_kpi_5m_statistics";
CREATE TABLE "public"."gem_realtime_monitoring_s1u_dns_kpi_5m_statistics" (
"id" varchar COLLATE "default" DEFAULT next_id() NOT NULL,
"whole_network" varchar COLLATE "default",
"mme_group_id" varchar COLLATE "default",
"mme_code" varchar COLLATE "default",
"tac" varchar COLLATE "default",
"cell_id" varchar COLLATE "default",
"imsi" varchar COLLATE "default",
"ue_type" varchar COLLATE "default",
"statistical_time" timestamp(6),
"created_time" timestamp(6) DEFAULT now() NOT NULL,
"dns_request_count" int8,
"dns_success_count" int8,
"tcp_link_request_count" int8,
"tcp_link_success_count" int8
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for gem_realtime_monitoring_s1u_http_kpi_15m_statistics
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_realtime_monitoring_s1u_http_kpi_15m_statistics";
CREATE TABLE "public"."gem_realtime_monitoring_s1u_http_kpi_15m_statistics" (
"id" varchar COLLATE "default" DEFAULT next_id() NOT NULL,
"whole_network" varchar COLLATE "default",
"mme_group_id" varchar COLLATE "default",
"mme_code" varchar COLLATE "default",
"tac" varchar COLLATE "default",
"cell_id" varchar COLLATE "default",
"imsi" varchar COLLATE "default",
"sgw_ggsn_ip_add" varchar COLLATE "default",
"ue_type" varchar COLLATE "default",
"statistical_time" timestamp(6),
"created_time" timestamp(6) DEFAULT now() NOT NULL,
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
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for gem_realtime_monitoring_s1u_http_kpi_30m_statistics
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_realtime_monitoring_s1u_http_kpi_30m_statistics";
CREATE TABLE "public"."gem_realtime_monitoring_s1u_http_kpi_30m_statistics" (
"id" varchar COLLATE "default" DEFAULT next_id() NOT NULL,
"whole_network" varchar COLLATE "default",
"mme_group_id" varchar COLLATE "default",
"mme_code" varchar COLLATE "default",
"tac" varchar COLLATE "default",
"cell_id" varchar COLLATE "default",
"imsi" varchar COLLATE "default",
"sgw_ggsn_ip_add" varchar COLLATE "default",
"ue_type" varchar COLLATE "default",
"statistical_time" timestamp(6),
"created_time" timestamp(6) DEFAULT now() NOT NULL,
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
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for gem_realtime_monitoring_s1u_http_kpi_5m_statistics
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_realtime_monitoring_s1u_http_kpi_5m_statistics";
CREATE TABLE "public"."gem_realtime_monitoring_s1u_http_kpi_5m_statistics" (
"id" varchar COLLATE "default" DEFAULT next_id() NOT NULL,
"whole_network" varchar COLLATE "default",
"mme_group_id" varchar COLLATE "default",
"mme_code" varchar COLLATE "default",
"tac" varchar COLLATE "default",
"cell_id" varchar COLLATE "default",
"imsi" varchar COLLATE "default",
"sgw_ggsn_ip_add" varchar COLLATE "default",
"ue_type" varchar COLLATE "default",
"statistical_time" timestamp(6),
"created_time" timestamp(6) DEFAULT now() NOT NULL,
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
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for gem_realtime_monitoring_s1u_kpi_15m_statistics
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_realtime_monitoring_s1u_kpi_15m_statistics";
CREATE TABLE "public"."gem_realtime_monitoring_s1u_kpi_15m_statistics" (
"id" varchar COLLATE "default" DEFAULT next_id() NOT NULL,
"whole_network" varchar COLLATE "default",
"mme_group_id" varchar COLLATE "default",
"mme_code" varchar COLLATE "default",
"tac" varchar COLLATE "default",
"cell_id" varchar COLLATE "default",
"imsi" varchar COLLATE "default",
"ue_type" varchar COLLATE "default",
"statistical_time" timestamp(6),
"created_time" timestamp(6) DEFAULT now() NOT NULL,
"tcp_link_request_count" int8,
"tcp_link_success_count" int8
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for gem_realtime_monitoring_s1u_kpi_30m_statistics
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_realtime_monitoring_s1u_kpi_30m_statistics";
CREATE TABLE "public"."gem_realtime_monitoring_s1u_kpi_30m_statistics" (
"id" varchar COLLATE "default" DEFAULT next_id() NOT NULL,
"whole_network" varchar COLLATE "default",
"mme_group_id" varchar COLLATE "default",
"mme_code" varchar COLLATE "default",
"tac" varchar COLLATE "default",
"cell_id" varchar COLLATE "default",
"imsi" varchar COLLATE "default",
"ue_type" varchar COLLATE "default",
"statistical_time" timestamp(6),
"created_time" timestamp(6) DEFAULT now() NOT NULL,
"tcp_link_request_count" int8,
"tcp_link_success_count" int8
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for gem_realtime_monitoring_s1u_kpi_5m_statistics
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_realtime_monitoring_s1u_kpi_5m_statistics";
CREATE TABLE "public"."gem_realtime_monitoring_s1u_kpi_5m_statistics" (
"id" varchar COLLATE "default" DEFAULT next_id() NOT NULL,
"whole_network" varchar COLLATE "default",
"mme_group_id" varchar COLLATE "default",
"mme_code" varchar COLLATE "default",
"tac" varchar COLLATE "default",
"cell_id" varchar COLLATE "default",
"imsi" varchar COLLATE "default",
"ue_type" varchar COLLATE "default",
"statistical_time" timestamp(6),
"created_time" timestamp(6) DEFAULT now() NOT NULL,
"tcp_link_request_count" int8,
"tcp_link_success_count" int8
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for gem_realtime_monitoring_s6a_kpi_15m_statistics
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_realtime_monitoring_s6a_kpi_15m_statistics";
CREATE TABLE "public"."gem_realtime_monitoring_s6a_kpi_15m_statistics" (
"id" varchar COLLATE "default" DEFAULT next_id() NOT NULL,
"whole_network" varchar COLLATE "default",
"mme_code" varchar COLLATE "default",
"imsi" varchar COLLATE "default",
"ue_type" varchar COLLATE "default",
"statistical_time" timestamp(6),
"created_time" timestamp(6),
"hss_authentication_information_request_count" int8,
"hss_authentication_information_success_count" int8,
"hss_update_location_request_count" int8,
"hss_update_location_success_count" int8
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for gem_realtime_monitoring_s6a_kpi_30m_statistics
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_realtime_monitoring_s6a_kpi_30m_statistics";
CREATE TABLE "public"."gem_realtime_monitoring_s6a_kpi_30m_statistics" (
"id" varchar COLLATE "default" DEFAULT next_id() NOT NULL,
"whole_network" varchar COLLATE "default",
"mme_code" varchar COLLATE "default",
"imsi" varchar COLLATE "default",
"ue_type" varchar COLLATE "default",
"statistical_time" timestamp(6),
"created_time" timestamp(6),
"hss_authentication_information_request_count" int8,
"hss_authentication_information_success_count" int8,
"hss_update_location_request_count" int8,
"hss_update_location_success_count" int8
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for gem_realtime_monitoring_s6a_kpi_5m_statistics
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_realtime_monitoring_s6a_kpi_5m_statistics";
CREATE TABLE "public"."gem_realtime_monitoring_s6a_kpi_5m_statistics" (
"id" varchar COLLATE "default" DEFAULT next_id() NOT NULL,
"whole_network" varchar COLLATE "default",
"mme_code" varchar COLLATE "default",
"imsi" varchar COLLATE "default",
"ue_type" varchar COLLATE "default",
"statistical_time" timestamp(6),
"created_time" timestamp(6),
"hss_authentication_information_request_count" int8,
"hss_authentication_information_success_count" int8,
"hss_update_location_request_count" int8,
"hss_update_location_success_count" int8
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for gem_realtime_monitoring_sgs_kpi_15m_statistics
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_realtime_monitoring_sgs_kpi_15m_statistics";
CREATE TABLE "public"."gem_realtime_monitoring_sgs_kpi_15m_statistics" (
"id" varchar COLLATE "default" DEFAULT next_id() NOT NULL,
"whole_network" varchar COLLATE "default",
"mme_group_id" varchar COLLATE "default",
"mme_code" varchar COLLATE "default",
"tac" varchar COLLATE "default",
"cell_id" varchar COLLATE "default",
"imsi" varchar COLLATE "default",
"ue_type" varchar COLLATE "default",
"statistical_time" timestamp(6),
"created_time" timestamp(6),
"sgsap_location_update_request_count" int8,
"sgsap_location_update_success_count" int8,
"cs_paging_request_count" int8,
"cs_paging_success_count" int8
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for gem_realtime_monitoring_sgs_kpi_30m_statistics
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_realtime_monitoring_sgs_kpi_30m_statistics";
CREATE TABLE "public"."gem_realtime_monitoring_sgs_kpi_30m_statistics" (
"id" varchar COLLATE "default" DEFAULT next_id() NOT NULL,
"whole_network" varchar COLLATE "default",
"mme_group_id" varchar COLLATE "default",
"mme_code" varchar COLLATE "default",
"tac" varchar COLLATE "default",
"cell_id" varchar COLLATE "default",
"imsi" varchar COLLATE "default",
"ue_type" varchar COLLATE "default",
"statistical_time" timestamp(6),
"created_time" timestamp(6),
"sgsap_location_update_request_count" int8,
"sgsap_location_update_success_count" int8,
"cs_paging_request_count" int8,
"cs_paging_success_count" int8
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for gem_realtime_monitoring_sgs_kpi_5m_statistics
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_realtime_monitoring_sgs_kpi_5m_statistics";
CREATE TABLE "public"."gem_realtime_monitoring_sgs_kpi_5m_statistics" (
"id" varchar COLLATE "default" DEFAULT next_id() NOT NULL,
"whole_network" varchar COLLATE "default",
"mme_group_id" varchar COLLATE "default",
"mme_code" varchar COLLATE "default",
"tac" varchar COLLATE "default",
"cell_id" varchar COLLATE "default",
"imsi" varchar COLLATE "default",
"ue_type" varchar COLLATE "default",
"statistical_time" timestamp(6),
"created_time" timestamp(6),
"sgsap_location_update_request_count" int8,
"sgsap_location_update_success_count" int8,
"cs_paging_request_count" int8,
"cs_paging_success_count" int8
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for gem_realtime_monitoring_uu_kpi_15m_statistics
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_realtime_monitoring_uu_kpi_15m_statistics";
CREATE TABLE "public"."gem_realtime_monitoring_uu_kpi_15m_statistics" (
"id" varchar COLLATE "default" DEFAULT next_id() NOT NULL,
"whole_network" varchar COLLATE "default",
"mme_group_id" varchar COLLATE "default",
"mme_code" varchar COLLATE "default",
"cell_id" varchar COLLATE "default",
"imsi" varchar COLLATE "default",
"ue_type" varchar COLLATE "default",
"statistical_time" timestamp(6),
"created_time" timestamp(6),
"rrc_connection_setup_request_count" int8,
"rrc_connection_setup_success_count" int8,
"ps_paging_request_count" int8,
"ps_paging_success_count" int8
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for gem_realtime_monitoring_uu_kpi_30m_statistics
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_realtime_monitoring_uu_kpi_30m_statistics";
CREATE TABLE "public"."gem_realtime_monitoring_uu_kpi_30m_statistics" (
"id" varchar COLLATE "default" DEFAULT next_id() NOT NULL,
"whole_network" varchar COLLATE "default",
"mme_group_id" varchar COLLATE "default",
"mme_code" varchar COLLATE "default",
"cell_id" varchar COLLATE "default",
"imsi" varchar COLLATE "default",
"ue_type" varchar COLLATE "default",
"statistical_time" timestamp(6),
"created_time" timestamp(6),
"rrc_connection_setup_request_count" int8,
"rrc_connection_setup_success_count" int8,
"ps_paging_request_count" int8,
"ps_paging_success_count" int8
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for gem_realtime_monitoring_uu_kpi_5m_statistics
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_realtime_monitoring_uu_kpi_5m_statistics";
CREATE TABLE "public"."gem_realtime_monitoring_uu_kpi_5m_statistics" (
"id" varchar COLLATE "default" DEFAULT next_id() NOT NULL,
"whole_network" varchar COLLATE "default",
"mme_group_id" varchar COLLATE "default",
"mme_code" varchar COLLATE "default",
"cell_id" varchar COLLATE "default",
"imsi" varchar COLLATE "default",
"ue_type" varchar COLLATE "default",
"statistical_time" timestamp(6),
"created_time" timestamp(6),
"rrc_connection_setup_request_count" int8,
"rrc_connection_setup_success_count" int8,
"ps_paging_request_count" int8,
"ps_paging_success_count" int8
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for gem_realtime_monitoring_x2_kpi_15m_statistics
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_realtime_monitoring_x2_kpi_15m_statistics";
CREATE TABLE "public"."gem_realtime_monitoring_x2_kpi_15m_statistics" (
"id" varchar COLLATE "default" DEFAULT next_id() NOT NULL,
"whole_network" varchar COLLATE "default",
"mme_group_id" varchar COLLATE "default",
"mme_code" varchar COLLATE "default",
"cell_id" varchar COLLATE "default",
"imsi" varchar COLLATE "default",
"ue_type" varchar COLLATE "default",
"statistical_time" timestamp(6),
"created_time" timestamp(6) DEFAULT now() NOT NULL,
"x2_establish_request_count" int8,
"x2_establish_success_count" int8,
"handover_prepare_request_count" int8,
"handover_prepare_success_count" int8,
"cell_activation_request_count" int8,
"cell_activation_success_count" int8
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for gem_realtime_monitoring_x2_kpi_30m_statistics
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_realtime_monitoring_x2_kpi_30m_statistics";
CREATE TABLE "public"."gem_realtime_monitoring_x2_kpi_30m_statistics" (
"id" varchar COLLATE "default" DEFAULT next_id() NOT NULL,
"whole_network" varchar COLLATE "default",
"mme_group_id" varchar COLLATE "default",
"mme_code" varchar COLLATE "default",
"cell_id" varchar COLLATE "default",
"imsi" varchar COLLATE "default",
"ue_type" varchar COLLATE "default",
"statistical_time" timestamp(6),
"created_time" timestamp(6) DEFAULT now() NOT NULL,
"x2_establish_request_count" int8,
"x2_establish_success_count" int8,
"handover_prepare_request_count" int8,
"handover_prepare_success_count" int8,
"cell_activation_request_count" int8,
"cell_activation_success_count" int8
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for gem_realtime_monitoring_x2_kpi_5m_statistics
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_realtime_monitoring_x2_kpi_5m_statistics";
CREATE TABLE "public"."gem_realtime_monitoring_x2_kpi_5m_statistics" (
"id" varchar COLLATE "default" DEFAULT next_id() NOT NULL,
"whole_network" varchar COLLATE "default",
"mme_group_id" varchar COLLATE "default",
"mme_code" varchar COLLATE "default",
"cell_id" varchar COLLATE "default",
"imsi" varchar COLLATE "default",
"ue_type" varchar COLLATE "default",
"statistical_time" timestamp(6),
"created_time" timestamp(6) DEFAULT now() NOT NULL,
"x2_establish_request_count" int8,
"x2_establish_success_count" int8,
"handover_prepare_request_count" int8,
"handover_prepare_success_count" int8,
"cell_activation_request_count" int8,
"cell_activation_success_count" int8
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for gem_road_info
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_road_info";
CREATE TABLE "public"."gem_road_info" (
"id" varchar COLLATE "default" DEFAULT next_id() NOT NULL,
"name" varchar COLLATE "default",
"type_id" varchar COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for gem_road_types
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_road_types";
CREATE TABLE "public"."gem_road_types" (
"id" varchar COLLATE "default" DEFAULT next_id() NOT NULL,
"name" varchar COLLATE "default",
"code" varchar COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for gem_s1_mme_event_5m_statistics_by_imsi
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_s1_mme_event_5m_statistics_by_imsi";
CREATE TABLE "public"."gem_s1_mme_event_5m_statistics_by_imsi" (
"statistical_time" timestamp(6),
"imsi" text COLLATE "default",
"msisdn" text COLLATE "default",
"event_type" varchar COLLATE "default",
"request_count" int4 NOT NULL,
"success_count" int4 NOT NULL,
"abnormal_count" int4 NOT NULL,
"response_delay_time" int8,
"no_resp_count" int4 NOT NULL,
"created_time" timestamp(6) DEFAULT now()
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for gem_s1_mme_kpi_1d_failure_statistics
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_s1_mme_kpi_1d_failure_statistics";
CREATE TABLE "public"."gem_s1_mme_kpi_1d_failure_statistics" (
"statistical_time" timestamp(6),
"whole_network" varchar COLLATE "default",
"mme_group_id" varchar COLLATE "default",
"mme_code" varchar COLLATE "default",
"tac" int4,
"enodeb_id" int4,
"cell_id" int4,
"event_type" varchar COLLATE "default",
"abnormal_type" int4,
"abnormal_reason" int4,
"abnormal_reason_count" int8,
"created_time" timestamp(6) DEFAULT now()
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for gem_s1_mme_kpi_1d_statistics
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_s1_mme_kpi_1d_statistics";
CREATE TABLE "public"."gem_s1_mme_kpi_1d_statistics" (
"id" varchar COLLATE "default" DEFAULT next_id() NOT NULL,
"whole_network" varchar COLLATE "default",
"mme_group_id" varchar COLLATE "default",
"mme_code" varchar COLLATE "default",
"tac" varchar COLLATE "default",
"enodeb_id" varchar COLLATE "default",
"cell_id" varchar COLLATE "default",
"statistical_time" timestamp(6) NOT NULL,
"created_time" timestamp(6) DEFAULT now(),
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
"paging_failure_casue" varchar COLLATE "default",
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
"error_indication_request" varchar COLLATE "default",
"error_indication_cause" varchar COLLATE "default",
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
"csfb_original_authentication_success" int8,
"csfb_original_authentication_timedelay" int8,
"csfb_original_security_request" int8,
"csfb_original_security_success" int8,
"csfb_original_security_timedelay" int8,
"csfb_terminal_request" int8,
"csfb_terminal_success" int8,
"csfb_terminal_failure" int8,
"csfb_terminal_authentication_request" int8,
"csfb_terminal_authentication_success" int8,
"csfb_terminal_authentication_timedelay" int8,
"csfb_terminal_security_request" int8,
"csfb_terminal_security_success" int8,
"csfb_terminal_security_timedelay" int8,
"csfb_emergency_request" int8,
"csfb_emergency_success" int8,
"csfb_emergency_failure" int8
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for gem_s1_mme_kpi_1h_failure_statistics
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_s1_mme_kpi_1h_failure_statistics";
CREATE TABLE "public"."gem_s1_mme_kpi_1h_failure_statistics" (
"statistical_time" timestamp(6),
"whole_network" varchar COLLATE "default",
"mme_group_id" varchar COLLATE "default",
"mme_code" varchar COLLATE "default",
"tac" int4,
"enodeb_id" int4,
"cell_id" int4,
"event_type" varchar COLLATE "default",
"abnormal_type" int4,
"abnormal_reason" int4,
"abnormal_reason_count" int8,
"created_time" timestamp(6) DEFAULT now()
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for gem_s1_mme_kpi_1h_statistics
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_s1_mme_kpi_1h_statistics";
CREATE TABLE "public"."gem_s1_mme_kpi_1h_statistics" (
"id" varchar COLLATE "default" DEFAULT next_id() NOT NULL,
"whole_network" varchar COLLATE "default",
"mme_group_id" varchar COLLATE "default",
"mme_code" varchar COLLATE "default",
"tac" varchar COLLATE "default",
"enodeb_id" varchar COLLATE "default",
"cell_id" varchar COLLATE "default",
"statistical_time" timestamp(6),
"created_time" timestamp(6) DEFAULT now(),
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
"paging_failure_casue" varchar COLLATE "default",
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
"error_indication_request" varchar COLLATE "default",
"error_indication_cause" varchar COLLATE "default",
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
"csfb_original_authentication_success" int8,
"csfb_original_authentication_timedelay" int8,
"csfb_original_security_request" int8,
"csfb_original_security_success" int8,
"csfb_original_security_timedelay" int8,
"csfb_terminal_request" int8,
"csfb_terminal_success" int8,
"csfb_terminal_failure" int8,
"csfb_terminal_authentication_request" int8,
"csfb_terminal_authentication_success" int8,
"csfb_terminal_authentication_timedelay" int8,
"csfb_terminal_security_request" int8,
"csfb_terminal_security_success" int8,
"csfb_terminal_security_timedelay" int8,
"csfb_emergency_request" int8,
"csfb_emergency_success" int8,
"csfb_emergency_failure" int8
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for gem_s1_mme_kpi_5m_failure_statistics
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_s1_mme_kpi_5m_failure_statistics";
CREATE TABLE "public"."gem_s1_mme_kpi_5m_failure_statistics" (
"statistical_time" timestamp(6),
"whole_network" varchar COLLATE "default",
"mme_group_id" varchar COLLATE "default",
"mme_code" varchar COLLATE "default",
"tac" int4,
"enodeb_id" int4,
"cell_id" int4,
"event_type" varchar COLLATE "default",
"abnormal_type" int4,
"abnormal_reason" int4,
"abnormal_reason_count" int8,
"created_time" timestamp(6) DEFAULT now()
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for gem_s1_mme_kpi_5m_statistics
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_s1_mme_kpi_5m_statistics";
CREATE TABLE "public"."gem_s1_mme_kpi_5m_statistics" (
"id" varchar COLLATE "default" DEFAULT next_id() NOT NULL,
"whole_network" varchar COLLATE "default",
"mme_group_id" varchar COLLATE "default",
"mme_code" varchar COLLATE "default",
"tac" varchar COLLATE "default",
"enodeb_id" varchar COLLATE "default",
"cell_id" varchar COLLATE "default",
"statistical_time" timestamp(6) NOT NULL,
"created_time" timestamp(6) DEFAULT now(),
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
"paging_failure_casue" varchar COLLATE "default",
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
"error_indication_request" varchar COLLATE "default",
"error_indication_cause" varchar COLLATE "default",
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
"csfb_original_authentication_success" int8,
"csfb_original_authentication_timedelay" int8,
"csfb_original_security_request" int8,
"csfb_original_security_success" int8,
"csfb_original_security_timedelay" int8,
"csfb_terminal_request" int8,
"csfb_terminal_success" int8,
"csfb_terminal_failure" int8,
"csfb_terminal_authentication_request" int8,
"csfb_terminal_authentication_success" int8,
"csfb_terminal_authentication_timedelay" int8,
"csfb_terminal_security_request" int8,
"csfb_terminal_security_success" int8,
"csfb_terminal_security_timedelay" int8,
"csfb_emergency_request" int8,
"csfb_emergency_success" int8,
"csfb_emergency_failure" int8
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for gem_s11_event_5m_statistics_by_imsi
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_s11_event_5m_statistics_by_imsi";
CREATE TABLE "public"."gem_s11_event_5m_statistics_by_imsi" (
"statistical_time" timestamp(6),
"imsi" text COLLATE "default",
"msisdn" text COLLATE "default",
"event_type" varchar(8) COLLATE "default",
"request_count" int4 NOT NULL,
"success_count" int4 NOT NULL,
"abnormal_count" int4 NOT NULL,
"response_delay_time" int8,
"no_resp_count" int4 NOT NULL,
"created_time" timestamp(6) DEFAULT now()
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for gem_s11_kpi_1d_failure_statistics
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_s11_kpi_1d_failure_statistics";
CREATE TABLE "public"."gem_s11_kpi_1d_failure_statistics" (
"statistical_time" timestamp(6),
"whole_network" varchar COLLATE "default",
"mme_code" varchar COLLATE "default",
"sgw" varchar COLLATE "default",
"pgw" varchar COLLATE "default",
"tac" varchar COLLATE "default",
"cell_id" varchar COLLATE "default",
"apn" varchar COLLATE "default",
"event_type" varchar COLLATE "default",
"abnormal_type" int4,
"abnormal_reason" int4,
"abnormal_reason_count" int8,
"created_time" timestamp(6) DEFAULT now()
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for gem_s11_kpi_1d_statistics
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_s11_kpi_1d_statistics";
CREATE TABLE "public"."gem_s11_kpi_1d_statistics" (
"id" varchar COLLATE "default" DEFAULT next_id() NOT NULL,
"whole_network" varchar COLLATE "default",
"mme_code" varchar COLLATE "default",
"sgw" varchar COLLATE "default",
"pgw" varchar COLLATE "default",
"tac" varchar COLLATE "default",
"cell_id" varchar COLLATE "default",
"apn" varchar COLLATE "default",
"statistical_time" timestamp(6),
"created_time" timestamp(6) DEFAULT now() NOT NULL,
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
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for gem_s11_kpi_1h_failure_statistics
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_s11_kpi_1h_failure_statistics";
CREATE TABLE "public"."gem_s11_kpi_1h_failure_statistics" (
"statistical_time" timestamp(6),
"whole_network" varchar COLLATE "default",
"mme_code" varchar COLLATE "default",
"sgw" varchar COLLATE "default",
"pgw" varchar COLLATE "default",
"tac" varchar COLLATE "default",
"cell_id" varchar COLLATE "default",
"apn" varchar COLLATE "default",
"event_type" varchar COLLATE "default",
"abnormal_type" int4,
"abnormal_reason" int4,
"abnormal_reason_count" int8,
"created_time" timestamp(6) DEFAULT now()
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for gem_s11_kpi_1h_statistics
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_s11_kpi_1h_statistics";
CREATE TABLE "public"."gem_s11_kpi_1h_statistics" (
"id" varchar COLLATE "default" DEFAULT next_id() NOT NULL,
"whole_network" varchar COLLATE "default",
"mme_code" varchar COLLATE "default",
"sgw" varchar COLLATE "default",
"pgw" varchar COLLATE "default",
"tac" varchar COLLATE "default",
"cell_id" varchar COLLATE "default",
"apn" varchar COLLATE "default",
"statistical_time" timestamp(6),
"created_time" timestamp(6) DEFAULT now() NOT NULL,
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
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for gem_s11_kpi_5m_failure_statistics
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_s11_kpi_5m_failure_statistics";
CREATE TABLE "public"."gem_s11_kpi_5m_failure_statistics" (
"statistical_time" timestamp(6),
"whole_network" varchar COLLATE "default",
"mme_code" varchar COLLATE "default",
"sgw" varchar COLLATE "default",
"pgw" varchar COLLATE "default",
"tac" varchar COLLATE "default",
"cell_id" varchar COLLATE "default",
"apn" varchar COLLATE "default",
"event_type" varchar COLLATE "default",
"abnormal_type" int4,
"abnormal_reason" int4,
"abnormal_reason_count" int8,
"created_time" timestamp(6) DEFAULT now()
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for gem_s11_kpi_5m_statistics
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_s11_kpi_5m_statistics";
CREATE TABLE "public"."gem_s11_kpi_5m_statistics" (
"id" varchar COLLATE "default" DEFAULT next_id() NOT NULL,
"whole_network" varchar COLLATE "default",
"mme_code" varchar COLLATE "default",
"sgw" varchar COLLATE "default",
"pgw" varchar COLLATE "default",
"tac" varchar COLLATE "default",
"cell_id" varchar COLLATE "default",
"apn" varchar COLLATE "default",
"statistical_time" timestamp(6) NOT NULL,
"created_time" timestamp(6) DEFAULT now() NOT NULL,
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
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for gem_s1u_bad_quality_apns
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_s1u_bad_quality_apns";
CREATE TABLE "public"."gem_s1u_bad_quality_apns" (
"id" varchar COLLATE "default" DEFAULT next_id() NOT NULL,
"statistical_time" timestamp(6),
"apn" varchar COLLATE "default",
"speed" varchar COLLATE "default",
"success_rate" varchar COLLATE "default",
"http_dl_avg_speed_all" varchar COLLATE "default",
"created_time" timestamp(6) DEFAULT now()
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."gem_s1u_bad_quality_apns" IS 'S1U质差APN表';
COMMENT ON COLUMN "public"."gem_s1u_bad_quality_apns"."statistical_time" IS '统计时间点';
COMMENT ON COLUMN "public"."gem_s1u_bad_quality_apns"."apn" IS '接入点名';
COMMENT ON COLUMN "public"."gem_s1u_bad_quality_apns"."speed" IS '速率';

-- ----------------------------
-- Table structure for gem_s1u_bad_quality_applications
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_s1u_bad_quality_applications";
CREATE TABLE "public"."gem_s1u_bad_quality_applications" (
"id" varchar COLLATE "default" DEFAULT next_id() NOT NULL,
"statistical_time" timestamp(6),
"intwruleid" varchar COLLATE "default",
"speed" varchar COLLATE "default",
"success_rate" varchar COLLATE "default",
"created_time" timestamp(6) DEFAULT now()
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."gem_s1u_bad_quality_applications" IS 'S1U质差业务表';

-- ----------------------------
-- Table structure for gem_s1u_bad_quality_enodeb
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_s1u_bad_quality_enodeb";
CREATE TABLE "public"."gem_s1u_bad_quality_enodeb" (
"id" varchar COLLATE "default" DEFAULT next_id() NOT NULL,
"statistical_time" timestamp(6),
"enb_sgsn_ip_add" varchar COLLATE "default",
"speed" varchar COLLATE "default",
"success_rate" varchar COLLATE "default",
"http_dl_avg_speed_all" varchar COLLATE "default",
"created_time" timestamp(6) DEFAULT now()
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."gem_s1u_bad_quality_enodeb" IS 'S1U质差enb表';

-- ----------------------------
-- Table structure for gem_s1u_bad_quality_ipv4
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_s1u_bad_quality_ipv4";
CREATE TABLE "public"."gem_s1u_bad_quality_ipv4" (
"id" varchar COLLATE "default" DEFAULT next_id() NOT NULL,
"statistical_time" timestamp(6),
"app_server_ipv4" varchar COLLATE "default",
"speed" varchar COLLATE "default",
"success_rate" varchar COLLATE "default",
"http_dl_avg_speed_all" varchar COLLATE "default",
"created_time" timestamp(6) DEFAULT now()
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."gem_s1u_bad_quality_ipv4" IS 'S1U质差IP表';

-- ----------------------------
-- Table structure for gem_s1u_bad_quality_pre_ipv4
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_s1u_bad_quality_pre_ipv4";
CREATE TABLE "public"."gem_s1u_bad_quality_pre_ipv4" (
"id" varchar COLLATE "default" DEFAULT next_id() NOT NULL,
"statistical_time" timestamp(6),
"pre_user_ipv4" varchar COLLATE "default",
"speed" varchar COLLATE "default",
"success_rate" varchar COLLATE "default",
"http_dl_avg_speed_all" varchar COLLATE "default",
"created_time" timestamp(6) DEFAULT now()
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."gem_s1u_bad_quality_pre_ipv4" IS '质差用户IP段表';

-- ----------------------------
-- Table structure for gem_s1u_bad_quality_sgw
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_s1u_bad_quality_sgw";
CREATE TABLE "public"."gem_s1u_bad_quality_sgw" (
"id" varchar COLLATE "default" DEFAULT next_id() NOT NULL,
"statistical_time" timestamp(6),
"sgw_ggsn_ip_add" varchar COLLATE "default",
"speed" varchar COLLATE "default",
"success_rate" varchar COLLATE "default",
"http_dl_avg_speed_all" varchar COLLATE "default",
"created_time" timestamp(6) DEFAULT now()
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."gem_s1u_bad_quality_sgw" IS 'S1U质差SGW表';

-- ----------------------------
-- Table structure for gem_s1u_bad_quality_terminal_applications
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_s1u_bad_quality_terminal_applications";
CREATE TABLE "public"."gem_s1u_bad_quality_terminal_applications" (
"id" varchar COLLATE "default" DEFAULT next_id() NOT NULL,
"statistical_time" timestamp(6),
"intwruleid" varchar COLLATE "default",
"imei" varchar COLLATE "default",
"speed" varchar COLLATE "default",
"success_rate" varchar COLLATE "default",
"http_dl_avg_speed_all" float8,
"created_time" timestamp(6)
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."gem_s1u_bad_quality_terminal_applications" IS 'S1U终端表现质差业务表';

-- ----------------------------
-- Table structure for gem_s1u_bad_quality_terminal_ipv4
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_s1u_bad_quality_terminal_ipv4";
CREATE TABLE "public"."gem_s1u_bad_quality_terminal_ipv4" (
"id" varchar COLLATE "default" DEFAULT next_id() NOT NULL,
"statistical_time" timestamp(6),
"app_server_ipv4" varchar COLLATE "default",
"imei" varchar COLLATE "default",
"speed" varchar COLLATE "default",
"success_rate" varchar COLLATE "default",
"http_dl_avg_speed_all" varchar COLLATE "default",
"created_time" timestamp(6) DEFAULT now()
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."gem_s1u_bad_quality_terminal_ipv4" IS 'S1U终端表现质差业务IP表';

-- ----------------------------
-- Table structure for gem_s1u_bad_quality_terminals
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_s1u_bad_quality_terminals";
CREATE TABLE "public"."gem_s1u_bad_quality_terminals" (
"id" varchar COLLATE "default" DEFAULT next_id() NOT NULL,
"statistical_time" timestamp(6),
"imei" varchar COLLATE "default",
"speed" varchar COLLATE "default",
"success_rate" varchar COLLATE "default",
"created_time" timestamp(6) DEFAULT now()
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."gem_s1u_bad_quality_terminals" IS 'S1U质差终端表';

-- ----------------------------
-- Table structure for gem_s1u_bad_quality_uri_main
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_s1u_bad_quality_uri_main";
CREATE TABLE "public"."gem_s1u_bad_quality_uri_main" (
"id" varchar COLLATE "default" DEFAULT next_id() NOT NULL,
"statistical_time" timestamp(6),
"host" varchar COLLATE "default",
"speed" varchar COLLATE "default",
"success_rate" varchar COLLATE "default",
"http_dl_avg_speed_all" varchar COLLATE "default",
"created_time" timestamp(6) DEFAULT now()
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."gem_s1u_bad_quality_uri_main" IS 'S1U质差uri_main表';

-- ----------------------------
-- Table structure for gem_s1u_dns_event_5m_statistics_by_imsi
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_s1u_dns_event_5m_statistics_by_imsi";
CREATE TABLE "public"."gem_s1u_dns_event_5m_statistics_by_imsi" (
"statistical_time" timestamp(6),
"imsi" text COLLATE "default",
"msisdn" text COLLATE "default",
"event_type" varchar COLLATE "default",
"request_count" int4,
"success_count" int4,
"abnormal_count" int4,
"response_delay_time" int8,
"ul_ip_packet_count" int4,
"dl_ip_packet_count" int4,
"ul_data_sum" float4,
"dl_data_sum" float4,
"no_resp_count" int4,
"created_time" timestamp(6) DEFAULT now()
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for gem_s1u_dns_kpi_1d_failure_statistics
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_s1u_dns_kpi_1d_failure_statistics";
CREATE TABLE "public"."gem_s1u_dns_kpi_1d_failure_statistics" (
"statistical_time" timestamp(6),
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

-- ----------------------------
-- Table structure for gem_s1u_dns_kpi_1d_statistics
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_s1u_dns_kpi_1d_statistics";
CREATE TABLE "public"."gem_s1u_dns_kpi_1d_statistics" (
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
"statistical_time" timestamp(6),
"created_time" timestamp(6) DEFAULT now(),
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
"dns_timedelay" int8
)
WITH (OIDS=FALSE)

;
COMMENT ON COLUMN "public"."gem_s1u_dns_kpi_1d_statistics"."business_type" IS '业务大类';
COMMENT ON COLUMN "public"."gem_s1u_dns_kpi_1d_statistics"."detail_business" IS '业务小类';
COMMENT ON COLUMN "public"."gem_s1u_dns_kpi_1d_statistics"."tcp_up_link_request_count" IS 'TCP上行连接请求次数';
COMMENT ON COLUMN "public"."gem_s1u_dns_kpi_1d_statistics"."tcp_up_link_success_count" IS 'TCP上行连接成功次数';
COMMENT ON COLUMN "public"."gem_s1u_dns_kpi_1d_statistics"."tcp_up_link_success_ratio" IS 'TCP上行连接成功率';
COMMENT ON COLUMN "public"."gem_s1u_dns_kpi_1d_statistics"."tcp_up_link_timedelay" IS 'TCP上行连接时延';
COMMENT ON COLUMN "public"."gem_s1u_dns_kpi_1d_statistics"."tcp_dl_link_request_count" IS 'TCP下行连接请求次数';
COMMENT ON COLUMN "public"."gem_s1u_dns_kpi_1d_statistics"."tcp_dl_link_success_count" IS 'TCP下行连接成功次数';
COMMENT ON COLUMN "public"."gem_s1u_dns_kpi_1d_statistics"."tcp_dl_link_success_ratio" IS 'TCP下行连接成功率';
COMMENT ON COLUMN "public"."gem_s1u_dns_kpi_1d_statistics"."tcp_dl_link_timedelay" IS 'TCP下行连接时延';
COMMENT ON COLUMN "public"."gem_s1u_dns_kpi_1d_statistics"."tcp_link_success_ratio" IS 'TCP连接成功率';
COMMENT ON COLUMN "public"."gem_s1u_dns_kpi_1d_statistics"."tcp_link_timedelay" IS 'TCP连接时延';
COMMENT ON COLUMN "public"."gem_s1u_dns_kpi_1d_statistics"."dns_request_count" IS 'DNS解析请求次数';
COMMENT ON COLUMN "public"."gem_s1u_dns_kpi_1d_statistics"."dns_failure_count" IS 'DNS解析失败次数';
COMMENT ON COLUMN "public"."gem_s1u_dns_kpi_1d_statistics"."dns_system_success_count" IS 'DNS系统成功次数';
COMMENT ON COLUMN "public"."gem_s1u_dns_kpi_1d_statistics"."dns_service_success_count" IS 'DNS业务成功次数';
COMMENT ON COLUMN "public"."gem_s1u_dns_kpi_1d_statistics"."dns_no_response_count" IS 'DNS解析无响应次数';
COMMENT ON COLUMN "public"."gem_s1u_dns_kpi_1d_statistics"."dns_failure_ratio" IS 'DNS解析失败率';
COMMENT ON COLUMN "public"."gem_s1u_dns_kpi_1d_statistics"."dns_system_success_ratio" IS 'DNS解析系统成功率';
COMMENT ON COLUMN "public"."gem_s1u_dns_kpi_1d_statistics"."dns_service_success_ratio" IS 'DNS解析业务成功率';
COMMENT ON COLUMN "public"."gem_s1u_dns_kpi_1d_statistics"."dns_timedelay" IS 'DNS解析平均时延';

-- ----------------------------
-- Table structure for gem_s1u_dns_kpi_1h_failure_statistics
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_s1u_dns_kpi_1h_failure_statistics";
CREATE TABLE "public"."gem_s1u_dns_kpi_1h_failure_statistics" (
"statistical_time" timestamp(6),
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

-- ----------------------------
-- Table structure for gem_s1u_dns_kpi_1h_statistics
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_s1u_dns_kpi_1h_statistics";
CREATE TABLE "public"."gem_s1u_dns_kpi_1h_statistics" (
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
"statistical_time" timestamp(6),
"created_time" timestamp(6) DEFAULT now(),
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
"dns_timedelay" int8
)
WITH (OIDS=FALSE)

;
COMMENT ON COLUMN "public"."gem_s1u_dns_kpi_1h_statistics"."business_type" IS '业务大类';
COMMENT ON COLUMN "public"."gem_s1u_dns_kpi_1h_statistics"."detail_business" IS '业务小类';
COMMENT ON COLUMN "public"."gem_s1u_dns_kpi_1h_statistics"."tcp_up_link_request_count" IS 'TCP上行连接请求次数';
COMMENT ON COLUMN "public"."gem_s1u_dns_kpi_1h_statistics"."tcp_up_link_success_count" IS 'TCP上行连接成功次数';
COMMENT ON COLUMN "public"."gem_s1u_dns_kpi_1h_statistics"."tcp_up_link_success_ratio" IS 'TCP上行连接成功率';
COMMENT ON COLUMN "public"."gem_s1u_dns_kpi_1h_statistics"."tcp_up_link_timedelay" IS 'TCP上行连接时延';
COMMENT ON COLUMN "public"."gem_s1u_dns_kpi_1h_statistics"."tcp_dl_link_request_count" IS 'TCP下行连接请求次数';
COMMENT ON COLUMN "public"."gem_s1u_dns_kpi_1h_statistics"."tcp_dl_link_success_count" IS 'TCP下行连接成功次数';
COMMENT ON COLUMN "public"."gem_s1u_dns_kpi_1h_statistics"."tcp_dl_link_success_ratio" IS 'TCP下行连接成功率';
COMMENT ON COLUMN "public"."gem_s1u_dns_kpi_1h_statistics"."tcp_dl_link_timedelay" IS 'TCP下行连接时延';
COMMENT ON COLUMN "public"."gem_s1u_dns_kpi_1h_statistics"."tcp_link_success_ratio" IS 'TCP连接成功率';
COMMENT ON COLUMN "public"."gem_s1u_dns_kpi_1h_statistics"."tcp_link_timedelay" IS 'TCP连接时延';
COMMENT ON COLUMN "public"."gem_s1u_dns_kpi_1h_statistics"."dns_request_count" IS 'DNS解析请求次数';
COMMENT ON COLUMN "public"."gem_s1u_dns_kpi_1h_statistics"."dns_failure_count" IS 'DNS解析失败次数';
COMMENT ON COLUMN "public"."gem_s1u_dns_kpi_1h_statistics"."dns_system_success_count" IS 'DNS系统成功次数';
COMMENT ON COLUMN "public"."gem_s1u_dns_kpi_1h_statistics"."dns_service_success_count" IS 'DNS业务成功次数';
COMMENT ON COLUMN "public"."gem_s1u_dns_kpi_1h_statistics"."dns_no_response_count" IS 'DNS解析无响应次数';
COMMENT ON COLUMN "public"."gem_s1u_dns_kpi_1h_statistics"."dns_failure_ratio" IS 'DNS解析失败率';
COMMENT ON COLUMN "public"."gem_s1u_dns_kpi_1h_statistics"."dns_system_success_ratio" IS 'DNS解析系统成功率';
COMMENT ON COLUMN "public"."gem_s1u_dns_kpi_1h_statistics"."dns_service_success_ratio" IS 'DNS解析业务成功率';
COMMENT ON COLUMN "public"."gem_s1u_dns_kpi_1h_statistics"."dns_timedelay" IS 'DNS解析平均时延';

-- ----------------------------
-- Table structure for gem_s1u_dns_kpi_5m_failure_statistics
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_s1u_dns_kpi_5m_failure_statistics";
CREATE TABLE "public"."gem_s1u_dns_kpi_5m_failure_statistics" (
"statistical_time" timestamp(6),
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

-- ----------------------------
-- Table structure for gem_s1u_dns_kpi_5m_statistics
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_s1u_dns_kpi_5m_statistics";
CREATE TABLE "public"."gem_s1u_dns_kpi_5m_statistics" (
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
"statistical_time" timestamp(6),
"created_time" timestamp(6) DEFAULT now(),
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
"dns_timedelay" int8
)
WITH (OIDS=FALSE)

;
COMMENT ON COLUMN "public"."gem_s1u_dns_kpi_5m_statistics"."business_type" IS '业务大类';
COMMENT ON COLUMN "public"."gem_s1u_dns_kpi_5m_statistics"."detail_business" IS '业务小类';
COMMENT ON COLUMN "public"."gem_s1u_dns_kpi_5m_statistics"."tcp_up_link_request_count" IS 'TCP上行连接请求次数';
COMMENT ON COLUMN "public"."gem_s1u_dns_kpi_5m_statistics"."tcp_up_link_success_count" IS 'TCP上行连接成功次数';
COMMENT ON COLUMN "public"."gem_s1u_dns_kpi_5m_statistics"."tcp_up_link_success_ratio" IS 'TCP上行连接成功率';
COMMENT ON COLUMN "public"."gem_s1u_dns_kpi_5m_statistics"."tcp_up_link_timedelay" IS 'TCP上行连接时延';
COMMENT ON COLUMN "public"."gem_s1u_dns_kpi_5m_statistics"."tcp_dl_link_request_count" IS 'TCP下行连接请求次数';
COMMENT ON COLUMN "public"."gem_s1u_dns_kpi_5m_statistics"."tcp_dl_link_success_count" IS 'TCP下行连接成功次数';
COMMENT ON COLUMN "public"."gem_s1u_dns_kpi_5m_statistics"."tcp_dl_link_success_ratio" IS 'TCP下行连接成功率';
COMMENT ON COLUMN "public"."gem_s1u_dns_kpi_5m_statistics"."tcp_dl_link_timedelay" IS 'TCP下行连接时延';
COMMENT ON COLUMN "public"."gem_s1u_dns_kpi_5m_statistics"."tcp_link_success_ratio" IS 'TCP连接成功率';
COMMENT ON COLUMN "public"."gem_s1u_dns_kpi_5m_statistics"."tcp_link_timedelay" IS 'TCP连接时延';
COMMENT ON COLUMN "public"."gem_s1u_dns_kpi_5m_statistics"."dns_request_count" IS 'DNS解析请求次数';
COMMENT ON COLUMN "public"."gem_s1u_dns_kpi_5m_statistics"."dns_failure_count" IS 'DNS解析失败次数';
COMMENT ON COLUMN "public"."gem_s1u_dns_kpi_5m_statistics"."dns_system_success_count" IS 'DNS系统成功次数';
COMMENT ON COLUMN "public"."gem_s1u_dns_kpi_5m_statistics"."dns_service_success_count" IS 'DNS业务成功次数';
COMMENT ON COLUMN "public"."gem_s1u_dns_kpi_5m_statistics"."dns_no_response_count" IS 'DNS解析无响应次数';
COMMENT ON COLUMN "public"."gem_s1u_dns_kpi_5m_statistics"."dns_failure_ratio" IS 'DNS解析失败率';
COMMENT ON COLUMN "public"."gem_s1u_dns_kpi_5m_statistics"."dns_system_success_ratio" IS 'DNS解析系统成功率';
COMMENT ON COLUMN "public"."gem_s1u_dns_kpi_5m_statistics"."dns_service_success_ratio" IS 'DNS解析业务成功率';
COMMENT ON COLUMN "public"."gem_s1u_dns_kpi_5m_statistics"."dns_timedelay" IS 'DNS解析平均时延';

-- ----------------------------
-- Table structure for gem_s1u_event_5m_statistics_by_imsi
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_s1u_event_5m_statistics_by_imsi";
CREATE TABLE "public"."gem_s1u_event_5m_statistics_by_imsi" (
"statistical_time" timestamp(6),
"imsi" varchar COLLATE "default",
"msisdn" varchar COLLATE "default",
"event_type" varchar COLLATE "default",
"request_count" int4,
"success_count" int4,
"abnormal_count" int4,
"response_delay_time" int8,
"no_resp_count" int4,
"ul_ip_packet_count" int4,
"dl_ip_packet_count" int4,
"ul_data_sum" float8,
"dl_data_sum" float8,
"created_time" timestamp(6) DEFAULT now()
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for gem_s1u_http_event_5m_statistics_by_imsi
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_s1u_http_event_5m_statistics_by_imsi";
CREATE TABLE "public"."gem_s1u_http_event_5m_statistics_by_imsi" (
"statistical_time" timestamp(6),
"imsi" text COLLATE "default",
"msisdn" text COLLATE "default",
"event_type" varchar COLLATE "default",
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
"created_time" timestamp(6) DEFAULT now()
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for gem_s1u_http_kpi_1d_failure_statistics
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_s1u_http_kpi_1d_failure_statistics";
CREATE TABLE "public"."gem_s1u_http_kpi_1d_failure_statistics" (
"statistical_time" timestamp(6),
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

-- ----------------------------
-- Table structure for gem_s1u_http_kpi_1d_statistics
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_s1u_http_kpi_1d_statistics";
CREATE TABLE "public"."gem_s1u_http_kpi_1d_statistics" (
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
"statistical_time" timestamp(6),
"created_time" timestamp(6) DEFAULT now(),
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
"rtsp_playing_waiting_time" int8,
"ul_ip_packet" int8,
"dl_ip_packet" int8,
"district" varchar COLLATE "default",
"session_count" int8
)
WITH (OIDS=FALSE)

;
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_1d_statistics"."business_type" IS '业务大类';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_1d_statistics"."detail_business" IS '业务小类';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_1d_statistics"."tcp_up_link_request_count" IS 'TCP上行连接请求次数';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_1d_statistics"."tcp_up_link_success_count" IS 'TCP上行连接成功次数';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_1d_statistics"."tcp_up_link_success_ratio" IS 'TCP上行连接成功率';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_1d_statistics"."tcp_up_link_timedelay" IS 'TCP上行连接时延';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_1d_statistics"."tcp_dl_link_request_count" IS 'TCP下行连接请求次数';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_1d_statistics"."tcp_dl_link_success_count" IS 'TCP下行连接成功次数';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_1d_statistics"."tcp_dl_link_success_ratio" IS 'TCP下行连接成功率';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_1d_statistics"."tcp_dl_link_timedelay" IS 'TCP下行连接时延';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_1d_statistics"."tcp_link_success_ratio" IS 'TCP连接成功率';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_1d_statistics"."tcp_link_timedelay" IS 'TCP连接时延';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_1d_statistics"."up_tcp_retrans_count" IS '上行TCP重传包数';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_1d_statistics"."up_tcp_retrans_ratio" IS '上行TCP重传率';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_1d_statistics"."dl_tcp_retrans_count" IS '下行TCP重传包数';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_1d_statistics"."dl_tcp_retrans_ratio" IS '下行TCP重传率';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_1d_statistics"."up_ip_packet_slicing_count" IS '上行IP包分片数';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_1d_statistics"."up_ip_packet_slicing_ratio" IS '上行IP包分片率';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_1d_statistics"."dl_ip_packet_slicing_count" IS '下行IP包分片数';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_1d_statistics"."dl_ip_packet_slicing_ratio" IS '下行IP包分片率';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_1d_statistics"."up_tcp_disorder_count" IS '上行TCP乱序包数';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_1d_statistics"."up_tcp_disorder_ratio" IS '上行TCP乱序率';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_1d_statistics"."dl_tcp_disorder_count" IS '下行TCP乱序包数';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_1d_statistics"."dl_tcp_disorder_ratio" IS '下行TCP乱序率';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_1d_statistics"."tcp_dropping_count" IS 'TCP掉线次数';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_1d_statistics"."tcp_dropping_ratio" IS 'TCP掉线率';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_1d_statistics"."get_request_count" IS 'GET请求次数';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_1d_statistics"."get_success_count" IS 'GET请求成功次数';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_1d_statistics"."get_success_ratio" IS 'GET请求成功率';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_1d_statistics"."get_resp_timedelay" IS 'GET响应时延';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_1d_statistics"."post_request_count" IS 'POST请求次数';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_1d_statistics"."post_success_count" IS 'POST请求成功次数';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_1d_statistics"."post_success_ratio" IS 'POST请求成功率';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_1d_statistics"."post_resp_timedelay" IS 'POST响应时延';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_1d_statistics"."http_request_count" IS 'HTTP业务请求次数';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_1d_statistics"."http_success_count" IS 'HTTP业务请求成功次数';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_1d_statistics"."http_success_ratio" IS 'HTTP业务请求成功率';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_1d_statistics"."http_resp_timedelay" IS 'HTTP业务响应时延';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_1d_statistics"."http_dlup_data_more_than_500k" IS 'HTTP业务流量(>500K)';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_1d_statistics"."http_timedelay_more_than_500k" IS 'HTTP业务时延(>500K)';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_1d_statistics"."http_speed_more_than_500k" IS 'HTTP业务速率(>500K)';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_1d_statistics"."rtsp_playing_request_count" IS '流媒体播放请求次数';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_1d_statistics"."rtsp_playing_success_count" IS '流媒体播放成功次数';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_1d_statistics"."rtsp_playing_success_ratio" IS '流媒体播放成功率';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_1d_statistics"."rtsp_playing_waiting_time" IS '流媒体播放等待时长';

-- ----------------------------
-- Table structure for gem_s1u_http_kpi_1h_failure_statistics
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_s1u_http_kpi_1h_failure_statistics";
CREATE TABLE "public"."gem_s1u_http_kpi_1h_failure_statistics" (
"statistical_time" timestamp(6),
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

-- ----------------------------
-- Table structure for gem_s1u_http_kpi_1h_statistics
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_s1u_http_kpi_1h_statistics";
CREATE TABLE "public"."gem_s1u_http_kpi_1h_statistics" (
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
"statistical_time" timestamp(6),
"created_time" timestamp(6) DEFAULT now(),
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
"rtsp_playing_waiting_time" int8,
"ul_ip_packet" int8,
"dl_ip_packet" int8,
"http_resp_total_timedelay" int8,
"http_resp_success_count" int8,
"http_dl_data" int8,
"app_store_success_count_less_than_500kbps" int8,
"app_store_success_count" int8,
"page_show_more_than_5s_count" int8,
"page_merge_count" int8,
"page_show_success_count" int8,
"page_show_time" int8
)
WITH (OIDS=FALSE)

;
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_1h_statistics"."business_type" IS '业务大类';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_1h_statistics"."detail_business" IS '业务小类';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_1h_statistics"."tcp_up_link_request_count" IS 'TCP上行连接请求次数';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_1h_statistics"."tcp_up_link_success_count" IS 'TCP上行连接成功次数';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_1h_statistics"."tcp_up_link_success_ratio" IS 'TCP上行连接成功率';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_1h_statistics"."tcp_up_link_timedelay" IS 'TCP上行连接时延';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_1h_statistics"."tcp_dl_link_request_count" IS 'TCP下行连接请求次数';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_1h_statistics"."tcp_dl_link_success_count" IS 'TCP下行连接成功次数';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_1h_statistics"."tcp_dl_link_success_ratio" IS 'TCP下行连接成功率';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_1h_statistics"."tcp_dl_link_timedelay" IS 'TCP下行连接时延';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_1h_statistics"."tcp_link_success_ratio" IS 'TCP连接成功率';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_1h_statistics"."tcp_link_timedelay" IS 'TCP连接时延';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_1h_statistics"."up_tcp_retrans_count" IS '上行TCP重传包数';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_1h_statistics"."up_tcp_retrans_ratio" IS '上行TCP重传率';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_1h_statistics"."dl_tcp_retrans_count" IS '下行TCP重传包数';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_1h_statistics"."dl_tcp_retrans_ratio" IS '下行TCP重传率';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_1h_statistics"."up_ip_packet_slicing_count" IS '上行IP包分片数';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_1h_statistics"."up_ip_packet_slicing_ratio" IS '上行IP包分片率';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_1h_statistics"."dl_ip_packet_slicing_count" IS '下行IP包分片数';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_1h_statistics"."dl_ip_packet_slicing_ratio" IS '下行IP包分片率';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_1h_statistics"."up_tcp_disorder_count" IS '上行TCP乱序包数';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_1h_statistics"."up_tcp_disorder_ratio" IS '上行TCP乱序率';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_1h_statistics"."dl_tcp_disorder_count" IS '下行TCP乱序包数';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_1h_statistics"."dl_tcp_disorder_ratio" IS '下行TCP乱序率';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_1h_statistics"."tcp_dropping_count" IS 'TCP掉线次数';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_1h_statistics"."tcp_dropping_ratio" IS 'TCP掉线率';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_1h_statistics"."get_request_count" IS 'GET请求次数';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_1h_statistics"."get_success_count" IS 'GET请求成功次数';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_1h_statistics"."get_success_ratio" IS 'GET请求成功率';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_1h_statistics"."get_resp_timedelay" IS 'GET响应时延';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_1h_statistics"."post_request_count" IS 'POST请求次数';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_1h_statistics"."post_success_count" IS 'POST请求成功次数';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_1h_statistics"."post_success_ratio" IS 'POST请求成功率';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_1h_statistics"."post_resp_timedelay" IS 'POST响应时延';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_1h_statistics"."http_request_count" IS 'HTTP业务请求次数';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_1h_statistics"."http_success_count" IS 'HTTP业务请求成功次数';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_1h_statistics"."http_success_ratio" IS 'HTTP业务请求成功率';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_1h_statistics"."http_resp_timedelay" IS 'HTTP业务响应时延';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_1h_statistics"."http_dlup_data_more_than_500k" IS 'HTTP业务流量(>500K)';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_1h_statistics"."http_timedelay_more_than_500k" IS 'HTTP业务时延(>500K)';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_1h_statistics"."http_speed_more_than_500k" IS 'HTTP业务速率(>500K)';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_1h_statistics"."rtsp_playing_request_count" IS '流媒体播放请求次数';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_1h_statistics"."rtsp_playing_success_count" IS '流媒体播放成功次数';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_1h_statistics"."rtsp_playing_success_ratio" IS '流媒体播放成功率';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_1h_statistics"."rtsp_playing_waiting_time" IS '流媒体播放等待时长';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_1h_statistics"."http_resp_total_timedelay" IS 'HTTP业务响应总时延';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_1h_statistics"."http_resp_success_count" IS 'http业务响应成功次数';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_1h_statistics"."http_dl_data" IS 'HTTP下行流量';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_1h_statistics"."app_store_success_count_less_than_500kbps" IS '应用商店500kbps以下的响应成功次数';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_1h_statistics"."app_store_success_count" IS '应用商店响应成功次数';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_1h_statistics"."page_show_more_than_5s_count" IS '网页显示时长5s以上的合成页面数量';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_1h_statistics"."page_merge_count" IS '合成页面数量';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_1h_statistics"."page_show_success_count" IS '网页显示成功的合成页面数量';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_1h_statistics"."page_show_time" IS '网页显示时长';
-- ----------------------------
-- Table structure for gem_s1u_http_kpi_5m_failure_statistics
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_s1u_http_kpi_5m_failure_statistics";
CREATE TABLE "public"."gem_s1u_http_kpi_5m_failure_statistics" (
"statistical_time" timestamp(6),
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

-- ----------------------------
-- Table structure for gem_s1u_http_kpi_5m_statistics
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_s1u_http_kpi_5m_statistics";
CREATE TABLE "public"."gem_s1u_http_kpi_5m_statistics" (
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
"statistical_time" timestamp(6),
"created_time" timestamp(6) DEFAULT now(),
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
"rtsp_playing_waiting_time" int8,
"ul_ip_packet" int8,
"dl_ip_packet" int8,
"district" varchar COLLATE "default",
"session_count" int8
)
WITH (OIDS=FALSE)

;
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_5m_statistics"."business_type" IS '业务大类';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_5m_statistics"."detail_business" IS '业务小类';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_5m_statistics"."tcp_up_link_request_count" IS 'TCP上行连接请求次数';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_5m_statistics"."tcp_up_link_success_count" IS 'TCP上行连接成功次数';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_5m_statistics"."tcp_up_link_success_ratio" IS 'TCP上行连接成功率';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_5m_statistics"."tcp_up_link_timedelay" IS 'TCP上行连接时延';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_5m_statistics"."tcp_dl_link_request_count" IS 'TCP下行连接请求次数';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_5m_statistics"."tcp_dl_link_success_count" IS 'TCP下行连接成功次数';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_5m_statistics"."tcp_dl_link_success_ratio" IS 'TCP下行连接成功率';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_5m_statistics"."tcp_dl_link_timedelay" IS 'TCP下行连接时延';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_5m_statistics"."tcp_link_success_ratio" IS 'TCP连接成功率';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_5m_statistics"."tcp_link_timedelay" IS 'TCP连接时延';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_5m_statistics"."up_tcp_retrans_count" IS '上行TCP重传包数';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_5m_statistics"."up_tcp_retrans_ratio" IS '上行TCP重传率';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_5m_statistics"."dl_tcp_retrans_count" IS '下行TCP重传包数';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_5m_statistics"."dl_tcp_retrans_ratio" IS '下行TCP重传率';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_5m_statistics"."up_ip_packet_slicing_count" IS '上行IP包分片数';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_5m_statistics"."up_ip_packet_slicing_ratio" IS '上行IP包分片率';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_5m_statistics"."dl_ip_packet_slicing_count" IS '下行IP包分片数';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_5m_statistics"."dl_ip_packet_slicing_ratio" IS '下行IP包分片率';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_5m_statistics"."up_tcp_disorder_count" IS '上行TCP乱序包数';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_5m_statistics"."up_tcp_disorder_ratio" IS '上行TCP乱序率';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_5m_statistics"."dl_tcp_disorder_count" IS '下行TCP乱序包数';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_5m_statistics"."dl_tcp_disorder_ratio" IS '下行TCP乱序率';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_5m_statistics"."tcp_dropping_count" IS 'TCP掉线次数';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_5m_statistics"."tcp_dropping_ratio" IS 'TCP掉线率';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_5m_statistics"."get_request_count" IS 'GET请求次数';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_5m_statistics"."get_success_count" IS 'GET请求成功次数';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_5m_statistics"."get_success_ratio" IS 'GET请求成功率';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_5m_statistics"."get_resp_timedelay" IS 'GET响应时延';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_5m_statistics"."post_request_count" IS 'POST请求次数';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_5m_statistics"."post_success_count" IS 'POST请求成功次数';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_5m_statistics"."post_success_ratio" IS 'POST请求成功率';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_5m_statistics"."post_resp_timedelay" IS 'POST响应时延';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_5m_statistics"."http_request_count" IS 'HTTP业务请求次数';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_5m_statistics"."http_success_count" IS 'HTTP业务请求成功次数';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_5m_statistics"."http_success_ratio" IS 'HTTP业务请求成功率';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_5m_statistics"."http_resp_timedelay" IS 'HTTP业务响应时延';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_5m_statistics"."http_dlup_data_more_than_500k" IS 'HTTP业务流量(>500K)';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_5m_statistics"."http_timedelay_more_than_500k" IS 'HTTP业务时延(>500K)';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_5m_statistics"."http_speed_more_than_500k" IS 'HTTP业务速率(>500K)';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_5m_statistics"."rtsp_playing_request_count" IS '流媒体播放请求次数';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_5m_statistics"."rtsp_playing_success_count" IS '流媒体播放成功次数';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_5m_statistics"."rtsp_playing_success_ratio" IS '流媒体播放成功率';
COMMENT ON COLUMN "public"."gem_s1u_http_kpi_5m_statistics"."rtsp_playing_waiting_time" IS '流媒体播放等待时长';

-- ----------------------------
-- Table structure for gem_s1u_im_kpi_1d_failure_statistics
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_s1u_im_kpi_1d_failure_statistics";
CREATE TABLE "public"."gem_s1u_im_kpi_1d_failure_statistics" (
"statistical_time" timestamp(6),
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

-- ----------------------------
-- Table structure for gem_s1u_im_kpi_1d_statistics
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_s1u_im_kpi_1d_statistics";
CREATE TABLE "public"."gem_s1u_im_kpi_1d_statistics" (
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
"statistical_time" timestamp(6),
"created_time" timestamp(6) DEFAULT now(),
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
WITH (OIDS=FALSE)

;
COMMENT ON COLUMN "public"."gem_s1u_im_kpi_1d_statistics"."business_type" IS '业务大类';
COMMENT ON COLUMN "public"."gem_s1u_im_kpi_1d_statistics"."detail_business" IS '业务小类';
COMMENT ON COLUMN "public"."gem_s1u_im_kpi_1d_statistics"."tcp_up_link_request_count" IS 'TCP上行连接请求次数';
COMMENT ON COLUMN "public"."gem_s1u_im_kpi_1d_statistics"."tcp_up_link_success_count" IS 'TCP上行连接成功次数';
COMMENT ON COLUMN "public"."gem_s1u_im_kpi_1d_statistics"."tcp_up_link_success_ratio" IS 'TCP上行连接成功率';
COMMENT ON COLUMN "public"."gem_s1u_im_kpi_1d_statistics"."tcp_up_link_timedelay" IS 'TCP上行连接时延';
COMMENT ON COLUMN "public"."gem_s1u_im_kpi_1d_statistics"."tcp_dl_link_request_count" IS 'TCP下行连接请求次数';
COMMENT ON COLUMN "public"."gem_s1u_im_kpi_1d_statistics"."tcp_dl_link_success_count" IS 'TCP下行连接成功次数';
COMMENT ON COLUMN "public"."gem_s1u_im_kpi_1d_statistics"."tcp_dl_link_success_ratio" IS 'TCP下行连接成功率';
COMMENT ON COLUMN "public"."gem_s1u_im_kpi_1d_statistics"."tcp_dl_link_timedelay" IS 'TCP下行连接时延';
COMMENT ON COLUMN "public"."gem_s1u_im_kpi_1d_statistics"."tcp_link_success_ratio" IS 'TCP连接成功率';
COMMENT ON COLUMN "public"."gem_s1u_im_kpi_1d_statistics"."tcp_link_timedelay" IS 'TCP连接时延';
COMMENT ON COLUMN "public"."gem_s1u_im_kpi_1d_statistics"."im_login_request_count" IS 'IM登陆请求次数';
COMMENT ON COLUMN "public"."gem_s1u_im_kpi_1d_statistics"."im_login_success_count" IS 'IM登陆成功次数';
COMMENT ON COLUMN "public"."gem_s1u_im_kpi_1d_statistics"."im_login_success_ratio" IS 'IM登陆成功率';
COMMENT ON COLUMN "public"."gem_s1u_im_kpi_1d_statistics"."im_login_timedelay" IS 'IM登陆时延';

-- ----------------------------
-- Table structure for gem_s1u_im_kpi_1h_failure_statistics
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_s1u_im_kpi_1h_failure_statistics";
CREATE TABLE "public"."gem_s1u_im_kpi_1h_failure_statistics" (
"statistical_time" timestamp(6),
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

-- ----------------------------
-- Table structure for gem_s1u_im_kpi_1h_statistics
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_s1u_im_kpi_1h_statistics";
CREATE TABLE "public"."gem_s1u_im_kpi_1h_statistics" (
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
"statistical_time" timestamp(6),
"created_time" timestamp(6) DEFAULT now(),
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
WITH (OIDS=FALSE)

;
COMMENT ON COLUMN "public"."gem_s1u_im_kpi_1h_statistics"."business_type" IS '业务大类';
COMMENT ON COLUMN "public"."gem_s1u_im_kpi_1h_statistics"."detail_business" IS '业务小类';
COMMENT ON COLUMN "public"."gem_s1u_im_kpi_1h_statistics"."tcp_up_link_request_count" IS 'TCP上行连接请求次数';
COMMENT ON COLUMN "public"."gem_s1u_im_kpi_1h_statistics"."tcp_up_link_success_count" IS 'TCP上行连接成功次数';
COMMENT ON COLUMN "public"."gem_s1u_im_kpi_1h_statistics"."tcp_up_link_success_ratio" IS 'TCP上行连接成功率';
COMMENT ON COLUMN "public"."gem_s1u_im_kpi_1h_statistics"."tcp_up_link_timedelay" IS 'TCP上行连接时延';
COMMENT ON COLUMN "public"."gem_s1u_im_kpi_1h_statistics"."tcp_dl_link_request_count" IS 'TCP下行连接请求次数';
COMMENT ON COLUMN "public"."gem_s1u_im_kpi_1h_statistics"."tcp_dl_link_success_count" IS 'TCP下行连接成功次数';
COMMENT ON COLUMN "public"."gem_s1u_im_kpi_1h_statistics"."tcp_dl_link_success_ratio" IS 'TCP下行连接成功率';
COMMENT ON COLUMN "public"."gem_s1u_im_kpi_1h_statistics"."tcp_dl_link_timedelay" IS 'TCP下行连接时延';
COMMENT ON COLUMN "public"."gem_s1u_im_kpi_1h_statistics"."tcp_link_success_ratio" IS 'TCP连接成功率';
COMMENT ON COLUMN "public"."gem_s1u_im_kpi_1h_statistics"."tcp_link_timedelay" IS 'TCP连接时延';
COMMENT ON COLUMN "public"."gem_s1u_im_kpi_1h_statistics"."im_login_request_count" IS 'IM登陆请求次数';
COMMENT ON COLUMN "public"."gem_s1u_im_kpi_1h_statistics"."im_login_success_count" IS 'IM登陆成功次数';
COMMENT ON COLUMN "public"."gem_s1u_im_kpi_1h_statistics"."im_login_success_ratio" IS 'IM登陆成功率';
COMMENT ON COLUMN "public"."gem_s1u_im_kpi_1h_statistics"."im_login_timedelay" IS 'IM登陆时延';

-- ----------------------------
-- Table structure for gem_s1u_im_kpi_5m_failure_statistics
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_s1u_im_kpi_5m_failure_statistics";
CREATE TABLE "public"."gem_s1u_im_kpi_5m_failure_statistics" (
"statistical_time" timestamp(6),
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

-- ----------------------------
-- Table structure for gem_s1u_im_kpi_5m_statistics
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_s1u_im_kpi_5m_statistics";
CREATE TABLE "public"."gem_s1u_im_kpi_5m_statistics" (
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
"statistical_time" timestamp(6),
"created_time" timestamp(6) DEFAULT now(),
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
WITH (OIDS=FALSE)

;
COMMENT ON COLUMN "public"."gem_s1u_im_kpi_5m_statistics"."business_type" IS '业务大类';
COMMENT ON COLUMN "public"."gem_s1u_im_kpi_5m_statistics"."detail_business" IS '业务小类';
COMMENT ON COLUMN "public"."gem_s1u_im_kpi_5m_statistics"."tcp_up_link_request_count" IS 'TCP上行连接请求次数';
COMMENT ON COLUMN "public"."gem_s1u_im_kpi_5m_statistics"."tcp_up_link_success_count" IS 'TCP上行连接成功次数';
COMMENT ON COLUMN "public"."gem_s1u_im_kpi_5m_statistics"."tcp_up_link_success_ratio" IS 'TCP上行连接成功率';
COMMENT ON COLUMN "public"."gem_s1u_im_kpi_5m_statistics"."tcp_up_link_timedelay" IS 'TCP上行连接时延';
COMMENT ON COLUMN "public"."gem_s1u_im_kpi_5m_statistics"."tcp_dl_link_request_count" IS 'TCP下行连接请求次数';
COMMENT ON COLUMN "public"."gem_s1u_im_kpi_5m_statistics"."tcp_dl_link_success_count" IS 'TCP下行连接成功次数';
COMMENT ON COLUMN "public"."gem_s1u_im_kpi_5m_statistics"."tcp_dl_link_success_ratio" IS 'TCP下行连接成功率';
COMMENT ON COLUMN "public"."gem_s1u_im_kpi_5m_statistics"."tcp_dl_link_timedelay" IS 'TCP下行连接时延';
COMMENT ON COLUMN "public"."gem_s1u_im_kpi_5m_statistics"."tcp_link_success_ratio" IS 'TCP连接成功率';
COMMENT ON COLUMN "public"."gem_s1u_im_kpi_5m_statistics"."tcp_link_timedelay" IS 'TCP连接时延';
COMMENT ON COLUMN "public"."gem_s1u_im_kpi_5m_statistics"."im_login_request_count" IS 'IM登陆请求次数';
COMMENT ON COLUMN "public"."gem_s1u_im_kpi_5m_statistics"."im_login_success_count" IS 'IM登陆成功次数';
COMMENT ON COLUMN "public"."gem_s1u_im_kpi_5m_statistics"."im_login_success_ratio" IS 'IM登陆成功率';
COMMENT ON COLUMN "public"."gem_s1u_im_kpi_5m_statistics"."im_login_timedelay" IS 'IM登陆时延';

-- ----------------------------
-- Table structure for gem_s6a_event_5m_statistics_by_imsi
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_s6a_event_5m_statistics_by_imsi";
CREATE TABLE "public"."gem_s6a_event_5m_statistics_by_imsi" (
"statistical_time" timestamp(6),
"imsi" text COLLATE "default",
"msisdn" text COLLATE "default",
"event_type" varchar(8) COLLATE "default",
"request_count" int4 NOT NULL,
"success_count" int4 NOT NULL,
"abnormal_count" int4 NOT NULL,
"response_delay_time" int8,
"no_resp_count" int4 NOT NULL,
"created_time" timestamp(6) DEFAULT now()
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for gem_s6a_kpi_1d_failure_statistics
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_s6a_kpi_1d_failure_statistics";
CREATE TABLE "public"."gem_s6a_kpi_1d_failure_statistics" (
"statistical_time" timestamp(6),
"whole_network" varchar COLLATE "default",
"mme_code" varchar COLLATE "default",
"hss" varchar COLLATE "default",
"event_type" varchar COLLATE "default",
"abnormal_type" int4,
"abnormal_reason" int4,
"abnormal_reason_count" int8,
"created_time" timestamp(6) DEFAULT now()
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for gem_s6a_kpi_1d_statistics
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_s6a_kpi_1d_statistics";
CREATE TABLE "public"."gem_s6a_kpi_1d_statistics" (
"id" varchar COLLATE "default" DEFAULT next_id() NOT NULL,
"whole_network" varchar COLLATE "default",
"mme_code" varchar COLLATE "default",
"hss" varchar COLLATE "default",
"statistical_time" timestamp(6),
"created_time" timestamp(6) DEFAULT now() NOT NULL,
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
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for gem_s6a_kpi_1h_failure_statistics
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_s6a_kpi_1h_failure_statistics";
CREATE TABLE "public"."gem_s6a_kpi_1h_failure_statistics" (
"statistical_time" timestamp(6),
"whole_network" varchar COLLATE "default",
"mme_code" varchar COLLATE "default",
"hss" varchar COLLATE "default",
"event_type" varchar COLLATE "default",
"abnormal_type" int4,
"abnormal_reason" int4,
"abnormal_reason_count" int8,
"created_time" timestamp(6) DEFAULT now()
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for gem_s6a_kpi_1h_statistics
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_s6a_kpi_1h_statistics";
CREATE TABLE "public"."gem_s6a_kpi_1h_statistics" (
"id" varchar COLLATE "default" DEFAULT next_id() NOT NULL,
"whole_network" varchar COLLATE "default",
"mme_code" varchar COLLATE "default",
"hss" varchar COLLATE "default",
"statistical_time" timestamp(6),
"created_time" timestamp(6) DEFAULT now() NOT NULL,
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
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for gem_s6a_kpi_5m_failure_statistics
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_s6a_kpi_5m_failure_statistics";
CREATE TABLE "public"."gem_s6a_kpi_5m_failure_statistics" (
"statistical_time" timestamp(6),
"whole_network" varchar COLLATE "default",
"mme_code" varchar COLLATE "default",
"hss" varchar COLLATE "default",
"event_type" varchar COLLATE "default",
"abnormal_type" int4,
"abnormal_reason" int4,
"abnormal_reason_count" int8,
"created_time" timestamp(6) DEFAULT now()
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for gem_s6a_kpi_5m_statistics
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_s6a_kpi_5m_statistics";
CREATE TABLE "public"."gem_s6a_kpi_5m_statistics" (
"id" varchar COLLATE "default" DEFAULT next_id() NOT NULL,
"whole_network" varchar COLLATE "default",
"mme_code" varchar COLLATE "default",
"hss" varchar COLLATE "default",
"statistical_time" timestamp(6),
"created_time" timestamp(6) DEFAULT now() NOT NULL,
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
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for gem_session_analysis_abnormal_reason
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_session_analysis_abnormal_reason";
CREATE TABLE "public"."gem_session_analysis_abnormal_reason" (
"id" varchar COLLATE "default" DEFAULT next_id() NOT NULL,
"network_interface" varchar(8) COLLATE "default" NOT NULL,
"procedure_type" varchar(8) COLLATE "default" NOT NULL,
"reject_cause" varchar(8) COLLATE "default",
"cause_type" varchar(8) COLLATE "default",
"failure_cause" varchar(8) COLLATE "default",
"linked_interface" varchar(8) COLLATE "default",
"linked_event_type" varchar(8) COLLATE "default",
"linked_failure_cause" varchar(8) COLLATE "default",
"reason" text COLLATE "default",
"description" text COLLATE "default"
)
WITH (OIDS=FALSE)

;
COMMENT ON COLUMN "public"."gem_session_analysis_abnormal_reason"."reason" IS '定界';

-- ----------------------------
-- Table structure for gem_session_analysis_indicators
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_session_analysis_indicators";
CREATE TABLE "public"."gem_session_analysis_indicators" (
"id" varchar COLLATE "default" DEFAULT next_id() NOT NULL,
"name" varchar COLLATE "default",
"value" varchar COLLATE "default",
"level" varchar COLLATE "default",
"parent_id" varchar COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for gem_session_failure_causes
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_session_failure_causes";
CREATE TABLE "public"."gem_session_failure_causes" (
"id" varchar COLLATE "default" DEFAULT next_id() NOT NULL,
"code" varchar COLLATE "default",
"description" varchar COLLATE "default",
"network_interface" varchar COLLATE "default",
"abnormal_type" varchar COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for gem_sgs_event_5m_statistics_by_imsi
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_sgs_event_5m_statistics_by_imsi";
CREATE TABLE "public"."gem_sgs_event_5m_statistics_by_imsi" (
"statistical_time" timestamp(6),
"imsi" text COLLATE "default",
"msisdn" text COLLATE "default",
"event_type" varchar(8) COLLATE "default",
"request_count" int4 NOT NULL,
"success_count" int4 NOT NULL,
"abnormal_count" int4 NOT NULL,
"response_delay_time" int8,
"no_resp_count" int4 NOT NULL,
"created_time" timestamp(6) DEFAULT now()
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for gem_sgs_kpi_1d_failure_statistics
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_sgs_kpi_1d_failure_statistics";
CREATE TABLE "public"."gem_sgs_kpi_1d_failure_statistics" (
"statistical_time" timestamp(6),
"whole_network" varchar COLLATE "default",
"mme_code" varchar COLLATE "default",
"msc" varchar COLLATE "default",
"event_type" varchar COLLATE "default",
"abnormal_type" int4,
"abnormal_reason" int4,
"abnormal_reason_count" int8,
"created_time" timestamp(6) DEFAULT now()
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for gem_sgs_kpi_1d_statistics
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_sgs_kpi_1d_statistics";
CREATE TABLE "public"."gem_sgs_kpi_1d_statistics" (
"id" varchar COLLATE "default" DEFAULT next_id() NOT NULL,
"whole_network" varchar COLLATE "default",
"mme_code" varchar COLLATE "default",
"msc" varchar COLLATE "default",
"statistical_time" timestamp(6),
"created_time" timestamp(6) DEFAULT now() NOT NULL,
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
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for gem_sgs_kpi_1h_failure_statistics
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_sgs_kpi_1h_failure_statistics";
CREATE TABLE "public"."gem_sgs_kpi_1h_failure_statistics" (
"statistical_time" timestamp(6),
"whole_network" varchar COLLATE "default",
"mme_code" varchar COLLATE "default",
"msc" varchar COLLATE "default",
"event_type" varchar COLLATE "default",
"abnormal_type" int4,
"abnormal_reason" int4,
"abnormal_reason_count" int8,
"created_time" timestamp(6) DEFAULT now()
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for gem_sgs_kpi_1h_statistics
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_sgs_kpi_1h_statistics";
CREATE TABLE "public"."gem_sgs_kpi_1h_statistics" (
"id" varchar COLLATE "default" DEFAULT next_id() NOT NULL,
"whole_network" varchar COLLATE "default",
"mme_code" varchar COLLATE "default",
"msc" varchar COLLATE "default",
"statistical_time" timestamp(6),
"created_time" timestamp(6) DEFAULT now() NOT NULL,
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
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for gem_sgs_kpi_5m_failure_statistics
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_sgs_kpi_5m_failure_statistics";
CREATE TABLE "public"."gem_sgs_kpi_5m_failure_statistics" (
"statistical_time" timestamp(6),
"whole_network" varchar COLLATE "default",
"mme_code" varchar COLLATE "default",
"msc" varchar COLLATE "default",
"event_type" varchar COLLATE "default",
"abnormal_type" int4,
"abnormal_reason" int4,
"abnormal_reason_count" int8,
"created_time" timestamp(6) DEFAULT now()
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for gem_sgs_kpi_5m_statistics
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_sgs_kpi_5m_statistics";
CREATE TABLE "public"."gem_sgs_kpi_5m_statistics" (
"id" varchar COLLATE "default" DEFAULT next_id() NOT NULL,
"whole_network" varchar COLLATE "default",
"mme_code" varchar COLLATE "default",
"msc" varchar COLLATE "default",
"statistical_time" timestamp(6),
"created_time" timestamp(6) DEFAULT now() NOT NULL,
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
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for gem_uu_event_5m_statistics_by_imsi
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_uu_event_5m_statistics_by_imsi";
CREATE TABLE "public"."gem_uu_event_5m_statistics_by_imsi" (
"statistical_time" timestamp(6),
"imsi" varchar COLLATE "default",
"msisdn" varchar COLLATE "default",
"event_type" varchar(32) COLLATE "default",
"request_count" int4,
"success_count" int4,
"abnormal_count" int4,
"response_delay_time" int8,
"no_resp_count" int4,
"created_time" timestamp(6) DEFAULT now()
)
WITH (OIDS=FALSE)

;
COMMENT ON COLUMN "public"."gem_uu_event_5m_statistics_by_imsi"."no_resp_count" IS '无响应次数';

-- ----------------------------
-- Table structure for gem_uu_kpi_1d_statistics
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_uu_kpi_1d_statistics";
CREATE TABLE "public"."gem_uu_kpi_1d_statistics" (
"id" varchar COLLATE "default" DEFAULT next_id() NOT NULL,
"statistical_time" timestamp(6),
"whole_network" varchar COLLATE "default",
"mme_group_id" varchar COLLATE "default",
"mme_code" varchar COLLATE "default",
"tac" varchar COLLATE "default",
"enodeb_id" varchar COLLATE "default",
"cell_id" varchar COLLATE "default",
"target_cell_id" varchar COLLATE "default",
"ue_brand" varchar COLLATE "default",
"ue_type" varchar COLLATE "default",
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
"created_time" timestamp(6) DEFAULT now(),
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
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."gem_uu_kpi_1d_statistics" IS 'UU_KPI接口查询表';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics"."statistical_time" IS '时间（小时）';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics"."whole_network" IS '全网维度';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics"."mme_group_id" IS 'MME POOL维度';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics"."mme_code" IS 'MME维度';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics"."tac" IS 'TAC维度';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics"."enodeb_id" IS '基站维度';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics"."cell_id" IS '小区维度';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics"."target_cell_id" IS '目标小区维度';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics"."ue_brand" IS '终端品牌维度';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics"."ue_type" IS '终端型号维度';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics"."rrc_paging_count" IS 'Paging请求次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics"."rrc_paging_success_count" IS 'Paging成功次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics"."rrc_paging_delay_sum" IS 'Paging响应时延和';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics"."rrc_cs_paging_count" IS 'CSPaging请求次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics"."rrc_cs_paging_success_count" IS 'CSPaging成功次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics"."rrc_cs_paging_delay_sum" IS 'CSPaging响应时延和';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics"."rrc_ps_paging_count" IS 'PSPaging请求次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics"."rrc_ps_paging_success_count" IS 'PSPaging成功次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics"."rrc_ps_paging_delay_sum" IS 'PSPaging响应时延和';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics"."rrc_connection_setup_count" IS 'RRC连接建立请求次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics"."rrc_connection_setup_success_count" IS 'RRC连接建立成功次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics"."rrc_connection_setup_delay_sum" IS 'RRC连接建立响应时延和';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics"."rrc_connection_setup_emergency_count" IS 'RRC连接建立请求次数_emergency';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics"."rrc_connection_setup_emergency_success_count" IS 'RRC连接建立成功次数_emergency';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics"."rrc_connection_setup_emergency_delay_sum" IS 'RRC连接建立_emergency响应时延和';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics"."rrc_connection_setup_high_priority_access_count" IS 'RRC连接建立请求次数_highPriorityAccess';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics"."rrc_connection_setup_high_priority_access_success_count" IS 'RRC连接建立成功次数_highPriorityAccess';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics"."rrc_connection_setup_high_priority_access_delay_sum" IS 'RRC连接建立_highPriorityAccess响应时延和';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics"."rrc_connection_setup_mt_access_count" IS 'RRC连接建立请求次数_mtAccess';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics"."rrc_connection_setup_mt_access_success_count" IS 'RRC连接建立成功次数_mtAccess';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics"."rrc_connection_setup_mt_access_delay_sum" IS 'RRC连接建立_mtAccess响应时延和';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics"."rrc_connection_setup_mo_signalling_count" IS 'RRC连接建立请求次数_moSignalling';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics"."rrc_connection_setup_mo_signalling_success_count" IS 'RRC连接建立成功次数_moSignalling';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics"."rrc_connection_setup_mo_signalling_delay_sum" IS 'RRC连接建立_moSignalling响应时延和';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics"."rrc_connection_setup_mo_data_count" IS 'RRC连接建立请求次数_moData';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics"."rrc_connection_setup_mo_data_success_count" IS 'RRC连接建立成功次数_moData';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics"."rrc_connection_setup_mo_data_delay_sum" IS 'RRC连接建立_moData响应时延和';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics"."rrc_connection_reestablishment_count" IS 'RRC连接重建请求次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics"."rrc_connection_reestablishment_success_count" IS 'RRC连接重建成功次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics"."rrc_connection_reestablishment_delay_sum" IS 'RRC连接重建响应时延和';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics"."rrc_connection_reestablishment_reconfig_failure_count" IS 'RRC连接重建请求次数_reconfigurationFailure';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics"."rrc_connection_reestablishment_reconfig_failure_success_count" IS 'RRC连接重建成功次数_reconfigurationFailure';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics"."rrc_connection_reestablishment_reconfig_failure_delay_sum" IS 'RRC连接重建_ReConfigurationFailure响应时延和';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics"."rrc_connection_reestablishment_handover_failure_count" IS 'RRC连接重建请求次数_handoverFailure';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics"."rrc_connection_reestablishment_handover_failure_success_count" IS 'RRC连接重建成功次数_handoverFailure';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics"."rrc_connection_reestablishment_handover_failure_delay_sum" IS 'RRC连接重建_handoverFailure响应时延和';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics"."rrc_connection_reestablishment_other_failure_count" IS 'RRC连接重建请求次数_otherFailure';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics"."rrc_connection_reestablishment_other_failure_success_count" IS 'RRC连接重建成功次数_otherFailure';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics"."rrc_connection_reestablishment_other_failure_delay_sum" IS 'RRC连接重建_otherFailure响应时延和';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics"."rrc_connection_release_count" IS 'RRC连接释放次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics"."rrc_connection_rest_count" IS 'RRC连接重建sum';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics"."rrc_connection_reconfig_count" IS 'RRC连接重配置请求次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics"."rrc_connection_reconfig_success_count" IS 'RRC连接重配置成功次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics"."rrc_connection_reconfig_delay_sum" IS 'RRC连接重配置响应时延和';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics"."rrc_safe_mode_count" IS '安全模式命令请求次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics"."rrc_safe_mode_success_count" IS '安全模式命令成功次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics"."rrc_safe_mode_delay_sum" IS '安全模式命令响应时延和';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics"."rrc_lte_handover_out_count" IS 'LTE往异系统切换请求次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics"."rrc_lte_handover_out_success_count" IS 'LTE往异系统切换成功次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics"."rrc_lte_handover_out_delay_sum" IS 'LTE往异系统切换时延和';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics"."rrc_lte_handover_in_count" IS '异系统切入LTE请求次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics"."rrc_lte_handover_in_success_count" IS '异系统切入LTE成功次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics"."rrc_lte_handover_in_delay_sum" IS '异系统切入LTE时延和';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics"."rrc_csfb_handover_out_count" IS 'CSFB切出请求次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics"."rrc_csfb_handover_out_success_count" IS 'CSFB切出成功次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics"."rrc_csfb_handover_out_delay_sum" IS 'CSFB切出时延和';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics"."rrc_handover_intra_cell_count" IS '小区内切换请求次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics"."rrc_handover_intra_cell_success_count" IS '小区内切换成功次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics"."rrc_handover_intra_cell_delay_sum" IS '小区内切换时延和';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics"."rrc_connection_abnormal_release_count" IS 'RRC连接异常释放次数';

-- ----------------------------
-- Table structure for gem_uu_kpi_1d_statistics_by_imsi
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_uu_kpi_1d_statistics_by_imsi";
CREATE TABLE "public"."gem_uu_kpi_1d_statistics_by_imsi" (
"id" varchar COLLATE "default" DEFAULT next_id() NOT NULL,
"statistical_time" timestamp(6),
"imsi" varchar COLLATE "default",
"enodeb_id" varchar COLLATE "default",
"cell_id" varchar COLLATE "default",
"ue_type" varchar COLLATE "default",
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
"created_time" timestamp(6) DEFAULT now(),
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
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."gem_uu_kpi_1d_statistics_by_imsi" IS 'UU_KPI接口查询表';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics_by_imsi"."statistical_time" IS '时间';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics_by_imsi"."imsi" IS '用户维度';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics_by_imsi"."rrc_paging_count" IS 'Paging请求次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics_by_imsi"."rrc_paging_success_count" IS 'Paging成功次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics_by_imsi"."rrc_paging_delay_sum" IS 'Paging响应时延和';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics_by_imsi"."rrc_cs_paging_count" IS 'CSPaging请求次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics_by_imsi"."rrc_cs_paging_success_count" IS 'CSPaging成功次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics_by_imsi"."rrc_cs_paging_delay_sum" IS 'CSPaging响应时延和';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics_by_imsi"."rrc_ps_paging_count" IS 'PSPaging请求次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics_by_imsi"."rrc_ps_paging_success_count" IS 'PSPaging成功次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics_by_imsi"."rrc_ps_paging_delay_sum" IS 'PSPaging响应时延和';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics_by_imsi"."rrc_connection_setup_count" IS 'RRC连接建立请求次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics_by_imsi"."rrc_connection_setup_success_count" IS 'RRC连接建立成功次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics_by_imsi"."rrc_connection_setup_delay_sum" IS 'RRC连接建立响应时延和';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics_by_imsi"."rrc_connection_setup_emergency_count" IS 'RRC连接建立请求次数_emergency';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics_by_imsi"."rrc_connection_setup_emergency_success_count" IS 'RRC连接建立成功次数_emergency';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics_by_imsi"."rrc_connection_setup_emergency_delay_sum" IS 'RRC连接建立_emergency响应时延和';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics_by_imsi"."rrc_connection_setup_high_priority_access_count" IS 'RRC连接建立请求次数_highPriorityAccess';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics_by_imsi"."rrc_connection_setup_high_priority_access_success_count" IS 'RRC连接建立成功次数_highPriorityAccess';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics_by_imsi"."rrc_connection_setup_high_priority_access_delay_sum" IS 'RRC连接建立_highPriorityAccess响应时延和';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics_by_imsi"."rrc_connection_setup_mt_access_count" IS 'RRC连接建立请求次数_mtAccess';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics_by_imsi"."rrc_connection_setup_mt_access_success_count" IS 'RRC连接建立成功次数_mtAccess';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics_by_imsi"."rrc_connection_setup_mt_access_delay_sum" IS 'RRC连接建立_mtAccess响应时延和';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics_by_imsi"."rrc_connection_setup_mo_signalling_count" IS 'RRC连接建立请求次数_moSignalling';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics_by_imsi"."rrc_connection_setup_mo_signalling_success_count" IS 'RRC连接建立成功次数_moSignalling';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics_by_imsi"."rrc_connection_setup_mo_signalling_delay_sum" IS 'RRC连接建立_moSignalling响应时延和';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics_by_imsi"."rrc_connection_setup_mo_data_count" IS 'RRC连接建立请求次数_moData';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics_by_imsi"."rrc_connection_setup_mo_data_success_count" IS 'RRC连接建立成功次数_moData';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics_by_imsi"."rrc_connection_setup_mo_data_delay_sum" IS 'RRC连接建立_moData响应时延和';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics_by_imsi"."rrc_connection_reestablishment_count" IS 'RRC连接重建请求次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics_by_imsi"."rrc_connection_reestablishment_success_count" IS 'RRC连接重建成功次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics_by_imsi"."rrc_connection_reestablishment_delay_sum" IS 'RRC连接重建响应时延和';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics_by_imsi"."rrc_connection_reestablishment_reconfig_failure_count" IS 'RRC连接重建请求次数_reconfigurationFailure';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics_by_imsi"."rrc_connection_reestablishment_reconfig_failure_success_count" IS 'RRC连接重建成功次数_reconfigurationFailure';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics_by_imsi"."rrc_connection_reestablishment_reconfig_failure_delay_sum" IS 'RRC连接重建_ReConfigurationFailure响应时延和';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics_by_imsi"."rrc_connection_reestablishment_handover_failure_count" IS 'RRC连接重建请求次数_handoverFailure';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics_by_imsi"."rrc_connection_reestablishment_handover_failure_success_count" IS 'RRC连接重建成功次数_handoverFailure';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics_by_imsi"."rrc_connection_reestablishment_handover_failure_delay_sum" IS 'RRC连接重建_handoverFailure响应时延和';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics_by_imsi"."rrc_connection_reestablishment_other_failure_count" IS 'RRC连接重建请求次数_otherFailure';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics_by_imsi"."rrc_connection_reestablishment_other_failure_success_count" IS 'RRC连接重建成功次数_otherFailure';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics_by_imsi"."rrc_connection_reestablishment_other_failure_delay_sum" IS 'RRC连接重建_otherFailure响应时延和';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics_by_imsi"."rrc_connection_release_count" IS 'RRC连接释放次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics_by_imsi"."rrc_connection_rest_count" IS 'RRC连接重建sum';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics_by_imsi"."rrc_connection_reconfig_count" IS 'RRC连接重配置请求次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics_by_imsi"."rrc_connection_reconfig_success_count" IS 'RRC连接重配置成功次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics_by_imsi"."rrc_connection_reconfig_delay_sum" IS 'RRC连接重配置响应时延和';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics_by_imsi"."rrc_safe_mode_count" IS '安全模式命令请求次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics_by_imsi"."rrc_safe_mode_success_count" IS '安全模式命令成功次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics_by_imsi"."rrc_safe_mode_delay_sum" IS '安全模式命令响应时延和';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics_by_imsi"."rrc_lte_handover_out_count" IS 'LTE往异系统切换请求次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics_by_imsi"."rrc_lte_handover_out_success_count" IS 'LTE往异系统切换成功次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics_by_imsi"."rrc_lte_handover_out_delay_sum" IS 'LTE往异系统切换时延和';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics_by_imsi"."rrc_lte_handover_in_count" IS '异系统切入LTE请求次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics_by_imsi"."rrc_lte_handover_in_success_count" IS '异系统切入LTE成功次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics_by_imsi"."rrc_lte_handover_in_delay_sum" IS '异系统切入LTE时延和';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics_by_imsi"."rrc_csfb_handover_out_count" IS 'CSFB切出请求次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics_by_imsi"."rrc_csfb_handover_out_success_count" IS 'CSFB切出成功次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics_by_imsi"."rrc_csfb_handover_out_delay_sum" IS 'CSFB切出时延和';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics_by_imsi"."rrc_handover_intra_cell_count" IS '小区内切换请求次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics_by_imsi"."rrc_handover_intra_cell_success_count" IS '小区内切换成功次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics_by_imsi"."rrc_handover_intra_cell_delay_sum" IS '小区内切换时延和';
COMMENT ON COLUMN "public"."gem_uu_kpi_1d_statistics_by_imsi"."rrc_connection_abnormal_release_count" IS 'RRC连接异常释放次数';

-- ----------------------------
-- Table structure for gem_uu_kpi_1h_statistics
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_uu_kpi_1h_statistics";
CREATE TABLE "public"."gem_uu_kpi_1h_statistics" (
"id" varchar COLLATE "default" DEFAULT next_id() NOT NULL,
"statistical_time" timestamp(6),
"whole_network" varchar COLLATE "default",
"mme_group_id" varchar COLLATE "default",
"mme_code" varchar COLLATE "default",
"tac" varchar COLLATE "default",
"enodeb_id" varchar COLLATE "default",
"cell_id" varchar COLLATE "default",
"target_cell_id" varchar COLLATE "default",
"ue_brand" varchar COLLATE "default",
"ue_type" varchar COLLATE "default",
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
"created_time" timestamp(6) DEFAULT now(),
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
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."gem_uu_kpi_1h_statistics" IS 'UU_KPI接口查询表';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics"."statistical_time" IS '时间（小时）';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics"."whole_network" IS '全网维度';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics"."mme_group_id" IS 'MME POOL维度';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics"."mme_code" IS 'MME维度';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics"."tac" IS 'TAC维度';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics"."enodeb_id" IS '基站维度';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics"."cell_id" IS '小区维度';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics"."target_cell_id" IS '目标小区维度';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics"."ue_brand" IS '终端品牌维度';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics"."ue_type" IS '终端型号维度';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics"."rrc_paging_count" IS 'Paging请求次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics"."rrc_paging_success_count" IS 'Paging成功次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics"."rrc_paging_delay_sum" IS 'Paging响应时延和';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics"."rrc_cs_paging_count" IS 'CSPaging请求次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics"."rrc_cs_paging_success_count" IS 'CSPaging成功次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics"."rrc_cs_paging_delay_sum" IS 'CSPaging响应时延和';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics"."rrc_ps_paging_count" IS 'PSPaging请求次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics"."rrc_ps_paging_success_count" IS 'PSPaging成功次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics"."rrc_ps_paging_delay_sum" IS 'PSPaging响应时延和';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics"."rrc_connection_setup_count" IS 'RRC连接建立请求次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics"."rrc_connection_setup_success_count" IS 'RRC连接建立成功次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics"."rrc_connection_setup_delay_sum" IS 'RRC连接建立响应时延和';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics"."rrc_connection_setup_emergency_count" IS 'RRC连接建立请求次数_emergency';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics"."rrc_connection_setup_emergency_success_count" IS 'RRC连接建立成功次数_emergency';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics"."rrc_connection_setup_emergency_delay_sum" IS 'RRC连接建立_emergency响应时延和';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics"."rrc_connection_setup_high_priority_access_count" IS 'RRC连接建立请求次数_highPriorityAccess';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics"."rrc_connection_setup_high_priority_access_success_count" IS 'RRC连接建立成功次数_highPriorityAccess';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics"."rrc_connection_setup_high_priority_access_delay_sum" IS 'RRC连接建立_highPriorityAccess响应时延和';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics"."rrc_connection_setup_mt_access_count" IS 'RRC连接建立请求次数_mtAccess';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics"."rrc_connection_setup_mt_access_success_count" IS 'RRC连接建立成功次数_mtAccess';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics"."rrc_connection_setup_mt_access_delay_sum" IS 'RRC连接建立_mtAccess响应时延和';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics"."rrc_connection_setup_mo_signalling_count" IS 'RRC连接建立请求次数_moSignalling';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics"."rrc_connection_setup_mo_signalling_success_count" IS 'RRC连接建立成功次数_moSignalling';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics"."rrc_connection_setup_mo_signalling_delay_sum" IS 'RRC连接建立_moSignalling响应时延和';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics"."rrc_connection_setup_mo_data_count" IS 'RRC连接建立请求次数_moData';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics"."rrc_connection_setup_mo_data_success_count" IS 'RRC连接建立成功次数_moData';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics"."rrc_connection_setup_mo_data_delay_sum" IS 'RRC连接建立_moData响应时延和';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics"."rrc_connection_reestablishment_count" IS 'RRC连接重建请求次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics"."rrc_connection_reestablishment_success_count" IS 'RRC连接重建成功次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics"."rrc_connection_reestablishment_delay_sum" IS 'RRC连接重建响应时延和';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics"."rrc_connection_reestablishment_reconfig_failure_count" IS 'RRC连接重建请求次数_reconfigurationFailure';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics"."rrc_connection_reestablishment_reconfig_failure_success_count" IS 'RRC连接重建成功次数_reconfigurationFailure';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics"."rrc_connection_reestablishment_reconfig_failure_delay_sum" IS 'RRC连接重建_ReConfigurationFailure响应时延和';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics"."rrc_connection_reestablishment_handover_failure_count" IS 'RRC连接重建请求次数_handoverFailure';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics"."rrc_connection_reestablishment_handover_failure_success_count" IS 'RRC连接重建成功次数_handoverFailure';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics"."rrc_connection_reestablishment_handover_failure_delay_sum" IS 'RRC连接重建_handoverFailure响应时延和';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics"."rrc_connection_reestablishment_other_failure_count" IS 'RRC连接重建请求次数_otherFailure';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics"."rrc_connection_reestablishment_other_failure_success_count" IS 'RRC连接重建成功次数_otherFailure';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics"."rrc_connection_reestablishment_other_failure_delay_sum" IS 'RRC连接重建_otherFailure响应时延和';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics"."rrc_connection_release_count" IS 'RRC连接释放次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics"."rrc_connection_rest_count" IS 'RRC连接重建sum';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics"."rrc_connection_reconfig_count" IS 'RRC连接重配置请求次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics"."rrc_connection_reconfig_success_count" IS 'RRC连接重配置成功次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics"."rrc_connection_reconfig_delay_sum" IS 'RRC连接重配置响应时延和';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics"."rrc_safe_mode_count" IS '安全模式命令请求次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics"."rrc_safe_mode_success_count" IS '安全模式命令成功次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics"."rrc_safe_mode_delay_sum" IS '安全模式命令响应时延和';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics"."rrc_lte_handover_out_count" IS 'LTE往异系统切换请求次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics"."rrc_lte_handover_out_success_count" IS 'LTE往异系统切换成功次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics"."rrc_lte_handover_out_delay_sum" IS 'LTE往异系统切换时延和';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics"."rrc_lte_handover_in_count" IS '异系统切入LTE请求次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics"."rrc_lte_handover_in_success_count" IS '异系统切入LTE成功次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics"."rrc_lte_handover_in_delay_sum" IS '异系统切入LTE时延和';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics"."rrc_csfb_handover_out_count" IS 'CSFB切出请求次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics"."rrc_csfb_handover_out_success_count" IS 'CSFB切出成功次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics"."rrc_csfb_handover_out_delay_sum" IS 'CSFB切出时延和';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics"."rrc_handover_intra_cell_count" IS '小区内切换请求次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics"."rrc_handover_intra_cell_success_count" IS '小区内切换成功次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics"."rrc_handover_intra_cell_delay_sum" IS '小区内切换时延和';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics"."rrc_connection_abnormal_release_count" IS 'RRC连接异常释放次数';

-- ----------------------------
-- Table structure for gem_uu_kpi_1h_statistics_by_imsi
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_uu_kpi_1h_statistics_by_imsi";
CREATE TABLE "public"."gem_uu_kpi_1h_statistics_by_imsi" (
"id" varchar COLLATE "default" DEFAULT next_id() NOT NULL,
"statistical_time" timestamp(6),
"imsi" varchar COLLATE "default",
"enodeb_id" varchar COLLATE "default",
"cell_id" varchar COLLATE "default",
"ue_type" varchar COLLATE "default",
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
"created_time" timestamp(6) DEFAULT now(),
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
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."gem_uu_kpi_1h_statistics_by_imsi" IS 'UU_KPI接口查询表';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics_by_imsi"."statistical_time" IS '时间';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics_by_imsi"."imsi" IS '用户维度';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics_by_imsi"."rrc_paging_count" IS 'Paging请求次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics_by_imsi"."rrc_paging_success_count" IS 'Paging成功次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics_by_imsi"."rrc_paging_delay_sum" IS 'Paging响应时延和';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics_by_imsi"."rrc_cs_paging_count" IS 'CSPaging请求次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics_by_imsi"."rrc_cs_paging_success_count" IS 'CSPaging成功次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics_by_imsi"."rrc_cs_paging_delay_sum" IS 'CSPaging响应时延和';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics_by_imsi"."rrc_ps_paging_count" IS 'PSPaging请求次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics_by_imsi"."rrc_ps_paging_success_count" IS 'PSPaging成功次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics_by_imsi"."rrc_ps_paging_delay_sum" IS 'PSPaging响应时延和';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics_by_imsi"."rrc_connection_setup_count" IS 'RRC连接建立请求次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics_by_imsi"."rrc_connection_setup_success_count" IS 'RRC连接建立成功次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics_by_imsi"."rrc_connection_setup_delay_sum" IS 'RRC连接建立响应时延和';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics_by_imsi"."rrc_connection_setup_emergency_count" IS 'RRC连接建立请求次数_emergency';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics_by_imsi"."rrc_connection_setup_emergency_success_count" IS 'RRC连接建立成功次数_emergency';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics_by_imsi"."rrc_connection_setup_emergency_delay_sum" IS 'RRC连接建立_emergency响应时延和';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics_by_imsi"."rrc_connection_setup_high_priority_access_count" IS 'RRC连接建立请求次数_highPriorityAccess';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics_by_imsi"."rrc_connection_setup_high_priority_access_success_count" IS 'RRC连接建立成功次数_highPriorityAccess';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics_by_imsi"."rrc_connection_setup_high_priority_access_delay_sum" IS 'RRC连接建立_highPriorityAccess响应时延和';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics_by_imsi"."rrc_connection_setup_mt_access_count" IS 'RRC连接建立请求次数_mtAccess';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics_by_imsi"."rrc_connection_setup_mt_access_success_count" IS 'RRC连接建立成功次数_mtAccess';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics_by_imsi"."rrc_connection_setup_mt_access_delay_sum" IS 'RRC连接建立_mtAccess响应时延和';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics_by_imsi"."rrc_connection_setup_mo_signalling_count" IS 'RRC连接建立请求次数_moSignalling';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics_by_imsi"."rrc_connection_setup_mo_signalling_success_count" IS 'RRC连接建立成功次数_moSignalling';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics_by_imsi"."rrc_connection_setup_mo_signalling_delay_sum" IS 'RRC连接建立_moSignalling响应时延和';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics_by_imsi"."rrc_connection_setup_mo_data_count" IS 'RRC连接建立请求次数_moData';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics_by_imsi"."rrc_connection_setup_mo_data_success_count" IS 'RRC连接建立成功次数_moData';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics_by_imsi"."rrc_connection_setup_mo_data_delay_sum" IS 'RRC连接建立_moData响应时延和';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics_by_imsi"."rrc_connection_reestablishment_count" IS 'RRC连接重建请求次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics_by_imsi"."rrc_connection_reestablishment_success_count" IS 'RRC连接重建成功次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics_by_imsi"."rrc_connection_reestablishment_delay_sum" IS 'RRC连接重建响应时延和';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics_by_imsi"."rrc_connection_reestablishment_reconfig_failure_count" IS 'RRC连接重建请求次数_reconfigurationFailure';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics_by_imsi"."rrc_connection_reestablishment_reconfig_failure_success_count" IS 'RRC连接重建成功次数_reconfigurationFailure';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics_by_imsi"."rrc_connection_reestablishment_reconfig_failure_delay_sum" IS 'RRC连接重建_ReConfigurationFailure响应时延和';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics_by_imsi"."rrc_connection_reestablishment_handover_failure_count" IS 'RRC连接重建请求次数_handoverFailure';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics_by_imsi"."rrc_connection_reestablishment_handover_failure_success_count" IS 'RRC连接重建成功次数_handoverFailure';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics_by_imsi"."rrc_connection_reestablishment_handover_failure_delay_sum" IS 'RRC连接重建_handoverFailure响应时延和';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics_by_imsi"."rrc_connection_reestablishment_other_failure_count" IS 'RRC连接重建请求次数_otherFailure';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics_by_imsi"."rrc_connection_reestablishment_other_failure_success_count" IS 'RRC连接重建成功次数_otherFailure';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics_by_imsi"."rrc_connection_reestablishment_other_failure_delay_sum" IS 'RRC连接重建_otherFailure响应时延和';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics_by_imsi"."rrc_connection_release_count" IS 'RRC连接释放次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics_by_imsi"."rrc_connection_rest_count" IS 'RRC连接重建sum';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics_by_imsi"."rrc_connection_reconfig_count" IS 'RRC连接重配置请求次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics_by_imsi"."rrc_connection_reconfig_success_count" IS 'RRC连接重配置成功次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics_by_imsi"."rrc_connection_reconfig_delay_sum" IS 'RRC连接重配置响应时延和';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics_by_imsi"."rrc_safe_mode_count" IS '安全模式命令请求次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics_by_imsi"."rrc_safe_mode_success_count" IS '安全模式命令成功次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics_by_imsi"."rrc_safe_mode_delay_sum" IS '安全模式命令响应时延和';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics_by_imsi"."rrc_lte_handover_out_count" IS 'LTE往异系统切换请求次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics_by_imsi"."rrc_lte_handover_out_success_count" IS 'LTE往异系统切换成功次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics_by_imsi"."rrc_lte_handover_out_delay_sum" IS 'LTE往异系统切换时延和';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics_by_imsi"."rrc_lte_handover_in_count" IS '异系统切入LTE请求次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics_by_imsi"."rrc_lte_handover_in_success_count" IS '异系统切入LTE成功次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics_by_imsi"."rrc_lte_handover_in_delay_sum" IS '异系统切入LTE时延和';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics_by_imsi"."rrc_csfb_handover_out_count" IS 'CSFB切出请求次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics_by_imsi"."rrc_csfb_handover_out_success_count" IS 'CSFB切出成功次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics_by_imsi"."rrc_csfb_handover_out_delay_sum" IS 'CSFB切出时延和';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics_by_imsi"."rrc_handover_intra_cell_count" IS '小区内切换请求次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics_by_imsi"."rrc_handover_intra_cell_success_count" IS '小区内切换成功次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics_by_imsi"."rrc_handover_intra_cell_delay_sum" IS '小区内切换时延和';
COMMENT ON COLUMN "public"."gem_uu_kpi_1h_statistics_by_imsi"."rrc_connection_abnormal_release_count" IS 'RRC连接异常释放次数';

-- ----------------------------
-- Table structure for gem_uu_kpi_5m_statistics
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_uu_kpi_5m_statistics";
CREATE TABLE "public"."gem_uu_kpi_5m_statistics" (
"id" varchar COLLATE "default" DEFAULT next_id() NOT NULL,
"statistical_time" timestamp(6),
"whole_network" varchar COLLATE "default",
"mme_group_id" varchar COLLATE "default",
"mme_code" varchar COLLATE "default",
"tac" varchar COLLATE "default",
"enodeb_id" varchar COLLATE "default",
"cell_id" varchar COLLATE "default",
"target_cell_id" varchar COLLATE "default",
"ue_brand" varchar COLLATE "default",
"ue_type" varchar COLLATE "default",
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
"created_time" timestamp(6) DEFAULT now(),
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
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."gem_uu_kpi_5m_statistics" IS 'UU_KPI接口查询表';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics"."statistical_time" IS '时间（小时）';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics"."whole_network" IS '全网维度';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics"."mme_group_id" IS 'MME POOL维度';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics"."mme_code" IS 'MME维度';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics"."tac" IS 'TAC维度';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics"."enodeb_id" IS '基站维度';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics"."cell_id" IS '小区维度';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics"."target_cell_id" IS '目标小区维度';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics"."ue_brand" IS '终端品牌维度';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics"."ue_type" IS '终端型号维度';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics"."rrc_paging_count" IS 'Paging请求次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics"."rrc_paging_success_count" IS 'Paging成功次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics"."rrc_paging_delay_sum" IS 'Paging响应时延和';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics"."rrc_cs_paging_count" IS 'CSPaging请求次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics"."rrc_cs_paging_success_count" IS 'CSPaging成功次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics"."rrc_cs_paging_delay_sum" IS 'CSPaging响应时延和';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics"."rrc_ps_paging_count" IS 'PSPaging请求次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics"."rrc_ps_paging_success_count" IS 'PSPaging成功次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics"."rrc_ps_paging_delay_sum" IS 'PSPaging响应时延和';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics"."rrc_connection_setup_count" IS 'RRC连接建立请求次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics"."rrc_connection_setup_success_count" IS 'RRC连接建立成功次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics"."rrc_connection_setup_delay_sum" IS 'RRC连接建立响应时延和';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics"."rrc_connection_setup_emergency_count" IS 'RRC连接建立请求次数_emergency';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics"."rrc_connection_setup_emergency_success_count" IS 'RRC连接建立成功次数_emergency';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics"."rrc_connection_setup_emergency_delay_sum" IS 'RRC连接建立_emergency响应时延和';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics"."rrc_connection_setup_high_priority_access_count" IS 'RRC连接建立请求次数_highPriorityAccess';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics"."rrc_connection_setup_high_priority_access_success_count" IS 'RRC连接建立成功次数_highPriorityAccess';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics"."rrc_connection_setup_high_priority_access_delay_sum" IS 'RRC连接建立_highPriorityAccess响应时延和';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics"."rrc_connection_setup_mt_access_count" IS 'RRC连接建立请求次数_mtAccess';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics"."rrc_connection_setup_mt_access_success_count" IS 'RRC连接建立成功次数_mtAccess';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics"."rrc_connection_setup_mt_access_delay_sum" IS 'RRC连接建立_mtAccess响应时延和';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics"."rrc_connection_setup_mo_signalling_count" IS 'RRC连接建立请求次数_moSignalling';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics"."rrc_connection_setup_mo_signalling_success_count" IS 'RRC连接建立成功次数_moSignalling';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics"."rrc_connection_setup_mo_signalling_delay_sum" IS 'RRC连接建立_moSignalling响应时延和';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics"."rrc_connection_setup_mo_data_count" IS 'RRC连接建立请求次数_moData';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics"."rrc_connection_setup_mo_data_success_count" IS 'RRC连接建立成功次数_moData';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics"."rrc_connection_setup_mo_data_delay_sum" IS 'RRC连接建立_moData响应时延和';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics"."rrc_connection_reestablishment_count" IS 'RRC连接重建请求次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics"."rrc_connection_reestablishment_success_count" IS 'RRC连接重建成功次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics"."rrc_connection_reestablishment_delay_sum" IS 'RRC连接重建响应时延和';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics"."rrc_connection_reestablishment_reconfig_failure_count" IS 'RRC连接重建请求次数_reconfigurationFailure';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics"."rrc_connection_reestablishment_reconfig_failure_success_count" IS 'RRC连接重建成功次数_reconfigurationFailure';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics"."rrc_connection_reestablishment_reconfig_failure_delay_sum" IS 'RRC连接重建_ReConfigurationFailure响应时延和';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics"."rrc_connection_reestablishment_handover_failure_count" IS 'RRC连接重建请求次数_handoverFailure';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics"."rrc_connection_reestablishment_handover_failure_success_count" IS 'RRC连接重建成功次数_handoverFailure';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics"."rrc_connection_reestablishment_handover_failure_delay_sum" IS 'RRC连接重建_handoverFailure响应时延和';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics"."rrc_connection_reestablishment_other_failure_count" IS 'RRC连接重建请求次数_otherFailure';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics"."rrc_connection_reestablishment_other_failure_success_count" IS 'RRC连接重建成功次数_otherFailure';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics"."rrc_connection_reestablishment_other_failure_delay_sum" IS 'RRC连接重建_otherFailure响应时延和';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics"."rrc_connection_release_count" IS 'RRC连接释放次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics"."rrc_connection_rest_count" IS 'RRC连接重建sum';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics"."rrc_connection_reconfig_count" IS 'RRC连接重配置请求次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics"."rrc_connection_reconfig_success_count" IS 'RRC连接重配置成功次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics"."rrc_connection_reconfig_delay_sum" IS 'RRC连接重配置响应时延和';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics"."rrc_safe_mode_count" IS '安全模式命令请求次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics"."rrc_safe_mode_success_count" IS '安全模式命令成功次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics"."rrc_safe_mode_delay_sum" IS '安全模式命令响应时延和';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics"."rrc_lte_handover_out_count" IS 'LTE往异系统切换请求次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics"."rrc_lte_handover_out_success_count" IS 'LTE往异系统切换成功次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics"."rrc_lte_handover_out_delay_sum" IS 'LTE往异系统切换时延和';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics"."rrc_lte_handover_in_count" IS '异系统切入LTE请求次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics"."rrc_lte_handover_in_success_count" IS '异系统切入LTE成功次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics"."rrc_lte_handover_in_delay_sum" IS '异系统切入LTE时延和';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics"."rrc_csfb_handover_out_count" IS 'CSFB切出请求次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics"."rrc_csfb_handover_out_success_count" IS 'CSFB切出成功次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics"."rrc_csfb_handover_out_delay_sum" IS 'CSFB切出时延和';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics"."rrc_handover_intra_cell_count" IS '小区内切换请求次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics"."rrc_handover_intra_cell_success_count" IS '小区内切换成功次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics"."rrc_handover_intra_cell_delay_sum" IS '小区内切换时延和';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics"."rrc_connection_abnormal_release_count" IS 'RRC连接异常释放次数';

-- ----------------------------
-- Table structure for gem_uu_kpi_5m_statistics_by_imsi
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_uu_kpi_5m_statistics_by_imsi";
CREATE TABLE "public"."gem_uu_kpi_5m_statistics_by_imsi" (
"id" varchar COLLATE "default" DEFAULT next_id() NOT NULL,
"statistical_time" timestamp(6),
"imsi" varchar COLLATE "default",
"enodeb_id" varchar COLLATE "default",
"cell_id" varchar COLLATE "default",
"ue_type" varchar COLLATE "default",
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
"created_time" timestamp(6) DEFAULT now(),
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
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."gem_uu_kpi_5m_statistics_by_imsi" IS 'UU_KPI接口查询表';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics_by_imsi"."statistical_time" IS '时间';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics_by_imsi"."imsi" IS '用户维度';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics_by_imsi"."rrc_paging_count" IS 'Paging请求次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics_by_imsi"."rrc_paging_success_count" IS 'Paging成功次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics_by_imsi"."rrc_paging_delay_sum" IS 'Paging响应时延和';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics_by_imsi"."rrc_cs_paging_count" IS 'CSPaging请求次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics_by_imsi"."rrc_cs_paging_success_count" IS 'CSPaging成功次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics_by_imsi"."rrc_cs_paging_delay_sum" IS 'CSPaging响应时延和';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics_by_imsi"."rrc_ps_paging_count" IS 'PSPaging请求次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics_by_imsi"."rrc_ps_paging_success_count" IS 'PSPaging成功次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics_by_imsi"."rrc_ps_paging_delay_sum" IS 'PSPaging响应时延和';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics_by_imsi"."rrc_connection_setup_count" IS 'RRC连接建立请求次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics_by_imsi"."rrc_connection_setup_success_count" IS 'RRC连接建立成功次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics_by_imsi"."rrc_connection_setup_delay_sum" IS 'RRC连接建立响应时延和';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics_by_imsi"."rrc_connection_setup_emergency_count" IS 'RRC连接建立请求次数_emergency';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics_by_imsi"."rrc_connection_setup_emergency_success_count" IS 'RRC连接建立成功次数_emergency';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics_by_imsi"."rrc_connection_setup_emergency_delay_sum" IS 'RRC连接建立_emergency响应时延和';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics_by_imsi"."rrc_connection_setup_high_priority_access_count" IS 'RRC连接建立请求次数_highPriorityAccess';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics_by_imsi"."rrc_connection_setup_high_priority_access_success_count" IS 'RRC连接建立成功次数_highPriorityAccess';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics_by_imsi"."rrc_connection_setup_high_priority_access_delay_sum" IS 'RRC连接建立_highPriorityAccess响应时延和';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics_by_imsi"."rrc_connection_setup_mt_access_count" IS 'RRC连接建立请求次数_mtAccess';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics_by_imsi"."rrc_connection_setup_mt_access_success_count" IS 'RRC连接建立成功次数_mtAccess';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics_by_imsi"."rrc_connection_setup_mt_access_delay_sum" IS 'RRC连接建立_mtAccess响应时延和';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics_by_imsi"."rrc_connection_setup_mo_signalling_count" IS 'RRC连接建立请求次数_moSignalling';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics_by_imsi"."rrc_connection_setup_mo_signalling_success_count" IS 'RRC连接建立成功次数_moSignalling';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics_by_imsi"."rrc_connection_setup_mo_signalling_delay_sum" IS 'RRC连接建立_moSignalling响应时延和';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics_by_imsi"."rrc_connection_setup_mo_data_count" IS 'RRC连接建立请求次数_moData';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics_by_imsi"."rrc_connection_setup_mo_data_success_count" IS 'RRC连接建立成功次数_moData';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics_by_imsi"."rrc_connection_setup_mo_data_delay_sum" IS 'RRC连接建立_moData响应时延和';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics_by_imsi"."rrc_connection_reestablishment_count" IS 'RRC连接重建请求次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics_by_imsi"."rrc_connection_reestablishment_success_count" IS 'RRC连接重建成功次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics_by_imsi"."rrc_connection_reestablishment_delay_sum" IS 'RRC连接重建响应时延和';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics_by_imsi"."rrc_connection_reestablishment_reconfig_failure_count" IS 'RRC连接重建请求次数_reconfigurationFailure';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics_by_imsi"."rrc_connection_reestablishment_reconfig_failure_success_count" IS 'RRC连接重建成功次数_reconfigurationFailure';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics_by_imsi"."rrc_connection_reestablishment_reconfig_failure_delay_sum" IS 'RRC连接重建_ReConfigurationFailure响应时延和';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics_by_imsi"."rrc_connection_reestablishment_handover_failure_count" IS 'RRC连接重建请求次数_handoverFailure';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics_by_imsi"."rrc_connection_reestablishment_handover_failure_success_count" IS 'RRC连接重建成功次数_handoverFailure';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics_by_imsi"."rrc_connection_reestablishment_handover_failure_delay_sum" IS 'RRC连接重建_handoverFailure响应时延和';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics_by_imsi"."rrc_connection_reestablishment_other_failure_count" IS 'RRC连接重建请求次数_otherFailure';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics_by_imsi"."rrc_connection_reestablishment_other_failure_success_count" IS 'RRC连接重建成功次数_otherFailure';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics_by_imsi"."rrc_connection_reestablishment_other_failure_delay_sum" IS 'RRC连接重建_otherFailure响应时延和';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics_by_imsi"."rrc_connection_release_count" IS 'RRC连接释放次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics_by_imsi"."rrc_connection_rest_count" IS 'RRC连接重建sum';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics_by_imsi"."rrc_connection_reconfig_count" IS 'RRC连接重配置请求次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics_by_imsi"."rrc_connection_reconfig_success_count" IS 'RRC连接重配置成功次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics_by_imsi"."rrc_connection_reconfig_delay_sum" IS 'RRC连接重配置响应时延和';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics_by_imsi"."rrc_safe_mode_count" IS '安全模式命令请求次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics_by_imsi"."rrc_safe_mode_success_count" IS '安全模式命令成功次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics_by_imsi"."rrc_safe_mode_delay_sum" IS '安全模式命令响应时延和';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics_by_imsi"."rrc_lte_handover_out_count" IS 'LTE往异系统切换请求次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics_by_imsi"."rrc_lte_handover_out_success_count" IS 'LTE往异系统切换成功次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics_by_imsi"."rrc_lte_handover_out_delay_sum" IS 'LTE往异系统切换时延和';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics_by_imsi"."rrc_lte_handover_in_count" IS '异系统切入LTE请求次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics_by_imsi"."rrc_lte_handover_in_success_count" IS '异系统切入LTE成功次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics_by_imsi"."rrc_lte_handover_in_delay_sum" IS '异系统切入LTE时延和';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics_by_imsi"."rrc_csfb_handover_out_count" IS 'CSFB切出请求次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics_by_imsi"."rrc_csfb_handover_out_success_count" IS 'CSFB切出成功次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics_by_imsi"."rrc_csfb_handover_out_delay_sum" IS 'CSFB切出时延和';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics_by_imsi"."rrc_handover_intra_cell_count" IS '小区内切换请求次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics_by_imsi"."rrc_handover_intra_cell_success_count" IS '小区内切换成功次数';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics_by_imsi"."rrc_handover_intra_cell_delay_sum" IS '小区内切换时延和';
COMMENT ON COLUMN "public"."gem_uu_kpi_5m_statistics_by_imsi"."rrc_connection_abnormal_release_count" IS 'RRC连接异常释放次数';

-- ----------------------------
-- Table structure for gem_vdt_analysis_indicators
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_vdt_analysis_indicators";
CREATE TABLE "public"."gem_vdt_analysis_indicators" (
"id" varchar COLLATE "default" DEFAULT next_id() NOT NULL,
"name" varchar COLLATE "default",
"value" varchar COLLATE "default",
"level" varchar COLLATE "default",
"parent_id" varchar COLLATE "default",
"source_table" varchar COLLATE "default",
"parameter" varchar COLLATE "default",
"expression" varchar COLLATE "default",
"network_interface" varchar COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for gem_vdt_road_analysis_mr_5m_imsi
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_vdt_road_analysis_mr_5m_imsi";
CREATE TABLE "public"."gem_vdt_road_analysis_mr_5m_imsi" (
"id" varchar COLLATE "default" DEFAULT next_id() NOT NULL,
"road_type_id" varchar COLLATE "default",
"road_id" varchar COLLATE "default",
"imsi" varchar COLLATE "default",
"statistical_time" timestamp(6),
"serving_rsrp_sum" int4 DEFAULT 0 NOT NULL,
"serving_rsrp_count" int4 DEFAULT 0 NOT NULL,
"serving_rsrq_sum" int4 DEFAULT 0 NOT NULL,
"serving_rsrq_count" int4 DEFAULT 0 NOT NULL,
"ta_sum" int4 DEFAULT 0 NOT NULL,
"ta_count" int4 DEFAULT 0 NOT NULL,
"ul_sinr_sum" int4 DEFAULT 0 NOT NULL,
"ul_sinr_count" int4 DEFAULT 0 NOT NULL,
"overlapping_coverage_count" int4 DEFAULT 0 NOT NULL,
"longitude" varchar COLLATE "default",
"latitude" varchar COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for gem_vdt_road_analysis_s1u_http_5m_imsi
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_vdt_road_analysis_s1u_http_5m_imsi";
CREATE TABLE "public"."gem_vdt_road_analysis_s1u_http_5m_imsi" (
"id" varchar COLLATE "default" DEFAULT next_id() NOT NULL,
"road_type_id" varchar COLLATE "default",
"road_id" varchar COLLATE "default",
"imsi" varchar COLLATE "default",
"statistical_time" timestamp(6),
"longitude" varchar COLLATE "default",
"latitude" varchar COLLATE "default",
"ul_data" float8 DEFAULT 0 NOT NULL,
"dl_data" float8 DEFAULT 0 NOT NULL,
"http_lastpacket_1streq_delay" int8 DEFAULT 0 NOT NULL,
"ul_ip_packet" int4 DEFAULT 0 NOT NULL,
"dl_ip_packet" int4 DEFAULT 0 NOT NULL,
"up_tcp_disorder_num" int4 DEFAULT 0 NOT NULL,
"down_tcp_disorder_num" int4 DEFAULT 0 NOT NULL,
"up_tcp_retrans_num" int4 DEFAULT 0 NOT NULL,
"down_tcp_retrans_num" int4 DEFAULT 0 NOT NULL,
"up_tcp_lost_num" int4 DEFAULT 0 NOT NULL,
"down_tcp_lost_num" int4 DEFAULT 0 NOT NULL,
"ul_ip_frag_packets" int4 DEFAULT 0 NOT NULL,
"dl_ip_frag_packets" int4 DEFAULT 0 NOT NULL,
"tcp_drop_count" int4 DEFAULT 0 NOT NULL,
"tcp_total_count" int4 DEFAULT 0 NOT NULL,
"ul_rtt_times" int4 DEFAULT 0 NOT NULL,
"dl_rtt_times" int4 DEFAULT 0 NOT NULL,
"ul_rtt_total_delay" int4 DEFAULT 0 NOT NULL,
"dl_rtt_total_delay" int4 DEFAULT 0 NOT NULL,
"ul_zero_window_times" int4 DEFAULT 0 NOT NULL,
"dl_zero_window_times" int4 DEFAULT 0 NOT NULL,
"ul_zero_window_total_time" int4 DEFAULT 0 NOT NULL,
"dl_zero_window_total_time" int4 DEFAULT 0 NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for gem_vdt_road_analysis_uu_5m_imsi
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_vdt_road_analysis_uu_5m_imsi";
CREATE TABLE "public"."gem_vdt_road_analysis_uu_5m_imsi" (
"id" varchar COLLATE "default" DEFAULT next_id() NOT NULL,
"road_type_id" varchar COLLATE "default",
"road_id" varchar COLLATE "default",
"imsi" varchar COLLATE "default",
"statistical_time" timestamp(6),
"handover_count" int4 DEFAULT 0 NOT NULL,
"handover_success_count" int4 DEFAULT 0 NOT NULL,
"rrc_connection_setup_count" int4 DEFAULT 0 NOT NULL,
"rrc_connection_setup_success_count" int4 DEFAULT 0 NOT NULL,
"rrc_connection_reconfig_count" int4 DEFAULT 0 NOT NULL,
"rrc_connection_reconfig_success_count" int4 DEFAULT 0 NOT NULL,
"rrc_connection_reestablishment_count" int4 DEFAULT 0 NOT NULL,
"rrc_connection_reestablishment_success_count" int4 DEFAULT 0 NOT NULL,
"longitude" varchar COLLATE "default",
"latitude" varchar COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for gem_vdt_road_analysis_x2_5m_imsi
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_vdt_road_analysis_x2_5m_imsi";
CREATE TABLE "public"."gem_vdt_road_analysis_x2_5m_imsi" (
"id" varchar COLLATE "default" DEFAULT next_id() NOT NULL,
"road_type_id" varchar COLLATE "default",
"road_id" varchar COLLATE "default",
"imsi" varchar COLLATE "default",
"statistical_time" timestamp(6),
"handover_preparation_count" int4 DEFAULT 0 NOT NULL,
"handover_preparation_success_count" int4 DEFAULT 0 NOT NULL,
"longitude" varchar COLLATE "default",
"latitude" varchar COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for gem_vdt_road_filter
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_vdt_road_filter";
CREATE TABLE "public"."gem_vdt_road_filter" (
"id" varchar COLLATE "default" DEFAULT next_id() NOT NULL,
"road_id" varchar COLLATE "default",
"statistical_time" timestamp(6),
"imsi" varchar COLLATE "default",
"sample_count" int4 DEFAULT 0 NOT NULL,
"distance" float8 DEFAULT 0 NOT NULL,
"serving_rsrp_count" int4 DEFAULT 0 NOT NULL,
"serving_rsrp_30_count" int4 DEFAULT 0 NOT NULL,
"duration" int4 DEFAULT 0 NOT NULL,
"overlapping_coverage_count" int4 DEFAULT 0 NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for gem_x2_event_5m_statistics_by_imsi
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_x2_event_5m_statistics_by_imsi";
CREATE TABLE "public"."gem_x2_event_5m_statistics_by_imsi" (
"statistical_time" timestamp(6),
"imsi" varchar COLLATE "default",
"msisdn" varchar COLLATE "default",
"event_type" varchar(32) COLLATE "default",
"request_count" int4,
"success_count" int4,
"abnormal_count" int4,
"response_delay_time" int8,
"no_resp_count" int4,
"created_time" timestamp(6) DEFAULT now()
)
WITH (OIDS=FALSE)

;
COMMENT ON COLUMN "public"."gem_x2_event_5m_statistics_by_imsi"."no_resp_count" IS '无响应次数';

-- ----------------------------
-- Table structure for gem_x2_kpi_1d_failure_statistics
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_x2_kpi_1d_failure_statistics";
CREATE TABLE "public"."gem_x2_kpi_1d_failure_statistics" (
"id" varchar COLLATE "default" DEFAULT next_id() NOT NULL,
"statistical_time" timestamp(6),
"whole_network" varchar COLLATE "default",
"mme_group_id" varchar COLLATE "default",
"mme_code" varchar COLLATE "default",
"tac" varchar COLLATE "default",
"enodeb_id" varchar COLLATE "default",
"target_enodeb_id" varchar COLLATE "default",
"cell_id" varchar COLLATE "default",
"ue_brand" varchar COLLATE "default",
"ue_type" varchar COLLATE "default",
"event_type" varchar COLLATE "default",
"abnormal_type" int4,
"abnormal_reason" int4,
"abnormal_reason_count" int8,
"created_time" timestamp(6) DEFAULT now()
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for gem_x2_kpi_1d_failure_statistics_by_imsi
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_x2_kpi_1d_failure_statistics_by_imsi";
CREATE TABLE "public"."gem_x2_kpi_1d_failure_statistics_by_imsi" (
"id" varchar COLLATE "default" DEFAULT next_id() NOT NULL,
"statistical_time" timestamp(6),
"imsi" varchar COLLATE "default",
"event_type" varchar COLLATE "default",
"abnormal_type" int4,
"abnormal_reason" int4,
"abnormal_reason_count" int8,
"created_time" timestamp(6) DEFAULT now()
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for gem_x2_kpi_1d_statistics
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_x2_kpi_1d_statistics";
CREATE TABLE "public"."gem_x2_kpi_1d_statistics" (
"statistical_time" timestamp(6),
"whole_network" varchar COLLATE "default",
"mme_group_id" varchar COLLATE "default",
"mme_code" varchar COLLATE "default",
"tac" varchar COLLATE "default",
"enodeb_id" varchar COLLATE "default",
"target_enodeb_id" varchar COLLATE "default",
"cell_id" varchar COLLATE "default",
"ue_brand" varchar COLLATE "default",
"ue_type" varchar COLLATE "default",
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
"id" varchar COLLATE "default" DEFAULT next_id() NOT NULL,
"created_time" timestamp(6) DEFAULT now()
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."gem_x2_kpi_1d_statistics" IS 'X2_KP接口查询表';
COMMENT ON COLUMN "public"."gem_x2_kpi_1d_statistics"."statistical_time" IS '时间';
COMMENT ON COLUMN "public"."gem_x2_kpi_1d_statistics"."whole_network" IS '全网维度';
COMMENT ON COLUMN "public"."gem_x2_kpi_1d_statistics"."mme_group_id" IS 'mme pool维度';
COMMENT ON COLUMN "public"."gem_x2_kpi_1d_statistics"."mme_code" IS 'mme维度';
COMMENT ON COLUMN "public"."gem_x2_kpi_1d_statistics"."tac" IS 'TAC维度';
COMMENT ON COLUMN "public"."gem_x2_kpi_1d_statistics"."enodeb_id" IS '基站维度';
COMMENT ON COLUMN "public"."gem_x2_kpi_1d_statistics"."target_enodeb_id" IS '源基站_目标基站维度';
COMMENT ON COLUMN "public"."gem_x2_kpi_1d_statistics"."cell_id" IS '小区维度';
COMMENT ON COLUMN "public"."gem_x2_kpi_1d_statistics"."ue_brand" IS '终端品牌维度';
COMMENT ON COLUMN "public"."gem_x2_kpi_1d_statistics"."ue_type" IS '终端型号维度';
COMMENT ON COLUMN "public"."gem_x2_kpi_1d_statistics"."handover_preparation_count" IS 'X2切换准备请求次数';
COMMENT ON COLUMN "public"."gem_x2_kpi_1d_statistics"."handover_preparation_success_count" IS 'X2切换准备成功次数';
COMMENT ON COLUMN "public"."gem_x2_kpi_1d_statistics"."handover_preparation_delay_sum" IS 'X2切换准备响应时长和';
COMMENT ON COLUMN "public"."gem_x2_kpi_1d_statistics"."reset_count" IS 'X2 Reset请求次数';
COMMENT ON COLUMN "public"."gem_x2_kpi_1d_statistics"."reset_success_count" IS 'X2 Reset成功次数';
COMMENT ON COLUMN "public"."gem_x2_kpi_1d_statistics"."reset_delay_sum" IS 'X2 Reset响应时长和';
COMMENT ON COLUMN "public"."gem_x2_kpi_1d_statistics"."x2_setup_count" IS 'X2建立请求次数';
COMMENT ON COLUMN "public"."gem_x2_kpi_1d_statistics"."x2_setup_success_count" IS 'X2建立成功次数';
COMMENT ON COLUMN "public"."gem_x2_kpi_1d_statistics"."x2_setup_delay_sum" IS 'X2建立响应时长和';
COMMENT ON COLUMN "public"."gem_x2_kpi_1d_statistics"."enodeb_config_update_count" IS 'eNB配置更新请求次数';
COMMENT ON COLUMN "public"."gem_x2_kpi_1d_statistics"."enodeb_config_update_success_count" IS 'eNB配置更新成功次数';
COMMENT ON COLUMN "public"."gem_x2_kpi_1d_statistics"."enodeb_config_update_delay_sum" IS 'eNB配置更新响应时长和';
COMMENT ON COLUMN "public"."gem_x2_kpi_1d_statistics"."resource_status_count" IS '资源状态请求次数';
COMMENT ON COLUMN "public"."gem_x2_kpi_1d_statistics"."resource_status_success_count" IS '资源状态请求成功次数';
COMMENT ON COLUMN "public"."gem_x2_kpi_1d_statistics"."resource_status_delay_sum" IS '资源状态请求响应时长和';
COMMENT ON COLUMN "public"."gem_x2_kpi_1d_statistics"."mobility_settings_count" IS '移动性变更请求次数';
COMMENT ON COLUMN "public"."gem_x2_kpi_1d_statistics"."mobility_settings_success_count" IS '移动性变更请求成功次数';
COMMENT ON COLUMN "public"."gem_x2_kpi_1d_statistics"."mobility_settings_delay_sum" IS '移动性变更请求响应时长和';
COMMENT ON COLUMN "public"."gem_x2_kpi_1d_statistics"."cell_activation_count" IS '小区激活请求次数';
COMMENT ON COLUMN "public"."gem_x2_kpi_1d_statistics"."cell_activation_success_count" IS '小区激活成功次数';
COMMENT ON COLUMN "public"."gem_x2_kpi_1d_statistics"."cell_activation_delay_sum" IS '小区激活响应时长和';
COMMENT ON COLUMN "public"."gem_x2_kpi_1d_statistics"."load_indication_count" IS '负荷指示次数';
COMMENT ON COLUMN "public"."gem_x2_kpi_1d_statistics"."handover_cancel_count" IS '切换取消次数';
COMMENT ON COLUMN "public"."gem_x2_kpi_1d_statistics"."resource_status_update_count" IS '资源状态更新次数';

-- ----------------------------
-- Table structure for gem_x2_kpi_1d_statistics_by_imsi
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_x2_kpi_1d_statistics_by_imsi";
CREATE TABLE "public"."gem_x2_kpi_1d_statistics_by_imsi" (
"statistical_time" timestamp(6),
"imsi" varchar COLLATE "default",
"enodeb_id" varchar COLLATE "default",
"cell_id" varchar COLLATE "default",
"ue_type" varchar COLLATE "default",
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
"id" varchar COLLATE "default" DEFAULT next_id() NOT NULL,
"created_time" timestamp(6) DEFAULT now()
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."gem_x2_kpi_1d_statistics_by_imsi" IS 'X2_KP接口查询表';
COMMENT ON COLUMN "public"."gem_x2_kpi_1d_statistics_by_imsi"."statistical_time" IS '时间';
COMMENT ON COLUMN "public"."gem_x2_kpi_1d_statistics_by_imsi"."imsi" IS '用户维度';
COMMENT ON COLUMN "public"."gem_x2_kpi_1d_statistics_by_imsi"."handover_preparation_count" IS 'X2切换准备请求次数';
COMMENT ON COLUMN "public"."gem_x2_kpi_1d_statistics_by_imsi"."handover_preparation_success_count" IS 'X2切换准备成功次数';
COMMENT ON COLUMN "public"."gem_x2_kpi_1d_statistics_by_imsi"."handover_preparation_delay_sum" IS 'X2切换准备响应时长和';
COMMENT ON COLUMN "public"."gem_x2_kpi_1d_statistics_by_imsi"."reset_count" IS 'X2 Reset请求次数';
COMMENT ON COLUMN "public"."gem_x2_kpi_1d_statistics_by_imsi"."reset_success_count" IS 'X2 Reset成功次数';
COMMENT ON COLUMN "public"."gem_x2_kpi_1d_statistics_by_imsi"."reset_delay_sum" IS 'X2 Reset响应时长和';
COMMENT ON COLUMN "public"."gem_x2_kpi_1d_statistics_by_imsi"."x2_setup_count" IS 'X2建立请求次数';
COMMENT ON COLUMN "public"."gem_x2_kpi_1d_statistics_by_imsi"."x2_setup_success_count" IS 'X2建立成功次数';
COMMENT ON COLUMN "public"."gem_x2_kpi_1d_statistics_by_imsi"."x2_setup_delay_sum" IS 'X2建立响应时长和';
COMMENT ON COLUMN "public"."gem_x2_kpi_1d_statistics_by_imsi"."enodeb_config_update_count" IS 'eNB配置更新请求次数';
COMMENT ON COLUMN "public"."gem_x2_kpi_1d_statistics_by_imsi"."enodeb_config_update_success_count" IS 'eNB配置更新成功次数';
COMMENT ON COLUMN "public"."gem_x2_kpi_1d_statistics_by_imsi"."enodeb_config_update_delay_sum" IS 'eNB配置更新响应时长和';
COMMENT ON COLUMN "public"."gem_x2_kpi_1d_statistics_by_imsi"."resource_status_count" IS '资源状态请求次数';
COMMENT ON COLUMN "public"."gem_x2_kpi_1d_statistics_by_imsi"."resource_status_success_count" IS '资源状态请求成功次数';
COMMENT ON COLUMN "public"."gem_x2_kpi_1d_statistics_by_imsi"."resource_status_delay_sum" IS '资源状态请求响应时长和';
COMMENT ON COLUMN "public"."gem_x2_kpi_1d_statistics_by_imsi"."mobility_settings_count" IS '移动性变更请求次数';
COMMENT ON COLUMN "public"."gem_x2_kpi_1d_statistics_by_imsi"."mobility_settings_success_count" IS '移动性变更请求成功次数';
COMMENT ON COLUMN "public"."gem_x2_kpi_1d_statistics_by_imsi"."mobility_settings_delay_sum" IS '移动性变更请求响应时长和';
COMMENT ON COLUMN "public"."gem_x2_kpi_1d_statistics_by_imsi"."cell_activation_count" IS '小区激活请求次数';
COMMENT ON COLUMN "public"."gem_x2_kpi_1d_statistics_by_imsi"."cell_activation_success_count" IS '小区激活成功次数';
COMMENT ON COLUMN "public"."gem_x2_kpi_1d_statistics_by_imsi"."cell_activation_delay_sum" IS '小区激活响应时长和';
COMMENT ON COLUMN "public"."gem_x2_kpi_1d_statistics_by_imsi"."load_indication_count" IS '负荷指示次数';
COMMENT ON COLUMN "public"."gem_x2_kpi_1d_statistics_by_imsi"."handover_cancel_count" IS '切换取消次数';
COMMENT ON COLUMN "public"."gem_x2_kpi_1d_statistics_by_imsi"."resource_status_update_count" IS '资源状态更新次数';

-- ----------------------------
-- Table structure for gem_x2_kpi_1h_failure_statistics
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_x2_kpi_1h_failure_statistics";
CREATE TABLE "public"."gem_x2_kpi_1h_failure_statistics" (
"id" varchar COLLATE "default" DEFAULT next_id() NOT NULL,
"statistical_time" timestamp(6),
"whole_network" varchar COLLATE "default",
"mme_group_id" varchar COLLATE "default",
"mme_code" varchar COLLATE "default",
"tac" varchar COLLATE "default",
"enodeb_id" varchar COLLATE "default",
"target_enodeb_id" varchar COLLATE "default",
"cell_id" varchar COLLATE "default",
"ue_brand" varchar COLLATE "default",
"ue_type" varchar COLLATE "default",
"event_type" varchar COLLATE "default",
"abnormal_type" int4,
"abnormal_reason" int4,
"abnormal_reason_count" int8,
"created_time" timestamp(6) DEFAULT now()
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for gem_x2_kpi_1h_failure_statistics_by_imsi
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_x2_kpi_1h_failure_statistics_by_imsi";
CREATE TABLE "public"."gem_x2_kpi_1h_failure_statistics_by_imsi" (
"id" varchar COLLATE "default" DEFAULT next_id() NOT NULL,
"statistical_time" timestamp(6),
"imsi" varchar COLLATE "default",
"event_type" varchar COLLATE "default",
"abnormal_type" int4,
"abnormal_reason" int4,
"abnormal_reason_count" int8,
"created_time" timestamp(6) DEFAULT now()
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for gem_x2_kpi_1h_statistics
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_x2_kpi_1h_statistics";
CREATE TABLE "public"."gem_x2_kpi_1h_statistics" (
"statistical_time" timestamp(6),
"whole_network" varchar COLLATE "default",
"mme_group_id" varchar COLLATE "default",
"mme_code" varchar COLLATE "default",
"tac" varchar COLLATE "default",
"enodeb_id" varchar COLLATE "default",
"target_enodeb_id" varchar COLLATE "default",
"cell_id" varchar COLLATE "default",
"ue_brand" varchar COLLATE "default",
"ue_type" varchar COLLATE "default",
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
"id" varchar COLLATE "default" DEFAULT next_id() NOT NULL,
"created_time" timestamp(6) DEFAULT now()
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."gem_x2_kpi_1h_statistics" IS 'X2_KP接口查询表';
COMMENT ON COLUMN "public"."gem_x2_kpi_1h_statistics"."statistical_time" IS '时间';
COMMENT ON COLUMN "public"."gem_x2_kpi_1h_statistics"."whole_network" IS '全网维度';
COMMENT ON COLUMN "public"."gem_x2_kpi_1h_statistics"."mme_group_id" IS 'mme pool维度';
COMMENT ON COLUMN "public"."gem_x2_kpi_1h_statistics"."mme_code" IS 'mme维度';
COMMENT ON COLUMN "public"."gem_x2_kpi_1h_statistics"."tac" IS 'TAC维度';
COMMENT ON COLUMN "public"."gem_x2_kpi_1h_statistics"."enodeb_id" IS '基站维度';
COMMENT ON COLUMN "public"."gem_x2_kpi_1h_statistics"."target_enodeb_id" IS '源基站_目标基站维度';
COMMENT ON COLUMN "public"."gem_x2_kpi_1h_statistics"."cell_id" IS '小区维度';
COMMENT ON COLUMN "public"."gem_x2_kpi_1h_statistics"."ue_brand" IS '终端品牌维度';
COMMENT ON COLUMN "public"."gem_x2_kpi_1h_statistics"."ue_type" IS '终端型号维度';
COMMENT ON COLUMN "public"."gem_x2_kpi_1h_statistics"."handover_preparation_count" IS 'X2切换准备请求次数';
COMMENT ON COLUMN "public"."gem_x2_kpi_1h_statistics"."handover_preparation_success_count" IS 'X2切换准备成功次数';
COMMENT ON COLUMN "public"."gem_x2_kpi_1h_statistics"."handover_preparation_delay_sum" IS 'X2切换准备响应时长和';
COMMENT ON COLUMN "public"."gem_x2_kpi_1h_statistics"."reset_count" IS 'X2 Reset请求次数';
COMMENT ON COLUMN "public"."gem_x2_kpi_1h_statistics"."reset_success_count" IS 'X2 Reset成功次数';
COMMENT ON COLUMN "public"."gem_x2_kpi_1h_statistics"."reset_delay_sum" IS 'X2 Reset响应时长和';
COMMENT ON COLUMN "public"."gem_x2_kpi_1h_statistics"."x2_setup_count" IS 'X2建立请求次数';
COMMENT ON COLUMN "public"."gem_x2_kpi_1h_statistics"."x2_setup_success_count" IS 'X2建立成功次数';
COMMENT ON COLUMN "public"."gem_x2_kpi_1h_statistics"."x2_setup_delay_sum" IS 'X2建立响应时长和';
COMMENT ON COLUMN "public"."gem_x2_kpi_1h_statistics"."enodeb_config_update_count" IS 'eNB配置更新请求次数';
COMMENT ON COLUMN "public"."gem_x2_kpi_1h_statistics"."enodeb_config_update_success_count" IS 'eNB配置更新成功次数';
COMMENT ON COLUMN "public"."gem_x2_kpi_1h_statistics"."enodeb_config_update_delay_sum" IS 'eNB配置更新响应时长和';
COMMENT ON COLUMN "public"."gem_x2_kpi_1h_statistics"."resource_status_count" IS '资源状态请求次数';
COMMENT ON COLUMN "public"."gem_x2_kpi_1h_statistics"."resource_status_success_count" IS '资源状态请求成功次数';
COMMENT ON COLUMN "public"."gem_x2_kpi_1h_statistics"."resource_status_delay_sum" IS '资源状态请求响应时长和';
COMMENT ON COLUMN "public"."gem_x2_kpi_1h_statistics"."mobility_settings_count" IS '移动性变更请求次数';
COMMENT ON COLUMN "public"."gem_x2_kpi_1h_statistics"."mobility_settings_success_count" IS '移动性变更请求成功次数';
COMMENT ON COLUMN "public"."gem_x2_kpi_1h_statistics"."mobility_settings_delay_sum" IS '移动性变更请求响应时长和';
COMMENT ON COLUMN "public"."gem_x2_kpi_1h_statistics"."cell_activation_count" IS '小区激活请求次数';
COMMENT ON COLUMN "public"."gem_x2_kpi_1h_statistics"."cell_activation_success_count" IS '小区激活成功次数';
COMMENT ON COLUMN "public"."gem_x2_kpi_1h_statistics"."cell_activation_delay_sum" IS '小区激活响应时长和';
COMMENT ON COLUMN "public"."gem_x2_kpi_1h_statistics"."load_indication_count" IS '负荷指示次数';
COMMENT ON COLUMN "public"."gem_x2_kpi_1h_statistics"."handover_cancel_count" IS '切换取消次数';
COMMENT ON COLUMN "public"."gem_x2_kpi_1h_statistics"."resource_status_update_count" IS '资源状态更新次数';

-- ----------------------------
-- Table structure for gem_x2_kpi_1h_statistics_by_imsi
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_x2_kpi_1h_statistics_by_imsi";
CREATE TABLE "public"."gem_x2_kpi_1h_statistics_by_imsi" (
"statistical_time" timestamp(6),
"imsi" varchar COLLATE "default",
"enodeb_id" varchar COLLATE "default",
"cell_id" varchar COLLATE "default",
"ue_type" varchar COLLATE "default",
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
"id" varchar COLLATE "default" DEFAULT next_id() NOT NULL,
"created_time" timestamp(6) DEFAULT now()
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."gem_x2_kpi_1h_statistics_by_imsi" IS 'X2_KP接口查询表';
COMMENT ON COLUMN "public"."gem_x2_kpi_1h_statistics_by_imsi"."statistical_time" IS '时间';
COMMENT ON COLUMN "public"."gem_x2_kpi_1h_statistics_by_imsi"."imsi" IS '用户维度';
COMMENT ON COLUMN "public"."gem_x2_kpi_1h_statistics_by_imsi"."handover_preparation_count" IS 'X2切换准备请求次数';
COMMENT ON COLUMN "public"."gem_x2_kpi_1h_statistics_by_imsi"."handover_preparation_success_count" IS 'X2切换准备成功次数';
COMMENT ON COLUMN "public"."gem_x2_kpi_1h_statistics_by_imsi"."handover_preparation_delay_sum" IS 'X2切换准备响应时长和';
COMMENT ON COLUMN "public"."gem_x2_kpi_1h_statistics_by_imsi"."reset_count" IS 'X2 Reset请求次数';
COMMENT ON COLUMN "public"."gem_x2_kpi_1h_statistics_by_imsi"."reset_success_count" IS 'X2 Reset成功次数';
COMMENT ON COLUMN "public"."gem_x2_kpi_1h_statistics_by_imsi"."reset_delay_sum" IS 'X2 Reset响应时长和';
COMMENT ON COLUMN "public"."gem_x2_kpi_1h_statistics_by_imsi"."x2_setup_count" IS 'X2建立请求次数';
COMMENT ON COLUMN "public"."gem_x2_kpi_1h_statistics_by_imsi"."x2_setup_success_count" IS 'X2建立成功次数';
COMMENT ON COLUMN "public"."gem_x2_kpi_1h_statistics_by_imsi"."x2_setup_delay_sum" IS 'X2建立响应时长和';
COMMENT ON COLUMN "public"."gem_x2_kpi_1h_statistics_by_imsi"."enodeb_config_update_count" IS 'eNB配置更新请求次数';
COMMENT ON COLUMN "public"."gem_x2_kpi_1h_statistics_by_imsi"."enodeb_config_update_success_count" IS 'eNB配置更新成功次数';
COMMENT ON COLUMN "public"."gem_x2_kpi_1h_statistics_by_imsi"."enodeb_config_update_delay_sum" IS 'eNB配置更新响应时长和';
COMMENT ON COLUMN "public"."gem_x2_kpi_1h_statistics_by_imsi"."resource_status_count" IS '资源状态请求次数';
COMMENT ON COLUMN "public"."gem_x2_kpi_1h_statistics_by_imsi"."resource_status_success_count" IS '资源状态请求成功次数';
COMMENT ON COLUMN "public"."gem_x2_kpi_1h_statistics_by_imsi"."resource_status_delay_sum" IS '资源状态请求响应时长和';
COMMENT ON COLUMN "public"."gem_x2_kpi_1h_statistics_by_imsi"."mobility_settings_count" IS '移动性变更请求次数';
COMMENT ON COLUMN "public"."gem_x2_kpi_1h_statistics_by_imsi"."mobility_settings_success_count" IS '移动性变更请求成功次数';
COMMENT ON COLUMN "public"."gem_x2_kpi_1h_statistics_by_imsi"."mobility_settings_delay_sum" IS '移动性变更请求响应时长和';
COMMENT ON COLUMN "public"."gem_x2_kpi_1h_statistics_by_imsi"."cell_activation_count" IS '小区激活请求次数';
COMMENT ON COLUMN "public"."gem_x2_kpi_1h_statistics_by_imsi"."cell_activation_success_count" IS '小区激活成功次数';
COMMENT ON COLUMN "public"."gem_x2_kpi_1h_statistics_by_imsi"."cell_activation_delay_sum" IS '小区激活响应时长和';
COMMENT ON COLUMN "public"."gem_x2_kpi_1h_statistics_by_imsi"."load_indication_count" IS '负荷指示次数';
COMMENT ON COLUMN "public"."gem_x2_kpi_1h_statistics_by_imsi"."handover_cancel_count" IS '切换取消次数';
COMMENT ON COLUMN "public"."gem_x2_kpi_1h_statistics_by_imsi"."resource_status_update_count" IS '资源状态更新次数';

-- ----------------------------
-- Table structure for gem_x2_kpi_5m_failure_statistics
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_x2_kpi_5m_failure_statistics";
CREATE TABLE "public"."gem_x2_kpi_5m_failure_statistics" (
"id" varchar COLLATE "default" DEFAULT next_id() NOT NULL,
"statistical_time" timestamp(6),
"whole_network" varchar COLLATE "default",
"mme_group_id" varchar COLLATE "default",
"mme_code" varchar COLLATE "default",
"tac" varchar COLLATE "default",
"enodeb_id" varchar COLLATE "default",
"target_enodeb_id" varchar COLLATE "default",
"cell_id" varchar COLLATE "default",
"ue_brand" varchar COLLATE "default",
"ue_type" varchar COLLATE "default",
"event_type" varchar COLLATE "default",
"abnormal_type" int4,
"abnormal_reason" int4,
"abnormal_reason_count" int8,
"created_time" timestamp(6) DEFAULT now()
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for gem_x2_kpi_5m_failure_statistics_by_imsi
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_x2_kpi_5m_failure_statistics_by_imsi";
CREATE TABLE "public"."gem_x2_kpi_5m_failure_statistics_by_imsi" (
"id" varchar COLLATE "default" DEFAULT next_id() NOT NULL,
"statistical_time" timestamp(6),
"imsi" varchar(64) COLLATE "default",
"event_type" varchar COLLATE "default",
"abnormal_type" int4,
"abnormal_reason" int4,
"abnormal_reason_count" int8,
"created_time" timestamp(6) DEFAULT now()
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for gem_x2_kpi_5m_statistics
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_x2_kpi_5m_statistics";
CREATE TABLE "public"."gem_x2_kpi_5m_statistics" (
"statistical_time" timestamp(6),
"whole_network" varchar COLLATE "default",
"mme_group_id" varchar COLLATE "default",
"mme_code" varchar COLLATE "default",
"tac" varchar COLLATE "default",
"enodeb_id" varchar COLLATE "default",
"target_enodeb_id" varchar COLLATE "default",
"cell_id" varchar COLLATE "default",
"ue_brand" varchar COLLATE "default",
"ue_type" varchar COLLATE "default",
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
"id" varchar COLLATE "default" DEFAULT next_id() NOT NULL,
"created_time" timestamp(6) DEFAULT now()
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."gem_x2_kpi_5m_statistics" IS 'X2_KP接口查询表';
COMMENT ON COLUMN "public"."gem_x2_kpi_5m_statistics"."statistical_time" IS '时间';
COMMENT ON COLUMN "public"."gem_x2_kpi_5m_statistics"."whole_network" IS '全网维度';
COMMENT ON COLUMN "public"."gem_x2_kpi_5m_statistics"."mme_group_id" IS 'mme pool维度';
COMMENT ON COLUMN "public"."gem_x2_kpi_5m_statistics"."mme_code" IS 'mme维度';
COMMENT ON COLUMN "public"."gem_x2_kpi_5m_statistics"."tac" IS 'TAC维度';
COMMENT ON COLUMN "public"."gem_x2_kpi_5m_statistics"."enodeb_id" IS '基站维度';
COMMENT ON COLUMN "public"."gem_x2_kpi_5m_statistics"."target_enodeb_id" IS '源基站_目标基站维度';
COMMENT ON COLUMN "public"."gem_x2_kpi_5m_statistics"."cell_id" IS '小区维度';
COMMENT ON COLUMN "public"."gem_x2_kpi_5m_statistics"."ue_brand" IS '终端品牌维度';
COMMENT ON COLUMN "public"."gem_x2_kpi_5m_statistics"."ue_type" IS '终端型号维度';
COMMENT ON COLUMN "public"."gem_x2_kpi_5m_statistics"."handover_preparation_count" IS 'X2切换准备请求次数';
COMMENT ON COLUMN "public"."gem_x2_kpi_5m_statistics"."handover_preparation_success_count" IS 'X2切换准备成功次数';
COMMENT ON COLUMN "public"."gem_x2_kpi_5m_statistics"."handover_preparation_delay_sum" IS 'X2切换准备响应时长和';
COMMENT ON COLUMN "public"."gem_x2_kpi_5m_statistics"."reset_count" IS 'X2 Reset请求次数';
COMMENT ON COLUMN "public"."gem_x2_kpi_5m_statistics"."reset_success_count" IS 'X2 Reset成功次数';
COMMENT ON COLUMN "public"."gem_x2_kpi_5m_statistics"."reset_delay_sum" IS 'X2 Reset响应时长和';
COMMENT ON COLUMN "public"."gem_x2_kpi_5m_statistics"."x2_setup_count" IS 'X2建立请求次数';
COMMENT ON COLUMN "public"."gem_x2_kpi_5m_statistics"."x2_setup_success_count" IS 'X2建立成功次数';
COMMENT ON COLUMN "public"."gem_x2_kpi_5m_statistics"."x2_setup_delay_sum" IS 'X2建立响应时长和';
COMMENT ON COLUMN "public"."gem_x2_kpi_5m_statistics"."enodeb_config_update_count" IS 'eNB配置更新请求次数';
COMMENT ON COLUMN "public"."gem_x2_kpi_5m_statistics"."enodeb_config_update_success_count" IS 'eNB配置更新成功次数';
COMMENT ON COLUMN "public"."gem_x2_kpi_5m_statistics"."enodeb_config_update_delay_sum" IS 'eNB配置更新响应时长和';
COMMENT ON COLUMN "public"."gem_x2_kpi_5m_statistics"."resource_status_count" IS '资源状态请求次数';
COMMENT ON COLUMN "public"."gem_x2_kpi_5m_statistics"."resource_status_success_count" IS '资源状态请求成功次数';
COMMENT ON COLUMN "public"."gem_x2_kpi_5m_statistics"."resource_status_delay_sum" IS '资源状态请求响应时长和';
COMMENT ON COLUMN "public"."gem_x2_kpi_5m_statistics"."mobility_settings_count" IS '移动性变更请求次数';
COMMENT ON COLUMN "public"."gem_x2_kpi_5m_statistics"."mobility_settings_success_count" IS '移动性变更请求成功次数';
COMMENT ON COLUMN "public"."gem_x2_kpi_5m_statistics"."mobility_settings_delay_sum" IS '移动性变更请求响应时长和';
COMMENT ON COLUMN "public"."gem_x2_kpi_5m_statistics"."cell_activation_count" IS '小区激活请求次数';
COMMENT ON COLUMN "public"."gem_x2_kpi_5m_statistics"."cell_activation_success_count" IS '小区激活成功次数';
COMMENT ON COLUMN "public"."gem_x2_kpi_5m_statistics"."cell_activation_delay_sum" IS '小区激活响应时长和';
COMMENT ON COLUMN "public"."gem_x2_kpi_5m_statistics"."load_indication_count" IS '负荷指示次数';
COMMENT ON COLUMN "public"."gem_x2_kpi_5m_statistics"."handover_cancel_count" IS '切换取消次数';
COMMENT ON COLUMN "public"."gem_x2_kpi_5m_statistics"."resource_status_update_count" IS '资源状态更新次数';

-- ----------------------------
-- Table structure for gem_x2_kpi_5m_statistics_by_imsi
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_x2_kpi_5m_statistics_by_imsi";
CREATE TABLE "public"."gem_x2_kpi_5m_statistics_by_imsi" (
"statistical_time" timestamp(6),
"imsi" varchar COLLATE "default",
"enodeb_id" varchar COLLATE "default",
"cell_id" varchar COLLATE "default",
"ue_type" varchar COLLATE "default",
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
"id" varchar COLLATE "default" DEFAULT next_id() NOT NULL,
"created_time" timestamp(6) DEFAULT now()
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."gem_x2_kpi_5m_statistics_by_imsi" IS 'X2_KP接口查询表';
COMMENT ON COLUMN "public"."gem_x2_kpi_5m_statistics_by_imsi"."statistical_time" IS '时间';
COMMENT ON COLUMN "public"."gem_x2_kpi_5m_statistics_by_imsi"."imsi" IS '用户维度';
COMMENT ON COLUMN "public"."gem_x2_kpi_5m_statistics_by_imsi"."handover_preparation_count" IS 'X2切换准备请求次数';
COMMENT ON COLUMN "public"."gem_x2_kpi_5m_statistics_by_imsi"."handover_preparation_success_count" IS 'X2切换准备成功次数';
COMMENT ON COLUMN "public"."gem_x2_kpi_5m_statistics_by_imsi"."handover_preparation_delay_sum" IS 'X2切换准备响应时长和';
COMMENT ON COLUMN "public"."gem_x2_kpi_5m_statistics_by_imsi"."reset_count" IS 'X2 Reset请求次数';
COMMENT ON COLUMN "public"."gem_x2_kpi_5m_statistics_by_imsi"."reset_success_count" IS 'X2 Reset成功次数';
COMMENT ON COLUMN "public"."gem_x2_kpi_5m_statistics_by_imsi"."reset_delay_sum" IS 'X2 Reset响应时长和';
COMMENT ON COLUMN "public"."gem_x2_kpi_5m_statistics_by_imsi"."x2_setup_count" IS 'X2建立请求次数';
COMMENT ON COLUMN "public"."gem_x2_kpi_5m_statistics_by_imsi"."x2_setup_success_count" IS 'X2建立成功次数';
COMMENT ON COLUMN "public"."gem_x2_kpi_5m_statistics_by_imsi"."x2_setup_delay_sum" IS 'X2建立响应时长和';
COMMENT ON COLUMN "public"."gem_x2_kpi_5m_statistics_by_imsi"."enodeb_config_update_count" IS 'eNB配置更新请求次数';
COMMENT ON COLUMN "public"."gem_x2_kpi_5m_statistics_by_imsi"."enodeb_config_update_success_count" IS 'eNB配置更新成功次数';
COMMENT ON COLUMN "public"."gem_x2_kpi_5m_statistics_by_imsi"."enodeb_config_update_delay_sum" IS 'eNB配置更新响应时长和';
COMMENT ON COLUMN "public"."gem_x2_kpi_5m_statistics_by_imsi"."resource_status_count" IS '资源状态请求次数';
COMMENT ON COLUMN "public"."gem_x2_kpi_5m_statistics_by_imsi"."resource_status_success_count" IS '资源状态请求成功次数';
COMMENT ON COLUMN "public"."gem_x2_kpi_5m_statistics_by_imsi"."resource_status_delay_sum" IS '资源状态请求响应时长和';
COMMENT ON COLUMN "public"."gem_x2_kpi_5m_statistics_by_imsi"."mobility_settings_count" IS '移动性变更请求次数';
COMMENT ON COLUMN "public"."gem_x2_kpi_5m_statistics_by_imsi"."mobility_settings_success_count" IS '移动性变更请求成功次数';
COMMENT ON COLUMN "public"."gem_x2_kpi_5m_statistics_by_imsi"."mobility_settings_delay_sum" IS '移动性变更请求响应时长和';
COMMENT ON COLUMN "public"."gem_x2_kpi_5m_statistics_by_imsi"."cell_activation_count" IS '小区激活请求次数';
COMMENT ON COLUMN "public"."gem_x2_kpi_5m_statistics_by_imsi"."cell_activation_success_count" IS '小区激活成功次数';
COMMENT ON COLUMN "public"."gem_x2_kpi_5m_statistics_by_imsi"."cell_activation_delay_sum" IS '小区激活响应时长和';
COMMENT ON COLUMN "public"."gem_x2_kpi_5m_statistics_by_imsi"."load_indication_count" IS '负荷指示次数';
COMMENT ON COLUMN "public"."gem_x2_kpi_5m_statistics_by_imsi"."handover_cancel_count" IS '切换取消次数';
COMMENT ON COLUMN "public"."gem_x2_kpi_5m_statistics_by_imsi"."resource_status_update_count" IS '资源状态更新次数';


DROP TABLE IF EXISTS gem_key_indicator_alerting_rules CASCADE;

CREATE TABLE gem_key_indicator_alerting_rules
(
   id                          varchar     DEFAULT next_id() NOT NULL,
   name                        varchar,
   network_interface          varchar,
   dimension_type              varchar,
   indicator_id                varchar,
   affected_element_ids        varchar,
   rule_assert_expression_ids  varchar,
   interval                    integer,
   active_sms                  boolean,
   modified_time               timestamp,
   created_time                timestamp   DEFAULT now(),
   enabled                     bool        DEFAULT true
);

ALTER TABLE gem_key_indicator_alerting_rules
   ADD CONSTRAINT gem_key_indicator_alerting_rules_pkey
   PRIMARY KEY (id);
-- ----------------------------
-- Uniques structure for table gem_key_indicator_alerting_rules
-- ----------------------------
ALTER TABLE "public"."gem_key_indicator_alerting_rules" ADD UNIQUE ("name");

COMMENT ON TABLE gem_key_indicator_alerting_rules IS '核心指标告警规则表';
COMMENT ON COLUMN gem_key_indicator_alerting_rules.name IS '告警规则名称';
COMMENT ON COLUMN gem_key_indicator_alerting_rules.network_interface IS '接口';
COMMENT ON COLUMN gem_key_indicator_alerting_rules.dimension_type IS '维度类型：区域，业务，网元';
COMMENT ON COLUMN gem_key_indicator_alerting_rules.indicator_id IS '指标id';
COMMENT ON COLUMN gem_key_indicator_alerting_rules.affected_element_ids IS '影响范围';
COMMENT ON COLUMN gem_key_indicator_alerting_rules.rule_assert_expression_ids IS '告警规则表达式id';
COMMENT ON COLUMN gem_key_indicator_alerting_rules.interval IS '刷新时间粒度';
COMMENT ON COLUMN gem_key_indicator_alerting_rules.active_sms IS '是否触发短信告警';
COMMENT ON COLUMN gem_key_indicator_alerting_rules.enabled IS '是否启用';

COMMIT;

DROP TABLE IF EXISTS gem_key_indicators_alerting_area_statistics CASCADE;

CREATE TABLE gem_key_indicators_alerting_area_statistics
(
   id               varchar     DEFAULT next_id() NOT NULL,
   area_id          varchar,
   indicator_id     varchar,
   indicator_value  numeric,
   priority         integer,
   interval         integer,
   triggered_time   timestamp   NOT NULL,
   rule_id          varchar
);

ALTER TABLE gem_key_indicators_alerting_area_statistics
   ADD CONSTRAINT gem_key_indicators_alerting_area_statistics_pkey
   PRIMARY KEY (id);

COMMENT ON TABLE gem_key_indicators_alerting_area_statistics IS '区域维度核心指标告警数据表';
COMMENT ON COLUMN gem_key_indicators_alerting_area_statistics.area_id IS '区域ID';
COMMENT ON COLUMN gem_key_indicators_alerting_area_statistics.indicator_id IS '指标ID';
COMMENT ON COLUMN gem_key_indicators_alerting_area_statistics.indicator_value IS '指标值';
COMMENT ON COLUMN gem_key_indicators_alerting_area_statistics.priority IS '告警级别';
COMMENT ON COLUMN gem_key_indicators_alerting_area_statistics.interval IS '时间粒度';
COMMENT ON COLUMN gem_key_indicators_alerting_area_statistics.triggered_time IS '告警被触发的时间';
COMMENT ON COLUMN gem_key_indicators_alerting_area_statistics.rule_id IS '规则id';
COMMIT;


DROP TABLE IF EXISTS gem_key_indicators_alerting_area_cell_statistics CASCADE;

CREATE TABLE gem_key_indicators_alerting_area_cell_statistics
(
   id                     varchar     DEFAULT next_id() NOT NULL,
   area_id                varchar,
   cell_id            varchar,
   indicator_id           varchar,
   indicator_value        numeric,
   priority               integer,
   interval               integer,
   triggered_time         timestamp NOT NULL,
   rule_id                varchar
);

ALTER TABLE gem_key_indicators_alerting_area_cell_statistics
   ADD CONSTRAINT gem_key_indicators_alerting_area_cell_statistics_pkey
   PRIMARY KEY (id);
COMMENT ON TABLE gem_key_indicators_alerting_area_cell_statistics IS '区域小区维度核心指标告警数据表';
COMMENT ON COLUMN gem_key_indicators_alerting_area_cell_statistics.area_id IS '区域ID';
COMMENT ON COLUMN gem_key_indicators_alerting_area_cell_statistics.cell_id IS '小区ID';
COMMENT ON COLUMN gem_key_indicators_alerting_area_cell_statistics.indicator_id IS '指标ID';
COMMENT ON COLUMN gem_key_indicators_alerting_area_cell_statistics.indicator_value IS '指标值';
COMMENT ON COLUMN gem_key_indicators_alerting_area_cell_statistics.priority IS '告警级别';
COMMENT ON COLUMN gem_key_indicators_alerting_area_cell_statistics.interval IS '时间粒度';
COMMENT ON COLUMN gem_key_indicators_alerting_area_cell_statistics.triggered_time IS '告警被触发的时间';
COMMENT ON COLUMN gem_key_indicators_alerting_area_cell_statistics.rule_id IS '规则id';
COMMIT;


DROP TABLE IF EXISTS gem_key_indicators_alerting_app_statistics CASCADE;

CREATE TABLE gem_key_indicators_alerting_app_statistics
(
   id                     varchar     DEFAULT next_id() NOT NULL,
   app_id                varchar,
   indicator_id           varchar,
   indicator_value        numeric,
   priority               integer,
   interval               integer,
   triggered_time         timestamp NOT NULL,
   rule_id                varchar
);

ALTER TABLE gem_key_indicators_alerting_app_statistics
   ADD CONSTRAINT gem_key_indicators_alerting_app_statistics_pkey
   PRIMARY KEY (id);
COMMENT ON TABLE gem_key_indicators_alerting_app_statistics IS '业务维度核心指标告警数据表';
COMMENT ON COLUMN gem_key_indicators_alerting_app_statistics.app_id IS '业务小类ID';
COMMENT ON COLUMN gem_key_indicators_alerting_app_statistics.indicator_id IS '指标ID';
COMMENT ON COLUMN gem_key_indicators_alerting_app_statistics.indicator_value IS '指标值';
COMMENT ON COLUMN gem_key_indicators_alerting_app_statistics.priority IS '告警级别';
COMMENT ON COLUMN gem_key_indicators_alerting_app_statistics.interval IS '时间粒度';
COMMENT ON COLUMN gem_key_indicators_alerting_app_statistics.triggered_time IS '告警被触发的时间';
COMMENT ON COLUMN gem_key_indicators_alerting_app_statistics.rule_id IS '规则id';
COMMIT;

DROP TABLE IF EXISTS gem_key_indicators_alerting_network_element_statistics CASCADE;

CREATE TABLE gem_key_indicators_alerting_network_element_statistics
(
   id                     varchar     DEFAULT next_id() NOT NULL,
   network_element_id                varchar,
   indicator_id           varchar,
   indicator_value        numeric,
   priority               integer,
   interval               integer,
   triggered_time         timestamp NOT NULL,
   rule_id                varchar
);

ALTER TABLE gem_key_indicators_alerting_network_element_statistics
   ADD CONSTRAINT gem_key_indicators_alerting_network_element_statistics_pkey
   PRIMARY KEY (id);
COMMENT ON TABLE gem_key_indicators_alerting_network_element_statistics IS '网元核心指标告警数据表';
COMMENT ON COLUMN gem_key_indicators_alerting_network_element_statistics.network_element_id IS '网元ID';
COMMENT ON COLUMN gem_key_indicators_alerting_network_element_statistics.indicator_id IS '指标ID';
COMMENT ON COLUMN gem_key_indicators_alerting_network_element_statistics.indicator_value IS '指标值';
COMMENT ON COLUMN gem_key_indicators_alerting_network_element_statistics.priority IS '告警级别';
COMMENT ON COLUMN gem_key_indicators_alerting_network_element_statistics.interval IS '时间粒度';
COMMENT ON COLUMN gem_key_indicators_alerting_network_element_statistics.triggered_time IS '告警被触发的时间';
COMMENT ON COLUMN gem_key_indicators_alerting_network_element_statistics.rule_id IS '规则id';
COMMIT;

-- gem_applications
DROP TABLE IF EXISTS gem_applications;
CREATE TABLE gem_applications (
  id                 VARCHAR COLLATE "default" DEFAULT next_id() NOT NULL,
  name               VARCHAR COLLATE "default",
  intsid1            INT4,
  app_type           INT4,
  app_sub_type       VARCHAR COLLATE "default",
  is_own_application BOOL
)
WITH (OIDS = FALSE
);
COMMENT ON TABLE "public"."gem_applications" IS '业务APP表';
COMMENT ON COLUMN "public"."gem_applications"."name" IS '业务小类名称';
COMMENT ON COLUMN "public"."gem_applications"."intsid1" IS 'intsid1';
COMMENT ON COLUMN "public"."gem_applications"."app_type" IS '业务大类ID';
COMMENT ON COLUMN "public"."gem_applications"."app_sub_type" IS '业务小类ID';
ALTER TABLE "gem_applications"
  ADD CONSTRAINT "gem_applications_unique_idx_app_type_app_sub_type" UNIQUE ("app_type", "app_sub_type");

-- gem_areas
DROP TABLE IF EXISTS gem_areas CASCADE;
CREATE TABLE gem_areas
(
   id        varchar   DEFAULT next_id() NOT NULL,
   name      varchar,
   cell_ids  varchar
);
ALTER TABLE gem_areas
  ADD CONSTRAINT gem_areas_pkey PRIMARY KEY (id);

COMMENT ON TABLE gem_areas IS '区域小区配置表';
COMMENT ON COLUMN gem_areas.name IS '区域名称';
COMMENT ON COLUMN gem_areas.cell_ids IS '小区id';

COMMIT;

DROP TABLE IF EXISTS gem_key_indicator_alerting_message_notification_groups CASCADE;

CREATE TABLE gem_key_indicator_alerting_message_notification_groups
(
   id                          varchar     DEFAULT next_id() NOT NULL,
   name                        varchar,
   users                       text,
   config_ids                  text
);

ALTER TABLE gem_key_indicator_alerting_message_notification_groups
   ADD CONSTRAINT gem_key_indicator_alerting_message_notification_groups_pkey
   PRIMARY KEY (id);

COMMENT ON TABLE gem_key_indicator_alerting_message_notification_groups IS '核心指标告警短信通知群组表';
COMMENT ON COLUMN gem_key_indicator_alerting_message_notification_groups.name IS '群组名称';
COMMENT ON COLUMN gem_key_indicator_alerting_message_notification_groups.users IS '群组用户';
COMMENT ON COLUMN gem_key_indicator_alerting_message_notification_groups.config_ids IS '群组配置';

COMMIT;

DROP TABLE IF EXISTS gem_key_indicator_alerting_message_notification_configs CASCADE;

CREATE TABLE gem_key_indicator_alerting_message_notification_configs
(
   id                          varchar     DEFAULT next_id() NOT NULL,
   indicator                varchar,
   frequency                   int,
   high_threshold              int,
   middle_threshold            int,
   low_threshold               int,
   rule_id varchar COLLATE "default"
);

ALTER TABLE gem_key_indicator_alerting_message_notification_configs
   ADD CONSTRAINT gem_key_indicator_alerting_message_notification_configs_pkey
   PRIMARY KEY (id);

COMMENT ON TABLE gem_key_indicator_alerting_message_notification_configs IS '核心指标告警短信通知配置表';
COMMENT ON COLUMN gem_key_indicator_alerting_message_notification_configs.indicator IS '核心指标';
COMMENT ON COLUMN gem_key_indicator_alerting_message_notification_configs.frequency IS '通知频率';
COMMENT ON COLUMN gem_key_indicator_alerting_message_notification_configs.high_threshold IS '一级告警阈值';
COMMENT ON COLUMN gem_key_indicator_alerting_message_notification_configs.middle_threshold IS '二级告警阈值';
COMMENT ON COLUMN gem_key_indicator_alerting_message_notification_configs.low_threshold IS '三级告警阈值';
COMMENT ON COLUMN gem_key_indicator_alerting_message_notification_configs.rule_id IS '告警规则ID';

COMMIT;

DROP TABLE IF EXISTS "public"."gem_key_indicator_alerting_message_notifications";
CREATE TABLE "public"."gem_key_indicator_alerting_message_notifications" (
"id" varchar COLLATE "default" DEFAULT next_id() NOT NULL,
"group_id" varchar COLLATE "default",
"indicator" varchar COLLATE "default",
"dimension_type" varchar COLLATE "default",
"affected_element_ids" text COLLATE "default",
"priority" int4,
"related_record_ids" text COLLATE "default",
"earliest_triggered_time" timestamp(6),
"created_time" timestamp(6) DEFAULT now(),
"text_content" text COLLATE "default",
"group_name" varchar COLLATE "default",
"group_user" varchar COLLATE "default",
"group_config_ids" varchar COLLATE "default",
"rule_id" varchar COLLATE "default"
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."gem_key_indicator_alerting_message_notifications" IS '核心指标告警短信记录表';
COMMENT ON COLUMN "public"."gem_key_indicator_alerting_message_notifications"."group_id" IS '群组ID';
COMMENT ON COLUMN "public"."gem_key_indicator_alerting_message_notifications"."indicator" IS '指标字段';
COMMENT ON COLUMN "public"."gem_key_indicator_alerting_message_notifications"."dimension_type" IS '维度类型：区域(area)，业务(app)，网元(network_element)';
COMMENT ON COLUMN "public"."gem_key_indicator_alerting_message_notifications"."affected_element_ids" IS '影响范围';
COMMENT ON COLUMN "public"."gem_key_indicator_alerting_message_notifications"."priority" IS '告警等级';
COMMENT ON COLUMN "public"."gem_key_indicator_alerting_message_notifications"."related_record_ids" IS '相关告警记录ID';
COMMENT ON COLUMN "public"."gem_key_indicator_alerting_message_notifications"."earliest_triggered_time" IS '最早触发时间';
COMMENT ON COLUMN "public"."gem_key_indicator_alerting_message_notifications"."text_content" IS '短信内容';
COMMENT ON COLUMN "public"."gem_key_indicator_alerting_message_notifications"."group_name" IS '用户群组名';
COMMENT ON COLUMN "public"."gem_key_indicator_alerting_message_notifications"."group_user" IS '群组里的用户';
COMMENT ON COLUMN "public"."gem_key_indicator_alerting_message_notifications"."group_config_ids" IS '群组里的配置指标ID';
COMMENT ON COLUMN "public"."gem_key_indicator_alerting_message_notifications"."rule_id" IS '告警规则ID';

-- ----------------------------
-- Alter Sequences Owned By
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table gem_key_indicator_alerting_message_notifications
-- ----------------------------
ALTER TABLE "public"."gem_key_indicator_alerting_message_notifications" ADD PRIMARY KEY ("id");

COMMIT;

DROP TABLE IF EXISTS gem_users CASCADE;

CREATE TABLE gem_users
(
   id             varchar     DEFAULT next_id() NOT NULL,
   user_name      varchar     NOT NULL,
   password       varchar     NOT NULL,
   roles          varchar     NOT NULL,
   created_time   timestamp   DEFAULT now() NOT NULL,
   modified_time  timestamp   DEFAULT now() NOT NULL
);

ALTER TABLE gem_users
   ADD CONSTRAINT gem_users_pk
   PRIMARY KEY (id);

create unique index gem_users_unique_index on gem_users using btree (user_name);

COMMENT ON TABLE gem_users IS '用户角色表';
COMMENT ON COLUMN gem_users.user_name IS '用户名';
COMMENT ON COLUMN gem_users.password IS '用户密码';
COMMENT ON COLUMN gem_users.roles IS '用户角色';
COMMENT ON COLUMN gem_users.created_time IS '创建时间';
COMMENT ON COLUMN gem_users.modified_time IS '修改时间';

COMMIT;

DROP TABLE IF EXISTS gem_roles CASCADE;

CREATE TABLE gem_roles
(
   id           varchar     DEFAULT next_id() NOT NULL,
   name         varchar     NOT NULL,
   value        integer     NOT NULL,
   authorities  text        NOT NULL
);

ALTER TABLE gem_roles
   ADD CONSTRAINT gem_roles_pk
   PRIMARY KEY (id);

COMMENT ON TABLE gem_roles IS '权限表';
COMMENT ON COLUMN gem_roles.name IS '权限名称';
COMMENT ON COLUMN gem_roles.value IS '权限代号';
COMMENT ON COLUMN gem_roles.authorities IS '权限内容';

COMMIT;

DROP TABLE IF EXISTS gem_s1u_kpi_1d_statistics CASCADE;

CREATE TABLE gem_s1u_kpi_1d_statistics
(
   whole_network              varchar,
   sgw                        varchar,
   tac                        varchar,
   enodeb_id                  varchar,
   cell_id                    varchar,
   imsi                       varchar,
   ue_brand                   varchar,
   ue_type                    varchar,
   business_type              varchar,
   detail_business            varchar,
   statistical_time           timestamp,
   created_time               timestamp   DEFAULT now(),
   tcp_up_link_request_count  bigint,
   tcp_up_link_success_count  bigint,
   tcp_up_link_timedelay      bigint,
   tcp_dl_link_request_count  bigint,
   tcp_dl_link_success_count  bigint,
   tcp_dl_link_timedelay      bigint,
   tcp_link_timedelay         bigint
);

COMMENT ON COLUMN gem_s1u_kpi_1d_statistics.business_type IS '业务大类';
COMMENT ON COLUMN gem_s1u_kpi_1d_statistics.detail_business IS '业务小类';
COMMENT ON COLUMN gem_s1u_kpi_1d_statistics.tcp_up_link_request_count IS 'TCP上行连接请求次数';
COMMENT ON COLUMN gem_s1u_kpi_1d_statistics.tcp_up_link_success_count IS 'TCP上行连接成功次数';
COMMENT ON COLUMN gem_s1u_kpi_1d_statistics.tcp_up_link_timedelay IS 'TCP上行连接时延';
COMMENT ON COLUMN gem_s1u_kpi_1d_statistics.tcp_dl_link_request_count IS 'TCP下行连接请求次数';
COMMENT ON COLUMN gem_s1u_kpi_1d_statistics.tcp_dl_link_success_count IS 'TCP下行连接成功次数';
COMMENT ON COLUMN gem_s1u_kpi_1d_statistics.tcp_dl_link_timedelay IS 'TCP下行连接时延';
COMMENT ON COLUMN gem_s1u_kpi_1d_statistics.tcp_link_timedelay IS 'TCP连接时延';

COMMIT;

DROP TABLE IF EXISTS gem_s1u_kpi_1h_statistics CASCADE;

CREATE TABLE gem_s1u_kpi_1h_statistics
(
   whole_network              varchar,
   sgw                        varchar,
   tac                        varchar,
   enodeb_id                  varchar,
   cell_id                    varchar,
   imsi                       varchar,
   ue_brand                   varchar,
   ue_type                    varchar,
   business_type              varchar,
   detail_business            varchar,
   statistical_time           timestamp,
   created_time               timestamp   DEFAULT now(),
   tcp_up_link_request_count  bigint,
   tcp_up_link_success_count  bigint,
   tcp_up_link_timedelay      bigint,
   tcp_dl_link_request_count  bigint,
   tcp_dl_link_success_count  bigint,
   tcp_dl_link_timedelay      bigint,
   tcp_link_timedelay         bigint
);

COMMENT ON COLUMN gem_s1u_kpi_1h_statistics.business_type IS '业务大类';
COMMENT ON COLUMN gem_s1u_kpi_1h_statistics.detail_business IS '业务小类';
COMMENT ON COLUMN gem_s1u_kpi_1h_statistics.tcp_up_link_request_count IS 'TCP上行连接请求次数';
COMMENT ON COLUMN gem_s1u_kpi_1h_statistics.tcp_up_link_success_count IS 'TCP上行连接成功次数';
COMMENT ON COLUMN gem_s1u_kpi_1h_statistics.tcp_up_link_timedelay IS 'TCP上行连接时延';
COMMENT ON COLUMN gem_s1u_kpi_1h_statistics.tcp_dl_link_request_count IS 'TCP下行连接请求次数';
COMMENT ON COLUMN gem_s1u_kpi_1h_statistics.tcp_dl_link_success_count IS 'TCP下行连接成功次数';
COMMENT ON COLUMN gem_s1u_kpi_1h_statistics.tcp_dl_link_timedelay IS 'TCP下行连接时延';
COMMENT ON COLUMN gem_s1u_kpi_1h_statistics.tcp_link_timedelay IS 'TCP连接时延';

COMMIT;

DROP TABLE IF EXISTS gem_s1u_kpi_5m_statistics CASCADE;

CREATE TABLE gem_s1u_kpi_5m_statistics
(
   whole_network              varchar,
   sgw                        varchar,
   tac                        varchar,
   enodeb_id                  varchar,
   cell_id                    varchar,
   imsi                       varchar,
   ue_brand                   varchar,
   ue_type                    varchar,
   business_type              varchar,
   detail_business            varchar,
   statistical_time           timestamp,
   created_time               timestamp   DEFAULT now(),
   tcp_up_link_request_count  bigint,
   tcp_up_link_success_count  bigint,
   tcp_up_link_timedelay      bigint,
   tcp_dl_link_request_count  bigint,
   tcp_dl_link_success_count  bigint,
   tcp_dl_link_timedelay      bigint,
   tcp_link_timedelay         bigint
);

COMMENT ON COLUMN gem_s1u_kpi_5m_statistics.business_type IS '业务大类';
COMMENT ON COLUMN gem_s1u_kpi_5m_statistics.detail_business IS '业务小类';
COMMENT ON COLUMN gem_s1u_kpi_5m_statistics.tcp_up_link_request_count IS 'TCP上行连接请求次数';
COMMENT ON COLUMN gem_s1u_kpi_5m_statistics.tcp_up_link_success_count IS 'TCP上行连接成功次数';
COMMENT ON COLUMN gem_s1u_kpi_5m_statistics.tcp_up_link_timedelay IS 'TCP上行连接时延';
COMMENT ON COLUMN gem_s1u_kpi_5m_statistics.tcp_dl_link_request_count IS 'TCP下行连接请求次数';
COMMENT ON COLUMN gem_s1u_kpi_5m_statistics.tcp_dl_link_success_count IS 'TCP下行连接成功次数';
COMMENT ON COLUMN gem_s1u_kpi_5m_statistics.tcp_dl_link_timedelay IS 'TCP下行连接时延';
COMMENT ON COLUMN gem_s1u_kpi_5m_statistics.tcp_link_timedelay IS 'TCP连接时延';

COMMIT;

DROP TABLE IF EXISTS gem_s1u_kpi_5m_failure_statistics CASCADE;

CREATE TABLE gem_s1u_kpi_5m_failure_statistics
(
   statistical_time       timestamp,
   whole_network          varchar,
   sgw                    varchar,
   tac                    varchar,
   enodeb_id              varchar,
   cell_id                varchar,
   imsi                   varchar,
   ue_brand               varchar,
   ue_type                varchar,
   business_type          varchar,
   detail_business        varchar,
   event_type             varchar,
   abnormal_type          integer,
   abnormal_reason        integer,
   abnormal_reason_count  bigint,
   created_time           timestamp   DEFAULT now()
);

COMMIT;

DROP TABLE IF EXISTS gem_s1u_kpi_1d_failure_statistics CASCADE;

CREATE TABLE gem_s1u_kpi_1d_failure_statistics
(
   statistical_time       timestamp,
   whole_network          varchar,
   sgw                    varchar,
   tac                    varchar,
   enodeb_id              varchar,
   cell_id                varchar,
   imsi                   varchar,
   ue_brand               varchar,
   ue_type                varchar,
   business_type          varchar,
   detail_business        varchar,
   event_type             varchar,
   abnormal_type          integer,
   abnormal_reason        integer,
   abnormal_reason_count  bigint,
   created_time           timestamp   DEFAULT now()
);

COMMIT;

DROP TABLE IF EXISTS gem_s1u_kpi_1h_failure_statistics CASCADE;

CREATE TABLE gem_s1u_kpi_1h_failure_statistics
(
   statistical_time       timestamp,
   whole_network          varchar,
   sgw                    varchar,
   tac                    varchar,
   enodeb_id              varchar,
   cell_id                varchar,
   imsi                   varchar,
   ue_brand               varchar,
   ue_type                varchar,
   business_type          varchar,
   detail_business        varchar,
   event_type             varchar,
   abnormal_type          integer,
   abnormal_reason        integer,
   abnormal_reason_count  bigint,
   created_time           timestamp   DEFAULT now()
);

COMMIT;

-- ----------------------------
-- Uniques structure for table gem_abnormal_reasons
-- ----------------------------
ALTER TABLE "public"."gem_abnormal_reasons" ADD UNIQUE ("abnormal_type_id", "name", "abnormal_reason_code");

-- ----------------------------
-- Uniques structure for table gem_dimension
-- ----------------------------
ALTER TABLE "public"."gem_dimension" ADD UNIQUE ("name","network_interface","source_table","top_level","value","level");

-- ----------------------------
-- Primary Key structure for table gem_abnormal_reasons
-- ----------------------------
ALTER TABLE "public"."gem_abnormal_reasons" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table gem_abnormal_types
-- ----------------------------
ALTER TABLE "public"."gem_abnormal_types" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table gem_application_type_mapping
-- ----------------------------
ALTER TABLE "public"."gem_application_type_mapping" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table gem_auto_alert_history_15m_statistics
-- ----------------------------
ALTER TABLE "public"."gem_auto_alert_history_15m_statistics" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table gem_auto_alert_history_30m_statistics
-- ----------------------------
ALTER TABLE "public"."gem_auto_alert_history_30m_statistics" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table gem_auto_alert_history_5m_statistics
-- ----------------------------
ALTER TABLE "public"."gem_auto_alert_history_5m_statistics" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table gem_auto_alert_indicator_dimensions
-- ----------------------------
ALTER TABLE "public"."gem_auto_alert_indicator_dimensions" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table gem_auto_alert_indicator_rules
-- ----------------------------
ALTER TABLE "public"."gem_auto_alert_indicator_rules" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table gem_auto_alert_indicators
-- ----------------------------
ALTER TABLE "public"."gem_auto_alert_indicators" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table gem_auto_alert_records_15m_statistics
-- ----------------------------
ALTER TABLE "public"."gem_auto_alert_records_15m_statistics" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table gem_auto_alert_records_30m_statistics
-- ----------------------------
ALTER TABLE "public"."gem_auto_alert_records_30m_statistics" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table gem_auto_alert_records_5m_statistics
-- ----------------------------
ALTER TABLE "public"."gem_auto_alert_records_5m_statistics" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table gem_dimension
-- ----------------------------
ALTER TABLE "public"."gem_dimension" ADD PRIMARY KEY ("name", "network_interface");

-- ----------------------------
-- Uniques structure for table gem_dimension_name_relations
-- ----------------------------
ALTER TABLE "public"."gem_dimension_name_relations" ADD UNIQUE ("dimension_name", "network_interface", "next_level_dimension_name");

-- ----------------------------
-- Primary Key structure for table gem_dimension_name_relations
-- ----------------------------
ALTER TABLE "public"."gem_dimension_name_relations" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table gem_dimension_names_tree
-- ----------------------------
ALTER TABLE "public"."gem_dimension_names_tree" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table gem_dimension_relative_indicators
-- ----------------------------
ALTER TABLE "public"."gem_dimension_relative_indicators" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table gem_dimension_to_sub_dimensions
-- ----------------------------
ALTER TABLE "public"."gem_dimension_to_sub_dimensions" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table gem_dns_domain_statistics
-- ----------------------------
ALTER TABLE "public"."gem_dns_domain_statistics" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table gem_dns_ip_statistics
-- ----------------------------
ALTER TABLE "public"."gem_dns_ip_statistics" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table gem_event_brd_to_fs
-- ----------------------------
ALTER TABLE "public"."gem_event_brd_to_fs" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table gem_event_relative_indicators
-- ----------------------------
ALTER TABLE "public"."gem_event_relative_indicators" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table gem_event_relative_indicators_for_division
-- ----------------------------
ALTER TABLE "public"."gem_event_relative_indicators_for_division" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table gem_event_statistics_indicators
-- ----------------------------
ALTER TABLE "public"."gem_event_statistics_indicators" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Uniques structure for table gem_event_types
-- ----------------------------
ALTER TABLE "public"."gem_event_types" ADD UNIQUE ("name", "event_code", "network_interface");

-- ----------------------------
-- Primary Key structure for table gem_event_types
-- ----------------------------
ALTER TABLE "public"."gem_event_types" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table gem_failure_dimension_name_relations
-- ----------------------------
ALTER TABLE "public"."gem_failure_dimension_name_relations" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table gem_http_status_codes
-- ----------------------------
ALTER TABLE "public"."gem_http_status_codes" ADD PRIMARY KEY ("http_status_code");

-- ----------------------------
-- Uniques structure for table gem_indicators
-- ----------------------------
ALTER TABLE "public"."gem_indicators" ADD UNIQUE ("name", "network_interface", "parameter");

-- ----------------------------
-- Primary Key structure for table gem_indicators
-- ----------------------------
ALTER TABLE "public"."gem_indicators" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table gem_interface_interval_tables
-- ----------------------------
ALTER TABLE "public"."gem_interface_interval_tables" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table gem_mr_distinct_kpi_1d_statistics_by_tac
-- ----------------------------
ALTER TABLE "public"."gem_mr_distinct_kpi_1d_statistics_by_tac" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table gem_mr_distinct_kpi_1d_statistics_by_te
-- ----------------------------
ALTER TABLE "public"."gem_mr_distinct_kpi_1d_statistics_by_te" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table gem_mr_distinct_kpi_1d_statistics_by_tec
-- ----------------------------
ALTER TABLE "public"."gem_mr_distinct_kpi_1d_statistics_by_tec" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table gem_mr_distinct_kpi_1d_statistics_by_ue_type
-- ----------------------------
ALTER TABLE "public"."gem_mr_distinct_kpi_1d_statistics_by_ue_type" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table gem_mr_distinct_kpi_1h_statistics_by_tac
-- ----------------------------
ALTER TABLE "public"."gem_mr_distinct_kpi_1h_statistics_by_tac" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table gem_mr_distinct_kpi_1h_statistics_by_te
-- ----------------------------
ALTER TABLE "public"."gem_mr_distinct_kpi_1h_statistics_by_te" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table gem_mr_distinct_kpi_1h_statistics_by_tec
-- ----------------------------
ALTER TABLE "public"."gem_mr_distinct_kpi_1h_statistics_by_tec" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table gem_mr_distinct_kpi_1h_statistics_by_ue_type
-- ----------------------------
ALTER TABLE "public"."gem_mr_distinct_kpi_1h_statistics_by_ue_type" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table gem_mr_distinct_kpi_5m_statistics_by_tac
-- ----------------------------
ALTER TABLE "public"."gem_mr_distinct_kpi_5m_statistics_by_tac" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table gem_mr_distinct_kpi_5m_statistics_by_te
-- ----------------------------
ALTER TABLE "public"."gem_mr_distinct_kpi_5m_statistics_by_te" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table gem_mr_distinct_kpi_5m_statistics_by_tec
-- ----------------------------
ALTER TABLE "public"."gem_mr_distinct_kpi_5m_statistics_by_tec" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table gem_mr_distinct_kpi_5m_statistics_by_ue_type
-- ----------------------------
ALTER TABLE "public"."gem_mr_distinct_kpi_5m_statistics_by_ue_type" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table gem_mr_kpi_1d_statistics
-- ----------------------------
ALTER TABLE "public"."gem_mr_kpi_1d_statistics" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table gem_mr_kpi_1d_statistics_by_imsi
-- ----------------------------
ALTER TABLE "public"."gem_mr_kpi_1d_statistics_by_imsi" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table gem_mr_kpi_1h_statistics
-- ----------------------------
ALTER TABLE "public"."gem_mr_kpi_1h_statistics" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table gem_mr_kpi_1h_statistics_by_imsi
-- ----------------------------
ALTER TABLE "public"."gem_mr_kpi_1h_statistics_by_imsi" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table gem_mr_kpi_5m_statistics
-- ----------------------------
ALTER TABLE "public"."gem_mr_kpi_5m_statistics" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table gem_mr_kpi_5m_statistics_by_imsi
-- ----------------------------
ALTER TABLE "public"."gem_mr_kpi_5m_statistics_by_imsi" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table gem_network_elements
-- ----------------------------
ALTER TABLE "public"."gem_network_elements" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table gem_network_elements_user_end
-- ----------------------------
ALTER TABLE "public"."gem_network_elements_user_end" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table gem_realtime_monitoring_indicator_dimensions
-- ----------------------------
ALTER TABLE "public"."gem_realtime_monitoring_indicator_dimensions" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table gem_realtime_monitoring_indicator_rules
-- ----------------------------
ALTER TABLE "public"."gem_realtime_monitoring_indicator_rules" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table gem_realtime_monitoring_mr_kpi_15m_statistics
-- ----------------------------
ALTER TABLE "public"."gem_realtime_monitoring_mr_kpi_15m_statistics" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table gem_realtime_monitoring_mr_kpi_30m_statistics
-- ----------------------------
ALTER TABLE "public"."gem_realtime_monitoring_mr_kpi_30m_statistics" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table gem_realtime_monitoring_mr_kpi_5m_statistics
-- ----------------------------
ALTER TABLE "public"."gem_realtime_monitoring_mr_kpi_5m_statistics" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table gem_realtime_monitoring_rule_relative_kpis
-- ----------------------------
ALTER TABLE "public"."gem_realtime_monitoring_rule_relative_kpis" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table gem_realtime_monitoring_s1_mme_kpi_15m_statistics
-- ----------------------------
ALTER TABLE "public"."gem_realtime_monitoring_s1_mme_kpi_15m_statistics" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table gem_realtime_monitoring_s1_mme_kpi_30m_statistics
-- ----------------------------
ALTER TABLE "public"."gem_realtime_monitoring_s1_mme_kpi_30m_statistics" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table gem_realtime_monitoring_s1_mme_kpi_5m_statistics
-- ----------------------------
ALTER TABLE "public"."gem_realtime_monitoring_s1_mme_kpi_5m_statistics" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table gem_realtime_monitoring_s1u_dns_kpi_15m_statistics
-- ----------------------------
ALTER TABLE "public"."gem_realtime_monitoring_s1u_dns_kpi_15m_statistics" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table gem_realtime_monitoring_s1u_dns_kpi_30m_statistics
-- ----------------------------
ALTER TABLE "public"."gem_realtime_monitoring_s1u_dns_kpi_30m_statistics" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table gem_realtime_monitoring_s1u_dns_kpi_5m_statistics
-- ----------------------------
ALTER TABLE "public"."gem_realtime_monitoring_s1u_dns_kpi_5m_statistics" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table gem_realtime_monitoring_s1u_http_kpi_15m_statistics
-- ----------------------------
ALTER TABLE "public"."gem_realtime_monitoring_s1u_http_kpi_15m_statistics" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table gem_realtime_monitoring_s1u_http_kpi_30m_statistics
-- ----------------------------
ALTER TABLE "public"."gem_realtime_monitoring_s1u_http_kpi_30m_statistics" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table gem_realtime_monitoring_s1u_http_kpi_5m_statistics
-- ----------------------------
ALTER TABLE "public"."gem_realtime_monitoring_s1u_http_kpi_5m_statistics" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table gem_realtime_monitoring_s1u_kpi_15m_statistics
-- ----------------------------
ALTER TABLE "public"."gem_realtime_monitoring_s1u_kpi_15m_statistics" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table gem_realtime_monitoring_s1u_kpi_30m_statistics
-- ----------------------------
ALTER TABLE "public"."gem_realtime_monitoring_s1u_kpi_30m_statistics" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table gem_realtime_monitoring_s1u_kpi_5m_statistics
-- ----------------------------
ALTER TABLE "public"."gem_realtime_monitoring_s1u_kpi_5m_statistics" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table gem_realtime_monitoring_s6a_kpi_15m_statistics
-- ----------------------------
ALTER TABLE "public"."gem_realtime_monitoring_s6a_kpi_15m_statistics" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table gem_realtime_monitoring_s6a_kpi_30m_statistics
-- ----------------------------
ALTER TABLE "public"."gem_realtime_monitoring_s6a_kpi_30m_statistics" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table gem_realtime_monitoring_s6a_kpi_5m_statistics
-- ----------------------------
ALTER TABLE "public"."gem_realtime_monitoring_s6a_kpi_5m_statistics" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table gem_realtime_monitoring_sgs_kpi_15m_statistics
-- ----------------------------
ALTER TABLE "public"."gem_realtime_monitoring_sgs_kpi_15m_statistics" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table gem_realtime_monitoring_sgs_kpi_30m_statistics
-- ----------------------------
ALTER TABLE "public"."gem_realtime_monitoring_sgs_kpi_30m_statistics" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table gem_realtime_monitoring_sgs_kpi_5m_statistics
-- ----------------------------
ALTER TABLE "public"."gem_realtime_monitoring_sgs_kpi_5m_statistics" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table gem_realtime_monitoring_uu_kpi_15m_statistics
-- ----------------------------
ALTER TABLE "public"."gem_realtime_monitoring_uu_kpi_15m_statistics" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table gem_realtime_monitoring_uu_kpi_30m_statistics
-- ----------------------------
ALTER TABLE "public"."gem_realtime_monitoring_uu_kpi_30m_statistics" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table gem_realtime_monitoring_uu_kpi_5m_statistics
-- ----------------------------
ALTER TABLE "public"."gem_realtime_monitoring_uu_kpi_5m_statistics" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table gem_realtime_monitoring_x2_kpi_15m_statistics
-- ----------------------------
ALTER TABLE "public"."gem_realtime_monitoring_x2_kpi_15m_statistics" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table gem_realtime_monitoring_x2_kpi_30m_statistics
-- ----------------------------
ALTER TABLE "public"."gem_realtime_monitoring_x2_kpi_30m_statistics" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table gem_realtime_monitoring_x2_kpi_5m_statistics
-- ----------------------------
ALTER TABLE "public"."gem_realtime_monitoring_x2_kpi_5m_statistics" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table gem_road_info
-- ----------------------------
ALTER TABLE "public"."gem_road_info" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table gem_road_types
-- ----------------------------
ALTER TABLE "public"."gem_road_types" ADD PRIMARY KEY ("id");


-- ----------------------------
-- Primary Key structure for table gem_s1_mme_kpi_1d_statistics
-- ----------------------------
ALTER TABLE "public"."gem_s1_mme_kpi_1d_statistics" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table gem_s1_mme_kpi_1h_statistics
-- ----------------------------
ALTER TABLE "public"."gem_s1_mme_kpi_1h_statistics" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table gem_s1_mme_kpi_5m_statistics
-- ----------------------------
ALTER TABLE "public"."gem_s1_mme_kpi_5m_statistics" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table gem_s11_kpi_1d_statistics
-- ----------------------------
ALTER TABLE "public"."gem_s11_kpi_1d_statistics" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table gem_s11_kpi_1h_statistics
-- ----------------------------
ALTER TABLE "public"."gem_s11_kpi_1h_statistics" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table gem_s11_kpi_5m_statistics
-- ----------------------------
ALTER TABLE "public"."gem_s11_kpi_5m_statistics" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table gem_s1u_bad_quality_apns
-- ----------------------------
ALTER TABLE "public"."gem_s1u_bad_quality_apns" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table gem_s1u_bad_quality_applications
-- ----------------------------
ALTER TABLE "public"."gem_s1u_bad_quality_applications" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table gem_s1u_bad_quality_enodeb
-- ----------------------------
ALTER TABLE "public"."gem_s1u_bad_quality_enodeb" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table gem_s1u_bad_quality_ipv4
-- ----------------------------
ALTER TABLE "public"."gem_s1u_bad_quality_ipv4" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table gem_s1u_bad_quality_pre_ipv4
-- ----------------------------
ALTER TABLE "public"."gem_s1u_bad_quality_pre_ipv4" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table gem_s1u_bad_quality_sgw
-- ----------------------------
ALTER TABLE "public"."gem_s1u_bad_quality_sgw" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table gem_s1u_bad_quality_terminal_applications
-- ----------------------------
ALTER TABLE "public"."gem_s1u_bad_quality_terminal_applications" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table gem_s1u_bad_quality_terminal_ipv4
-- ----------------------------
ALTER TABLE "public"."gem_s1u_bad_quality_terminal_ipv4" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table gem_s1u_bad_quality_terminals
-- ----------------------------
ALTER TABLE "public"."gem_s1u_bad_quality_terminals" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table gem_s1u_bad_quality_uri_main
-- ----------------------------
ALTER TABLE "public"."gem_s1u_bad_quality_uri_main" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table gem_s6a_kpi_1d_statistics
-- ----------------------------
ALTER TABLE "public"."gem_s6a_kpi_1d_statistics" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table gem_s6a_kpi_1h_statistics
-- ----------------------------
ALTER TABLE "public"."gem_s6a_kpi_1h_statistics" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table gem_s6a_kpi_5m_statistics
-- ----------------------------
ALTER TABLE "public"."gem_s6a_kpi_5m_statistics" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table gem_session_analysis_abnormal_reason
-- ----------------------------
ALTER TABLE "public"."gem_session_analysis_abnormal_reason" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table gem_session_analysis_indicators
-- ----------------------------
ALTER TABLE "public"."gem_session_analysis_indicators" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table gem_session_failure_causes
-- ----------------------------
ALTER TABLE "public"."gem_session_failure_causes" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table gem_sgs_kpi_1d_statistics
-- ----------------------------
ALTER TABLE "public"."gem_sgs_kpi_1d_statistics" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table gem_sgs_kpi_1h_statistics
-- ----------------------------
ALTER TABLE "public"."gem_sgs_kpi_1h_statistics" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table gem_sgs_kpi_5m_statistics
-- ----------------------------
ALTER TABLE "public"."gem_sgs_kpi_5m_statistics" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table gem_uu_kpi_1d_statistics
-- ----------------------------
ALTER TABLE "public"."gem_uu_kpi_1d_statistics" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table gem_uu_kpi_1d_statistics_by_imsi
-- ----------------------------
ALTER TABLE "public"."gem_uu_kpi_1d_statistics_by_imsi" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table gem_uu_kpi_1h_statistics
-- ----------------------------
ALTER TABLE "public"."gem_uu_kpi_1h_statistics" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table gem_uu_kpi_1h_statistics_by_imsi
-- ----------------------------
ALTER TABLE "public"."gem_uu_kpi_1h_statistics_by_imsi" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table gem_uu_kpi_5m_statistics
-- ----------------------------
ALTER TABLE "public"."gem_uu_kpi_5m_statistics" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table gem_uu_kpi_5m_statistics_by_imsi
-- ----------------------------
ALTER TABLE "public"."gem_uu_kpi_5m_statistics_by_imsi" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table gem_vdt_analysis_indicators
-- ----------------------------
ALTER TABLE "public"."gem_vdt_analysis_indicators" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table gem_vdt_road_analysis_mr_5m_imsi
-- ----------------------------
ALTER TABLE "public"."gem_vdt_road_analysis_mr_5m_imsi" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table gem_vdt_road_analysis_s1u_http_5m_imsi
-- ----------------------------
ALTER TABLE "public"."gem_vdt_road_analysis_s1u_http_5m_imsi" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table gem_vdt_road_analysis_uu_5m_imsi
-- ----------------------------
ALTER TABLE "public"."gem_vdt_road_analysis_uu_5m_imsi" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table gem_vdt_road_analysis_x2_5m_imsi
-- ----------------------------
ALTER TABLE "public"."gem_vdt_road_analysis_x2_5m_imsi" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table gem_vdt_road_filter
-- ----------------------------
ALTER TABLE "public"."gem_vdt_road_filter" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table gem_x2_kpi_1d_failure_statistics
-- ----------------------------
ALTER TABLE "public"."gem_x2_kpi_1d_failure_statistics" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table gem_x2_kpi_1d_failure_statistics_by_imsi
-- ----------------------------
ALTER TABLE "public"."gem_x2_kpi_1d_failure_statistics_by_imsi" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table gem_x2_kpi_1d_statistics
-- ----------------------------
ALTER TABLE "public"."gem_x2_kpi_1d_statistics" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table gem_x2_kpi_1d_statistics_by_imsi
-- ----------------------------
ALTER TABLE "public"."gem_x2_kpi_1d_statistics_by_imsi" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table gem_x2_kpi_1h_failure_statistics
-- ----------------------------
ALTER TABLE "public"."gem_x2_kpi_1h_failure_statistics" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table gem_x2_kpi_1h_failure_statistics_by_imsi
-- ----------------------------
ALTER TABLE "public"."gem_x2_kpi_1h_failure_statistics_by_imsi" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table gem_x2_kpi_1h_statistics
-- ----------------------------
ALTER TABLE "public"."gem_x2_kpi_1h_statistics" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table gem_x2_kpi_1h_statistics_by_imsi
-- ----------------------------
ALTER TABLE "public"."gem_x2_kpi_1h_statistics_by_imsi" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table gem_x2_kpi_5m_failure_statistics
-- ----------------------------
ALTER TABLE "public"."gem_x2_kpi_5m_failure_statistics" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table gem_x2_kpi_5m_failure_statistics_by_imsi
-- ----------------------------
ALTER TABLE "public"."gem_x2_kpi_5m_failure_statistics_by_imsi" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table gem_x2_kpi_5m_statistics
-- ----------------------------
ALTER TABLE "public"."gem_x2_kpi_5m_statistics" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table gem_x2_kpi_5m_statistics_by_imsi
-- ----------------------------
ALTER TABLE "public"."gem_x2_kpi_5m_statistics_by_imsi" ADD PRIMARY KEY ("id");



DROP TABLE IF EXISTS "public"."gem_aggregation_analysis_config";
CREATE TABLE "public"."gem_aggregation_analysis_config" (
"source_table" varchar COLLATE "default",
"target_table" varchar COLLATE "default",
"network_interface" varchar COLLATE "default",
"dimension_id" int4,
"batch_num" int4,
"dimension_combination" varchar COLLATE "default",
"statistic_sql" varchar COLLATE "default",
"insert_sql" varchar COLLATE "default",
"insert_columns_type" varchar COLLATE "default",
"insert_columns" varchar COLLATE "default",
"created_time" timestamp(6) DEFAULT now()
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."gem_aggregation_analysis_config" IS '接口降维参数配置表';
COMMENT ON COLUMN "public"."gem_aggregation_analysis_config"."source_table" IS '源表名';
COMMENT ON COLUMN "public"."gem_aggregation_analysis_config"."target_table" IS '目标表名';
COMMENT ON COLUMN "public"."gem_aggregation_analysis_config"."network_interface" IS '接口名';
COMMENT ON COLUMN "public"."gem_aggregation_analysis_config"."dimension_id" IS '维度id';
COMMENT ON COLUMN "public"."gem_aggregation_analysis_config"."batch_num" IS '批量插入的记录数';
COMMENT ON COLUMN "public"."gem_aggregation_analysis_config"."dimension_combination" IS '维度组合';
COMMENT ON COLUMN "public"."gem_aggregation_analysis_config"."statistic_sql" IS '原表查询语句';
COMMENT ON COLUMN "public"."gem_aggregation_analysis_config"."insert_sql" IS '目标表插入语句';
COMMENT ON COLUMN "public"."gem_aggregation_analysis_config"."insert_columns_type" IS '插入的列类型';
COMMENT ON COLUMN "public"."gem_aggregation_analysis_config"."insert_columns" IS '插入数据库的字段对应的java实体的变量';
COMMENT ON COLUMN "public"."gem_aggregation_analysis_config"."created_time" IS '记录的创建时间';


DROP TABLE IF EXISTS "public"."gem_aggregation_analysis_task_config";
CREATE TABLE "public"."gem_aggregation_analysis_task_config" (
"id" serial,
"source_table" varchar COLLATE "default",
"dimensions" varchar COLLATE "default",
"is_active" int2,
"created_time" timestamp DEFAULT now()
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."gem_aggregation_analysis_task_config" IS '接口降维参数任务配置表';
COMMENT ON COLUMN "public"."gem_aggregation_analysis_task_config"."id" IS '任务id';
COMMENT ON COLUMN "public"."gem_aggregation_analysis_task_config"."source_table" IS '接口表名';
COMMENT ON COLUMN "public"."gem_aggregation_analysis_task_config"."dimensions" IS '需要放在同一个线程中执行的维度用"@"符号分隔';
COMMENT ON COLUMN "public"."gem_aggregation_analysis_task_config"."is_active" IS '该任务是否有效1：有效，0：无效';
COMMENT ON COLUMN "public"."gem_aggregation_analysis_task_config"."created_time" IS '记录的创建时间';

-- ----------------------------
-- Alter Sequences Owned By
-- ----------------------------

-- ----------------------------
-- Uniques structure for table gem_aggregation_analysis_task_config
-- ----------------------------
ALTER TABLE "public"."gem_aggregation_analysis_task_config" ADD UNIQUE ("source_table", "dimensions");

-- ----------------------------
-- Primary Key structure for table gem_aggregation_analysis_task_config
-- ----------------------------
ALTER TABLE "public"."gem_aggregation_analysis_task_config" ADD PRIMARY KEY ("id");


DROP TABLE IF EXISTS "public"."gem_s1u_http_1h_aggregation";
CREATE TABLE "public"."gem_s1u_http_1h_aggregation" (
"dimension_id" int ,
"sgw" varchar COLLATE "default",
"tac" varchar COLLATE "default",
"enodeb_id" varchar COLLATE "default",
"cell_id" varchar COLLATE "default",
"imsi" varchar COLLATE "default",
"ue_brand" varchar COLLATE "default",
"ue_type" varchar COLLATE "default",
"business_type" varchar COLLATE "default",
"detail_business" varchar COLLATE "default",
"statistical_time" timestamp(6) NOT NULL,
"created_time" timestamp(6) DEFAULT now(),
"tcp_up_link_request_count" int8,
"tcp_up_link_success_count" int8,
"tcp_up_link_timedelay" int8,
"tcp_dl_link_request_count" int8,
"tcp_dl_link_success_count" int8,
"tcp_dl_link_timedelay" int8,
"tcp_link_timedelay" int8,
"up_tcp_retrans_count" int8,
"dl_tcp_retrans_count" int8,
"up_ip_packet_slicing_count" int8,
"dl_ip_packet_slicing_count" int8,
"up_tcp_disorder_count" int8,
"dl_tcp_disorder_count" int8,
"tcp_dropping_count" int8,
"get_request_count" int8,
"get_success_count" int8,
"get_resp_timedelay" int8,
"post_request_count" int8,
"post_success_count" int8,
"post_resp_timedelay" int8,
"http_request_count" int8,
"http_success_count" int8,
"http_resp_timedelay" int8,
"http_dlup_data_more_than_500k" int8,
"http_timedelay_more_than_500k" int8,
"http_speed_more_than_500k" int8,
"rtsp_playing_request_count" int8,
"rtsp_playing_success_count" int8,
"rtsp_playing_waiting_time" int8,
"ul_ip_packet" int8,
"dl_ip_packet" int8,
"session_count" int8
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Alter Sequences Owned By
-- ----------------------------

-- ----------------------------
-- Indexes structure for table gem_s1u_http_1h_aggregation
-- ----------------------------
CREATE INDEX "gem_s1u_http_kpi_1h_statistics_index" ON "public"."gem_s1u_http_1h_aggregation" USING btree (dimension_id, statistical_time);











DROP TABLE IF EXISTS "public"."gem_s1u_http_1d_aggregation";
CREATE TABLE "public"."gem_s1u_http_1d_aggregation" (
"dimension_id" int ,
"sgw" varchar COLLATE "default",
"tac" varchar COLLATE "default",
"enodeb_id" varchar COLLATE "default",
"cell_id" varchar COLLATE "default",
"imsi" varchar COLLATE "default",
"ue_brand" varchar COLLATE "default",
"ue_type" varchar COLLATE "default",
"business_type" varchar COLLATE "default",
"detail_business" varchar COLLATE "default",
"statistical_time" timestamp(6) NOT NULL,
"created_time" timestamp(6) DEFAULT now(),
"tcp_up_link_request_count" int8,
"tcp_up_link_success_count" int8,
"tcp_up_link_timedelay" int8,
"tcp_dl_link_request_count" int8,
"tcp_dl_link_success_count" int8,
"tcp_dl_link_timedelay" int8,
"tcp_link_timedelay" int8,
"up_tcp_retrans_count" int8,
"dl_tcp_retrans_count" int8,
"up_ip_packet_slicing_count" int8,
"dl_ip_packet_slicing_count" int8,
"up_tcp_disorder_count" int8,
"dl_tcp_disorder_count" int8,
"tcp_dropping_count" int8,
"get_request_count" int8,
"get_success_count" int8,
"get_resp_timedelay" int8,
"post_request_count" int8,
"post_success_count" int8,
"post_resp_timedelay" int8,
"http_request_count" int8,
"http_success_count" int8,
"http_resp_timedelay" int8,
"http_dlup_data_more_than_500k" int8,
"http_timedelay_more_than_500k" int8,
"http_speed_more_than_500k" int8,
"rtsp_playing_request_count" int8,
"rtsp_playing_success_count" int8,
"rtsp_playing_waiting_time" int8,
"ul_ip_packet" int8,
"dl_ip_packet" int8,
"session_count" int8
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Alter Sequences Owned By
-- ----------------------------

-- ----------------------------
-- Indexes structure for table gem_s1u_http_1h_aggregation
-- ----------------------------
CREATE INDEX "gem_s1u_http_kpi_1d_statistics_index" ON "public"."gem_s1u_http_1d_aggregation" USING btree (dimension_id, statistical_time);

DROP TABLE IF EXISTS "public"."gem_s1_mme_1h_aggregation";
CREATE TABLE "public"."gem_s1_mme_1h_aggregation" (
"dimension_id" int4,
"mme_group_id" varchar COLLATE "default",
"mme_code" varchar COLLATE "default",
"tac" varchar COLLATE "default",
"enodeb_id" varchar COLLATE "default",
"cell_id" varchar COLLATE "default",
"statistical_time" timestamp(6) NOT NULL,
"created_time" timestamp(6) DEFAULT now(),
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
"error_indication_request" int8,
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
"csfb_original_authentication_success" int8,
"csfb_original_authentication_timedelay" int8,
"csfb_original_security_request" int8,
"csfb_original_security_success" int8,
"csfb_original_security_timedelay" int8,
"csfb_terminal_request" int8,
"csfb_terminal_success" int8,
"csfb_terminal_failure" int8,
"csfb_terminal_authentication_request" int8,
"csfb_terminal_authentication_success" int8,
"csfb_terminal_authentication_timedelay" int8,
"csfb_terminal_security_request" int8,
"csfb_terminal_security_success" int8,
"csfb_terminal_security_timedelay" int8,
"csfb_emergency_request" int8,
"csfb_emergency_success" int8,
"csfb_emergency_failure" int8
)
WITH (OIDS=FALSE)

;

DROP TABLE IF EXISTS "public"."gem_s1u_dns_1h_aggregation";
CREATE TABLE "public"."gem_s1u_dns_1h_aggregation" (
"dimension_id" int4,
"sgw" varchar COLLATE "default",
"tac" varchar COLLATE "default",
"enodeb_id" varchar COLLATE "default",
"cell_id" varchar COLLATE "default",
"imsi" varchar COLLATE "default",
"ue_brand" varchar COLLATE "default",
"ue_type" varchar COLLATE "default",
"business_type" varchar COLLATE "default",
"detail_business" varchar COLLATE "default",
"statistical_time" timestamp(6) NOT NULL,
"created_time" timestamp(6) DEFAULT now(),
"tcp_up_link_request_count" int8,
"tcp_up_link_success_count" int8,
"tcp_up_link_timedelay" int8,
"tcp_dl_link_request_count" int8,
"tcp_dl_link_success_count" int8,
"tcp_dl_link_timedelay" int8,
"tcp_link_timedelay" int8,
"dns_request_count" int8,
"dns_failure_count" int8,
"dns_system_success_count" int8,
"dns_service_success_count" int8,
"dns_no_response_count" int8,
"dns_timedelay" int8
)
WITH (OIDS=FALSE)

;
COMMENT ON COLUMN "public"."gem_s1u_dns_1h_aggregation"."business_type" IS '业务大类';
COMMENT ON COLUMN "public"."gem_s1u_dns_1h_aggregation"."detail_business" IS '业务小类';
COMMENT ON COLUMN "public"."gem_s1u_dns_1h_aggregation"."tcp_up_link_request_count" IS 'TCP上行连接请求次数';
COMMENT ON COLUMN "public"."gem_s1u_dns_1h_aggregation"."tcp_up_link_success_count" IS 'TCP上行连接成功次数';
COMMENT ON COLUMN "public"."gem_s1u_dns_1h_aggregation"."tcp_up_link_timedelay" IS 'TCP上行连接时延';
COMMENT ON COLUMN "public"."gem_s1u_dns_1h_aggregation"."tcp_dl_link_request_count" IS 'TCP下行连接请求次数';
COMMENT ON COLUMN "public"."gem_s1u_dns_1h_aggregation"."tcp_dl_link_success_count" IS 'TCP下行连接成功次数';
COMMENT ON COLUMN "public"."gem_s1u_dns_1h_aggregation"."tcp_dl_link_timedelay" IS 'TCP下行连接时延';
COMMENT ON COLUMN "public"."gem_s1u_dns_1h_aggregation"."tcp_link_timedelay" IS 'TCP连接时延';
COMMENT ON COLUMN "public"."gem_s1u_dns_1h_aggregation"."dns_request_count" IS 'DNS解析请求次数';
COMMENT ON COLUMN "public"."gem_s1u_dns_1h_aggregation"."dns_failure_count" IS 'DNS解析失败次数';
COMMENT ON COLUMN "public"."gem_s1u_dns_1h_aggregation"."dns_system_success_count" IS 'DNS系统成功次数';
COMMENT ON COLUMN "public"."gem_s1u_dns_1h_aggregation"."dns_service_success_count" IS 'DNS业务成功次数';
COMMENT ON COLUMN "public"."gem_s1u_dns_1h_aggregation"."dns_no_response_count" IS 'DNS解析无响应次数';
COMMENT ON COLUMN "public"."gem_s1u_dns_1h_aggregation"."dns_timedelay" IS 'DNS解析平均时延';





DROP TABLE IF EXISTS "public"."gem_s1u_http_1d_aggregation";
CREATE TABLE "public"."gem_s1u_http_1d_aggregation" (
"dimension_id" int4,
"sgw" varchar COLLATE "default",
"tac" varchar COLLATE "default",
"enodeb_id" varchar COLLATE "default",
"cell_id" varchar COLLATE "default",
"imsi" varchar COLLATE "default",
"ue_brand" varchar COLLATE "default",
"ue_type" varchar COLLATE "default",
"business_type" varchar COLLATE "default",
"detail_business" varchar COLLATE "default",
"statistical_time" timestamp(6),
"created_time" timestamp(6) DEFAULT now(),
"tcp_up_link_request_count" int8,
"tcp_up_link_success_count" int8,
"tcp_up_link_timedelay" int8,
"tcp_dl_link_request_count" int8,
"tcp_dl_link_success_count" int8,
"tcp_dl_link_timedelay" int8,
"tcp_link_timedelay" int8,
"up_tcp_retrans_count" int8,
"dl_tcp_retrans_count" int8,
"up_ip_packet_slicing_count" int8,
"dl_ip_packet_slicing_count" int8,
"up_tcp_disorder_count" int8,
"dl_tcp_disorder_count" int8,
"tcp_dropping_count" int8,
"get_request_count" int8,
"get_success_count" int8,
"get_resp_timedelay" int8,
"post_request_count" int8,
"post_success_count" int8,
"post_resp_timedelay" int8,
"http_request_count" int8,
"http_success_count" int8,
"http_resp_timedelay" int8,
"http_dlup_data_more_than_500k" int8,
"http_timedelay_more_than_500k" int8,
"http_speed_more_than_500k" int8,
"rtsp_playing_request_count" int8,
"rtsp_playing_success_count" int8,
"rtsp_playing_waiting_time" int8,
"ul_ip_packet" int8,
"dl_ip_packet" int8,
"session_count" int8
)
WITH (OIDS=FALSE)

;



DROP TABLE IF EXISTS "public"."gem_s11_1h_aggregation";
CREATE TABLE "public"."gem_s11_1h_aggregation" (
"dimension_id" int4,
"mme_code" varchar COLLATE "default",
"sgw" varchar COLLATE "default",
"pgw" varchar COLLATE "default",
"tac" varchar COLLATE "default",
"cell_id" varchar COLLATE "default",
"apn" varchar COLLATE "default",
"statistical_time" timestamp(6) NOT NULL,
"created_time" timestamp(6) DEFAULT now() NOT NULL,
"session_establish_request" int8,
"session_establish_success" int8,
"session_establish_timedelay" int8,
"session_establish_failure" int8,
"session_delete_request" int8,
"session_delete_success" int8,
"session_delete_timedelay" int8,
"session_delete_failure" int8,
"bearer_creat_request" int8,
"bearer_creat_success" int8,
"bearer_creat_timedelay" int8,
"bearer_creat_failure" int8,
"bearer_modify_request" int8,
"bearer_modify_success" int8,
"bearer_modify_timedelay" int8,
"bearer_modify_failure" int8,
"bearer_modify_command_request" int8,
"bearer_modify_command_success" int8,
"bearer_modify_command_failure" int8,
"bearer_delete_command_request" int8,
"bearer_delete_command_success" int8,
"bearer_delete_command_failure" int8,
"bearer_resource_command_request" int8,
"bearer_resource_command_success" int8,
"bearer_resource_command_failure" int8,
"bearer_update_request" int8,
"bearer_update_success" int8,
"bearer_update_timedelay" int8,
"bearer_update_failure" int8,
"bearer_delete_request" int8,
"bearer_delete_success" int8,
"bearer_delete_timedelay" int8,
"bearer_delete_failure" int8,
"release_access_bearer_request" int8,
"release_access_bearer_success" int8,
"release_access_bearer_timedelay" int8,
"release_access_bearer_failure" int8,
"modify_access_bearer_request" int8,
"modify_access_bearer_success" int8,
"modify_access_bearer_timedelay" int8,
"modify_access_bearer_failure" int8,
"change_notification_request" int8,
"change_notification_success" int8,
"change_notification_timedelay" int8,
"change_notification_failure" int8,
"suspend_notification_request" int8,
"suspend_notification_success" int8,
"suspend_notification_timedelay" int8,
"suspend_notification_failure" int8,
"resume_notification_request" int8,
"resume_notification_success" int8,
"resume_notification_timedelay" int8,
"resume_notification_failure" int8,
"downlink_data_notification_request" int8,
"downlink_data_notification_success" int8,
"downlink_data_notification_timedelay" int8,
"downlink_data_notification_failure" int8,
"downlink_data_notification_failure_indication_request" int8,
"create_indirect_data_forward_tunnel_request" int8,
"create_indirect_data_forward_tunnel_success" int8,
"create_indirect_data_forward_tunnel_timedelay" int8,
"create_indirect_data_forward_tunnel_failure" int8,
"delete_indirect_data_forward_tunnel_request" int8,
"delete_indirect_data_forward_tunnel_success" int8,
"delete_indirect_data_forward_tunnel_timedelay" int8,
"delete_indirect_data_forward_tunnel_failure" int8,
"stop_paging_indication_request" int8,
"pgw_restart_notification_request" int8,
"pgw_restart_notification_success" int8,
"pgw_restart_notification_timedelay" int8,
"pgw_restart_notification_failure" int8,
"delete_pdn_connect_set_request" int8,
"delete_pdn_connect_set_success" int8,
"delete_pdn_connect_set_timedelay" int8,
"delete_pdn_connect_set_failure" int8,
"trace_session_activation_request" int8,
"trace_session_deactivation_request" int8
)
WITH (OIDS=FALSE)

;

DROP TABLE IF EXISTS "public"."gem_s1u_http_application_kpi_1h_final_statistics";
CREATE TABLE "public"."gem_s1u_http_application_kpi_1h_final_statistics" (
"statistical_time" timestamp(6) NOT NULL,
"flow_count" int8,
"session_count" int8
)
WITH (OIDS=FALSE)

;
COMMENT ON COLUMN "public"."gem_s1u_http_application_kpi_1h_final_statistics"."statistical_time" IS '时间';
COMMENT ON COLUMN "public"."gem_s1u_http_application_kpi_1h_final_statistics"."flow_count" IS '流量';
COMMENT ON COLUMN "public"."gem_s1u_http_application_kpi_1h_final_statistics"."session_count" IS '会话总数';

CREATE INDEX "gem_s1u_http_application_kpi_1h_final_statistics_idx" ON "public"."gem_s1u_http_application_kpi_1h_final_statistics" USING btree (statistical_time);

DROP TABLE IF EXISTS "public"."gem_s1u_http_district_kpi_1d_final_statistics";
CREATE TABLE "public"."gem_s1u_http_district_kpi_1d_final_statistics" (
"statistical_time" timestamp(6) NOT NULL,
"district" varchar COLLATE "default",
"subscriber_count" int8,
"flow_count" int8,
"session_count" int8
)
WITH (OIDS=FALSE)
;
COMMENT ON COLUMN "public"."gem_s1u_http_district_kpi_1d_final_statistics"."district" IS '行政区域';
COMMENT ON COLUMN "public"."gem_s1u_http_district_kpi_1d_final_statistics"."subscriber_count" IS '去重总人数';
COMMENT ON COLUMN "public"."gem_s1u_http_district_kpi_1d_final_statistics"."flow_count" IS '流量';
COMMENT ON COLUMN "public"."gem_s1u_http_district_kpi_1d_final_statistics"."session_count" IS '会话总数';

CREATE INDEX "gem_s1u_http_district_kpi_1d_final_statistics_idx" ON "public"."gem_s1u_http_district_kpi_1d_final_statistics" USING btree ("statistical_time", "district");

DROP TABLE IF EXISTS "public"."gem_s1u_http_application_type_kpi_1d_final_statistics";
CREATE TABLE "public"."gem_s1u_http_application_type_kpi_1d_final_statistics" (
"statistical_time" timestamp(6) NOT NULL,
"business_type" varchar COLLATE "default",
"detail_business" varchar COLLATE "default",
"subscriber_count" int8,
"flow_count" int8
)
WITH (OIDS = FALSE
);
COMMENT ON COLUMN "public"."gem_s1u_http_application_type_kpi_1d_final_statistics"."business_type" IS '业务大类';
COMMENT ON COLUMN "public"."gem_s1u_http_application_type_kpi_1d_final_statistics"."detail_business" IS '业务小类';
COMMENT ON COLUMN "public"."gem_s1u_http_application_type_kpi_1d_final_statistics"."subscriber_count" IS '人数';
COMMENT ON COLUMN "public"."gem_s1u_http_application_type_kpi_1d_final_statistics"."flow_count" IS '流量';





DROP TABLE IF EXISTS "public"."gem_s1u_1h_aggregation";
CREATE TABLE "public"."gem_s1u_1h_aggregation" (
"dimension_id" int4,
"sgw" varchar COLLATE "default",
"tac" varchar COLLATE "default",
"enodeb_id" varchar COLLATE "default",
"cell_id" varchar COLLATE "default",
"imsi" varchar COLLATE "default",
"ue_brand" varchar COLLATE "default",
"ue_type" varchar COLLATE "default",
"business_type" varchar COLLATE "default",
"detail_business" varchar COLLATE "default",
"statistical_time" timestamp(6) NOT NULL,
"created_time" timestamp(6) DEFAULT now(),
"tcp_up_link_request_count" int8,
"tcp_up_link_success_count" int8,
"tcp_up_link_timedelay" int8,
"tcp_dl_link_request_count" int8,
"tcp_dl_link_success_count" int8,
"tcp_dl_link_timedelay" int8,
"tcp_link_timedelay" int8
)
WITH (OIDS=FALSE)

;

DROP TABLE IF EXISTS "public"."gem_s1u_im_1h_aggregation";
CREATE TABLE "public"."gem_s1u_im_1h_aggregation" (
"dimension_id" int4,
"sgw" varchar COLLATE "default",
"tac" varchar COLLATE "default",
"enodeb_id" varchar COLLATE "default",
"cell_id" varchar COLLATE "default",
"imsi" varchar COLLATE "default",
"ue_brand" varchar COLLATE "default",
"ue_type" varchar COLLATE "default",
"business_type" varchar COLLATE "default",
"detail_business" varchar COLLATE "default",
"statistical_time" timestamp(6) NOT NULL,
"created_time" timestamp(6) DEFAULT now(),
"tcp_up_link_request_count" int8,
"tcp_up_link_success_count" int8,
"tcp_up_link_timedelay" int8,
"tcp_dl_link_request_count" int8,
"tcp_dl_link_success_count" int8,
"tcp_dl_link_timedelay" int8,
"tcp_link_timedelay" int8,
"im_login_request_count" int8,
"im_login_success_count" int8,
"im_login_timedelay" int8
)
WITH (OIDS=FALSE)
;

CREATE TABLE "public"."gem_s1u_total_kpi_1h_statistics" (
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
"statistical_time" timestamp(6) NOT NULL,
"created_time" timestamp(6) DEFAULT now(),
"tcp_up_link_request_count" int8,
"tcp_up_link_success_count" int8,
"tcp_up_link_timedelay" int8,
"tcp_dl_link_request_count" int8,
"tcp_dl_link_success_count" int8,
"tcp_dl_link_timedelay" int8,
"tcp_link_timedelay" int8
)
WITH (OIDS=FALSE)
;
COMMENT ON TABLE "public"."gem_s1u_total_kpi_1h_statistics" IS 'S1U TCP事件汇总指标表';
COMMENT ON COLUMN "public"."gem_s1u_kpi_1h_statistics"."business_type" IS '业务大类';
COMMENT ON COLUMN "public"."gem_s1u_kpi_1h_statistics"."detail_business" IS '业务小类';
COMMENT ON COLUMN "public"."gem_s1u_kpi_1h_statistics"."tcp_up_link_request_count" IS 'TCP上行连接请求次数';
COMMENT ON COLUMN "public"."gem_s1u_kpi_1h_statistics"."tcp_up_link_success_count" IS 'TCP上行连接成功次数';
COMMENT ON COLUMN "public"."gem_s1u_kpi_1h_statistics"."tcp_up_link_timedelay" IS 'TCP上行连接时延';
COMMENT ON COLUMN "public"."gem_s1u_kpi_1h_statistics"."tcp_dl_link_request_count" IS 'TCP下行连接请求次数';
COMMENT ON COLUMN "public"."gem_s1u_kpi_1h_statistics"."tcp_dl_link_success_count" IS 'TCP下行连接成功次数';
COMMENT ON COLUMN "public"."gem_s1u_kpi_1h_statistics"."tcp_dl_link_timedelay" IS 'TCP下行连接时延';
COMMENT ON COLUMN "public"."gem_s1u_kpi_1h_statistics"."tcp_link_timedelay" IS 'TCP连接时延';


DROP TABLE IF EXISTS "public"."gem_s1u_total_kpi_5m_statistics";
CREATE TABLE "public"."gem_s1u_total_kpi_5m_statistics" (
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
  "statistical_time" timestamp(6) NOT NULL,
  "created_time" timestamp(6) DEFAULT now(),
  "tcp_up_link_request_count" int8,
  "tcp_up_link_success_count" int8,
  "tcp_up_link_timedelay" int8,
  "tcp_dl_link_request_count" int8,
  "tcp_dl_link_success_count" int8,
  "tcp_dl_link_timedelay" int8,
  "tcp_link_timedelay" int8
)
WITH (OIDS=FALSE)
;

DROP TABLE IF EXISTS "public"."gem_s1u_total_kpi_1h_statistics";
CREATE TABLE "public"."gem_s1u_total_kpi_1h_statistics" (
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
  "statistical_time" timestamp(6) NOT NULL,
  "created_time" timestamp(6) DEFAULT now(),
  "tcp_up_link_request_count" int8,
  "tcp_up_link_success_count" int8,
  "tcp_up_link_timedelay" int8,
  "tcp_dl_link_request_count" int8,
  "tcp_dl_link_success_count" int8,
  "tcp_dl_link_timedelay" int8,
  "tcp_link_timedelay" int8
)
WITH (OIDS=FALSE)
;

DROP TABLE IF EXISTS "public"."gem_s1u_total_kpi_1d_statistics";
CREATE TABLE "public"."gem_s1u_total_kpi_1d_statistics" (
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
  "statistical_time" timestamp(6) NOT NULL,
  "created_time" timestamp(6) DEFAULT now(),
  "tcp_up_link_request_count" int8,
  "tcp_up_link_success_count" int8,
  "tcp_up_link_timedelay" int8,
  "tcp_dl_link_request_count" int8,
  "tcp_dl_link_success_count" int8,
  "tcp_dl_link_timedelay" int8,
  "tcp_link_timedelay" int8
)
WITH (OIDS=FALSE)
;

CREATE TABLE "public"."gem_s1u_total_1h_aggregation" (
  "dimension_id" int4,
  "sgw" varchar COLLATE "default",
  "tac" varchar COLLATE "default",
  "enodeb_id" varchar COLLATE "default",
  "cell_id" varchar COLLATE "default",
  "imsi" varchar COLLATE "default",
  "ue_brand" varchar COLLATE "default",
  "ue_type" varchar COLLATE "default",
  "business_type" varchar COLLATE "default",
  "detail_business" varchar COLLATE "default",
  "statistical_time" timestamp(6) NOT NULL,
  "created_time" timestamp(6) DEFAULT now(),
  "tcp_up_link_request_count" int8,
  "tcp_up_link_success_count" int8,
  "tcp_up_link_timedelay" int8,
  "tcp_dl_link_request_count" int8,
  "tcp_dl_link_success_count" int8,
  "tcp_dl_link_timedelay" int8,
  "tcp_link_timedelay" int8
)
WITH (OIDS=FALSE)
;



/*
Navicat PGSQL Data Transfer

Source Server         : company_postgreSQL
Source Server Version : 90601
Source Host           : 192.168.6.97:5432
Source Database       : GEMPILE_DATA
Source Schema         : public

Target Server Type    : PGSQL
Target Server Version : 90601
File Encoding         : 65001

Date: 2017-08-17 17:59:32
*/


-- ----------------------------
-- Table structure for gem_auto_alert_rules
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_auto_alert_rules";
CREATE TABLE "public"."gem_auto_alert_rules" (
"rule_id" varchar COLLATE "default" DEFAULT "next_id(result int8)"() NOT NULL,
"rule_name" varchar COLLATE "default" NOT NULL,
"network_interface" varchar COLLATE "default" NOT NULL,
"dimension_group" varchar COLLATE "default" NOT NULL,
"dimension_type" varchar COLLATE "default" NOT NULL,
"dimension_values" varchar COLLATE "default",
"indicator_id" varchar COLLATE "default" NOT NULL,
"emergent_alert_relational_operator" varchar COLLATE "default",
"emergent_alert_threshold" int4,
"major_alert_relational_operator" varchar COLLATE "default",
"major_alert_threshold" int4,
"commonly_alert_relational_operator" varchar COLLATE "default",
"commonly_alert_threshold" int4,
"unit" int4 NOT NULL,
"interval" int4 NOT NULL,
"active_sms" bool DEFAULT false NOT NULL,
"enabled" bool DEFAULT true NOT NULL,
"active_monitoring" bool DEFAULT false NOT NULL,
"modified_time" timestamp(6) DEFAULT now()NOT NULL,
"created_time" timestamp(6) DEFAULT now()NOT NULL
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."gem_auto_alert_rules" IS '主动告警规则表';
COMMENT ON COLUMN "public"."gem_auto_alert_rules"."rule_id" IS '规则id';
COMMENT ON COLUMN "public"."gem_auto_alert_rules"."rule_name" IS '规则名称';
COMMENT ON COLUMN "public"."gem_auto_alert_rules"."network_interface" IS '接口名';
COMMENT ON COLUMN "public"."gem_auto_alert_rules"."dimension_group" IS '维度组（全网:whole_network,网元network_element,业务app,区域area）';
COMMENT ON COLUMN "public"."gem_auto_alert_rules"."dimension_type" IS '维度';
COMMENT ON COLUMN "public"."gem_auto_alert_rules"."dimension_values" IS '对象值';
COMMENT ON COLUMN "public"."gem_auto_alert_rules"."indicator_id" IS '指标id';
COMMENT ON COLUMN "public"."gem_auto_alert_rules"."emergent_alert_relational_operator" IS '紧急告警操作符';
COMMENT ON COLUMN "public"."gem_auto_alert_rules"."emergent_alert_threshold" IS '紧急告警阈值';
COMMENT ON COLUMN "public"."gem_auto_alert_rules"."major_alert_relational_operator" IS '重要告警操作符';
COMMENT ON COLUMN "public"."gem_auto_alert_rules"."major_alert_threshold" IS '重要告警阈值';
COMMENT ON COLUMN "public"."gem_auto_alert_rules"."commonly_alert_relational_operator" IS '一般告警操作符';
COMMENT ON COLUMN "public"."gem_auto_alert_rules"."commonly_alert_threshold" IS '一般告警阈值';
COMMENT ON COLUMN "public"."gem_auto_alert_rules"."unit" IS '告警阈值单位,1为百分比，2为其他';
COMMENT ON COLUMN "public"."gem_auto_alert_rules"."interval" IS '分钟为单位的时间粒度';
COMMENT ON COLUMN "public"."gem_auto_alert_rules"."active_sms" IS '是否触发短信告警';
COMMENT ON COLUMN "public"."gem_auto_alert_rules"."enabled" IS '是否启用该规则默认为true';
COMMENT ON COLUMN "public"."gem_auto_alert_rules"."active_monitoring" IS '是否加入实时监控';
COMMENT ON COLUMN "public"."gem_auto_alert_rules"."modified_time" IS '记录更改时间';
COMMENT ON COLUMN "public"."gem_auto_alert_rules"."created_time" IS '记录创建时间';

-- ----------------------------
-- Alter Sequences Owned By
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table gem_auto_alert_rules
-- ----------------------------
ALTER TABLE "public"."gem_auto_alert_rules" ADD PRIMARY KEY ("rule_id");


-- ----------------------------
-- Table structure for gem_auto_alert_records_statistics
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_auto_alert_records_statistics";
CREATE TABLE "public"."gem_auto_alert_records_statistics" (
"id" varchar COLLATE "default" DEFAULT "next_id(result int8)"() NOT NULL,
"rule_id" varchar COLLATE "default" NOT NULL,
"first_triggered_time" timestamp(6) NOT NULL,
"latest_triggered_time" timestamp(6) NOT NULL,
"latest_auto_alert_value" numeric NOT NULL,
"network_interface" varchar COLLATE "default" NOT NULL,
"dimension_type" varchar COLLATE "default" NOT NULL,
"dimension_value" varchar COLLATE "default" NOT NULL,
"triggered_count" int4 NOT NULL,
"alert_level" int4 NOT NULL,
"active" bool DEFAULT true NOT NULL,
"unit" int4 NOT NULL,
"interval" int4 NOT NULL,
"operator" varchar COLLATE "default" ,
"modified_time" timestamp(6) DEFAULT now()NOT NULL,
"created_time" timestamp(6) DEFAULT now()NOT NULL
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."gem_auto_alert_records_statistics" IS '主动告警记录统计结果表';
COMMENT ON COLUMN "public"."gem_auto_alert_records_statistics"."id" IS '规则id';
COMMENT ON COLUMN "public"."gem_auto_alert_records_statistics"."rule_id" IS '规则名称';
COMMENT ON COLUMN "public"."gem_auto_alert_records_statistics"."first_triggered_time" IS '第一次触发时间';
COMMENT ON COLUMN "public"."gem_auto_alert_records_statistics"."latest_triggered_time" IS '最后一次触发时间';
COMMENT ON COLUMN "public"."gem_auto_alert_records_statistics"."latest_auto_alert_value" IS '最后一次告警值';
COMMENT ON COLUMN "public"."gem_auto_alert_records_statistics"."network_interface" IS '接口名称';
COMMENT ON COLUMN "public"."gem_auto_alert_records_statistics"."dimension_type" IS '维度类型';
COMMENT ON COLUMN "public"."gem_auto_alert_records_statistics"."dimension_value" IS '维度值维度值';
COMMENT ON COLUMN "public"."gem_auto_alert_records_statistics"."triggered_count" IS '触发次数';
COMMENT ON COLUMN "public"."gem_auto_alert_records_statistics"."alert_level" IS '告警级别，1为紧急告警，2为重要告警，3为一般告警';
COMMENT ON COLUMN "public"."gem_auto_alert_records_statistics"."active" IS '是否是活动告警';
COMMENT ON COLUMN "public"."gem_auto_alert_records_statistics"."unit" IS '指标值单位，1为百分比，2为其他';
COMMENT ON COLUMN "public"."gem_auto_alert_records_statistics"."interval" IS '时间粒度';
COMMENT ON COLUMN "public"."gem_auto_alert_records_statistics"."operator" IS '记录操作者';
COMMENT ON COLUMN "public"."gem_auto_alert_records_statistics"."modified_time" IS '修改时间';
COMMENT ON COLUMN "public"."gem_auto_alert_records_statistics"."created_time" IS '创建时间';

-- ----------------------------
-- Alter Sequences Owned By
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table gem_auto_alert_records_statistics
-- ----------------------------
ALTER TABLE "public"."gem_auto_alert_records_statistics" ADD PRIMARY KEY ("id");



-- ----------------------------
-- Table structure for gem_auto_alerting_application_dimensions
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_auto_alerting_application_dimensions";
CREATE TABLE "public"."gem_auto_alerting_application_dimensions" (
"rule_id" varchar COLLATE "default",
"app_type" varchar COLLATE "default",
"app_sub_type" varchar COLLATE "default",
"modified_time" timestamp(6) DEFAULT now(),
"created_time" timestamp(6) DEFAULT now()
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."gem_auto_alerting_application_dimensions" IS '主动告警规则表';
COMMENT ON COLUMN "public"."gem_auto_alerting_application_dimensions"."rule_id" IS '规则id';
COMMENT ON COLUMN "public"."gem_auto_alerting_application_dimensions"."app_type" IS '业务大类名称';
COMMENT ON COLUMN "public"."gem_auto_alerting_application_dimensions"."app_sub_type" IS '业务小类名称';
COMMENT ON COLUMN "public"."gem_auto_alerting_application_dimensions"."modified_time" IS '更新时间';
COMMENT ON COLUMN "public"."gem_auto_alerting_application_dimensions"."created_time" IS '创建时间';

-- ----------------------------
-- Alter Sequences Owned By
-- ----------------------------
-- ----------------------------
-- Table structure for gem_auto_alerting_whole_network_records
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_auto_alerting_whole_network_records";
CREATE TABLE "public"."gem_auto_alerting_whole_network_records" (
"id" varchar COLLATE "default" DEFAULT "next_id(result int8)"() NOT NULL,
"rule_id" varchar(64) COLLATE "default",
"interval" int4,
"dimension_type" varchar COLLATE "default",
"dimension_value" varchar COLLATE "default",
"indicator_id" varchar COLLATE "default",
"indicator_value" numeric,
"alert_level" int4,
"triggered_time" timestamp(6) NOT NULL,
"created_time" timestamp(6) DEFAULT now()
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."gem_auto_alerting_whole_network_records" IS '全网维度指标告警数据表';
COMMENT ON COLUMN "public"."gem_auto_alerting_whole_network_records"."id" IS '唯一标识ID';
COMMENT ON COLUMN "public"."gem_auto_alerting_whole_network_records"."rule_id" IS '规则ID';
COMMENT ON COLUMN "public"."gem_auto_alerting_whole_network_records"."interval" IS '时间粒度';
COMMENT ON COLUMN "public"."gem_auto_alerting_whole_network_records"."dimension_type" IS '维度';
COMMENT ON COLUMN "public"."gem_auto_alerting_whole_network_records"."dimension_value" IS '维度值';
COMMENT ON COLUMN "public"."gem_auto_alerting_whole_network_records"."indicator_id" IS '指标ID';
COMMENT ON COLUMN "public"."gem_auto_alerting_whole_network_records"."indicator_value" IS '指标值';
COMMENT ON COLUMN "public"."gem_auto_alerting_whole_network_records"."alert_level" IS '告警级别，一般告警：3，重要告警：2，紧急告警：1';
COMMENT ON COLUMN "public"."gem_auto_alerting_whole_network_records"."triggered_time" IS '告警记录统计时间';
COMMENT ON COLUMN "public"."gem_auto_alerting_whole_network_records"."created_time" IS '告警记录入库时间';

-- ----------------------------
-- Alter Sequences Owned By
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table gem_auto_alerting_whole_network_records
-- ----------------------------
ALTER TABLE "public"."gem_auto_alerting_whole_network_records" ADD PRIMARY KEY ("id");


-- ----------------------------
-- Table structure for gem_auto_alerting_application_records
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_auto_alerting_application_records";
CREATE TABLE "public"."gem_auto_alerting_application_records" (
"id" varchar COLLATE "default" DEFAULT "next_id(result int8)"() NOT NULL,
"rule_id" varchar(64) COLLATE "default",
"interval" int4,
"app_type" varchar COLLATE "default",
"app_sub_type" varchar COLLATE "default",
"indicator_id" varchar COLLATE "default",
"indicator_value" numeric,
"alert_level" int4,
"triggered_time" timestamp(6) NOT NULL,
"created_time" timestamp(6) DEFAULT now()
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."gem_auto_alerting_application_records" IS '网元维度指标告警数据表';
COMMENT ON COLUMN "public"."gem_auto_alerting_application_records"."id" IS '唯一标识ID';
COMMENT ON COLUMN "public"."gem_auto_alerting_application_records"."rule_id" IS '规则ID';
COMMENT ON COLUMN "public"."gem_auto_alerting_application_records"."interval" IS '时间粒度';
COMMENT ON COLUMN "public"."gem_auto_alerting_application_records"."app_type" IS '业务大类';
COMMENT ON COLUMN "public"."gem_auto_alerting_application_records"."app_sub_type" IS '业务小类';
COMMENT ON COLUMN "public"."gem_auto_alerting_application_records"."indicator_id" IS '指标ID';
COMMENT ON COLUMN "public"."gem_auto_alerting_application_records"."indicator_value" IS '指标值';
COMMENT ON COLUMN "public"."gem_auto_alerting_application_records"."alert_level" IS '告警级别，一般告警：3，重要告警：2，紧急告警：1';
COMMENT ON COLUMN "public"."gem_auto_alerting_application_records"."triggered_time" IS '告警记录统计时间';
COMMENT ON COLUMN "public"."gem_auto_alerting_application_records"."created_time" IS '告警记录入库时间';

-- ----------------------------
-- Alter Sequences Owned By
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table gem_auto_alerting_application_records
-- ----------------------------
ALTER TABLE "public"."gem_auto_alerting_application_records" ADD PRIMARY KEY ("id");







-- ----------------------------
-- Table structure for gem_auto_alerting_area_records
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_auto_alerting_area_records";
CREATE TABLE "public"."gem_auto_alerting_area_records" (
"id" varchar COLLATE "default" DEFAULT "next_id(result int8)"() NOT NULL,
"rule_id" varchar(64) COLLATE "default",
"interval" int4,
"dimension_type" varchar COLLATE "default",
"dimension_value" varchar COLLATE "default",
"indicator_id" varchar COLLATE "default",
"indicator_value" numeric,
"alert_level" int4,
"triggered_time" timestamp(6) NOT NULL,
"created_time" timestamp(6) DEFAULT now()
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."gem_auto_alerting_area_records" IS '区域维度指标告警数据表';
COMMENT ON COLUMN "public"."gem_auto_alerting_area_records"."id" IS '唯一标识ID';
COMMENT ON COLUMN "public"."gem_auto_alerting_area_records"."rule_id" IS '规则ID';
COMMENT ON COLUMN "public"."gem_auto_alerting_area_records"."interval" IS '时间粒度';
COMMENT ON COLUMN "public"."gem_auto_alerting_area_records"."dimension_type" IS '维度';
COMMENT ON COLUMN "public"."gem_auto_alerting_area_records"."dimension_value" IS '维度值';
COMMENT ON COLUMN "public"."gem_auto_alerting_area_records"."indicator_id" IS '指标ID';
COMMENT ON COLUMN "public"."gem_auto_alerting_area_records"."indicator_value" IS '指标值';
COMMENT ON COLUMN "public"."gem_auto_alerting_area_records"."alert_level" IS '告警级别，一般告警：3，重要告警：2，紧急告警：1';
COMMENT ON COLUMN "public"."gem_auto_alerting_area_records"."triggered_time" IS '告警记录统计时间';
COMMENT ON COLUMN "public"."gem_auto_alerting_area_records"."created_time" IS '告警记录入库时间';

-- ----------------------------
-- Alter Sequences Owned By
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table gem_auto_alerting_area_records
-- ----------------------------
ALTER TABLE "public"."gem_auto_alerting_area_records" ADD PRIMARY KEY ("id");




-- ----------------------------
-- Table structure for gem_auto_alerting_network_element_records
-- ----------------------------
DROP TABLE IF EXISTS "public"."gem_auto_alerting_network_element_records";
CREATE TABLE "public"."gem_auto_alerting_network_element_records" (
"id" varchar COLLATE "default" DEFAULT "next_id(result int8)"() NOT NULL,
"rule_id" varchar(64) COLLATE "default",
"interval" int4,
"dimension_type" varchar COLLATE "default",
"dimension_value" varchar COLLATE "default",
"indicator_id" varchar COLLATE "default",
"indicator_value" numeric,
"alert_level" int4,
"triggered_time" timestamp(6) NOT NULL,
"created_time" timestamp(6) DEFAULT now()
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."gem_auto_alerting_network_element_records" IS '网元维度指标告警数据表';
COMMENT ON COLUMN "public"."gem_auto_alerting_network_element_records"."id" IS '唯一标识ID';
COMMENT ON COLUMN "public"."gem_auto_alerting_network_element_records"."rule_id" IS '规则ID';
COMMENT ON COLUMN "public"."gem_auto_alerting_network_element_records"."interval" IS '时间粒度';
COMMENT ON COLUMN "public"."gem_auto_alerting_network_element_records"."dimension_type" IS '维度';
COMMENT ON COLUMN "public"."gem_auto_alerting_network_element_records"."dimension_value" IS '维度值';
COMMENT ON COLUMN "public"."gem_auto_alerting_network_element_records"."indicator_id" IS '指标ID';
COMMENT ON COLUMN "public"."gem_auto_alerting_network_element_records"."indicator_value" IS '指标值';
COMMENT ON COLUMN "public"."gem_auto_alerting_network_element_records"."alert_level" IS '告警级别，一般告警：3，重要告警：2，紧急告警：1';
COMMENT ON COLUMN "public"."gem_auto_alerting_network_element_records"."triggered_time" IS '告警记录统计时间';
COMMENT ON COLUMN "public"."gem_auto_alerting_network_element_records"."created_time" IS '告警记录入库时间';

-- ----------------------------
-- Alter Sequences Owned By
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table gem_auto_alerting_network_element_records
-- ----------------------------
ALTER TABLE "public"."gem_auto_alerting_network_element_records" ADD PRIMARY KEY ("id");
























