<div class="row" style="margin-top: 10px;margin-bottom: 10px;">

    <div class="col-md-4">
        <#if !productStore?exists>
            ${uiLabelMap.EcommerceNoProductStore}
        </#if>
        <#if (productStore.title)?exists>
            ${productStore.title}
        </#if>
        <#if (productStore.subtitle)?exists>
            <p>
                <small>${productStore.subtitle}</small>
            </p>
        </#if>
    </div>

    <div class="col-md-4">
        <div class="form-group center-block">
            <div class="input-group">
                <input class="form-control" id="navbarInput-01" type="search" placeholder="搜索">
                <span class="input-group-btn">
                  <button type="submit" class="btn"><span class="fui-search"></span></button>
                </span>
            </div>
        </div>
    </div>

    <div class="col-md-4">

        <div class="pull-right">
            <#if userLogin?has_content && userLogin.userLoginId != "anonymous">

                <#assign shoppingCart = sessionAttributes.shoppingCart?if_exists>
                <#if shoppingCart?has_content>
                    <#assign shoppingCartSize = shoppingCart.size()>
                <#else>
                    <#assign shoppingCartSize = 0>
                </#if>

                <a type="button" class="btn btn-default" href="<@ofbizUrl>view/showcart</@ofbizUrl>">
                    购物车
                    ${(shoppingCart.getTotalQuantity())!}
                </a>

                <div class="btn-group">
                    <button data-toggle="dropdown" class="btn btn-primary dropdown-toggle" type="button">
                        <#if sessionAttributes.autoName?has_content>
                            ${sessionAttributes.autoName?html}
                        </#if>
                        <span class="caret"></span>
                    </button>
                    <ul role="menu" class="dropdown-menu">
                        <li><a href="<@ofbizUrl>viewprofile</@ofbizUrl>">${uiLabelMap.CommonProfile}</a></li>
                        <li class="divider"></li>
                        <li><a href="<@ofbizUrl>logout</@ofbizUrl>">${uiLabelMap.CommonLogout}</a></li>
                    </ul>
                </div>

            <#else/>
                <a href="<@ofbizUrl>${checkLoginUrl}</@ofbizUrl>" type="button" class="btn btn-info">${uiLabelMap.CommonLogin}</a>
            </#if>
        </div>

    </div>

</div>
