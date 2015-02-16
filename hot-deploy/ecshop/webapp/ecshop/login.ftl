<div class="well" style="margin-top: 40px;">

    <form class="form-horizontal" action="<@ofbizUrl>login</@ofbizUrl>" method="post">
        <div class="form-group">
            <label for="username" class="col-sm-2 control-label">${uiLabelMap.CommonUsername}</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="username" name="USERNAME">
            </div>
        </div>
        <div class="form-group">
            <label for="password" class="col-sm-2 control-label">${uiLabelMap.CommonPassword}</label>
            <div class="col-sm-10">
                <input type="password" class="form-control" id="password" name="PASSWORD">
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-default">${uiLabelMap.CommonLogin}</button>
            </div>
        </div>
    </form>

</div>
