/*
 * 广州丰石科技有限公司拥有本软件版权2018并保留所有权利。
 * Copyright 2018, Guangzhou Rich Stone Data Technologies Company Limited,
 * All rights reserved.
 *
 */

package com.richstonedt.gempile.commodity.model.commodity;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;

/**
 * <b><code>CommodityInfo</code></b>
 * <p>
 * class_comment
 * </p>
 * <b>Create Time:</b> 2018/6/13 12:22
 *
 * @author PeiZiWen
 * @version 0.1.0
 * @since gempile-commodity-be 0.1.0
 */
public class CommodityInfo {
    /**
     * The Name.
     */
    private String name;

    /**
     * The Id.
     */
    private Integer id;

    /**
     * The Price.
     */
    private Double price;

    /**
     * The Producter.
     */
    private String producter;

    /**
     * The Weight.
     */
    private Double weight;

    /**
     * The Type.
     */
    private String type;

    /**
     * Gets name.
     *
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * Sets name.
     *
     * @param name the name
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * Gets id.
     *
     * @return the id
     */
    public Integer getId() {
        return id;
    }

    /**
     * Sets id.
     *
     * @param id the id
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * Gets price.
     *
     * @return the price
     */
    public Double getPrice() {
        return price;
    }

    /**
     * Sets price.
     *
     * @param price the price
     */
    public void setPrice(Double price) {
        this.price = price;
    }

    /**
     * Gets producter.
     *
     * @return the producter
     */
    public String getProducter() {
        return producter;
    }

    /**
     * Sets producter.
     *
     * @param producter the producter
     */
    public void setProducter(String producter) {
        this.producter = producter;
    }

    /**
     * Gets weight.
     *
     * @return the weight
     */
    public Double getWeight() {
        return weight;
    }

    /**
     * Sets weight.
     *
     * @param weight the weight
     */
    public void setWeight(Double weight) {
        this.weight = weight;
    }

    /**
     * Gets type.
     *
     * @return the type
     */
    public String getType() {
        return type;
    }

    /**
     * Sets type.
     *
     * @param type the type
     */
    public void setType(String type) {
        this.type = type;
    }

    @Override
    public String toString() {
        return ReflectionToStringBuilder.toString(this);
    }
}
