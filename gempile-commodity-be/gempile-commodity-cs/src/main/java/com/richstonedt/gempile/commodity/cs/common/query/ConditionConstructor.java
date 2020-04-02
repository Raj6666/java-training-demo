/*
 * 广州丰石科技有限公司拥有本软件版权2017并保留所有权利。
 * Copyright 2017, Guangzhou Rich Stone Data Technologies Company Limited,
 * All rights reserved.
 */

package com.richstonedt.gempile.commodity.cs.common.query;

import com.richstonedt.commons.query.QueryCondition;
import com.richstonedt.commons.query.QueryConditionGroup;
import com.richstonedt.commons.query.QueryField;
import com.richstonedt.commons.query.SelectStatement;
import org.springframework.stereotype.Component;
import org.springframework.util.CollectionUtils;
import org.springframework.util.ObjectUtils;

import java.util.ArrayList;
import java.util.List;

/**
 * <b><code>ConditionConstructor</code></b>
 * <p>
 * To construct Conditions and ConditionGroups
 * </p>
 * <b>Create Time:</b> 2016/7/15 12:17
 *
 * @author chenzechao
 * @version 0.1.0
 * @since gemstack -core 0.1.0
 */
@Component
public class ConditionConstructor {

    /**
     * Operator "or"
     */
    public static final String OR = "OR";

    /**
     * Operator "and"
     */
    public static final String AND = "AND";

    /**
     * Operator "<"
     */
    public static final String LT = "<";

    /**
     * Operator ">"
     */
    public static final String GT = ">";

    /**
     * Operator "<="
     */
    public static final String LE = "<=";

    /**
     * Operator ">="
     */
    public static final String GE = ">=";

    /**
     * Operator "="
     */
    public static final String EQUAL = "=";

    /**
     * Operator "!="
     */
    public static final String NOT_EQUAL = "!=";

    /**
     * The constant NULL.
     */
    public static final String NULL = "NULL";

    /**
     * The constant NOT_NULL.
     */
    public static final String NOT_NULL = "NOT NULL";

    /**
     * Operator "is"
     */
    private static final String IS = "IS";

    /**
     * The constant LIKE.
     */
    private static final String LIKE = "LIKE";

    /**
     * The constant IN.
     */
    private static final String IN = "IN";

    /**
     * The constant BETWEEN.
     */
    private static final String BETWEEN = "BETWEEN";

    /**
     * Query condition group query condition group.
     *
     * @param conditions      the conditions
     * @param conditionGroups the condition groups
     * @param operator        the operator
     * @return the query condition group
     */
    public QueryConditionGroup queryConditionGroup(List<QueryCondition> conditions, List<QueryConditionGroup> conditionGroups, String operator) {
        QueryConditionGroup conditionGroup = new QueryConditionGroup();
        if (!CollectionUtils.isEmpty(conditionGroups)) {
            conditionGroup.setConditionGroups(conditionGroups);
        }
        if (!CollectionUtils.isEmpty(conditions)) {
            conditionGroup.setConditions(conditions);
        }
        conditionGroup.setLogicOperator(operator);
        return conditionGroup;
    }

    /**
     * Equal query condition query condition.
     *
     * @param queryField the query field
     * @param value      the value
     * @return the query condition
     */
    public QueryCondition equalQueryCondition(QueryField queryField, Object value) {
        List<Object> values = new ArrayList<>();
        values.add(value);
        QueryCondition queryCondition = new QueryCondition();
        queryCondition.setField(queryField);
        queryCondition.setOperator(EQUAL);
        queryCondition.setValues(values);
        return queryCondition;
    }

    /**
     * Not equal query condition query condition.
     *
     * @param queryField the query field
     * @param value      the value
     * @return the query condition
     */
//    public QueryCondition notEqualQueryCondition(QueryField queryField, Object value) {
//        List<Object> values = new ArrayList<>();
//        values.add(value);
//        QueryCondition queryCondition = new QueryCondition();
//        queryCondition.setField(queryField);
//        queryCondition.setOperator(NOT_EQUAL);
//        queryCondition.setValues(values);
//        return queryCondition;
//    }

    /**
     * Is query condition query condition.
     *
     * @param queryField the query field
     * @param value      the value
     * @return the query condition
     */
//    public QueryCondition isQueryCondition(QueryField queryField, Object value) {
//        QueryField valueQueryField = new QueryField();
//        valueQueryField.setName(value.toString());
//        List<Object> values = new ArrayList<>();
//        values.add(valueQueryField);
//
//        QueryCondition queryCondition = new QueryCondition();
//        queryCondition.setField(queryField);
//        queryCondition.setOperator(IS);
//        queryCondition.setValues(values);
//        return queryCondition;
//    }

    /**
     * Similar query condition query condition.
     *
     * @param queryField the query field
     * @param value      the value
     * @return the query condition
     */
//    public QueryCondition similarQueryCondition(QueryField queryField, Object value) {
//        List<Object> values = new ArrayList<>();
//        values.add(value);
//        QueryCondition queryCondition = new QueryCondition();
//        queryCondition.setField(queryField);
//        queryCondition.setOperator(LIKE);
//        queryCondition.setValues(values);
//        return queryCondition;
//    }

    /**
     * Between query condition query condition.
     *
     * @param queryField the query field
     * @param beginValue the begin value
     * @param endValue   the end value
     * @return the query condition
     */
//    public QueryCondition betweenQueryCondition(QueryField queryField, Object beginValue, Object endValue) {
//        List<Object> values = new ArrayList<>();
//        values.add(beginValue);
//        values.add(endValue);
//        QueryCondition queryCondition = new QueryCondition();
//        queryCondition.setField(queryField);
//        queryCondition.setOperator(BETWEEN);
//        queryCondition.setValues(values);
//        return queryCondition;
//    }

    /**
     * Compare query condition query condition.
     *
     * @param queryField the query field
     * @param value      the value
     * @param operator   the operator
     * @return the query condition
     */
//    public QueryCondition compareQueryCondition(QueryField queryField, Object value, String operator) {
//        List<Object> values = new ArrayList<>();
//        values.add(value);
//        QueryCondition queryCondition = new QueryCondition();
//        queryCondition.setField(queryField);
//        queryCondition.setOperator(operator);
//        queryCondition.setValues(values);
//        return queryCondition;
//    }

    /**
     * Contain query condition query condition.
     *
     * @param queryField the query field
     * @param parameters the parameters
     * @return the query condition
     */
//    public QueryCondition containQueryCondition(QueryField queryField, List<?> parameters) {
//        List<Object> values = new ArrayList<>();
//        values.addAll(parameters);
//        QueryCondition queryCondition = new QueryCondition();
//        queryCondition.setField(queryField);
//        queryCondition.setOperator(IN);
//        queryCondition.setValues(values);
//        return queryCondition;
//    }

    /**
     * Contain query condition query condition.
     *
     * @param queryField      the query field
     * @param selectStatement the select statement
     * @return the query condition
     */
//    public QueryCondition containQueryCondition(QueryField queryField, SelectStatement selectStatement) {
//        List<Object> values = new ArrayList<>();
//        if (!ObjectUtils.isEmpty(selectStatement)) {
//            values.add(selectStatement);
//        }
//        QueryCondition queryCondition = new QueryCondition();
//        queryCondition.setField(queryField);
//        queryCondition.setOperator(IN);
//        queryCondition.setValues(values);
//        return queryCondition;
//    }

}
