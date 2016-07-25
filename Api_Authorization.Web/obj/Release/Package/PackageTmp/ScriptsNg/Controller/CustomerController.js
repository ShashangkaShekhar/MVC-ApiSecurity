
AppSecurity.controller('customerCtrl', ['$scope', '$http', 'crudService',
function ($scope, $http, crudService) {

    $scope.customerManager = {
        pagesize: 100,
        pagenumber: 0,
        custurl: '/api/Customer/GetCustomers',
        methodtype: null,

        //Http Get Customer 
        getcustomer: function () {
            $scope.customers = [];
            $scope.customerManager.methodtype = 'get';
            var headerToken = { 'AuthorizedToken': $scope.tokenManager.generateSecurityToken($scope.customerManager.methodtype) };

            //Service call
            var url = $scope.customerManager.custurl + '/' + $scope.customerManager.pagenumber + '/' + $scope.customerManager.pagesize;
            var cust = crudService.get(url, headerToken);
            cust.then(function (response) {
                $scope.result = 'Customer records(' + response.data.customer.length + ') : HTTP-' + response.status;
                $scope.customers = response.data.customer;
            },
            function (error) {
                $scope.result = 'Limited access(Unauthorized) : HTTP-' + error.status;
            });
        },
        savecustomer: function () {
            $scope.customerManager.methodtype = 'post';
        },
        updatecustomer: function () {
            $scope.customerManager.methodtype = 'put';
        },
        deletecustomer: function () {
            $scope.customerManager.methodtype = 'delete';
        },
    };
}]);