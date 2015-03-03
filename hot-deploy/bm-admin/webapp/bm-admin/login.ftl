<div class="page-content container">
    <div class="row">
        <div class="col-md-4 col-md-offset-4">
            <div class="login-wrapper">

                <form method="post" action="<@ofbizUrl>login</@ofbizUrl>" name="loginform" id="loginform">

                    <div class="box">
                        <div class="content-wrap">
                            <h6>${uiLabelMap.CommonLogin}</h6>
                            <input class="form-control" name="USERNAME" type="text" placeholder="${uiLabelMap.CommonUsername}">
                            <input class="form-control" name="PASSWORD" type="password" placeholder="${uiLabelMap.CommonPassword}">
                            <div class="action">
                                <button class="btn btn-primary signup" type="submit">${uiLabelMap.CommonLogin}</button>
                            </div>
                        </div>
                    </div>

                </form>

                <div class="already">
                    <a href="<@ofbizUrl>forgotPassword</@ofbizUrl>">${uiLabelMap.CommonForgotYourPassword}</a>
                </div>
            </div>
        </div>
    </div>
</div>
