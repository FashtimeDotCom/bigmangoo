<div class="row">

    <#if productCategoryMembers?has_content>

        <#list productCategoryMembers as productCategoryMember>

            <#assign product = delegator.findOne("Product", {"productId" : productCategoryMember.productId}, true)>
            <#if product?exists>

                <#assign smallImageUrl = product.smallImageUrl?if_exists>
                <#if !smallImageUrl?string?has_content><#assign smallImageUrl = "/images/defaultImage.jpg"></#if>

                <div class="col-md-3">
                    <div class="tile">
                        <img src="${(smallImageUrl)!}" alt="Compas" class="tile-image big-illustration">
                        <#assign productName = product.productName?default('')>
                        <#if productName?length gt 15>
                            <#assign productName = productName?substring(0,15)>
                        </#if>
                        <h3 class="tile-title">${(productName)!}</h3>
                        <#assign description = product.description?default('')>
                        <#if description?length gt 15>
                            <#assign description = description?substring(0,15)>
                        </#if>
                        <p>${(description)!}</p>

                        <#-- check to see if introductionDate hasn't passed yet -->
                        <#if product.introductionDate?exists && nowTimestamp.before(product.introductionDate)>
                            <a class="btn btn-primary btn-large btn-block" href="#">${(uiLabelMap.ProductNotYetAvailable)!}</a>
                        <#-- check to see if salesDiscontinuationDate has passed -->
                        <#elseif product.salesDiscontinuationDate?exists && nowTimestamp.after(product.salesDiscontinuationDate)>
                            <a class="btn btn-primary btn-large btn-block" href="#">${(uiLabelMap.ProductNoLongerAvailable)!}</a>
                        <#-- check to see if it is a rental item; will enter parameters on the detail screen-->
                        <#elseif product.productTypeId?if_exists == "ASSET_USAGE">
                            <a class="btn btn-primary btn-large btn-block" href="#">${(uiLabelMap.OrderMakeBooking)!}</a>
                        <#-- check to see if it is an aggregated or configurable product; will enter parameters on the detail screen-->
                        <#elseif product.productTypeId?if_exists == "AGGREGATED" || product.productTypeId?if_exists == "AGGREGATED_SERVICE">
                            <a class="btn btn-primary btn-large btn-block" href="#">${(uiLabelMap.OrderConfigure)!}</a>
                        <#-- check to see if the product is a virtual product -->
                        <#elseif product.isVirtual?exists && product.isVirtual == "Y">
                            <a class="btn btn-primary btn-large btn-block" href="#">${(uiLabelMap.OrderChooseVariations)!}</a>
                        <#-- check to see if the product requires an amount -->
                        <#elseif product.requireAmount?exists && product.requireAmount == "Y">
                            <a class="btn btn-primary btn-large btn-block" href="#">${(uiLabelMap.OrderChooseAmount)!}</a>
                        <#elseif product.productTypeId?if_exists == "ASSET_USAGE_OUT_IN">
                            <a class="btn btn-primary btn-large btn-block" href="#">${(uiLabelMap.OrderRent)!}</a>
                        <#else>
                            <a class="btn btn-primary btn-large btn-block" href="javascript:document.the${productCategoryMember_index}form.submit();">${(uiLabelMap.OrderAddToCart)!}</a>

                            <form method="post" action="<@ofbizUrl>additem</@ofbizUrl>" name="the${productCategoryMember_index}form">
                                <input type="hidden" name="add_product_id" value="${product.productId}"/>
                                <input type="hidden" size="5" name="quantity" value="1"/>
                                <input type="hidden" name="clearSearch" value="N"/>
                                <input type="hidden" name="mainSubmitted" value="Y"/>
                            </form>

                        </#if>

                    </div>
                </div>

            </#if>
        </#list>
    <#else>
        <div>${uiLabelMap.ProductNoProductsInThisCategory}</div>
    </#if>

</div>
