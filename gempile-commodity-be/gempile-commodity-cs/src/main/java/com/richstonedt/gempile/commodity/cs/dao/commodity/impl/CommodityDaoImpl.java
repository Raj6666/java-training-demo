/*
 * 广州丰石科技有限公司拥有本软件版权2018并保留所有权利。
 * Copyright 2018, Guangzhou Rich Stone Data Technologies Company Limited,
 * All rights reserved.
 *
 */

package com.richstonedt.gempile.commodity.cs.dao.commodity.impl;

import com.richstonedt.commons.dao.DaoUtils;
import com.richstonedt.commons.dao.DaoUtilsForMultiTable;
import com.richstonedt.commons.dao.QueryEntityConfig;
import com.richstonedt.commons.query.QueryField;
import com.richstonedt.commons.query.QueryStatement;
import com.richstonedt.commons.query.SelectResult;
import com.richstonedt.commons.query.SelectStatement;
import com.richstonedt.commons.sql.SqlStatement;
import com.richstonedt.gempile.commodity.cs.dao.commodity.CommodityDao;
import com.richstonedt.gempile.commodity.cs.factory.JdbcTemplateFactory;
import com.richstonedt.gempile.commodity.model.commodity.CommodityInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/**
 * <b><code>TrainningDaoImpl</code></b>
 * <p>
 * class_comment
 * </p>
 * <b>Create Time:</b> 2018/6/13 14:32.
 *
 * @author PeiZiWen
 * @version 0.1.0
 * @since gempile -trainnig-be 0.1.0
 */
@Repository
public class CommodityDaoImpl implements CommodityDao {

    /**
     * The constant LOG.
     */
    private static final Logger LOG =
            LoggerFactory.getLogger(
                    CommodityDaoImpl.class);

    /**
     * The Jdbc template factory.
     */
    @Autowired
    private JdbcTemplateFactory jdbcTemplateFactory;
    /**
     * The Query entity config.
     */
    @Qualifier("commodifyInfo")
    @Autowired
    private QueryEntityConfig queryEntityConfig;

    /**
     * Cover to kpis list.
     *
     * @param rawResult the raw result
     * @return the list
     * @since gempile-core-cs 0.1.0
     */
    private List<CommodityInfo> coverToKpis(
            final List<Map<String, Object>> rawResult) {
        List<CommodityInfo> commodityInfos = new ArrayList<>();
        Iterator<Map<String, Object>> iterator = rawResult.iterator();
        while (iterator.hasNext()) {
            Map<String, Object> map = iterator.next();
            Object name = map.get("NAME");
            Object id = map.get("ID");
            Object price = map.get("PRICE");
            Object producter = map.get("PRODUCTER");
            Object weight = map.get("WEIGHT");
            Object type = map.get("TYPE");

            CommodityInfo commodityInfo = new CommodityInfo();
            if (name != null) {
                commodityInfo.setName(name.toString());
            }
            if (id != null) {
                commodityInfo.setId(Integer.parseInt(id.toString()));
            }
            if (price != null) {
                commodityInfo.setPrice(Double.parseDouble(price.toString()));
            }
            if (producter != null) {
                commodityInfo.setProducter(producter.toString());
            }
            if (weight != null) {
                commodityInfo.setWeight(Double.parseDouble(weight.toString()));
            }
            if (type != null) {
                commodityInfo.setType(type.toString());
            }
            commodityInfos.add(commodityInfo);
        }
        return commodityInfos;
    }


    /**
     * Search list.
     *
     * @param statement the statement
     * @return the list
     * @since gempile-core-cs 0.1.0
     */
    @Override
    public SelectResult<CommodityInfo> search(final SelectStatement statement) {
        SelectResult<Map<String, Object>> rawResult =
                DaoUtils.queryForMap(statement, queryEntityConfig,
                        jdbcTemplateFactory.getJdbcTemplate(
                                queryEntityConfig.getTableName()));
        SelectResult<CommodityInfo> results = new SelectResult<>();
        results.setEntities(coverToKpis(rawResult.getEntities()));
        return results;
    }

    /**
     * Delete int.
     *
     * @param statement the statement
     * @return the number of deleted row
     * @since gempile-core-cs 0.1.0
     */
    @Override
    public int delete(final QueryStatement statement) {
        return DaoUtils.deleteEntityByQueryStatement(
                statement,
                queryEntityConfig,
                jdbcTemplateFactory.getJdbcTemplate(
                        queryEntityConfig.getTableName()));
    }


    /**
     * Save CommodityInfo.
     *
     * @param commodityInfo the commodityInfo
     * @since gempile-core-cs 0.1.0
     */

    public void saveCommodityInfo(final CommodityInfo commodityInfo) {
        SqlStatement sqlStatement = new SqlStatement();
        String INSERT_SQL = "INSERT INTO "
                + queryEntityConfig.getTableName()
                + " (NAME, ID, PRICE, PRODUCTER, WEIGHT,TYPE)"
                + " VALUES (?,?,?,?,?,?)";
        sqlStatement.setStatement(INSERT_SQL);
        prepareSqlStatement(commodityInfo, sqlStatement);
//        String primaryKey = "ID";
        try {
            DaoUtils.insertEntityAndReturnPrimaryKey(sqlStatement, null,
                    jdbcTemplateFactory.getJdbcTemplate(
                            queryEntityConfig.getTableName()));
        } catch (DuplicateKeyException e) {
            String error = "Failed to add log: " + commodityInfo.toString();
            LOG.error(error, e);
            throw new RuntimeException(error, e);
        }
    }

    /**
     * Update.
     *
     * @param commodityInfos the commodity infos
     * @since gempile-core-cs 0.1.0
     */
    @Override
    public void update(final List<CommodityInfo> commodityInfos) {
        String SQL_UPDATE = "UPDATE "
                + queryEntityConfig.getTableName()
                + " SET NAME=?, PRICE=?, PRODUCTER=?,"
                + " WEIGHT=?, TYPE=?  WHERE ID=?";
        int row;
        SqlStatement sqlStatement = new SqlStatement();
        sqlStatement.setStatement(SQL_UPDATE);
        for (CommodityInfo commodityInfo : commodityInfos) {
            try {
                prepareSqlStatementForUpdate(commodityInfo, sqlStatement);
                row = DaoUtils.updateEntity(sqlStatement,
                        jdbcTemplateFactory.getJdbcTemplate(
                                queryEntityConfig.getTableName()));
            } catch (DuplicateKeyException e) {
                String error =
                        "Failed to update commodityInfos caused by conflict : "
                                + sqlStatement.getStatement()
                                + sqlStatement.getArguments();
                LOG.error(error, e);
                throw new RuntimeException(error, e);
            }
            if (row == 0) {
                String error =
                        "Failed to update commodityInfos caused by conflict : "
                                + sqlStatement.getStatement()
                                + sqlStatement.getArguments();
                LOG.error(error);
                throw new RuntimeException(error);
            }
        }
    }


    /**
     * Prepare sql statement for update.
     *
     * @param commodityInfo the commodity info
     * @param sqlStatement  the sql statement
     * @since gempile-core-cs 0.1.0
     */
    private void prepareSqlStatementForUpdate(
            final CommodityInfo commodityInfo,
            final SqlStatement sqlStatement) {
        List<Object> arguments = new ArrayList<>();
        List<Integer> argumentTypes = new ArrayList<>();
        arguments.add(commodityInfo.getName());
        argumentTypes.add(
                DaoUtilsForMultiTable.toSqlType(QueryField.TYPE_STRING));
        arguments.add(commodityInfo.getPrice());
        argumentTypes.add(
                DaoUtilsForMultiTable.toSqlType(QueryField.TYPE_DOUBLE));
        arguments.add(commodityInfo.getProducter());
        argumentTypes.add(
                DaoUtilsForMultiTable.toSqlType(QueryField.TYPE_STRING));
        arguments.add(commodityInfo.getWeight());
        argumentTypes.add(
                DaoUtilsForMultiTable.toSqlType(QueryField.TYPE_DOUBLE));
        arguments.add(commodityInfo.getType());
        argumentTypes.add(
                DaoUtilsForMultiTable.toSqlType(QueryField.TYPE_STRING));
        arguments.add(commodityInfo.getId());
        argumentTypes.add(
                DaoUtilsForMultiTable.toSqlType(QueryField.TYPE_INTEGER));
        sqlStatement.setArguments(arguments);
        sqlStatement.setArgumentTypes(argumentTypes);
    }

//    /**
//     * Gets query entity config.
//     *
//     * @return the query entity config
//     */
//    public QueryEntityConfig getQueryEntityConfig() {
//        return queryEntityConfig;
//    }

    /**
     * Sets query entity config.
     *
     * @param queryEntityConfig the query entity config
     * @since gempile-core-cs 0.1.0
     */
    public void setQueryEntityConfig(
            final QueryEntityConfig queryEntityConfig) {
        this.queryEntityConfig = queryEntityConfig;
    }

    /**
     * prepareSqlStatement.
     *
     * @param commodityInfo commodityInfo
     * @param sqlStatement  SqlStatement
     * @since gempile-core 0.1.0.
     */
    private void prepareSqlStatement(
            final CommodityInfo commodityInfo,
            final SqlStatement sqlStatement) {
        List<Object> args = new ArrayList<>();
        List<Integer> argTypes = new ArrayList<>();

        //NAME
        args.add(commodityInfo.getName());
        argTypes.add(DaoUtils.toSqlType(QueryField.TYPE_STRING));
        //id
        args.add(commodityInfo.getId());
        argTypes.add(DaoUtils.toSqlType(QueryField.TYPE_INTEGER));
        // PRICE
        args.add(commodityInfo.getPrice());
        argTypes.add(DaoUtils.toSqlType(QueryField.TYPE_INTEGER));

        // PRODUCTER
        args.add(commodityInfo.getProducter());
        argTypes.add(DaoUtils.toSqlType(QueryField.TYPE_STRING));

        // WEIGHT
        args.add(commodityInfo.getWeight());
        argTypes.add(DaoUtils.toSqlType(QueryField.TYPE_INTEGER));

        // TYPE
        args.add(commodityInfo.getType());
        argTypes.add(DaoUtils.toSqlType(QueryField.TYPE_STRING));


        sqlStatement.setArguments(args);
        sqlStatement.setArgumentTypes(argTypes);
    }
}
