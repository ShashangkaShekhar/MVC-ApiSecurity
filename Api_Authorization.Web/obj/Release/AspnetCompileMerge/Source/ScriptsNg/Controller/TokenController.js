
AppSecurity.controller('tokenCtrl', ['$scope', '$http', 'crudService', '$sessionStorage',
function ($scope, $http, crudService, $sessionStorage) {

    //Token Generate
    $scope.tokenManager = {
        generateSecurityToken: function (methodtype) {
            var username = $sessionStorage.loggeduser;
            var key = methodtype;
            var ip = $sessionStorage.loggedip;
            var userAgent = navigator.userAgent.replace(/ \.NET.+;/, '');
            var message = [username, ip, userAgent].join(':');
            var hash = CryptoJS.HmacSHA256(message, key);
            var token = CryptoJS.enc.Base64.stringify(hash);
            var tokenId = [username, key].join(':');
            var tokenStr = CryptoJS.enc.Utf8.parse([token, tokenId].join(':'));

            //Token Return
            return CryptoJS.enc.Base64.stringify(tokenStr);
        },
    };
}]);