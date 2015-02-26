
<#if (shoppingCartSize > 0)>

<table class="table">
    <thead>
        <tr>
            <th scope="row">${uiLabelMap.OrderProduct}</th>
            <th scope="row">${uiLabelMap.CommonQuantity}</th>
            <th scope="row">${uiLabelMap.EcommerceUnitPrice}</th>
            <th scope="row">${uiLabelMap.EcommerceAdjustments}</th>
            <th scope="row">${uiLabelMap.EcommerceItemTotal}</th>
            <th scope="row"><input type="checkbox" name="selectAll" value="0" onclick="javascript:toggleAll(this);" /></th>
        </tr>
    </thead>
    <tbody>
        <#assign itemsFromList = false />
        <#assign promoItems = false />
        <#list shoppingCart.items() as cartLine>

            <#assign cartLineIndex = shoppingCart.getItemIndex(cartLine) />
            <tr id="cartItemDisplayRow_${cartLineIndex}">
                <td>
                    <#if cartLine.getProductId()?exists>
                        <#if cartLine.getParentProductId()?exists>
                            <#assign parentProductId = cartLine.getParentProductId() />
                        <#else>
                            <#assign parentProductId = cartLine.getProductId() />
                        </#if>
                        <#assign smallImageUrl = Static["org.ofbiz.product.product.ProductContentWrapper"].getProductContentAsText(cartLine.getProduct(), "SMALL_IMAGE_URL", locale, dispatcher)?if_exists />
                        <#if !smallImageUrl?string?has_content><#assign smallImageUrl = "/images/defaultImage.jpg" /></#if>
                        <#if smallImageUrl?string?has_content>
                            <a href="<@ofbizCatalogAltUrl productId=parentProductId/>">
                                    <img src="<@ofbizContentUrl>${requestAttributes.contentPathPrefix?if_exists}${smallImageUrl}</@ofbizContentUrl>" alt="Product Image" class="imageborder" style="max-width: 40%;max-height: 40%;"/>
                            </a>
                        </#if>
                        <br>
                        <a href="<@ofbizCatalogAltUrl productId=parentProductId/>" class="linktext">${cartLine.getProductId()} - ${cartLine.getName()?if_exists}</a>

                    <#else>

                    </#if>

                </td>
                <td>${cartLine.getQuantity()?string.number}</td>
                <td><@ofbizCurrency amount=cartLine.getDisplayPrice() isoCode=shoppingCart.getCurrency()/></td>
                <td><@ofbizCurrency amount=cartLine.getOtherAdjustments() isoCode=shoppingCart.getCurrency()/></td>
                <td><@ofbizCurrency amount=cartLine.getDisplayItemSubTotal() isoCode=shoppingCart.getCurrency()/></td>
                <td><#if !cartLine.getIsPromo()><input type="checkbox" name="selectedItem" value="${cartLineIndex}" onclick="javascript:checkToggle(this);" /><#else>&nbsp;</#if></td>
            </tr>

        </#list>
    </tbody>
</table>



<#else>
    ${uiLabelMap.EcommerceYourShoppingCartEmpty}
</#if>
