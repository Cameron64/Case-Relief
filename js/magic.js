(function () {

    var app = angular.module('disasterSite', ['ngStorage','ngAnimate']);
    app.controller('TabController', ['$scope', '$localStorage', function ($scope, $localStorage) {

        $scope.$storage = $localStorage.$default({
            home: 0,
            about: 0,
            contact: 0
        });

    }]);

    app.directive('carousel', function(){
        return{
            restrict: 'E',
            templateUrl: 'directives/slider.html',
            controller: function($scope, $interval){
                $scope.album = [
                                { image: "img/phones/1.jpg", description: "On Sale Now" },
                                { image: "img/phones/2.jpg", description: "Our Strongest case yet" },
                                { image: "img/phones/3.jpg", description: "Strong and Beautiful, all at once"}
                ];
                $scope.showNavPannelLeft = false;
                $scope.showNavPannelRight = false;
                $scope.direction = 'left';
                $scope.currentIndex = 0;
                
                $scope.setCurrentSlideIndex = function (index) {
                    $scope.direction = (index > $scope.currentIndex) ? 'left' : 'right';
                    $scope.currentIndex = index;
                };

                $scope.isCurrentSlideIndex = function (index) {
                    return $scope.currentIndex === index;
                };

                $scope.prevSlide = function () {
                    $scope.direction = 'right';
                    $scope.currentIndex = ($scope.currentIndex == 0) ? $scope.album.length - 1 : --$scope.currentIndex;
                
                };
                
                $scope.nextSlide = function () {
                    $scope.direction = 'left';
                    $scope.currentIndex = ($scope.currentIndex < $scope.album.length - 1) ? ++$scope.currentIndex : 0 ;
                    
                };

                }
        }

    });

    app.animation('.slide-animation', function () {
        return {
            beforeAddClass: function (element, className, done) {
                var scope = element.scope();
                if (className == 'ng-hide') {
                    var finishPoint = element.parent().width();
                    
                    if (scope.direction !== 'right') {
                        finishPoint = -finishPoint;
                    }
                    TweenMax.to(element, .25, { left: finishPoint, onComplete: done });
                }
                else {
                    done();
                }
            },
            removeClass: function (element, className, done) {
                var scope = element.scope();

                if (className == 'ng-hide') {
                    element.removeClass('ng-hide');

                    var startPoint = element.parent().width();
                    if (scope.direction === 'right') {
                        startPoint = -startPoint;
                    }

                    TweenMax.fromTo(element, 0.25, { left: startPoint }, { left: 75, onComplete: done });
                }
                else {
                    done();
                }
            }
        };
    });
        
    app.directive('reviews', function () {
        return {
            restrict: 'E',
            templateUrl: 'directives/reviews.html',
            controller: function ($scope) {

                $scope.reviews = [
                    { name: "CNN", photo: "img/reviews/cnn.jpg", title: "Charity Will Never be the Same", review: "Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Ipsum " },
                    { name: "BBC News", photo: "img/reviews/bbc.jpg", title: "Charity Will Never be the Same", review: "Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum  Ipsum " },
                    { name: "Forbes Magazine", photo: "img/reviews/forbes.jpg", title: "Charity Will Never be the Same", review: "Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsumem Ipsum " }


                ]

            }
        }
    });

    app.directive('shop', function () {
        return {
            restrict: 'E',
            templateUrl: 'directives/shop.html',
            controller: function ($scope, $window) {
            }
        }
    });

    app.controller('shopping', function ($scope,$window,$filter,$localStorage) {
        $scope.dataRecieved1 = transcribe1($window.dr);
        $scope.dataRecieved = JSON.parse($scope.dataRecieved1);
        $scope.dataLength = $scope.dataRecieved.length;
       
        function transcribe1(array) {
            array2 = "";
            for (var i = 0; i < array.length; i++) {
                if (array.charAt(i) == "'") {
                    array2 += '"';
                } else {
                    array2 += array.charAt(i);
                }
            }
            return array2;
        }

        $filter('range');
        
            
        $scope.selectedStars = 1;

        $scope.$storage = $localStorage.$default({
            products: []
           
        });

        $scope.getBasketIndex = function (arr, value) {

            for (var i = 0, iLen = arr.length; i < iLen; i++) {

                if (arr[i].Name == value) return i;
            }
        }

        $scope.toCheckOut = function () {
            window.location = "Cart.aspx";
        }
    });
   

    app.controller('cart', function ($scope, $localStorage) {

        $scope.$storage = $localStorage.$default({
            products: [],
            shipping: {}
        });

        $scope.prices = [{ name: 'Standard ($3.15)', price: 3.15 }, { name: 'Expedited ($5.49)', price: 5.49 }];
        $scope.subTotal = function () {
            var total = $scope.total($scope.$storage.products);
            return total / 8.25 + total;
        }
        $scope.grandTotal = function () {
            return $scope.subTotal() + $scope.shipping.price;
        }
        
         $scope.getBasketIndex = function (arr, value) {

            for (var i = 0, iLen = arr.length; i < iLen; i++) {

                if (arr[i].Name == value) return i;
            }
         }
         $scope.initDropdown = function () {
             for (var i = 0; i < $scope.prices.length; i++) {
                 if ($scope.prices[i].name == 'Standard ($3.15)') {
                     $scope.shipping = $scope.prices[i];
                 }
             }
         }
         $scope.toPay = function () {
             
                 window.location = "BillingInfo.aspx";
             
         }

         $scope.total = function (arr) {
             var returnTotal = 0;
             for (var i = 0, iLen = arr.length; i < iLen; i++) {

                 returnTotal += arr[i].Price * arr[i].Quantity;
             }
             return returnTotal;
         }
        
             $scope.$watch('shipping', function(new_val, old_val){
                 $scope.$storage.shipping = new_val;
             });
         
    });

    app.controller('bill', function ($scope, $localStorage) {


    });

    app.filter('range', function () {
        return function (input, total) {
            total = parseInt(total);
            for (var i = 0; i < total; i++)
                input.push(i);
            return input;
        };
    });
   
    app.controller('billing',['$scope','$window', function ($scope,$window) {
       
    }]);
    app.controller('thankYou', ['$scope', '$window', '$localStorage', function ($scope, $window,$localStorage) {
        $scope.$storage = $localStorage.$default({
        });
        $scope.response = "";
        $scope.getService = function () {
          
            $.ajax({
                type: "POST",
                url: "ThankYou.aspx/Process",
                data: JSON.stringify({ 'Product': $scope.$storage.products }),
                contentType: "application/json;charset=utf-8",
                dataType: "json",
                async: true,
                cache: false,
                success: function (e) {
                    console.log(e.d.Success);
                    if (e.d.Success) {
                        
                    } else {
                        $scope.response = "The product quantity requested cannot be supplied. Please retry your order.\n Product: "
                        + e.d.Product + " Quantity: " + e.d.Quantity;
                        $scope.showMain = true;
                        $scope.showRedirect = true;
                        $scope.$apply();
                        
                    }
                },
                error: function (req,e) { $scope.response = "Fail"; console.log( req); }
            })
            return false;

        };
      
        $scope.subTotal = function () {
            var total = $scope.total($scope.$storage.products);
            return total / 8.25 + total;
        }
        $scope.finalGrandTotal = function () {
            return $scope.subTotal() + $scope.$storage.shipping.price;
        }
      
        $scope.total = function (arr) {
            var returnTotal = 0;
            for (var i = 0, iLen = arr.length; i < iLen; i++) {

                returnTotal += arr[i].Price * arr[i].Quantity;
            }
            return returnTotal;
        }

    }]);
})();