/*
 * 广州丰石科技有限公司拥有本软件版权2017并保留所有权利。
 * Copyright 2017, Guangzhou Rich Stone Data Technologies Company Limited,
 * All rights reserved.
 */

package com.richstonedt.gempile.commodity.cs.factory;


import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.core.JdbcTemplate;

import javax.sql.DataSource;
import java.io.IOException;
import java.util.Map;
import java.util.Properties;

/**
 * <b><code>JdbcTemplateFactory</code></b>
 * <p>
 * class_comment
 * </p>
 * <b>Create Time:</b> 2017/4/27 20:00
 *
 * @author Hetian Zhu
 * @version 0.1.0
 * @since gempile-core 0.1.0
 */
public class JdbcTemplateFactory {

    // TODO: 2017/5/2 zhuhetian create test case
    /**
     * The constant LOG.
     */
    public static final Logger LOG = LoggerFactory.getLogger(JdbcTemplateFactory.class);


    /**
     * DataSourceMap
     */
    private Map<String, DataSource> dataSourceMap;

    /**
     * DefaultDataSource
     */
    private DataSource defaultDataSource;

    /**
     * getJdbcTemplate
     *
     * @param table table
     * @return org.springframework.jdbc.core.JdbcTemplate
     * @see JdbcTemplate
     * @since gempile-core 0.1.0
     */
    public JdbcTemplate getJdbcTemplate(String table) {
        Properties props = new Properties();
        try {
            props.load(Thread.currentThread().getContextClassLoader().getResourceAsStream("data-source.properties"));
            if (!StringUtils.isBlank(table)) {
                String newTable = table.toLowerCase().trim();
                JdbcTemplate jdbcTemplate = new JdbcTemplate();

                DataSource dataSource;
                if (props.containsKey(newTable) && dataSourceMap != null) {
                    dataSource = dataSourceMap.get(props.getProperty(newTable));
                } else {
                    dataSource = defaultDataSource;
                }
                jdbcTemplate.setDataSource(dataSource);
                return jdbcTemplate;
            } else {
                String error = "Empty table is not allowed! [NotFound]";
                LOG.error(error);
                throw new RuntimeException(error);
            }
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * Set the DataSourceMap
     *
     * @param dataSourceMap value to be assigned to property dataSourceMap
     * @since gempile-core 0.1.0
     */
    public void setDataSourceMap(Map<String, DataSource> dataSourceMap) {
        this.dataSourceMap = dataSourceMap;
    }

    /**
     * Set the DefaultDataSource
     *
     * @param defaultDataSource value to be assigned to property defaultDataSource
     * @since gempile-core 0.1.0
     */
    public void setDefaultDataSource(DataSource defaultDataSource) {
        this.defaultDataSource = defaultDataSource;
    }
}
