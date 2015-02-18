<div class="row">
    <div class="col-md-2">

        <ul class="list-group">

            <#list completedTree as completedNode>
                <li class="list-group-item">
                    <a href="javascript:document.category_form_${(completedNode.productCategoryId)!}.submit();">
                        <#if completedNode.categoryName?has_content>
                            ${(completedNode.categoryName)!}
                        <#else>
                            ${(completedNode.categoryDescription)!}
                        </#if>
                    </a>
                    <form action="<@ofbizUrl>productList</@ofbizUrl>" method="post" name="category_form_${(completedNode.productCategoryId)!}">
                        <input hidden="hidden" name="category_id" value="${(completedNode.productCategoryId)!}">
                    </form>
                </li>
            </#list>

        </ul>

    </div>
    <div class="col-md-10">

        这是首页的促销界面

    </div>
</div>
