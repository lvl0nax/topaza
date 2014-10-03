ymaps.ready(init);

function init () {
    var myMap = new ymaps.Map('contacts_body_map', {
            center: [59.98, 30.45],
            zoom: 11
        }),
        markRudneva = new ymaps.Placemark([60.048392, 30.367005], {
            hintContent: 'Собственный значок метки'
        }, {
            // Опции.
            // Необходимо указать данный тип макета.
            iconLayout: 'default#image',
            // Своё изображение иконки метки.
            iconImageHref: '/assets/mark.png',
            // Размеры метки.
            iconImageSize: [30, 42],
            // Смещение левого верхнего угла иконки относительно
            // её "ножки" (точки привязки).
            iconImageOffset: [-3, -42]
        }),
        markBelinskogo = new ymaps.Placemark([59.937886, 30.344604], {
            hintContent: 'Собственный значок метки'
        }, {
            // Опции.
            // Необходимо указать данный тип макета.
            iconLayout: 'default#image',
            // Своё изображение иконки метки.
            iconImageHref: '/assets/mark.png',
            // Размеры метки.
            iconImageSize: [30, 42],
            // Смещение левого верхнего угла иконки относительно
            // её "ножки" (точки привязки).
            iconImageOffset: [-3, -42]
        });

    myMap.geoObjects.add(markRudneva);
    myMap.geoObjects.add(markBelinskogo);
}