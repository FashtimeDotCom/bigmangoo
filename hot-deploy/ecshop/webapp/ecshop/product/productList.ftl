<div class="row">
    <div class="col-md-2">

        筛选条件

    </div>
    <div class="col-md-10">

        <div class="row">

            <#list productList as productMap>
                <#if productMap.smallImageUrl?has_content>

                    <div class="col-md-3">
                        <div class="thumbnail">
                            <img src="${(productMap.smallImageUrl)!}" alt="/images/products/GZ-1000/small.png">
                            <div class="caption">
                                <small><a target="_blank" href="<@ofbizUrl>productDetail?productId=${(productMap.productId)!}</@ofbizUrl>">${(productMap.productName)!}</a></small>
                            </div>
                        </div>
                    </div>

                </#if>
            </#list>

        </div>

    </div>
</div>
