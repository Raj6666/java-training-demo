INSERT INTO "gem_session_analysis_abnormal_reason" VALUES ('1343289949780186567', 'S1_MME', '1', '7', '', '', 'S6A', '1', '5420', '用户未签约2G/3G/4G PS，有CS签约', 'Attach reject; EPS services not allowed (7)
3GPP-Update-Location-response:DIAMETER_ERROR_UNKNOWN_EPS_SUBSCRIPTION (5420) with Error-Diagnostic NO_GPRS_DATA_SUBSCRIBED');
INSERT INTO "gem_session_analysis_abnormal_reason" VALUES ('1343289949805352392', 'S1_MME', '1', '7', '', '', 'S6A', '6', '5420', '省外用户PS域欠费停机接入LTE网络', 'Attach reject; EPS services not allowed (7)
3GPP-Authentication-Information-response :DIAMETER_ERROR_UNKNOWN_EPS_SUBSCRIPTION (5420) with Error-Diagnostic NO_GPRS_DATA_SUBSCRIBED');
INSERT INTO "gem_session_analysis_abnormal_reason" VALUES ('1343289949805352393', 'S1_MME', '1', '8', '', '', 'S6A', '6', '5001', '1)非法imsi
', 'Attach reject; EPS services and non-EPS services not allowed (8)
3GPP-Authentication-Information-response  :DIAMETER_ERROR_USER_UNKNOWN (5001)');
INSERT INTO "gem_session_analysis_abnormal_reason" VALUES ('1343289949805352394', 'S1_MME', '1', '8', '', '', 'SGS', '1', '2', '
SGs口故障MSC/VLR无法查询用户信息', 'Attach reject; EPS services and non-EPS services not allowed (8)
SGs-Update-Location-response:IMSI Unknown in HLR (2)');
INSERT INTO "gem_session_analysis_abnormal_reason" VALUES ('1343289949805352395', 'S1_MME', '1', '14', '', '', '', '', '', '漫游限制/未开通PS漫游（多为国外漫入用户）', 'Attach reject; EPS services not allowed in this PLMN (14)');
INSERT INTO "gem_session_analysis_abnormal_reason" VALUES ('1343289949805352396', 'S1_MME', '1', '15', '', '', 'S6A', '1', '5420', '国际漫游限制（和中国移动签订漫游协议，但是该用户未开通2G、3G、LTE的CS和PS国际漫游）', 'Attach reject; No Suitable Cells In tracking area (15)
3GPP-Update-Location-response:DIAMETER_ERROR_UNKNOWN_EPS_SUBSCRIPTION (5420)');
INSERT INTO "gem_session_analysis_abnormal_reason" VALUES ('1343289949805352397', 'S1_MME', '1', '15', '', '', 'S6A', '1', '5420', '欠费用户', 'Attach reject; No Suitable Cells In tracking area (15)
3GPP-Update-Location-response:DIAMETER_ERROR_UNKNOWN_EPS_SUBSCRIPTION (5420)');
INSERT INTO "gem_session_analysis_abnormal_reason" VALUES ('1343289949805352398', 'S1_MME', '1', '15', '', '', 'S6A', '6', '5003', '用户使用SIM卡接入', 'Attach reject; No Suitable Cells In tracking area (15)
3GPP-Authentication-Information-response :DIAMETER_AUTHORIZATION_REJECTED (5003)');
INSERT INTO "gem_session_analysis_abnormal_reason" VALUES ('1343289949805352399', 'S1_MME', '1', '17', '', '', 'S6A', '1', '5012', 'USIM卡二次换卡后HSS中msisdn和新旧IMSI绑定问题', 'Attach reject; Network failure (17)
3GPP-Update-Location-response:DIAMETER_UNABLE_TO_COMPLY (5012)');
INSERT INTO "gem_session_analysis_abnormal_reason" VALUES ('1343289949805352400', 'S1_MME', '1', '17', '', '', '', '', '', 'MME拒绝', 'Attach reject; Network failure (17)');
INSERT INTO "gem_session_analysis_abnormal_reason" VALUES ('1343289949813741009', 'S1_MME', '1', '19', '', '', 'S1_MME', '7', '27', '终端携带错误APN且网络未开启APN纠错', 'Attach reject: ESM failure(19) 
PDN connectivity reject:Unknown or missing APN (27)');
INSERT INTO "gem_session_analysis_abnormal_reason" VALUES ('1343289949813741010', 'S1_MME', '1', '19', '', '', 'S1_MME', '7', '33', '手机设置了静态IP 地址、空或错误APN、受限制的漫游用户、4G流量用完', 'Attach reject : ESM failure(19)
PDN connectivity reject:Requested service option not subscribed (33)');
INSERT INTO "gem_session_analysis_abnormal_reason" VALUES ('1343289949813741011', 'S1_MME', '1', '19', '', '', 'S1_MME', '7', '38', 'DNS解析某些外地APN失败（如：GXDUMMY.GX）', 'Attach reject : ESM failure(19) + 
PDN connectivity reject; Network failure(38)\nPDN connectivity reject:Network failure(38)
APN：$xxxxxx');
INSERT INTO "gem_session_analysis_abnormal_reason" VALUES ('1343289949813741012', 'S1_MME', '1', '19', '', '', 'S1_MME', '7', '50', '用户使用Ipv6发起PDN连接，核心网只支持IPv4，拒绝用户接入', 'Attach reject ESM failure(19) 
PDN connectivity reject:PDN type IPv4 only allowed (50)');
INSERT INTO "gem_session_analysis_abnormal_reason" VALUES ('1343289949813741013', 'S1_MME', '1', '19', '', '', 'S1_MME', '16', '53', 'UE附着时没有上报APN或上报了但因上行链路质量差MME未收到', 'Attach reject :ESM failure(19)
1)DownlinkNASTransport无响应
2)PDN connectivity reject:ESM information not received (53)');
INSERT INTO "gem_session_analysis_abnormal_reason" VALUES ('1343289949813741014', 'S1_MME', '1', '', '0', '0', 'S1_MME', '20', '0', '无线问题', '事件因UEContextRelease——unspecified (0)释放');
INSERT INTO "gem_session_analysis_abnormal_reason" VALUES ('1343289949813741015', 'S1_MME', '1', '', '0', '21', 'S1_MME', '20', '21', '无线连接丢失', '事件因UEContextRelease——radio-connection-with-ue-lost (21)释放');
INSERT INTO "gem_session_analysis_abnormal_reason" VALUES ('1343289949813741016', 'S1_MME', '1', '', '0', '26', 'S1_MME', '20', '26', '无线接口流程错误', '事件因UEContextRelease——failure-in-radio-interface-procedure (26)释放');
INSERT INTO "gem_session_analysis_abnormal_reason" VALUES ('1343289949813741017', 'S1_MME', '1', '', '2', '', 'S1_MME', '16', '16', '无线原因', '事件中出现NonDeliveryIndication (16)消息');
INSERT INTO "gem_session_analysis_abnormal_reason" VALUES ('1343289949813741018', 'S1_MME', '5', '10', '', '', 'S3', '', '', 'S3接口MME向old SGSN请求的context未能成功', 'Implicitly detached
Context request');
INSERT INTO "gem_session_analysis_abnormal_reason" VALUES ('1343289949813741019', 'S1_MME', '5', '40', '', '', '', '', '', '默认的上下文承载没有激活，进而导致TAU失败', 'No EPS bearer context activated');
INSERT INTO "gem_session_analysis_abnormal_reason" VALUES ('1343289949813741020', 'S1_MME', '5', '15', '', '', 'S6A', '1', '5420', '用户未签约4G（但是签约了2G/3G）', 'No Suitable Cells In tracking area
3GPP-Update-Location-response:DIAMETER_ERROR_UNKNOWN_EPS_SUBSCRIPTION (5420)');
INSERT INTO "gem_session_analysis_abnormal_reason" VALUES ('1343289949813741021', 'S1_MME', '5', '15', '', '', 'S6A', '6', '5003', '用户使用SIM卡在23G附着后接入4G网络', '
3GPP-Authentication-Information-response:DIAMETER_AUTHORIZATION_REJECTED (5003)');
INSERT INTO "gem_session_analysis_abnormal_reason" VALUES ('1343289949822129630', 'S1_MME', '5', '9', '', '', '', '', '', 'DNS配置错误', 'UE identity cannot be derived by the network');
INSERT INTO "gem_session_analysis_abnormal_reason" VALUES ('1343289949822129631', 'S1_MME', '5', '17', '', '', 'S6A', '4', '5001', '省外欠费用户', 'Network failure
3GPP- Insert- Subscriber-Data -response:DIAMETER_ERROR_USER_UNKNOWN (5001)
APN：$xxx');
INSERT INTO "gem_session_analysis_abnormal_reason" VALUES ('1343289949947958752', 'S1_MME', '5', '17', '', '', '', '', '', 'MME原因', 'Network failure');
INSERT INTO "gem_session_analysis_abnormal_reason" VALUES ('1343289949947958753', 'S1_MME', '5', '95', '', '', '', '', '', 'MME无容错机制', 'Network failure');
INSERT INTO "gem_session_analysis_abnormal_reason" VALUES ('1343289949947958754', 'S1_MME', '5', '', '0', '0', 'S1_MME', '20', '', '无线原因', '事件因UE-Context_release：unspecified (0)释放');
INSERT INTO "gem_session_analysis_abnormal_reason" VALUES ('1343289949947958755', 'S1_MME', '5', '', '0', '21', 'S1_MME', '21', '', '无线原因', '事件因UE-Context_release:radio-connection-with-ue-lost (21)释放');
INSERT INTO "gem_session_analysis_abnormal_reason" VALUES ('1343289949947958756', 'S1_MME', '5', '', '0', '26', 'S1_MME', '26', '', '无线原因', '事件因UE-Context_release:failure-in-radio-interface-procedure (26)释放');
INSERT INTO "gem_session_analysis_abnormal_reason" VALUES ('1343289949947958757', 'S1_MME', '5', '', '2', '', 'S1_MME', '16', '', '无线原因', 'NonDeliveryIndication (16):');
INSERT INTO "gem_session_analysis_abnormal_reason" VALUES ('1343289949947958758', 'S1_MME', '2', '', '0', '3', 'S1_MME', '18', '', '无线原因', 'ContextSetupFailure:Release due to E-UTRAN generated reason');
INSERT INTO "gem_session_analysis_abnormal_reason" VALUES ('1343289949947958759', 'S1_MME', '2', '', '0', '26', 'S1_MME', '18', '', '流程冲突', 'ContextSetupFailure:Failure in the Radio Interface Procedure');
INSERT INTO "gem_session_analysis_abnormal_reason" VALUES ('1343289949947958760', 'S1_MME', '2', '', '0', '26', 'S1_MME', '18', '', '无线原因', 'ContextSetupFailure:Failure in the Radio Interface Procedure');
INSERT INTO "gem_session_analysis_abnormal_reason" VALUES ('1343289949947958761', 'S1_MME', '2', '10', '', '', 'S1_MME', '', '', '无线原因', ' NASNonDeliveryIndication消息');
INSERT INTO "gem_session_analysis_abnormal_reason" VALUES ('1343289949947958762', 'S1_MME', '2', '9', '', '', 'S1_MME', '', '', '无线原因', 'UE identity cannot be derived by the network');
INSERT INTO "gem_session_analysis_abnormal_reason" VALUES ('1343289949947958763', 'S1_MME', '2', '', '0', '0', 'S1_MME', '18', '', '无线原因', 'unspecified
ContextSetupFailure:');
INSERT INTO "gem_session_analysis_abnormal_reason" VALUES ('1343289949956347372', 'S1_MME', '2', '', '0', '21', 'S1_MME', '18', '', '无线原因', 'Radio Connection With UE Lost');
INSERT INTO "gem_session_analysis_abnormal_reason" VALUES ('1343289949956347373', 'S1_MME', '2', '17', '', '', 'S1_MME', '30', '', '核心网原因（鉴权问题）', 'Network failure
Authentication resp:synch failure/DIAMETER_UNABLE_TO_COMPLY');
INSERT INTO "gem_session_analysis_abnormal_reason" VALUES ('1343289949956347374', 'S1_MME', '2', '', '1', '40', 'S1_MME', '18', '', '无线资源问题', 'Transport Resource Unavailable
ContextSetupFailure:');
INSERT INTO "gem_session_analysis_abnormal_reason" VALUES ('1343289949956347375', 'S1_MME', '2', '15', '', '', 'S1_MME', '', '', '欠费用户', 'No Suitable Cells In tracking area\n/:');
INSERT INTO "gem_session_analysis_abnormal_reason" VALUES ('1343289949956347376', 'S1_MME', '2', '', '', '2', 'S1_MME', '6', '2', 'Re_Attach机制问题', 'Detach:');
INSERT INTO "gem_session_analysis_abnormal_reason" VALUES ('1343289949956347377', 'S1_MME', '2', '255', '', '', 'S1_MME', '', '', '无线问题', 'Authentication Req/Security mode command无响应');
INSERT INTO "gem_session_analysis_abnormal_reason" VALUES ('1343289949956347378', 'S1_MME', '2', '255', '', '', 'S1_MME', '30', '无响应', '核心网问题', '无下行消息');
INSERT INTO "gem_session_analysis_abnormal_reason" VALUES ('1343289949956347379', 'S1_MME', '2', '255', '', '', 'S1_MME', '31', '无响应', '核心网问题', '无下行消息');
INSERT INTO "gem_session_analysis_abnormal_reason" VALUES ('1343289949956347380', 'S1_MME', '2', '', '0', '28', 'S1_MME', '20', '', '无线原因', 'ue_context_release :Inter-RAT Redirection');
INSERT INTO "gem_session_analysis_abnormal_reason" VALUES ('1343289949956347381', 'S1_MME', '2', '', '0', '72', 'S1_MME', '16', '', '无线原因', '事件过程中出现NASNonDeliveryIndication消息');
INSERT INTO "gem_session_analysis_abnormal_reason" VALUES ('1343289949956347382', 'S1_MME', '2', '', '0', '21', 'S1_MME', '20', '', '无线掉线', 'ue_context_release :Radio Connection With UE Lost');
INSERT INTO "gem_session_analysis_abnormal_reason" VALUES ('1343289949956347383', 'S1_MME', '2', '', '0', '24', 'S1_MME', '20', '', '接入CS域', 'ue_context_release :UE Not Available for PS Service');
INSERT INTO "gem_session_analysis_abnormal_reason" VALUES ('1343289949956347384', 'S1_MME', '2', '', '0', '26', 'S1_MME', '20', '', '无线原因', 'ue_context_release :Failure in the Radio Interface Procedure');
INSERT INTO "gem_session_analysis_abnormal_reason" VALUES ('1343289949964735993', 'S1_MME', '2', '', '', '3', 'S1_MME', '6', '', '用户原因', 'Detach (用户发起):用户去附着');
INSERT INTO "gem_session_analysis_abnormal_reason" VALUES ('1343289949964735994', 'S1_MME', '2', '', '0', '23', 'S1_MME', '20', '', '接入CS域', 'ue_context_release :CS Fallback triggered');
INSERT INTO "gem_session_analysis_abnormal_reason" VALUES ('1343289949964735995', 'S1_MME', '2', '', '1', '40', 'S1_MME', '20', '', '资源受限', 'ue_context_release :Transport Resource Unavailable');
INSERT INTO "gem_session_analysis_abnormal_reason" VALUES ('1343289949964735996', 'S1_MME', '3', '35', '', '', 'S1_MME', '14', '', 'X2切换', 'x2-handover-triggered 
pathSwitchReq:出现该事件');
INSERT INTO "gem_session_analysis_abnormal_reason" VALUES ('1343289949964735997', 'S1_MME', '3', '0', '', '', 'S1_MME', '20', '', '无线原因', 'UEContextReleaseReq:unspecified');
INSERT INTO "gem_session_analysis_abnormal_reason" VALUES ('1343289949964735998', 'S1_MME', '3', '3', '', '', 'S1_MME', '', '', '无线原因', 'Release due to E-UTRAN generated reason');
INSERT INTO "gem_session_analysis_abnormal_reason" VALUES ('1343289949964735999', 'S1_MME', '3', '29', '', '', 'S1_MME', '', '', '过程关联导致失败', 'interaction-with-other-procedure');
INSERT INTO "gem_session_analysis_abnormal_reason" VALUES ('1343289949964736000', 'S1_MME', '3', '26', '', '', 'S1_MME', '20', '', '无线原因', 'UEContextReleaseReq:携带失败码26Failure in the Radio Interface Procedure');
INSERT INTO "gem_session_analysis_abnormal_reason" VALUES ('1343289949964736001', 'S1_MME', '3', '10', '', '', 'SGS', '10', '', '核心问题', 'Implicitly detached
SGsAP-IMSI-DETACH-INDICATION:出现该事件');
INSERT INTO "gem_session_analysis_abnormal_reason" VALUES ('1343289949964736002', 'S1_MME', '3', '9', '', '', 'S1_MME', '30', '', '过程冲突', 'UE identity cannot be derived by the network
AuthenticationReq:出现该流程');
INSERT INTO "gem_session_analysis_abnormal_reason" VALUES ('1343289949964736003', 'S1_MME', '3', '101', '', '', '', '', '', '终端原因', 'message-not-compatible-with-receiver-state
');
INSERT INTO "gem_session_analysis_abnormal_reason" VALUES ('1343289949964736004', 'S1_MME', '3', '33', '', '', 'S1_MME', '16', '', 'S1切换导致', 's1-intra-system-handover-triggered 
HandoverRequire:出现该流程');
INSERT INTO "gem_session_analysis_abnormal_reason" VALUES ('1343289949964736005', 'S1_MME', '3', '255', '', '', '', '', '', '流程冲突', '网络无响应');
INSERT INTO "gem_session_analysis_abnormal_reason" VALUES ('1343289949973124614', 'S1_MME', '3', '', '0', '3', 'S1_MME', '20', '', '异系统重定向', 'UEContextReleaseReq:Release due to E-UTRAN generated reason');
INSERT INTO "gem_session_analysis_abnormal_reason" VALUES ('1343289949973124615', 'S1_MME', '3', '', '', '2', 'S1_MME', '20', '', '核心网问题', '网络去附着');
INSERT INTO "gem_session_analysis_abnormal_reason" VALUES ('1343289949973124616', 'S1_MME', '3', '', '0', '20', 'S1_MME', '20', '', '用户长时间无交互释放', 'UEContextReleaseReq:User Inactivity');
INSERT INTO "gem_session_analysis_abnormal_reason" VALUES ('1343289949973124617', 'S1_MME', '3', '', '0', '28', 'S1_MME', '20', '', '异系统重定向', 'UEContextReleaseReq:Inter-RAT Redirection');
INSERT INTO "gem_session_analysis_abnormal_reason" VALUES ('1343289949973124618', 'S1_MME', '3', '', '0', '16', 'S1_MME', '20', '', '无线原因导致的切换', 'UEContextReleaseReq:Handover Desirable for Radio Reasons');
INSERT INTO "gem_session_analysis_abnormal_reason" VALUES ('1343289949973124619', 'S1_MME', '3', '', '0', '21', 'S1_MME', '20', '', '无线原因', 'UEContextReleaseReq:Radio Connection With UE Lost');
INSERT INTO "gem_session_analysis_abnormal_reason" VALUES ('1343289949973124620', 'S1_MME', '3', '', '0', '6', 'S1_MME', '20', '', '切换失败', 'UEContextReleaseReq:Handover Failure In Target EPC/eNB Or Target System');
INSERT INTO "gem_session_analysis_abnormal_reason" VALUES ('1343289949973124621', 'S1_MME', '3', '', '0', '26', 'S1_MME', '20', '', '无线原因', 'UEContextReleaseReq:Failure in the Radio Interface Procedure');
INSERT INTO "gem_session_analysis_abnormal_reason" VALUES ('1343289949973124622', 'S1_MME', '15', '6', '', '', '', '', '', '无线原因', 'UEContextReleaseReq:Handover Failure In Target EPC/eNB Or Target System');
INSERT INTO "gem_session_analysis_abnormal_reason" VALUES ('1343289949973124623', 'S1_MME', '15', '10', '', '', 'S1_MME', '20', '', '用户重定向', 'UEContextReleaseReq:Inter-RAT Redirection');
INSERT INTO "gem_session_analysis_abnormal_reason" VALUES ('1343289949973124624', 'S1_MME', '15', '12', '', '', '', '', '', '无线资源问题', ' no-radio-resources-available-in-target-cell');
INSERT INTO "gem_session_analysis_abnormal_reason" VALUES ('1343289949973124625', 'S1_MME', '15', '0', '', '', '', '', '', '传输资源问题', 'transport-resource-unavailable');
INSERT INTO "gem_session_analysis_abnormal_reason" VALUES ('1343289949973124626', 'S1_MME', '15', '', '0', '20', 'S1_MME', '4', '', '频繁TAU和频繁切换导致', '失败事件和TAU流程同时发生:UE Context Release - User Inactivity');
INSERT INTO "gem_session_analysis_abnormal_reason" VALUES ('1343289949981513235', 'S1_MME', '15', '', '0', '3', 'S1_MME', '4', '', '频繁TAU和频繁切换导致', '事件发生过程中UE发起TAU流程:UE Context Release - Release due to E-UTRAN generated reason');
INSERT INTO "gem_session_analysis_abnormal_reason" VALUES ('1343289949981513236', 'S1_MME', '15', '', '0', '72', 'S1_MME', '6', '', '核心网原因', '失败事件过程中MME出发Detach流程:UE Context Release - Detach');
INSERT INTO "gem_session_analysis_abnormal_reason" VALUES ('1343289949981513237', 'S1_MME', '15', '', '0', '28', 'S1_MME', '20', '', '用户重定向', '事件失败代码cause28:UE Context Release - Inter-RAT Redirection');
INSERT INTO "gem_session_analysis_abnormal_reason" VALUES ('1343289949981513238', 'S1_MME', '15', '', '0', '21', 'S1_MME', '20', '', '无线原因', '事件失败代码cause21:UE Context Release - Radio Connection With UE Lost');
INSERT INTO "gem_session_analysis_abnormal_reason" VALUES ('1343289949981513239', 'S1_MME', '15', '', '0', '26', 'S1_MME', '20', '', '无线原因', '事件失败代码cause26:UE Context Release - Failure in the Radio Interface Procedure');
INSERT INTO "gem_session_analysis_abnormal_reason" VALUES ('1343289949981513240', 'S1_MME', '15', '', '0', '24', 'S1_MME', '20', '', 'CS业务导致的回落', '事件失败代码cause24:UE Context Release - UE Not Available for PS Service');
INSERT INTO "gem_session_analysis_abnormal_reason" VALUES ('1343289949981513241', 'S1_MME', '16', '6', '', '', '', '', '', '无线原因', 'UEContextReleaseReq:Handover Failure In Target EPC/eNB Or Target System');
INSERT INTO "gem_session_analysis_abnormal_reason" VALUES ('1343289949981513242', 'S1_MME', '16', '10', '', '', 'S1_MME', '20', '', '用户重定向', 'UEContextReleaseReq:Inter-RAT Redirection');
INSERT INTO "gem_session_analysis_abnormal_reason" VALUES ('1343289949981513243', 'S1_MME', '16', '12', '', '', '', '', '', '无线资源问题', ' no-radio-resources-available-in-target-cell');
INSERT INTO "gem_session_analysis_abnormal_reason" VALUES ('1343289949981513244', 'S1_MME', '16', '0', '', '', '', '', '', '传输资源问题', 'transport-resource-unavailable');
INSERT INTO "gem_session_analysis_abnormal_reason" VALUES ('1343289949981513245', 'S1_MME', '16', '', '0', '20', 'S1_MME', '4', '', '频繁TAU和频繁切换导致', '失败事件和TAU流程同时发生:UE Context Release - User Inactivity');
INSERT INTO "gem_session_analysis_abnormal_reason" VALUES ('1343289949981513246', 'S1_MME', '16', '', '0', '3', 'S1_MME', '4', '', '频繁TAU和频繁切换导致', '事件发生过程中UE发起TAU流程:UE Context Release - Release due to E-UTRAN generated reason');
INSERT INTO "gem_session_analysis_abnormal_reason" VALUES ('1343289949981513247', 'S1_MME', '16', '', '0', '72', 'S1_MME', '6', '', '核心网原因', '失败事件过程中MME出发Detach流程:UE Context Release - Detach');
INSERT INTO "gem_session_analysis_abnormal_reason" VALUES ('1343289949989901856', 'S1_MME', '16', '', '0', '28', 'S1_MME', '20', '', '用户重定向', '事件失败代码cause28:UE Context Release - Inter-RAT Redirection');
INSERT INTO "gem_session_analysis_abnormal_reason" VALUES ('1343289949989901857', 'S1_MME', '16', '', '0', '21', 'S1_MME', '20', '', '无线原因', '事件失败代码cause21:UE Context Release - Radio Connection With UE Lost');
INSERT INTO "gem_session_analysis_abnormal_reason" VALUES ('1343289949989901858', 'S1_MME', '16', '', '0', '26', 'S1_MME', '20', '', '无线原因', '事件失败代码cause26:UE Context Release - Failure in the Radio Interface Procedure');
INSERT INTO "gem_session_analysis_abnormal_reason" VALUES ('1343289949989901859', 'S1_MME', '16', '', '0', '24', 'S1_MME', '20', '', 'CS业务导致的回落', '事件失败代码cause24:UE Context Release - UE Not Available for PS Service');
