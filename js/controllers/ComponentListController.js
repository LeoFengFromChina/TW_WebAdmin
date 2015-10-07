
/*********************************************************
------------------产品配件Controller--------------------
*********************************************************/
var currMinute;
var myDate;
var urlParam;
function ComponentListCtrl($scope, $http) {
    myDate = new Date();
    if (currMinute == null || myDate.getMinutes() - currMinute > 1) {
        currMinute = myDate.getMinutes();
    }
    //这里需要请求动态数据
    var alldata = new Array();
    //http请求
    $http({
        url: 'json/ComponentList.json?timespan=' + currMinute,
        method: 'GET'
    }).success(function (data, header, config, status) {
        //响应成功
        alldata = data;
        if (alldata != null && alldata.length > 0) {
            //左右两列数据
            var left = new Array();
            var right = new Array();

            //按列平均，如果需要按行平均，则修改这里即可
            for (var i = 0; i < alldata.length; i++) {
                if (i % 2 == 0)
                    left.push(alldata[i]);
                else
                    right.push(alldata[i]);
            }

            //定义左右两个作用于，用于前端遍历显示
            $scope.leftsideitems = left;
            $scope.rightsideitems = right;
        }
    }).error(function (data, header, config, status) {
        //处理响应失败,请求本地
        $http({
            url: 'json/ComponentList.json',
            method: 'GET'
        }).success(function (data, header, config, status) {
            //响应成功
            alldata = data;
            if (alldata != null && alldata.length > 0) {
                //左右两列数据
                var left = new Array();
                var right = new Array();

                //按列平均，如果需要按行平均，则修改这里即可
                for (var i = 0; i < alldata.length; i++) {
                    if (i % 2 == 0)
                        left.push(alldata[i]);
                    else
                        right.push(alldata[i]);
                }

                //定义左右两个作用于，用于前端遍历显示
                $scope.leftsideitems = left;
                $scope.rightsideitems = right;
            }
        }).error(function (data, header, config, status) {
            //处理响应失败,请求本地
            alert('No data reply');

        });
    });

    //按钮事件
    $scope.ngClick = function (item) {
        //根据Item的产品id获取产品的详细内容。

        $scope.title = item.title;
        var _url = 'json/components/component' + item.id + '.json';
        //http请求
        $http({
            url: _url,
            method: 'GET'
        }).success(function (data, header, config, status) {
            //响应成功
            $scope.content = data[0].content;
            $scope.secondtitle = data[0].date;

            //显示
            fadeDashBoard();
            $('.detail-all').addClass('slidePageInFromLeft').removeClass('slidePageBackLeft');
            //当前窗口的高度，减去(标题的高+margin-top)
            $("#productcontent").height(window.innerHeight - 100 + "px");
            //用直接设置html的方法显示图片
            $("#productcontent").html($scope.content);

        }).error(function (data, header, config, status) {
            //处理响应失败
            alert('获取数据失败.');
        });
    }
}
