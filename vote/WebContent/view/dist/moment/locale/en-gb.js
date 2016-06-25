//! moment.js locale configuration
//! locale : chinese (zh-cn)
//! author : suupic : https://github.com/suupic
//! author : Zeno Zeng : https://github.com/zenozeng

(function (global, factory) {
   typeof exports === 'object' && typeof module !== 'undefined' ? factory(require('../moment')) :
   typeof define === 'function' && define.amd ? define(['moment'], factory) :
   factory(global.moment)
}(this, function (moment) { 'use strict';


    var zh_cn = moment.defineLocale('en-gb', {
        months : 'һ��_����_����_����_����_����_����_����_����_ʮ��_ʮһ��_ʮ����'.split('_'),
        monthsShort : '1��_2��_3��_4��_5��_6��_7��_8��_9��_10��_11��_12��'.split('_'),
        weekdays : '������_����һ_���ڶ�_������_������_������_������'.split('_'),
        weekdaysShort : '����_��һ_�ܶ�_����_����_����_����'.split('_'),
        weekdaysMin : '��_һ_��_��_��_��_��'.split('_'),
        longDateFormat : {
            LT : 'Ah��mm��',
            LTS : 'Ah��m��s��',
            L : 'YYYY-MM-DD',
            LL : 'YYYY��MMMD��',
            LLL : 'YYYY��MMMD��Ah��mm��',
            LLLL : 'YYYY��MMMD��ddddAh��mm��',
            l : 'YYYY-MM-DD',
            ll : 'YYYY��MMMD��',
            lll : 'YYYY��MMMD��Ah��mm��',
            llll : 'YYYY��MMMD��ddddAh��mm��'
        },
        meridiemParse: /�賿|����|����|����|����|����/,
        meridiemHour: function (hour, meridiem) {
            if (hour === 12) {
                hour = 0;
            }
            if (meridiem === '�賿' || meridiem === '����' ||
                    meridiem === '����') {
                return hour;
            } else if (meridiem === '����' || meridiem === '����') {
                return hour + 12;
            } else {
                // '����'
                return hour >= 11 ? hour : hour + 12;
            }
        },
        meridiem : function (hour, minute, isLower) {
            var hm = hour * 100 + minute;
            if (hm < 600) {
                return '�賿';
            } else if (hm < 900) {
                return '����';
            } else if (hm < 1130) {
                return '����';
            } else if (hm < 1230) {
                return '����';
            } else if (hm < 1800) {
                return '����';
            } else {
                return '����';
            }
        },
        calendar : {
            sameDay : function () {
                return this.minutes() === 0 ? '[����]Ah[����]' : '[����]LT';
            },
            nextDay : function () {
                return this.minutes() === 0 ? '[����]Ah[����]' : '[����]LT';
            },
            lastDay : function () {
                return this.minutes() === 0 ? '[����]Ah[����]' : '[����]LT';
            },
            nextWeek : function () {
                var startOfWeek, prefix;
                startOfWeek = moment().startOf('week');
                prefix = this.unix() - startOfWeek.unix() >= 7 * 24 * 3600 ? '[��]' : '[��]';
                return this.minutes() === 0 ? prefix + 'dddAh����' : prefix + 'dddAh��mm';
            },
            lastWeek : function () {
                var startOfWeek, prefix;
                startOfWeek = moment().startOf('week');
                prefix = this.unix() < startOfWeek.unix()  ? '[��]' : '[��]';
                return this.minutes() === 0 ? prefix + 'dddAh����' : prefix + 'dddAh��mm';
            },
            sameElse : 'LL'
        },
        ordinalParse: /\d{1,2}(��|��|��)/,
        ordinal : function (number, period) {
            switch (period) {
            case 'd':
            case 'D':
            case 'DDD':
                return number + '��';
            case 'M':
                return number + '��';
            case 'w':
            case 'W':
                return number + '��';
            default:
                return number;
            }
        },
        relativeTime : {
            future : '%s��',
            past : '%sǰ',
            s : '����',
            m : '1 ����',
            mm : '%d ����',
            h : '1 Сʱ',
            hh : '%d Сʱ',
            d : '1 ��',
            dd : '%d ��',
            M : '1 ����',
            MM : '%d ����',
            y : '1 ��',
            yy : '%d ��'
        },
        week : {
            // GB/T 7408-1994������Ԫ�ͽ�����ʽ����Ϣ���������ں�ʱ���ʾ������ISO 8601:1988��Ч
            dow : 1, // Monday is the first day of the week.
            doy : 4  // The week that contains Jan 4th is the first week of the year.
        }
    });

    return zh_cn;

}));