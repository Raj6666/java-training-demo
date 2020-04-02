/**
description：该脚本用于更新gem_applications表
author：liangzheng
date：2017-07-13
*/
/*删除名称比较长并且不需要的自有业务*/
delete from gem_applications where is_own_application = true and app_sub_type = '7238';
delete from gem_applications where is_own_application = true and app_sub_type = '7563';
delete from gem_applications where is_own_application = true and app_sub_type = '7998';
delete from gem_applications where is_own_application = true and app_sub_type = '8015';
delete from gem_applications where is_own_application = true and app_sub_type = '8780';
delete from gem_applications where is_own_application = true and app_sub_type = '18554';
delete from gem_applications where is_own_application = true and app_sub_type = '18555';
delete from gem_applications where is_own_application = true and app_sub_type = '18556';
delete from gem_applications where is_own_application = true and app_sub_type = '10';
delete from gem_applications where is_own_application = true and app_sub_type = '7686';
/*更新名称比较长的自有业务，把名称缩写*/
update gem_applications t set "name" = '飞信同窗' where is_own_application = true and app_sub_type = '7047';
update gem_applications t set "name" = '网络广播' where is_own_application = true and app_sub_type = '7169';
update gem_applications t set "name" = '手机导航' where is_own_application = true and app_sub_type = '7070';
update gem_applications t set "name" = '积分商城' where is_own_application = true and app_sub_type = '7188';
update gem_applications t set "name" = 'JEGO' where is_own_application = true and app_sub_type = '7090';
update gem_applications t set "name" = '手机天地' where is_own_application = true and app_sub_type = '10129';
update gem_applications t set "name" = '统一分析平台' where is_own_application = true and app_sub_type = '18558';
update gem_applications t set "name" = '手机投注' where is_own_application = true and app_sub_type = '7186';
update gem_applications t set "name" = '手机安全先锋' where is_own_application = true and app_sub_type = '7022';
update gem_applications t set "name" = 'MBBMS' where is_own_application = true and app_sub_type = '11';
update gem_applications t set "name" = 'CMWAP网关' where is_own_application = true and app_sub_type = '7987';
update gem_applications t set "name" = 'G3视频监控' where is_own_application = true and app_sub_type = '7988';
update gem_applications t set "name" = '移动DNS' where is_own_application = true and app_sub_type = '8183';
