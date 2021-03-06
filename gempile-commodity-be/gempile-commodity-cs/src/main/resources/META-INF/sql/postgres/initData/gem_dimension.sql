--INSERT INTO "gem_dimension" VALUES ('apn', 'S11', 'gem_s11_kpi_1d_statistics,gem_s11_kpi_1h_statistics,gem_s11_kpi_5m_statistics', '0', 'APN', 3);
INSERT INTO "gem_dimension" VALUES ('business_type', 'S1U_DNS', NULL, '0', '业务大类', 8);
INSERT INTO "gem_dimension" VALUES ('business_type', 'S1U_HTTP', NULL, '0', '业务大类', 8);
INSERT INTO "gem_dimension" VALUES ('business_type', 'S1U_IM', NULL, '0', '业务大类', 8);
INSERT INTO "gem_dimension" VALUES ('cell_id', 'MR', 'gem_mr_kpi_1d_statistics,gem_mr_kpi_1h_statistics,gem_mr_kpi_5m_statistics', '0', 'Cell', 5);
INSERT INTO "gem_dimension" VALUES ('cell_id', 'S11', 'gem_s11_kpi_1d_statistics,gem_s11_kpi_1h_statistics,gem_s11_kpi_5m_statistics', '0', 'Cell', 6);
INSERT INTO "gem_dimension" VALUES ('cell_id', 'S1_MME', 'gem_s1_mme_kpi_1d_statistics,gem_s1_mme_kpi_1h_statistics,gem_s1_mme_kpi_5m_statistics', '0', 'Cell', 5);
INSERT INTO "gem_dimension" VALUES ('cell_id', 'S1U_DNS', NULL, '0', 'Cell', 4);
INSERT INTO "gem_dimension" VALUES ('cell_id', 'S1U_HTTP', NULL, '0', 'Cell', 4);
INSERT INTO "gem_dimension" VALUES ('cell_id', 'S1U_IM', NULL, '0', 'Cell', 4);
INSERT INTO "gem_dimension" VALUES ('cell_id', 'UU', 'gem_uu_kpi_1d_statistics,gem_uu_kpi_1h_statistics,gem_uu_kpi_5m_statistics', '0', 'Cell', 5);
INSERT INTO "gem_dimension" VALUES ('cell_id', 'X2', 'gem_x2_kpi_1d_statistics,gem_x2_kpi_1h_statistics,gem_x2_kpi_5m_statistics', '0', 'Cell', 5);
INSERT INTO "gem_dimension" VALUES ('detail_business', 'S1U_DNS', NULL, '0', '业务小类', 9);
INSERT INTO "gem_dimension" VALUES ('detail_business', 'S1U_HTTP', NULL, '0', '业务小类', 9);
INSERT INTO "gem_dimension" VALUES ('detail_business', 'S1U_IM', NULL, '0', '业务小类', 9);
INSERT INTO "gem_dimension" VALUES ('enodeb_id', 'MR', 'gem_mr_kpi_1d_statistics,gem_mr_kpi_1h_statistics,gem_mr_kpi_5m_statistics', '0', 'eNodeB', 4);
INSERT INTO "gem_dimension" VALUES ('enodeb_id', 'S1_MME', 'gem_s1_mme_kpi_1d_statistics,gem_s1_mme_kpi_1h_statistics,gem_s1_mme_kpi_5m_statistics', '0', 'eNodeB', 4);
INSERT INTO "gem_dimension" VALUES ('enodeb_id', 'S1U_DNS', NULL, '0', 'eNodeB', 3);
INSERT INTO "gem_dimension" VALUES ('enodeb_id', 'S1U_HTTP', NULL, '0', 'eNodeB', 3);
INSERT INTO "gem_dimension" VALUES ('enodeb_id', 'S1U_IM', NULL, '0', 'eNodeB', 3);
INSERT INTO "gem_dimension" VALUES ('enodeb_id', 'UU', 'gem_uu_kpi_1d_statistics,gem_uu_kpi_1h_statistics,gem_uu_kpi_5m_statistics', '0', 'eNodeB', 4);
INSERT INTO "gem_dimension" VALUES ('enodeb_id', 'X2', 'gem_x2_kpi_1d_statistics,gem_x2_kpi_1h_statistics,gem_x2_kpi_5m_statistics', '0', 'eNodeB', 4);
INSERT INTO "gem_dimension" VALUES ('hss', 'S6A', 'gem_s6a_kpi_1d_statistics,gem_s6a_kpi_1h_statistics,gem_s6a_kpi_5m_statistics', '0', 'HSS', 3);
-- INSERT INTO "gem_dimension" VALUES ('imsi', 'MR', 'gem_mr_kpi_1d_statistics_by_imsi,gem_mr_kpi_1h_statistics_by_imsi,gem_mr_kpi_5m_statistics_by_imsi', '0', 'IMSI', 6);
-- INSERT INTO "gem_dimension" VALUES ('imsi', 'S1U_DNS', NULL, '0', 'IMSI', 5);
-- INSERT INTO "gem_dimension" VALUES ('imsi', 'S1U_HTTP', NULL, '0', 'IMSI', 5);
-- INSERT INTO "gem_dimension" VALUES ('imsi', 'S1U_IM', NULL, '0', 'IMSI', 5);
-- INSERT INTO "gem_dimension" VALUES ('imsi', 'UU', 'gem_uu_kpi_1d_statistics_by_imsi,gem_uu_kpi_1h_statistics_by_imsi,gem_uu_kpi_5m_statistics_by_imsi', '0', 'IMSI', 6);
-- INSERT INTO "gem_dimension" VALUES ('imsi', 'X2', 'gem_x2_kpi_1d_statistics_by_imsi,gem_x2_kpi_1h_statistics_by_imsi,gem_x2_kpi_5m_statistics_by_imsi', '0', 'IMSI', 6);
INSERT INTO "gem_dimension" VALUES ('mme_code', 'S11', 'gem_s11_kpi_1d_statistics,gem_s11_kpi_1h_statistics,gem_s11_kpi_5m_statistics', '0', 'MME', 2);
INSERT INTO "gem_dimension" VALUES ('mme_code', 'S1_MME', 'gem_s1_mme_kpi_1d_statistics,gem_s1_mme_kpi_1h_statistics,gem_s1_mme_kpi_5m_statistics', '0', 'MME', 2);
INSERT INTO "gem_dimension" VALUES ('mme_code', 'S6A', 'gem_s6a_kpi_1d_statistics,gem_s6a_kpi_1h_statistics,gem_s6a_kpi_5m_statistics', '0', 'MME', 2);
INSERT INTO "gem_dimension" VALUES ('mme_code', 'SGS', 'gem_sgs_kpi_1d_statistics,gem_sgs_kpi_1h_statistics,gem_sgs_kpi_5m_statistics', '0', 'MME', 2);
INSERT INTO "gem_dimension" VALUES ('mme_code', 'UU', 'gem_uu_kpi_1d_statistics,gem_uu_kpi_1h_statistics,gem_uu_kpi_5m_statistics', '0', 'MME', 2);
INSERT INTO "gem_dimension" VALUES ('mme_code', 'X2', 'gem_x2_kpi_1d_statistics,gem_x2_kpi_1h_statistics,gem_x2_kpi_5m_statistics', '0', 'MME', 2);
INSERT INTO "gem_dimension" VALUES ('mme_group_id', 'S1_MME', 'gem_s1_mme_kpi_1d_statistics,gem_s1_mme_kpi_1h_statistics,gem_s1_mme_kpi_5m_statistics', '0', 'MME POOL', 1);
INSERT INTO "gem_dimension" VALUES ('mme_group_id', 'UU', 'gem_uu_kpi_1d_statistics,gem_uu_kpi_1h_statistics,gem_uu_kpi_5m_statistics', '0', 'MME POOL', 1);
INSERT INTO "gem_dimension" VALUES ('mme_group_id', 'X2', 'gem_x2_kpi_1d_statistics,gem_x2_kpi_1h_statistics,gem_x2_kpi_5m_statistics', '0', 'MME POOL', 1);
INSERT INTO "gem_dimension" VALUES ('msc', 'SGS', 'gem_sgs_kpi_1d_statistics,gem_sgs_kpi_1h_statistics,gem_sgs_kpi_5m_statistics', '0', 'MSC', 3);
--INSERT INTO "gem_dimension" VALUES ('pgw', 'S11', 'gem_s11_kpi_1d_statistics,gem_s11_kpi_1h_statistics,gem_s11_kpi_5m_statistics', '0', 'PGW', 4);
INSERT INTO "gem_dimension" VALUES ('sgw', 'S11', 'gem_s11_kpi_1d_statistics,gem_s11_kpi_1h_statistics,gem_s11_kpi_5m_statistics', '0', 'SGW', 3);
INSERT INTO "gem_dimension" VALUES ('sgw', 'S1U_DNS', NULL, '0', 'SGW', 1);
INSERT INTO "gem_dimension" VALUES ('sgw', 'S1U_HTTP', NULL, '0', 'SGW', 1);
INSERT INTO "gem_dimension" VALUES ('sgw', 'S1U_IM', NULL, '0', 'SGW', 1);
INSERT INTO "gem_dimension" VALUES ('tac', 'MR', 'gem_mr_kpi_1d_statistics,gem_mr_kpi_1h_statistics,gem_mr_kpi_5m_statistics', '0', 'TAC', 3);
INSERT INTO "gem_dimension" VALUES ('tac', 'S11', 'gem_s11_kpi_1d_statistics,gem_s11_kpi_1h_statistics,gem_s11_kpi_5m_statistics', '0', 'TAC', 5);
INSERT INTO "gem_dimension" VALUES ('tac', 'S1_MME', 'gem_s1_mme_kpi_1d_statistics,gem_s1_mme_kpi_1h_statistics,gem_s1_mme_kpi_5m_statistics', '0', 'TAC', 3);
INSERT INTO "gem_dimension" VALUES ('tac', 'S1U_DNS', NULL, '0', 'TAC', 2);
INSERT INTO "gem_dimension" VALUES ('tac', 'S1U_HTTP', NULL, '0', 'TAC', 2);
INSERT INTO "gem_dimension" VALUES ('tac', 'S1U_IM', NULL, '0', 'TAC', 2);
INSERT INTO "gem_dimension" VALUES ('tac', 'UU', 'gem_uu_kpi_1d_statistics,gem_uu_kpi_1h_statistics,gem_uu_kpi_5m_statistics', '0', 'TAC', 3);
INSERT INTO "gem_dimension" VALUES ('tac', 'X2', 'gem_x2_kpi_1d_statistics,gem_x2_kpi_1h_statistics,gem_x2_kpi_5m_statistics', '0', 'TAC', 3);
INSERT INTO "gem_dimension" VALUES ('target_cell_id', 'UU', 'gem_uu_kpi_1d_statistics,gem_uu_kpi_1h_statistics,gem_uu_kpi_5m_statistics', '0', '目标cell', 5);
INSERT INTO "gem_dimension" VALUES ('target_enodeb_id', 'X2', 'gem_x2_kpi_1d_statistics,gem_x2_kpi_1h_statistics,gem_x2_kpi_5m_statistics', '0', '目标eNodeB', 4);
-- INSERT INTO "gem_dimension" VALUES ('ue_brand', 'MR', 'gem_mr_kpi_1d_statistics,gem_mr_kpi_1h_statistics,gem_mr_kpi_5m_statistics', '0', '终端品牌', 7);
-- INSERT INTO "gem_dimension" VALUES ('ue_brand', 'S1U_DNS', NULL, '0', '终端品牌', 6);
-- INSERT INTO "gem_dimension" VALUES ('ue_brand', 'S1U_HTTP', NULL, '0', '终端品牌', 6);
-- INSERT INTO "gem_dimension" VALUES ('ue_brand', 'S1U_IM', NULL, '0', '终端品牌', 6);
-- INSERT INTO "gem_dimension" VALUES ('ue_brand', 'UU', 'gem_uu_kpi_1d_statistics,gem_uu_kpi_1h_statistics,gem_uu_kpi_5m_statistics', '0', '终端品牌', 7);
-- INSERT INTO "gem_dimension" VALUES ('ue_brand', 'X2', 'gem_x2_kpi_1d_statistics,gem_x2_kpi_1h_statistics,gem_x2_kpi_5m_statistics', '0', '终端品牌', 7);
-- INSERT INTO "gem_dimension" VALUES ('ue_type', 'MR', 'gem_mr_kpi_1d_statistics,gem_mr_kpi_1h_statistics,gem_mr_kpi_5m_statistics', '0', '终端型号', 8);
-- INSERT INTO "gem_dimension" VALUES ('ue_type', 'S1U_DNS', NULL, '0', '终端型号', 7);
-- INSERT INTO "gem_dimension" VALUES ('ue_type', 'S1U_HTTP', '', '0', '终端型号', 7);
-- INSERT INTO "gem_dimension" VALUES ('ue_type', 'S1U_IM', NULL, '0', '终端型号', 7);
-- INSERT INTO "gem_dimension" VALUES ('ue_type', 'UU', 'gem_uu_kpi_1d_statistics,gem_uu_kpi_1h_statistics,gem_uu_kpi_5m_statistics', '0', '终端型号', 8);
-- INSERT INTO "gem_dimension" VALUES ('ue_type', 'X2', 'gem_x2_kpi_1d_statistics,gem_x2_kpi_1h_statistics,gem_x2_kpi_5m_statistics', '0', '终端型号', 8);
INSERT INTO "gem_dimension" VALUES ('whole_network', 'MR', 'gem_mr_kpi_1d_statistics,gem_mr_kpi_1h_statistics,gem_mr_kpi_5m_statistics', '0', '全网', 0);
INSERT INTO "gem_dimension" VALUES ('whole_network', 'S11', 'gem_s11_kpi_1d_statistics,gem_s11_kpi_1h_statistics,gem_s11_kpi_5m_statistics', '0', '全网', 0);
INSERT INTO "gem_dimension" VALUES ('whole_network', 'S1_MME', 'gem_s1_mme_kpi_1d_statistics,gem_s1_mme_kpi_1h_statistics,gem_s1_mme_kpi_5m_statistics', '0', '全网', 0);
INSERT INTO "gem_dimension" VALUES ('whole_network', 'S1U_DNS', NULL, '0', '全网', 0);
INSERT INTO "gem_dimension" VALUES ('whole_network', 'S1U_HTTP', NULL, '0', '全网', 0);
INSERT INTO "gem_dimension" VALUES ('whole_network', 'S1U_IM', NULL, '0', '全网', 0);
INSERT INTO "gem_dimension" VALUES ('whole_network', 'S6A', 'gem_s6a_kpi_1d_statistics,gem_s6a_kpi_1h_statistics,gem_s6a_kpi_5m_statistics', '0', '全网', 0);
INSERT INTO "gem_dimension" VALUES ('whole_network', 'SGS', 'gem_sgs_kpi_1d_statistics,gem_sgs_kpi_1h_statistics,gem_sgs_kpi_5m_statistics', '0', '全网', 0);
INSERT INTO "gem_dimension" VALUES ('whole_network', 'UU', 'gem_uu_kpi_1d_statistics,gem_uu_kpi_1h_statistics,gem_uu_kpi_5m_statistics', '0', '全网', 0);
INSERT INTO "gem_dimension" VALUES ('whole_network', 'X2', 'gem_x2_kpi_1d_statistics,gem_x2_kpi_1h_statistics,gem_x2_kpi_5m_statistics', '0', '全网', 0);
INSERT INTO "public"."gem_dimension" ("name", "network_interface", "source_table", "top_level", "value", "level") VALUES ('cell_id', 'S1U', NULL, '0', 'Cell', '4');
INSERT INTO "public"."gem_dimension" ("name", "network_interface", "source_table", "top_level", "value", "level") VALUES ('enodeb_id', 'S1U', NULL, '0', 'eNodeB', '3');
INSERT INTO "public"."gem_dimension" ("name", "network_interface", "source_table", "top_level", "value", "level") VALUES ('sgw', 'S1U', NULL, '0', 'SGW', '1');
INSERT INTO "public"."gem_dimension" ("name", "network_interface", "source_table", "top_level", "value", "level") VALUES ('tac', 'S1U', NULL, '0', 'TAC', '2');
INSERT INTO "public"."gem_dimension" ("name", "network_interface", "source_table", "top_level", "value", "level") VALUES ('whole_network', 'S1U', NULL, '0', '全网', '0');
INSERT INTO "public"."gem_dimension" ("name", "network_interface", "source_table", "top_level", "value", "level") VALUES ('business_type', 'S1U', NULL, '0', '业务大类', '8');
INSERT INTO "public"."gem_dimension" ("name", "network_interface", "source_table", "top_level", "value", "level") VALUES ('detail_business', 'S1U', NULL, '0', '业务小类', '9');
INSERT INTO "public"."gem_dimension" ("name", "network_interface", "source_table", "top_level", "value", "level") VALUES ('cell_id', 'S1U_TOTAL', NULL, '0', 'Cell', '4');
INSERT INTO "public"."gem_dimension" ("name", "network_interface", "source_table", "top_level", "value", "level") VALUES ('enodeb_id', 'S1U_TOTAL', NULL, '0', 'eNodeB', '3');
INSERT INTO "public"."gem_dimension" ("name", "network_interface", "source_table", "top_level", "value", "level") VALUES ('sgw', 'S1U_TOTAL', NULL, '0', 'SGW', '1');
INSERT INTO "public"."gem_dimension" ("name", "network_interface", "source_table", "top_level", "value", "level") VALUES ('tac', 'S1U_TOTAL', NULL, '0', 'TAC', '2');
INSERT INTO "public"."gem_dimension" ("name", "network_interface", "source_table", "top_level", "value", "level") VALUES ('whole_network', 'S1U_TOTAL', NULL, '0', '全网', '0');
INSERT INTO "public"."gem_dimension" ("name", "network_interface", "source_table", "top_level", "value", "level") VALUES ('business_type', 'S1U_TOTAL', NULL, '0', '业务大类', '8');
INSERT INTO "public"."gem_dimension" ("name", "network_interface", "source_table", "top_level", "value", "level") VALUES ('detail_business', 'S1U_TOTAL', NULL, '0', '业务小类', '9');