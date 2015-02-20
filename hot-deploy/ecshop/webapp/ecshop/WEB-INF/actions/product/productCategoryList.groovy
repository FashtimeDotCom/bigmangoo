/**
 * Created by lianghh on 15-2-21.
 */


import org.ofbiz.base.util.UtilProperties
import org.ofbiz.entity.condition.EntityCondition
import org.ofbiz.entity.util.EntityTypeUtil
import org.ofbiz.product.catalog.CatalogWorker
import org.ofbiz.product.store.ProductStoreWorker

//取得当前访问目录
productCategoryId = request.getAttribute("productCategoryId") ?: parameters.category_id;
context.productCategoryId = productCategoryId;

//取得当前点击分类，分页信息
viewSize = parameters.VIEW_SIZE;
viewIndex = parameters.VIEW_INDEX;
currentCatalogId = CatalogWorker.getCurrentCatalogId(request);

// 设置默认分页大小
defaultViewSize = 20;
context.defaultViewSize = defaultViewSize;

// set the limit view
limitView = request.getAttribute("limitView") ?: true;
context.limitView = limitView;

// get the product category & members
andMap = [productCategoryId : productCategoryId,
          viewIndexString : viewIndex,
          viewSizeString : viewSize,
          defaultViewSize : defaultViewSize,
          limitView : limitView];
andMap.put("prodCatalogId", currentCatalogId);
andMap.put("checkViewAllow", true);
if (context.orderByFields) {
    andMap.put("orderByFields", context.orderByFields);
} else {
    andMap.put("orderByFields", ["sequenceNum", "productId"]);
}
catResult = dispatcher.runSync("getProductCategoryAndLimitedMembers", andMap);

productCategory = catResult.productCategory;
productCategoryMembers = catResult.productCategoryMembers;

// 剔除没有库存的商品
productStore = ProductStoreWorker.getProductStore(request);
if(productStore) {
    if("N".equals(productStore.showOutOfStockProducts)) {
        productsInStock = [];
        productCategoryMembers.each { productCategoryMember ->
            product = delegator.findOne("Product", [productId : productCategoryMember.productId], true);
            boolean isMarketingPackage = EntityTypeUtil.hasParentType(delegator, "ProductType", "productTypeId", product.productTypeId, "parentTypeId", "MARKETING_PKG");
            context.isMarketingPackage = (isMarketingPackage? "true": "false");
            if (isMarketingPackage) {
                resultOutput = dispatcher.runSync("getMktgPackagesAvailable", [productId : productCategoryMember.productId]);
                availableInventory = resultOutput.availableToPromiseTotal;
                if(availableInventory > 0) {
                    productsInStock.add(productCategoryMember);
                }
            } else {
                facilities = delegator.findList("ProductFacility", EntityCondition.makeCondition([productId : productCategoryMember.productId]), null, null, null, false);
                availableInventory = 0.0;
                if (facilities) {
                    facilities.each { facility ->
                        lastInventoryCount = facility.lastInventoryCount;
                        if (lastInventoryCount != null) {
                            availableInventory += lastInventoryCount;
                        }
                    }
                    if (availableInventory > 0) {
                        productsInStock.add(productCategoryMember);
                    }
                }
            }
        }
        context.productCategoryMembers = productsInStock;
    } else {
        context.productCategoryMembers = productCategoryMembers;
    }
}
context.productCategory = productCategory;
context.viewIndex = catResult.viewIndex;
context.viewSize = catResult.viewSize;
context.lowIndex = catResult.lowIndex;
context.highIndex = catResult.highIndex;
context.listSize = catResult.listSize;

//设置当前productCategoryId
request.setAttribute("productCategoryId", productCategoryId);
