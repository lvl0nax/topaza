class ContactsController < ApplicationController
  def index
    @contacts = [{city: 'Москва', name: 'Салон &laquo;KATRIN&raquo;', address: 'ул. Поварская д.35/28', tel: '(495) 999-99-99', time: 'Пн-Сб: <b>10:00 - 12:00</b> (без выходных)', site: 'www.nasa.gov', text: 'Предварительная запись'},
                 {city: 'Москва', name: 'Салон &laquo;KATRIN&raquo;', address: 'ул. Поварская д.35/28', tel: '(495) 999-99-99', time: 'Пн-Сб: <b>10:00 - 12:00</b> (без выходных)', site: 'www.nasa.gov', text: 'Предварительная запись'},
                 {city: 'Москва', name: 'Салон &laquo;KATRIN&raquo;', address: 'ул. Поварская д.35/28', tel: '(495) 999-99-99', time: 'Пн-Сб: <b>10:00 - 12:00</b> (без выходных)', site: 'www.nasa.gov', text: 'Предварительная запись'},
                 {city: 'Москва', name: 'Салон &laquo;KATRIN&raquo;', address: 'ул. Поварская д.35/28', tel: '(495) 999-99-99', time: 'Пн-Сб: <b>10:00 - 12:00</b> (без выходных)', site: 'www.nasa.gov', text: 'Предварительная запись'},
                 {city: 'Новороссийск', name: 'Салон &laquo;KATRIN&raquo;', address: 'ул. Поварская д.35/28', tel: '(495) 999-99-99', time: 'Пн-Сб: <b>10:00 - 12:00</b> (без выходных)', site: 'www.nasa.gov', text: 'Предварительная запись'},
                 {city: 'Иркутск', name: 'Салон &laquo;KATRIN&raquo;', address: 'ул. Поварская д.35/28', tel: '(495) 999-99-99', time: 'Пн-Сб: <b>10:00 - 12:00</b> (без выходных)', site: 'www.nasa.gov', text: 'Предварительная запись'},
                 {city: 'Тольятти', name: 'Салон &laquo;KATRIN&raquo;', address: 'ул. Поварская д.35/28', tel: '(495) 999-99-99', time: 'Пн-Сб: <b>10:00 - 12:00</b> (без выходных)', site: 'www.nasa.gov', text: 'Предварительная запись'},
                 {city: 'Краснодар', name: 'Салон &laquo;KATRIN&raquo;', address: 'ул. Поварская д.35/28', tel: '(495) 999-99-99', time: 'Пн-Сб: <b>10:00 - 12:00</b> (без выходных)', site: 'www.nasa.gov', text: 'Предварительная запись'},
                 {city: 'Батуми', name: 'Салон &laquo;KATRIN&raquo;', address: 'ул. Поварская д.35/28', tel: '(495) 999-99-99', time: 'Пн-Сб: <b>10:00 - 12:00</b> (без выходных)', site: 'www.nasa.gov', text: 'Предварительная запись'},
                 {city: 'Махачкала', name: 'Салон &laquo;KATRIN&raquo;', address: 'ул. Поварская д.35/28', tel: '(495) 999-99-99', time: 'Пн-Сб: <b>10:00 - 12:00</b> (без выходных)', site: 'www.nasa.gov', text: 'Предварительная запись'},
                ]
  end
end