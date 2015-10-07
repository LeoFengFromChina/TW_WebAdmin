
/*********************************************************
------------------产品列表Controller--------------------
*********************************************************/
var currMinute;
var myDate;
var urlParam;
function ProductListCtrl($scope, $http) {
    myDate = new Date();
    if (currMinute == null || myDate.getMinutes() - currMinute > 1) {
        currMinute = myDate.getMinutes();
    }

    //http请求
    $http({
        url: 'json/ProductList.json?timespan=' + currMinute,
        method: 'GET'
    }).success(function (data, header, config, status) {
        //响应成功

        //定义左右两个作用于，用于前端遍历显示
        $scope.datalist = data;
    }).error(function (data, header, config, status) {
        alert('error.');
    });

    //按钮事件
    $scope.ngClick = function (item) {
        //根据Item的产品id获取产品的详细内容。
        
        $scope.title = item.title;
        var _url = 'json/products/product' + item.id + '.json';
        //http请求
        $http({
            url: _url,
            method: 'GET'
        }).success(function (data, header, config, status) {
            //响应成功
            $scope.content = data[0].content;
            $scope.secondtitle = data[0].date;
            $('#popDiv').html('<a href="javascript:closeDiv()">关闭窗口</a></br>'+data[0].content);
            document.getElementById('popDiv').style.display = 'block';
            document.getElementById('bg').style.display = 'block';

        }).error(function (data, header, config, status) {
            //处理响应失败
            alert('获取数据失败.');
        });
    }
}