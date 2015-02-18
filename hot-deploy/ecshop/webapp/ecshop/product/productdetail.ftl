<div class="row">

    <div class="col-md-2">

        1

    </div>

    <div class="col-md-8">

        <#-- variable setup -->
        <#assign price = priceMap?if_exists />
        <#assign productImageList = productImageList?if_exists />
        <#-- end variable setup -->

        <#assign productLargeImageUrl = productContentWrapper.get("LARGE_IMAGE_URL")?if_exists />
        <#if firstLargeImage?has_content>
            <#assign productLargeImageUrl = firstLargeImage />
        </#if>
        <#if productLargeImageUrl?string?has_content>
            <img id="detailImage" src="<@ofbizContentUrl>${contentPathPrefix?if_exists}${productLargeImageUrl?if_exists}</@ofbizContentUrl>" name="mainImage" vspace="5" hspace="5" class="cssImgXLarge" alt="" />
        </#if>
        <#if !productLargeImageUrl?string?has_content>
            <img id="detailImage" src="/images/defaultImage.jpg" name="mainImage" alt="" />
        </#if>

        <small>
            <strong>${productContentWrapper.get("PRODUCT_NAME")?if_exists}</strong>
            ${productContentWrapper.get("DESCRIPTION")?if_exists}

            <#-- for prices:
                - if price < competitivePrice, show competitive or "Compare At" price
                - if price < listPrice, show list price
                - if price < defaultPrice and defaultPrice < listPrice, show default
                - if isSale show price with salePrice style and print "On Sale!"
            -->
            <#if price.competitivePrice?exists && price.price?exists && price.price &lt; price.competitivePrice>
                <div>${uiLabelMap.ProductCompareAtPrice}: <span class="basePrice"><@ofbizCurrency amount=price.competitivePrice isoCode=price.currencyUsed /></span></div>
            </#if>
            <#if price.listPrice?exists && price.price?exists && price.price &lt; price.listPrice>
                <div>${uiLabelMap.ProductListPrice}: <span class="basePrice"><@ofbizCurrency amount=price.listPrice isoCode=price.currencyUsed /></span></div>
            </#if>
            <#if price.listPrice?exists && price.defaultPrice?exists && price.price?exists && price.price &lt; price.defaultPrice && price.defaultPrice &lt; price.listPrice>
                <div>${uiLabelMap.ProductRegularPrice}: <span class="basePrice"><@ofbizCurrency amount=price.defaultPrice isoCode=price.currencyUsed /></span></div>
            </#if>
            <#if price.specialPromoPrice?exists>
                <div>${uiLabelMap.ProductSpecialPromoPrice}: <span class="basePrice"><@ofbizCurrency amount=price.specialPromoPrice isoCode=price.currencyUsed /></span></div>
            </#if>
                <div>
                    <strong>
                    <#if price.isSale?exists && price.isSale>
                        <span class="salePrice">${uiLabelMap.OrderOnSale}!</span>
                        <#assign priceStyle = "salePrice" />
                    <#else>
                        <#assign priceStyle = "regularPrice" />
                    </#if>
                    ${uiLabelMap.OrderYourPrice}: <#if "Y" = product.isVirtual?if_exists> ${uiLabelMap.CommonFrom} </#if><span class="${priceStyle}"><@ofbizCurrency amount=price.price isoCode=price.currencyUsed /></span>
                    <#if product.productTypeId?if_exists == "ASSET_USAGE" || product.productTypeId?if_exists == "ASSET_USAGE_OUT_IN">
                        <#if product.reserv2ndPPPerc?exists && product.reserv2ndPPPerc != 0><br /><span class="${priceStyle}">${uiLabelMap.ProductReserv2ndPPPerc}<#if !product.reservNthPPPerc?exists || product.reservNthPPPerc == 0>${uiLabelMap.CommonUntil} ${product.reservMaxPersons?if_exists}</#if> <@ofbizCurrency amount=product.reserv2ndPPPerc*price.price/100 isoCode=price.currencyUsed /></span></#if>
                        <#if product.reservNthPPPerc?exists &&product.reservNthPPPerc != 0><br /><span class="${priceStyle}">${uiLabelMap.ProductReservNthPPPerc} <#if !product.reserv2ndPPPerc?exists || product.reserv2ndPPPerc == 0>${uiLabelMap.ProductReservSecond} <#else> ${uiLabelMap.ProductReservThird} </#if> ${uiLabelMap.CommonUntil} ${product.reservMaxPersons?if_exists}, ${uiLabelMap.ProductEach}: <@ofbizCurrency amount=product.reservNthPPPerc*price.price/100 isoCode=price.currencyUsed /></span></#if>
                        <#if (!product.reserv2ndPPPerc?exists || product.reserv2ndPPPerc == 0) && (!product.reservNthPPPerc?exists || product.reservNthPPPerc == 0)><br />${uiLabelMap.ProductMaximum} ${product.reservMaxPersons?if_exists} ${uiLabelMap.ProductPersons}.</#if>
                    </#if>
                    </strong>
                </div>
            <#if price.listPrice?exists && price.price?exists && price.price &lt; price.listPrice>
                <#assign priceSaved = price.listPrice - price.price />
                <#assign percentSaved = (priceSaved / price.listPrice) * 100 />
                <div>${uiLabelMap.OrderSave}: <span class="basePrice"><@ofbizCurrency amount=priceSaved isoCode=price.currencyUsed /> (${percentSaved?int}%)</span></div>
            </#if>
            <#-- show price details ("showPriceDetails" field can be set in the screen definition) -->
            <#if (showPriceDetails?exists && showPriceDetails?default("N") == "Y")>
                <#if price.orderItemPriceInfos?exists>
                    <#list price.orderItemPriceInfos as orderItemPriceInfo>
                        <div>${orderItemPriceInfo.description?if_exists}</div>
                    </#list>
                </#if>
            </#if>

            <#-- Included quantities/pieces -->
            <#if product.piecesIncluded?exists && product.piecesIncluded?long != 0>
                <div>
                ${uiLabelMap.OrderPieces}: ${product.piecesIncluded}
                </div>
            </#if>
            <#if (product.quantityIncluded?exists && product.quantityIncluded != 0) || product.quantityUomId?has_content>
                <#assign quantityUom = product.getRelatedOne("QuantityUom", true)?if_exists />
                <div>
                ${uiLabelMap.CommonQuantity}: ${product.quantityIncluded?if_exists} ${((quantityUom.abbreviation)?default(product.quantityUomId))?if_exists}
                </div>
            </#if>

            <#if (product.weight?exists && product.weight != 0) || product.weightUomId?has_content>
                <#assign weightUom = product.getRelatedOne("WeightUom", true)?if_exists />
                <div>
                ${uiLabelMap.CommonWeight}: ${product.weight?if_exists} ${((weightUom.abbreviation)?default(product.weightUomId))?if_exists}
                </div>
            </#if>
            <#if (product.productHeight?exists && product.productHeight != 0) || product.heightUomId?has_content>
                <#assign heightUom = product.getRelatedOne("HeightUom", true)?if_exists />
                <div>
                ${uiLabelMap.CommonHeight}: ${product.productHeight?if_exists} ${((heightUom.abbreviation)?default(product.heightUomId))?if_exists}
                </div>
            </#if>
            <#if (product.productWidth?exists && product.productWidth != 0) || product.widthUomId?has_content>
                <#assign widthUom = product.getRelatedOne("WidthUom", true)?if_exists />
                <div>
                ${uiLabelMap.CommonWidth}: ${product.productWidth?if_exists} ${((widthUom.abbreviation)?default(product.widthUomId))?if_exists}
                </div>
            </#if>
            <#if (product.productDepth?exists && product.productDepth != 0) || product.depthUomId?has_content>
                <#assign depthUom = product.getRelatedOne("DepthUom", true)?if_exists />
                <div>
                ${uiLabelMap.CommonDepth}: ${product.productDepth?if_exists} ${((depthUom.abbreviation)?default(product.depthUomId))?if_exists}
                </div>
            </#if>

        </small>

    </div>

    <div class="col-md-2">

        3

    </div>

</div>
