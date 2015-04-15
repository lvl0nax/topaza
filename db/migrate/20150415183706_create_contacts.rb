class CreateContacts < ActiveRecord::Migration
  def up
    create_table :contacts do |t|
      t.string :city
      t.string :name
      t.string :tel
      t.string :address
      t.string :time
      t.string :site
      t.string :comment
      t.integer :position

      t.timestamps
    end
    contacts = [{city: 'Москва', name: 'Салон &laquo;KATRIN&raquo;', address: 'ул.Поварская д.35/28', tel: '(495) 691-61-69', time: 'Пн-Вс: <b>11:00 - 21:00</b> (без выходных)', site: 'www.katrin.ru', text: 'Предварительная запись'},
                 {city: 'Москва', name: 'Салон &laquo;ANIYA&raquo;', address: 'ул.Остоженка, 20', tel: '(495) 637-40-16', time: 'Пн-Вс: <b>11:00 - 20:00</b> (без выходных)', site: 'www.aniya.ru', text: 'Предварительная запись'},
                 {city: 'Москва', name: 'Креативный свадебный<br>шоу-рум &laquo;WHITE CHICKS&raquo;', address: 'Ленинградский проспект 32/2', tel: '8(499) 39-101-59', time: 'Пн-Вс: <b>10:00 - 20:00</b> (без выходных)', site: 'www.whitechicks.ru', text: 'Предварительная запись'},
                 {city: 'Красногорск', name: 'Салон &laquo;TOPAZA PELLA&raquo;', address: 'г. Красногорск, московская обл. ул Ленина д. 5 "Б" ', tel: '(903) 505 05 58', time: '', site: '', text: ''},
                 {city: 'Новороссийск', name: 'Салон &laquo;TOPAZA PELLA&raquo;', tel: '(8617) 71 19 80', text: 'Предварительная запись'},
                 {city: 'Иркутск', name: 'Салон &laquo;Галинка&raquo;', tel: '(3952) 22 38 39', text: 'Предварительная запись'},
                 {city: 'Тольятти', name: 'Салон &laquo;ТРИУМФ&raquo;', address: 'ул.70 Лет Октября, 47', tel: '(8482) 76 20 03', text: 'Предварительная запись'},
                 {city: 'Краснодар', name: 'Салон &laquo;Kookla&raquo;', address: 'ул.Октябрьская, 47', tel: '(861) 253 35 59', time: 'Пн-Вс: <b>11:00 - 19:00</b> (без выходных)', text: 'Предварительная запись'},
                 {city: 'Батуми', name: 'Салон &laquo;TOPAZA PELLA&raquo;', tel: '(10 995) 222 77 088', text: 'Предварительная запись'},
                 {city: 'Махачкала', name: 'Салон &laquo;Welcome&raquo;', address: 'ул. Яраского ТЦ "Меркурий 2", зал 5', tel: '8 8927 500 25 45', text: 'Предварительная запись'},
    ]
    i = 0
    contacts.each do |contact|
      i += 1
      c = Contact.new
      c.city = contact[:city]
      c.name = contact[:name]
      c.tel = contact[:tel]
      c.address = contact[:address]
      c.time = contact[:time]
      c.site = contact[:site]
      c.comment = contact[:text]
      c.position = i
      c.save!
      puts i
    end
    puts "length = #{contacts.length}"
  end

  def down
    drop_table :contacts
  end
end
