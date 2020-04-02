/*
 * 广州丰石科技有限公司拥有本软件版权2018并保留所有权利。
 * Copyright 2018, Guangzhou Rich Stone Data Technologies Company Limited,
 * All rights reserved.
 *
 */

package com.richstonedt.gempile.commodity.cs.service.commodity;

import com.richstonedt.gempile.commodity.model.commodity.CommodityInfo;

import java.util.List;

/**
 * <b><code>TrainningService</code></b>
 * <p>
 * class_comment
 * </p>
 * <b>Create Time:</b> 2018/6/13 12:21.
 *
 * @author PeiZiWen
 * @version 0.1.0
 * @since gempile -trainnig-be 0.1.0
 */
public interface CommodityService {
    /**
     * Gets commondity infos.
     *
     * @param id the id
     * @return the commondity infos
     * @since gempile-core-cs 0.1.0
     */
    List<CommodityInfo> getCommondityInfos(Integer id);

    /**
     * Delete commondity infos by id.
     *
     * @param id the product id
     * @return the number of deleted row
     * @since gempile-core-cs 0.1.0
     */
    Integer deleteCommondityInfos(Integer id);

    /**
     * Save commodity info.
     *
     * @param commodityInfo the commodity info
     * @since gempile-core-cs 0.1.0
     */
    void saveCommodityInfo(CommodityInfo commodityInfo);

    /**
     * Update commondity infos.
     *
     * @param commodityInfo the commodity info
     * @since gempile-core-cs 0.1.0
     */
    void updateCommondityInfos(CommodityInfo commodityInfo);
}
