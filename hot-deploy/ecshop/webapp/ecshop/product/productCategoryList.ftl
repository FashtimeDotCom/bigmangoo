
<div class="row">

    <#list productCategoryMembers as productCategoryMember>

        ${setRequestAttribute("optProductId", productCategoryMember.productId)}
        ${setRequestAttribute("productCategoryMember", productCategoryMember)}
        ${setRequestAttribute("listIndex", productCategoryMember_index)}
        ${screens.render(productsummaryScreen)}

    </#list>

</div>
