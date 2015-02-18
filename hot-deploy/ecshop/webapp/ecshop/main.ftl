<div class="row">
    <div class="col-md-2">

        <ul class="list-group">

            <#if completedTree?has_content>
                <#list completedTree?sort_by("productCategoryId") as completedNode>
                    <li class="list-group-item">
                        <a href="javascript: void(0);" onclick="callDocument('${completedNode.productCategoryId}','${completedNode.parentCategoryId}');">
                            <#if completedNode.categoryName?has_content>
                                ${(completedNode.categoryName)!}
                            <#else>
                                ${(completedNode.categoryDescription)!}
                            </#if>
                        </a>
                    </li>
                </#list>
            </#if>

        </ul>

        <script type="text/javascript">

            function callDocument(id, parentCategoryStr) {
                var checkUrl = '<@ofbizUrl>productCategoryList</@ofbizUrl>';
                if(checkUrl.search("http"))
                    var ajaxUrl = '<@ofbizUrl>productCategoryList</@ofbizUrl>';
                else
                    var ajaxUrl = '<@ofbizUrl>productCategoryListSecure</@ofbizUrl>';

                //jQuerry Ajax Request
                jQuery.ajax({
                    url: ajaxUrl,
                    type: 'POST',
                    data: {"category_id" : id, "parentCategoryStr" : parentCategoryStr},
                    error: function(msg) {
                        alert("An error occured loading content! : " + msg);
                    },
                    success: function(msg) {
                        jQuery('#center').html(msg);
                    }
                });
            }

        </script>

    </div>

    <div id="center" class="col-md-10">

    </div>
</div>
