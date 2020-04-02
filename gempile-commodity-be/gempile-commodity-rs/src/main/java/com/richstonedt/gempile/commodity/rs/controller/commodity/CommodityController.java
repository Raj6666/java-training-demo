/*
 * 广州丰石科技有限公司拥有本软件版权2018并保留所有权利。
 * Copyright 2018, Guangzhou Rich Stone Data Technologies Company Limited,
 * All rights reserved.
 */

package com.richstonedt.gempile.commodity.rs.controller.commodity;

import com.richstonedt.gempile.commodity.cs.service.commodity.CommodityService;
import com.richstonedt.gempile.commodity.model.commodity.CommodityInfo;

import io.swagger.annotations.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.util.UriComponentsBuilder;
import org.springframework.util.StringUtils;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * <b><code>CommodityController</code></b>
 * <p>
 * class_comment
 * </p>
 * <b>Create Time:</b> 2018/6/13 11:57.
 *
 * @author PeiZiWen
 * @version 0.1.0
 * @since gempile -commodity-be 0.1.0
 */
@RestController
@RequestMapping("/v0.1.0/commodity")
@Api(tags = "commodityInterface", description = "B组商品信息相关接口")
public class CommodityController {

    /**
     * The constant LOG.
     * @since gempile-commodity-be 0.1.0
     */
    private static final Logger LOG = LoggerFactory.getLogger(
            CommodityController.class);

    /**
     * The Trainning service.
     * @since gempile-commodity-be 0.1.0
     */
    @Autowired
    private CommodityService commodityService;

    /**
     * httpSuccessStatus http请求,成功时返回信息.
     * @since gempile-commodity-be 0.1.0
     */
    private final int httpSuccessStatus = 200;

    /**
     * httpNotFoundStatus http请求,找不到目标时返回信息.
     * @since gempile-commodity-be 0.1.0
     */
    private final int httpNotFoundStatus = 404;

    /**
     * httpErrorStatus http请求,发生服务器内部错误时返回信息.
     * @since gempile-commodity-be 0.1.0
     */
    private final int httpErrorStatus = 500;

    /**
     * Gets commonditry infos.
     *
     * @param id the id
     * @return the commonditry infos
     * @since gempile-commodity-be 0.1.0
     */
    @RequestMapping(
            value = "/commodityInfos",
            method = RequestMethod.GET, produces =
            MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ApiOperation(value = "查询商品信息列表",
            notes = "get commodity infos",
            tags = "commodityInterface")
    @ApiResponses(value = {
            @ApiResponse(code = httpSuccessStatus, message = "successful"),
            @ApiResponse(code = httpErrorStatus,
                    message = "internal server error")})
    public ResponseEntity<?> getCommonditryInfos(
            @ApiParam(value = "int类型，商品编号")
            @RequestParam(value = "id") final Integer id) {
        try {
            List<CommodityInfo> commodityInfos =
                    commodityService.getCommondityInfos(id);
            return new ResponseEntity<>(commodityInfos, HttpStatus.OK);
//            return new ResponseEntity<>(0, HttpStatus.OK);
        } catch (Throwable t) {
            LOG.error("Fail to get commodity infos", t);
            Map<String, Object> errorMap = new HashMap<>();
            errorMap.put("errorMessage", t.getMessage());
            return new ResponseEntity<>(errorMap,
                    HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }


    /**
     * Update commonditry infos response entity.
     *
     * @param commonditry the commonditry
     * @return the response entity
     * @since gempile-commodity-be 0.1.0
     */
    @RequestMapping(value = "/updateCommodityInfos",
            method = RequestMethod.PUT,
            produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ApiOperation(
            value = "更新商品信息列表",
            notes = "update commodity infos",
            tags = "commodityInterface")
    @ApiResponses(value = {
            @ApiResponse(code = httpSuccessStatus, message = "successful"),
            @ApiResponse(code = httpErrorStatus,
                    message = "internal server error")
    })
    public ResponseEntity<?> updateCommonditryInfos(
            @RequestBody final CommodityInfo commonditry) {
        try {
            String id = commonditry.getId().toString();
            if (StringUtils.isEmpty(id.trim())) {
                String error = "Fail to update commonditry without id";
                LOG.error("Fail to update commonditry without id. commonditry:"
                        + commonditry.toString() + "[OBJECT_NOT_FOUND]");
                throw new RuntimeException(error);
            }
            commodityService.updateCommondityInfos(commonditry);
            return new ResponseEntity<>(HttpStatus.OK);
        } catch (Throwable t) {
            LOG.error("Fail to get commodity infos", t);
            Map<String, Object> errorMap = new HashMap<>();
            errorMap.put("errorMessage", t.getMessage());
            return new ResponseEntity<>(errorMap,
                    HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }


    /**
     * 新增商品.
     *
     * @param commodityInfos the commodity infos
     * @param ucBuilder      the uc builder
     * @return the response entity
     * @since gempile -commodity-be 0.1.0
     */
    @RequestMapping(value = "/createcommodityInfos",
            method = RequestMethod.POST,
            produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ResponseBody
    @ApiResponses(value = {
            @ApiResponse(
                    code = httpSuccessStatus,
                    message = "successful request"),
            @ApiResponse(
                    code = httpErrorStatus,
                    message = "internal server error")})
    @ApiOperation(
            value = "新增商品",
            httpMethod = "GET",
            notes = "新增商品",
            tags = "commodityInterface",
            produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    public ResponseEntity<?> createCommonditryInfos(
            @ApiParam(
                    value = "String类型，商品信息，例如格式：加多宝,6,5,广东,2,饮料")
            @RequestParam(value = "commodityInfos")
            final String commodityInfos,
            final UriComponentsBuilder ucBuilder
    ) {
        try {
            final int indexOf0 = 0;
            final int indexOf1 = 1;
            final int indexOf2 = 2;
            final int indexOf3 = 3;
            final int indexOf4 = 4;
            final int indexOf5 = 5;
            String[] commodityInfosArr = commodityInfos.split(",");
            CommodityInfo commodityInfo = new CommodityInfo();
            commodityInfo.setId(Integer.parseInt(commodityInfosArr[indexOf0]));
            commodityInfo.setName(commodityInfosArr[indexOf1]);
            commodityInfo.setPrice(
                    Double.parseDouble(commodityInfosArr[indexOf2]));
            commodityInfo.setProducter(commodityInfosArr[indexOf3]);
            commodityInfo.setType(commodityInfosArr[indexOf4]);
            commodityInfo.setWeight(
                    Double.parseDouble(commodityInfosArr[indexOf5]));
            commodityService.saveCommodityInfo(commodityInfo);
            HttpHeaders headers = new HttpHeaders();
            //     headers.setLocation(ucBuilder
            // .path("/v0.1.0/team/b/trainning"))
            //            .buildAndExpand(ids.get(0)).toUri());
            return new ResponseEntity<>(headers, HttpStatus.CREATED);
        } catch (Throwable t) {
            LOG.error("Fail to get commodity infos", t);
            Map<String, Object> errorMap = new HashMap<>();
            errorMap.put("errorMessage", t.getMessage());
            return new ResponseEntity<>(errorMap,
                    HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    /**
     * Delete commonditry info by id.
     *
     * @param id product id
     * @return the number of deleted row
     * @since gempile -commodity-be 0.1.0
     */
    @RequestMapping(value = "/deleteCommodityInfo",
            method = RequestMethod.DELETE,
            produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ApiOperation(
            value = "根据ID删除商品信息",
            notes = "delete commodity info by ID",
            tags = "commodityInterface")
    @ApiResponses(value = {
            @ApiResponse(
                    code = httpSuccessStatus, message = "successful"),
            @ApiResponse(
                    code = httpNotFoundStatus, message = "no found"),
            @ApiResponse(
                    code = httpErrorStatus, message = "internal server error")})
    public ResponseEntity<?> deleteCommonditryInfoByID(
            @ApiParam(value = "int类型，商品编号")
            @RequestParam(value = "id") final Integer id) {
        try {
            Integer deletedRow = commodityService.deleteCommondityInfos(id);
            LOG.info("deleted " + deletedRow + "row successfully!");
            return new ResponseEntity<>(HttpStatus.OK);
        } catch (Throwable t) {
            LOG.error("Failed to delete commodity info " + id, t);
            Map<String, Object> errorMap = new HashMap<>();
            errorMap.put("errorMessage", t.getMessage());
            return new ResponseEntity<>(errorMap,
                    HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}
