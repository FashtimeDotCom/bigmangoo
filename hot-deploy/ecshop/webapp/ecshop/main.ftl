<div class="row">
    <div class="col-md-2">

        <ul class="list-group">

            <#if completedTree?has_content>
                <#list completedTree?sort_by("productCategoryId") as completedNode>
                    <li class="list-group-item">

                        <form action="<@ofbizUrl>productCategoryList</@ofbizUrl>" method="post" name="this${completedNode_index}form" onsubmit="return changeFormAction(this)">

                            <input hidden="hidden" name="category_id" value="${completedNode.productCategoryId}">
                            <input hidden="hidden" name="parentCategoryStr" value="${completedNode.parentCategoryId}">

                            <a href="javascript:document.this${completedNode_index}form.submit();">
                                <#if completedNode.categoryName?has_content>
                                    ${(completedNode.categoryName)!}
                                <#else>
                                    ${(completedNode.categoryDescription)!}
                                </#if>
                            </a>

                        </form>

                    </li>
                </#list>
            </#if>

        </ul>

    </div>

    <div id="center" class="col-md-10">

    </div>
</div>
