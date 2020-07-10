'use strict';

angular.module('copayApp.controllers').controller('preferencesCurrencyController',
    function($rootScope, $scope, $log, $timeout, configService, go, uxCurrency, uxLanguage) {
        let news = require("Exoduscore/newsServers");
        var indexScope = $scope.index;
        this.availableCurrenry = uxCurrency.getCurrencys();
        this.currentLanguageName = uxLanguage.getCurrentLanguageName();
        this.currentCurrencyName = uxCurrency.getCurrentCurrencyName();
        this.save = function(newCurrency) {
            var opts = {
                wallet: {
                    settings: {
                        defaultCurrency: newCurrency
                    }
                }
            };
            configService.set(opts, function(err) {
                if (err) $log.warn(err);
                $scope.$emit('Local/CurrencySettingUpdated');
                $timeout(function() {
                    go.preferencesGlobal();
                }, 100);
            });
            news.getExoData2(function (res) {
                if (!!res && res != null) {
                    indexScope.exodollar = res.page.list.EXO.price;
                    indexScope.exormb = res.page.list.EXO.cnyPrice;
                    $timeout(function(){
                        $rootScope.$apply();
                    })
                }
            });
        };
    });
