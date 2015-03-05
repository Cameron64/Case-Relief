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
            templateUrl: 'slider.html',
            controller: function($scope){
                $scope.album = [
                                { image: "img/phones/1.jpg", description: "On Sale Now" },
                                { image: "img/phones/2.jpg", description: "Our Strongest case yet" },
                                { image: "img/phones/3.jpg", description: "Strong and Beautiful, all at once"}
                ];
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
                    $scope.direction = 'left';
                    $scope.currentIndex = ($scope.currentIndex == 0) ? $scope.album.length - 1 : --$scope.currentIndex;
                
                };
                
                $scope.nextSlide = function () {
                    $scope.direction = 'right';
                    $scope.currentIndex = ($scope.currentIndex < $scope.album.length - 1) ? ++$scope.currentIndex : 0 ;
                    
                };

                $scope.showNavPannelLeft = false;
                $scope.showNavPannelRight = false;
                
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
                    TweenMax.to(element, .5, { left: finishPoint, onComplete: done });
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

                    TweenMax.fromTo(element, 0.5, { left: startPoint }, { left: 75, onComplete: done });
                }
                else {
                    done();
                }
            }
        };
    });
        



   

})();