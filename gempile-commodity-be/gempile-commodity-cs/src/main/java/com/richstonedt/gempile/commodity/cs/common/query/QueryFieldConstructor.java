/*
 * 广州丰石科技有限公司拥有本软件版权2017并保留所有权利。
 * Copyright 2017, Guangzhou Rich Stone Data Technologies Company Limited,
 * All rights reserved.
 */

package com.richstonedt.gempile.commodity.cs.common.query;

import com.richstonedt.commons.query.QueryField;
import com.richstonedt.commons.query.QueryFunction;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

/**
 * <b><code>QueryFieldConstructor</code></b>
 * <p>
 * To Construct QueryField
 * </p>
 * <b>Create Time:</b> 2016/7/15 17:54
 *
 * @author chenzechao
 * @version 1.0.0
 * @since gemstack-core 1.0.0
 */
@Component
public class QueryFieldConstructor {

    /**
     * Construct field query field.
     *
     * @param name       the name
     * @param type       the type
     * @param entityType the entity type
     * @return the query field
     */
    public QueryField constructField(String name, String type, String entityType) {
        QueryField queryField = new QueryField();
        queryField.setName(name);
        queryField.setType(type);
        queryField.setEntityType(entityType);
        return queryField;
    }

//    /**
//     * Construct field query field.
//     *
//     * @param name       the name
//     * @param type       the type
//     * @param entityType the entity type
//     * @param alias      the alias
//     * @return the query field
//     */
//    public QueryField constructField(String name, String type, String entityType, String alias) {
//        QueryField queryField = new QueryField();
//        queryField.setName(name);
//        queryField.setType(type);
//        queryField.setEntityType(entityType);
//        queryField.setAlias(alias);
//        return queryField;
//    }

//    /**
//     * Query function query function.
//     *
//     * @param name        the name
//     * @param targetField the target field
//     * @param asFieldName the as field name
//     * @return the query function
//     */
//    public QueryFunction queryFunction(String name, QueryField targetField, String asFieldName) {
//        QueryFunction function = new QueryFunction();
//        List<QueryField> queryFields = new ArrayList<>();
//        queryFields.add(targetField);
//        function.setName(name);
//        function.setTargetField(queryFields);
//        function.setAsFieldName(asFieldName);
//        return function;
//    }

}
