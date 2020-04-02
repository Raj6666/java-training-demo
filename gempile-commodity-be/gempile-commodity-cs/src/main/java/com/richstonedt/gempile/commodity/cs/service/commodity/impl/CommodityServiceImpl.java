/*
 * 广州丰石科技有限公司拥有本软件版权2018并保留所有权利。
 * Copyright 2018, Guangzhou Rich Stone Data Technologies Company Limited,
 * All rights reserved.
 *
 */

package com.richstonedt.gempile.commodity.cs.service.commodity.impl;

import com.richstonedt.commons.query.QueryCondition;
import com.richstonedt.commons.query.QueryField;
import com.richstonedt.commons.query.QueryStatement;
import com.richstonedt.commons.query.SelectStatement;
import com.richstonedt.gempile.commodity.cs.dao.commodity.CommodityDao;
import com.richstonedt.gempile.commodity.cs.service.commodity.CommodityService;
import com.richstonedt.gempile.commodity.model.commodity.CommodityInfo;
import com.richstonedt.gempile.commodity.cs.common.query.ConditionConstructor;
import com.richstonedt.gempile.commodity.cs.common.query.QueryFieldConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * <b><code>TrainningServiceImpl</code></b>
 * <p>
 * class_comment
 * </p>
 * <b>Create Time:</b> 2018/6/13 12:28.
 *
 * @author PeiZiWen
 * @version 0.1.0
 * @since gempile -trainnig-be 0.1.0
 */
@Service
public class CommodityServiceImpl implements CommodityService {
    /**
     * The Query field constructor.
     */
    @Autowired
    private QueryFieldConstructor queryFieldConstructor;

    /**
     * The Condition constructor.
     */
    @Autowired
    private ConditionConstructor conditionConstructor;

    /**
     * The Trainning dao.
     */
    @Autowired
    private CommodityDao commodityDao;


    /**
     * Gets commondity infos.
     *
     * @param id the id
     * @return the commondity infos
     * @since gempile-core-cs 0.1.0
     */
    @Override
    public List<CommodityInfo> getCommondityInfos(final Integer id) {
        QueryField idField = queryFieldConstructor.constructField(
                "ID", QueryField.TYPE_INTEGER, null);

        //where condition
        List<QueryCondition> queryConditions = new ArrayList<>();
        queryConditions.add(
                conditionConstructor.equalQueryCondition(idField, id));

        SelectStatement statement = new SelectStatement();
        statement.setConditionGroup(
                conditionConstructor.queryConditionGroup(
                        queryConditions, null, ConditionConstructor.AND));
        return commodityDao.search(statement).getEntities();
    }

    /**
     * Delete commondity infos by id.
     *
     * @param deleteId the product id
     * @return the number of deleted row
     */
    @Override
    public Integer deleteCommondityInfos(final Integer deleteId) {
        QueryField id = queryFieldConstructor.constructField(
                "ID", QueryField.TYPE_INTEGER, null);
        //where condition
        List<QueryCondition> queryConditions = new ArrayList<>();
        ConditionConstructor constructor = conditionConstructor;
        queryConditions.add(constructor.equalQueryCondition(id, deleteId));
        QueryStatement statement = new QueryStatement();
        statement.setConditionGroup(
                constructor.queryConditionGroup(
                        queryConditions, null, ConditionConstructor.AND));
        return commodityDao.delete(statement);
    }

    /**
     * Save commodity info.
     *
     * @param commodityInfo the commodity info
     * @since gempile-core-cs 0.1.0
     */
    @Override
    public void saveCommodityInfo(final CommodityInfo commodityInfo) {
        commodityDao.saveCommodityInfo(commodityInfo);
    }


    /**
     * Update commondity infos.
     *
     * @param commodityInfo the commodity info
     * @since gempile-core-cs 0.1.0
     */
    @Override
    public void updateCommondityInfos(final CommodityInfo commodityInfo) {
        List<CommodityInfo> commodityInfos = new ArrayList<>();
        commodityInfos.add(commodityInfo);
        commodityDao.update(commodityInfos);
    }
}
