
<div class="header">
    <div class="container">
        <div class="row">
            <div class="col-md-5">
                <!-- Logo -->
                <div class="logo">
                    <h1><a href="<@ofbizUrl>main</@ofbizUrl>">BigMangoo 后台管理</a></h1>
                </div>
            </div>
            <div class="col-md-2 pull-right">

                <#if userLogin?exists>

                    <div class="navbar navbar-inverse" role="banner">
                        <nav class="collapse navbar-collapse bs-navbar-collapse navbar-right" role="navigation">
                            <ul class="nav navbar-nav">
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">${userLogin.userLoginId}<b class="caret"></b></a>
                                    <ul class="dropdown-menu animated fadeInUp">
                                        <li><a href="<@ofbizUrl>logout</@ofbizUrl>">${uiLabelMap.CommonLogout}</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </nav>
                    </div>

                <#else/>
                    <li>${uiLabelMap.CommonWelcome}! <a href="<@ofbizUrl>${checkLoginUrl}</@ofbizUrl>">${uiLabelMap.CommonLogin}</a></li>
                </#if>

            </div>
        </div>
    </div>
</div>
