<div class="row">
    <div class="col-md-2">

        <ul class="list-group">

            <#list completedTree as completedNode>
                <li class="list-group-item">
                    <a href="javascript:document.category_form_${(completedNode.productCategoryId)!}.submit();">
                        <#if completedNode.categoryName?has_content>
                            ${(completedNode.categoryName)!}
                        <#else>
                            ${(completedNode.categoryDescription)!}
                        </#if>
                    </a>
                    <form action="<@ofbizUrl>productList</@ofbizUrl>" method="post" name="category_form_${(completedNode.productCategoryId)!}">
                        <input hidden="hidden" name="category_id" value="${(completedNode.productCategoryId)!}">
                    </form>
                </li>
            </#list>

        </ul>

    </div>
    <div class="col-md-10">

        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
            <!-- Indicators -->
            <ol class="carousel-indicators">
                <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                <li data-target="#carousel-example-generic" data-slide-to="2"></li>
            </ol>

            <!-- Wrapper for slides -->
            <div class="carousel-inner" role="listbox">
                <div class="item active">
                    <img src="/ecshop/images/paipai.jpg" alt="/ecshop/images/paipai.jpg">
                    <div class="carousel-caption">
                        圖片1
                    </div>
                </div>
                <div class="item">
                    <img src="/ecshop/images/paipai.jpg" alt="/ecshop/images/paipai.jpg">
                    <div class="carousel-caption">
                        圖片2
                    </div>
                </div>
                <div class="item">
                    <img src="/ecshop/images/paipai.jpg" alt="/ecshop/images/paipai.jpg">
                    <div class="carousel-caption">
                        圖片3
                    </div>
                </div>
            </div>

            <!-- Controls -->
            <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>


    </div>
</div>
