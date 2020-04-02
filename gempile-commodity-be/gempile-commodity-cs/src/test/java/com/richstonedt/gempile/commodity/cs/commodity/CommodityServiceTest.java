package com.richstonedt.gempile.commodity.cs.commodity;

import com.richstonedt.gempile.commodity.cs.service.commodity.CommodityService;
import com.richstonedt.gempile.commodity.model.commodity.CommodityInfo;
import org.junit.After;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

/**
 * <b><code>TrainningServiceTest</code></b>
 * <p>
 * class_comment
 * </p>
 * <b>Create Time:</b> 2018/6/14 19:24
 *
 * @author PeiZiWen
 * @version 0.1.0
 * @since gempile -trainnig-be 0.1.0
 */
@ContextConfiguration(locations = "classpath:application-context-test.xml")
@RunWith(SpringJUnit4ClassRunner.class)
public class CommodityServiceTest {
    /**
     * The Trainning service.
     */
    @Autowired
    private CommodityService commodityService;

    /**
     * Sets up.
     *
     * @throws Exception the exception
     */
    @Before
    public void setUp() throws Exception {
    }

    /**
     * Tear down.
     *
     * @throws Exception the exception
     */
    @After
    public void tearDown() throws Exception {
    }

    /**
     * Gets commondity infos.
     */
    @Test
    public void getCommondityInfosTest() {

        Integer id = 3;
        CommodityInfo commodityInfo = new CommodityInfo();
        commodityInfo.setId(id);
        commodityInfo.setName("test_update");
        commodityInfo.setPrice(13.50);
        commodityInfo.setProducter("Nobody");
        commodityInfo.setType("unknown");
        commodityInfo.setWeight(5.6);
        commodityService.deleteCommondityInfos(id);
        commodityService.saveCommodityInfo(commodityInfo);
        List<CommodityInfo> commodityInfos = commodityService.getCommondityInfos(id);
        Assert.assertNotNull(commodityInfos);
        Assert.assertNotEquals(commodityInfos.size(), 0);
        CommodityInfo commodityInfo1 = commodityInfos.get(0);
        Assert.assertTrue(commodityInfo1.getId() == id);
        Assert.assertEquals(commodityInfo1.getName(),"test_update");
    }

    /**
     * Delete commondity info by id.
     */
    @Test
    public void deleteCommondityInfosByIdTest() {

        Integer id = 10;
        CommodityInfo commodityInfo = new CommodityInfo();
        commodityInfo.setId(id);
        commodityInfo.setName("test_update");
        commodityInfo.setPrice(13.50);
        commodityInfo.setProducter("Nobody");
        commodityInfo.setType("unknown");
        commodityInfo.setWeight(5.6);
        Assert.assertNotNull(commodityInfo.toString());
        commodityService.saveCommodityInfo(commodityInfo);
        Integer deletedRow = commodityService.deleteCommondityInfos(id);
        Assert.assertNotNull(deletedRow);
        Assert.assertNotEquals(deletedRow.intValue(), 0);
        Assert.assertTrue(deletedRow == 1);
    }

    @Test
    public void updateCommondityInfosTest(){
        CommodityInfo commodityInfo = new CommodityInfo();
        commodityInfo.setId(2);
        commodityInfo.setName("test_update");
        commodityInfo.setPrice(13.50);
        commodityInfo.setProducter("Nobody");
        commodityInfo.setType("unknown");
        commodityInfo.setWeight(5.6);
        commodityService.deleteCommondityInfos(2);
        commodityService.saveCommodityInfo(commodityInfo);
        commodityInfo.setName("test");
        commodityService.updateCommondityInfos(commodityInfo);
        List<CommodityInfo> commodityInfos = commodityService.getCommondityInfos(2);
        Assert.assertNotNull(commodityInfos);
        Assert.assertNotEquals(commodityInfos.size(), 0);
        CommodityInfo realCommodityInfo = commodityInfos.get(0);
        Assert.assertEquals(realCommodityInfo.getId(),commodityInfo.getId());
        Assert.assertEquals(realCommodityInfo.getName(),commodityInfo.getName());
        Assert.assertEquals(realCommodityInfo.getPrice(),commodityInfo.getPrice());
        Assert.assertEquals(realCommodityInfo.getProducter(),commodityInfo.getProducter());
        Assert.assertEquals(realCommodityInfo.getType(),commodityInfo.getType());
        Assert.assertEquals(realCommodityInfo.getWeight(),commodityInfo.getWeight());
    }

    @Test
    public void createUser() throws Exception {

        Integer id = 7;
        CommodityInfo commodityInfo = new CommodityInfo();
        commodityInfo.setId(id);
        commodityInfo.setName("test_create");
        commodityInfo.setPrice(6.7);
        commodityInfo.setProducter("可口可乐公司");
        commodityInfo.setType("饮料");
        commodityInfo.setWeight(500.0);

        commodityService.saveCommodityInfo(commodityInfo);

        List<CommodityInfo> commodityInfos = commodityService.getCommondityInfos(id);
        Assert.assertNotNull(commodityInfos);

        CommodityInfo queryCommodityInfo = commodityInfos.get(0);
        //  Assert.assertTrue(queryCommodityInfo.getId() == id);
        Assert.assertEquals(queryCommodityInfo.getId(), id);


    }
}
