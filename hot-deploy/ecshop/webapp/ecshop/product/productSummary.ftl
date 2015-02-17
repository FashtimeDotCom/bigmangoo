
<#if product?exists>

<#-- variable setup -->
    <#if backendPath?default("N") == "Y">
        <#assign productUrl><@ofbizCatalogUrl productId=product.productId productCategoryId=categoryId/></#assign>
    <#else>
        <#assign productUrl><@ofbizCatalogAltUrl productId=product.productId productCategoryId=categoryId/></#assign>
    </#if>

    <#if requestAttributes.productCategoryMember?exists>
        <#assign prodCatMem = requestAttributes.productCategoryMember>
    </#if>
    <#assign smallImageUrl = productContentWrapper.get("SMALL_IMAGE_URL")?if_exists>
    <#if !smallImageUrl?string?has_content><#assign smallImageUrl = "/images/defaultImage.jpg"></#if>
<#-- end variable setup -->

<div class="col-md-3">
    <div class="thumbnail">
        <img src="<@ofbizContentUrl>${contentPathPrefix?if_exists}${smallImageUrl}</@ofbizContentUrl>" alt="Small Image">
        <div class="caption">
            <small><a target="_blank" href="<@ofbizUrl>productDetail?product_id=${(product.productId)!}</@ofbizUrl>">${productContentWrapper.get("PRODUCT_NAME")?if_exists}</a></small>
        </div>
    </div>
</div>

<#else>
&nbsp;${uiLabelMap.ProductErrorProductNotFound}.<br />
</#if>
