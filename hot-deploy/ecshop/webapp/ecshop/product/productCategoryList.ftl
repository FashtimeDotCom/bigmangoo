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
                        <a class="btn btn-primary btn-large btn-block" href="#">${(uiLabelMap.OrderAddToCart)!}</a>
                    </div>
                </div>

            </#if>
        </#list>
    <#else>
        <div>${uiLabelMap.ProductNoProductsInThisCategory}</div>
    </#if>

</div>
