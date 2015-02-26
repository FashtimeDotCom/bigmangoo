<div class="well text-center">

    <#if shoppingCart.getAdjustments()?has_content>
        <strong >${uiLabelMap.CommonSubTotal}:</strong>
        <br>
        <@ofbizCurrency amount=shoppingCart.getDisplaySubTotal() isoCode=shoppingCart.getCurrency()/>
        <br>
        <br>

        <#list shoppingCart.getAdjustments() as cartAdjustment>
            <#assign adjustmentType = cartAdjustment.getRelatedOne("OrderAdjustmentType", true) />
            <strong>${uiLabelMap.EcommerceAdjustment} - ${adjustmentType.get("description",locale)?if_exists}</strong>
            <br>
            <@ofbizCurrency amount=Static["org.ofbiz.order.order.OrderReadHelper"].calcOrderAdjustment(cartAdjustment, shoppingCart.getSubTotal()) isoCode=shoppingCart.getCurrency()/>
            <br>
            <br>
        </#list>

        <strong>${uiLabelMap.EcommerceCartTotal}:</strong>
        <br>
        <@ofbizCurrency amount=shoppingCart.getDisplayGrandTotal() isoCode=shoppingCart.getCurrency()/>
        <br>
        <br>

    </#if>

    <a href="#" type="button" class="btn btn-info center-block">${uiLabelMap.OrderCheckout}</a>

</div>
