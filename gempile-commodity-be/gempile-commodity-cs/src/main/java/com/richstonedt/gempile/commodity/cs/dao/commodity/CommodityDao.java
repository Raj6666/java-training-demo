/*
 * 广州丰石科技有限公司拥有本软件版权2018并保留所有权利。
 * Copyright 2018, Guangzhou Rich Stone Data Technologies Company Limited,
 * All rights reserved.
 *
 */

package com.richstonedt.gempile.commodity.cs.dao.commodity;

import com.richstonedt.commons.query.QueryStatement;
import com.richstonedt.commons.query.SelectResult;
import com.richstonedt.commons.query.SelectStatement;
import com.richstonedt.gempile.commodity.model.commodity.CommodityInfo;

import java.util.List;

/**
 * <b><code>TrainningDao</code></b>
 * <p>
 * class_comment
 * </p>
 * <b>Create Time:</b> 2018/6/13 14:32.
 *
 * @author PeiZiWen
 * @version 0.1.0
 * @since gempile-core-cs 0.1.0
 */
public interface CommodityDao {
    /**
     * Search list.
     *
     * @param statement the statement
     * @return the list
     * @since gempile-core-cs 0.1.0
     */
    SelectResult<CommodityInfo> search(SelectStatement statement);

    /**
     * Delete int.
     *
     * @param statement the statement
     * @return the number of deleted row
     * @since gempile-core-cs 0.1.0
     */
    int delete(QueryStatement statement);

    /**
     * Save CommodityInfo.
     *
     * @param commodityInfo the commodityInfo
     * @since gempile-core-cs 0.1.0
     */
    void saveCommodityInfo(CommodityInfo commodityInfo);

    /**
     * Update.
     *
     * @param commodityInfos the commodity infos
     * @since gempile-core-cs 0.1.0
     */
    void update(List<CommodityInfo> commodityInfos);
}
