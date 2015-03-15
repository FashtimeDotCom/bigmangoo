<ul class="list-group">

    <#if completedCategoryList?has_content>
        <#list completedCategoryList?sort_by("productCategoryId") as completedCategoryMap>
            <li class="list-group-item">
                <a href="<@ofbizUrl>productCategoryList?category_id=${(completedCategoryMap.productCategoryId)!}</@ofbizUrl>">
                <#if completedCategoryMap.categoryName?has_content>
                    ${(completedCategoryMap.categoryName)!}
                <#else>
                    ${(completedCategoryMap.categoryDescription)!}
                </#if>
                </a>
            </li>
        </#list>
    </#if>

</ul>
