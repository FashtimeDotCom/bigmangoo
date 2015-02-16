<div class="row" style="margin-top: 10px;margin-bottom: 10px;">

    <div class="col-md-4">
        这是一个很长很长的logo
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
                <a href="<@ofbizUrl>logout</@ofbizUrl>" type="button" class="btn btn-info">${uiLabelMap.CommonLogout}</a>
            <#else/>
                <a href="<@ofbizUrl>${checkLoginUrl}</@ofbizUrl>" type="button" class="btn btn-info">${uiLabelMap.CommonLogin}</a>
            </#if>
        </div>

    </div>

</div>
