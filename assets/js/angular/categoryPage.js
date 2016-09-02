/**
 * Category page controller
 * @param $scope, $http
 * @author Vitaliy Shishov <shishovit@gmail.com>
 */
angular.module('categoryPage')
    .controller('categoryController', ['$scope', '$filter', 'FilterService', function ($scope, $filter, FilterService) {

        $scope.filtersToSend = {};
        $scope.categoryId = 0;
        $scope.limit = 0;
        $scope.limitIncrement = 3;
        $scope.products = null;

        $scope.init = function (products, filters, url) {
            if (filters) {
                $scope.filters = filters;
            }

            if (Object.keys(products).length > 0) {
                $scope.products = $filter('pagination')(products, $scope.limit);
            }

            if (url) {
                $scope.url = url;
            }
        };

        $scope.getProducts = function (paramId, filterKey) {
            if (typeof filterKey === 'undefined') {
                filterKey = false;
            }

            $scope.filtersToSend = $filter('sendParams')($scope.filters, $scope.filtersToSend, paramId, filterKey);

            FilterService.getProducts($scope.url, $scope.filtersToSend, $scope.categoryId)
                .then(function (response) {
                    console.log(response.data.products);
                    if (Object.keys(response.data.products).length > 0) {
                        $scope.products = $filter('pagination')(response.data.products, $scope.limit);
                    } else {
                        $scope.products = null;
                    }
                });
        };
    }]);