
<div class="row">

<#if productCategoryMembers?has_content>

    <#list productCategoryMembers as productCategoryMember>

        ${setRequestAttribute("optProductId", productCategoryMember.productId)}
        ${setRequestAttribute("productCategoryMember", productCategoryMember)}
        ${setRequestAttribute("listIndex", productCategoryMember_index)}
        ${screens.render(productsummaryScreen)}

    </#list>

<#else>
    <div>${uiLabelMap.ProductNoProductsInThisCategory}</div>
</#if>

</div>

<#assign viewIndexMax = Static["java.lang.Math"].ceil((listSize - 1)?double / viewSize?double)>
<#if (viewIndexMax?int > 0)>
<ul class="pagination-plain">

    <#if (viewIndex?int > 0)>
        <li class="previous"><a href="javascript: void(0);" onclick="callDocumentByPaginate('${productCategoryId}~${viewSize}~${viewIndex?int - 1}');">← ${uiLabelMap.CommonPrevious}</a></li>
    </#if>

    <#if ((listSize?int - viewSize?int) > 0)>
        <span>${lowIndex} - ${highIndex} ${uiLabelMap.CommonOf} ${listSize}</span>
    </#if>

    <#if highIndex?int < listSize?int>
        <li class="next"><a href="javascript: void(0);" onclick="callDocumentByPaginate('${productCategoryId}~${viewSize}~${viewIndex?int + 1}');">${uiLabelMap.CommonNext} →</a></li>
    </#if>

</ul>
</#if>

<script type="text/javascript">
    function callDocumentByPaginate(info) {
        var str = info.split('~');
        var checkUrl = '<@ofbizUrl>categoryAjaxFired</@ofbizUrl>';
        if(checkUrl.search("http"))
            var ajaxUrl = '<@ofbizUrl>categoryAjaxFired</@ofbizUrl>';
        else
            var ajaxUrl = '<@ofbizUrl>categoryAjaxFiredSecure</@ofbizUrl>';

        //jQuerry Ajax Request
        jQuery.ajax({
            url: ajaxUrl,
            type: 'POST',
            data: {"category_id" : str[0], "VIEW_SIZE" : str[1], "VIEW_INDEX" : str[2]},
            error: function(msg) {
                alert("An error occured loading content! : " + msg);
            },
            success: function(msg) {
                jQuery('#center').html(msg);
            }
        });
    }
</script>
