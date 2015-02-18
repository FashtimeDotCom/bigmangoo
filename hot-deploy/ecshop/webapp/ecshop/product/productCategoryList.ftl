<div class="row">
    <div class="col-md-2">

        筛选条件

    </div>
    <div class="col-md-10">

        <div class="row">

            <#list productCategoryMembers as productCategoryMember>

                ${setRequestAttribute("optProductId", productCategoryMember.productId)}
                ${setRequestAttribute("productCategoryMember", productCategoryMember)}
                ${setRequestAttribute("listIndex", productCategoryMember_index)}
                ${screens.render(productsummaryScreen)}

            </#list>

        </div>

    </div>
</div>
