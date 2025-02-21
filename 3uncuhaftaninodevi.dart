import 'dart:ffi';
import 'dart:io';

void main() {
// Akilli Ev Otomasyan Sistemi
  // 1. Oda Yonetimi
      //  a- Odalari tutan bir Map olusturun (Oda numarasi, odanin ismi)
      //  b- En az 4 oda ekleyin (1 salon, 2 mutfak ...)
      //  c- Bir numarasini verdigimiz odanin ismini donduren fonksiyon yazin
      //  d- Odanin ismini verdigimiz ve numarasini donduren fonskiyon yazin

  // a,b- Odalari tutan bir Map olusturun

  Map<String, int> rooms = { //rooms adında bir map inşa ediyorum
    'Kitchen': 1,
    'Bedroom': 2,
    'Salon': 3,
    'Bath': 4,
    'LivingRoom': 5
  };
  print('Odalar ve Numaraları: $rooms'); // burda mapi yazdırıyorum (süslü parantez içerisinde yazdırır)

  // c- Bir numarasini verdigimiz odanin ismini donduren fonksiyon yazin

  int aradiginizNumara = 2;  // Aradığınız oda numarası için int değişkeni
  bool odaBulundu = false;   // Odanın bulunmama durumu için bool olarak bir değişken atıyorm
    for (var items in rooms.entries) { // girilenleri items olarak var değişkeninde eşliyorum
      if (items.value == aradiginizNumara) { // eğer aradığım value(değer(2)) itemsin içinden eşleşiyorsa
        print("Oda ismi: ${items.key}"); // mapin key bölümü yani ismini yazdır
        odaBulundu = true; // yazdırılabiliyor olduğu için true olarak değişkeni if altında güncelliyorum
        break; // üst üste çağıracağım for döngülerinin çalışması için duraksama gibi
      }
    }

  if (!odaBulundu) { // ! işareti tersine çevirmek anlamına gelir ve bool değerlerde kullanılır
    print('Böyle bir oda sayısı yok');
  }

  //  d- Odanin ismini verdigimiz ve numarasini donduren fonskiyon yazin

String aradiginizOdaIsmi = 'Bedroom';  // Aradığınız oda ismi için String değişkeni

  bool odaIsmiBulundu = false; // Odanın bulunmama durumu için bool olarak bir değişken atıyorum
  for (var items in rooms.entries) { // girilenleri items olarak var değişkeninde eşliyorum
    if (items.key == aradiginizOdaIsmi) { // eğer aradığım key(değer('')) itemsin içinden eşleşiyorsa
      print("Oda numarası: ${items.value}"); //mapin value bölümü yani oda numarası(int) yazdır
      odaIsmiBulundu = true; // bir üstte isimler çakışmasın diye oda ismi bulundu değişkeni yaptım
      break;
    }
  }

  if (!odaIsmiBulundu) {
    print('Böyle bir oda ismi yok');
  }

// 2. Isik Kontrolu
    // a- Odalarin isik durumunu kontrol eden bir Map (Oda numarasi, acik kapali)
    // b- Kac tane odanin isiginin acik oldugunu donduren bir fonksiyon yazin

  // a- Odalarin isik durumunu kontrol eden bir Map (Oda numarasi, acik kapali)

  Map<int, bool> roomStat = { // açık olma durumunu bool olarak yazıyorum
    1:true,
    2:false,
    3:true,
    4:false
  };
print(roomStat); // şart değil sadece test için

  // b- Kac tane odanin isiginin acik oldugunu donduren bir fonksiyon yazin

  for (var oda in roomStat.entries) {
    if (oda.value == true) { // girilenleri oda olarak var değişkeninde eşliyorum ve koşul olarak true ya == eşitliyorum 
      print("Işığı açık olan odalar: ${oda.key}"); // true değerinde olanlar yazdırılıyor
    }
  }

// 3. Sicaklik Takibi
    // a- Her odanin sicakligini tutan bir Map (Oda numarasi, sicaklik)
    // b- En sicak ve en soguk odayi bulan bir fonksiyon
    // c- Ortalama ev sicakligini bulan bir fonksiyon

  // a- Her odanin sicakligini tutan bir Map (Oda numarasi, sicaklik)

  Map<String, int> roomTemperatures = {
  'Kitchen': 22,
  'Bedroom': 18,
  'Salon': 24,
  'Bath': 19,
  'LivingRoom': 21
};

  // b- En sicak ve en soguk odayi bulan bir fonksiyon

  String enSicakOda = roomTemperatures.keys.first; // oda sıcaklığı key'inin ilkini string yapıyorum
  String enSogukOda = roomTemperatures.keys.first; // ve soğuk oda içi de aynı şekil
  int enYuksek = roomTemperatures[enSicakOda]!; // en sıcak odanın değerini int olarak enYuksek değişkeni yapıyorum
  int enDusuk = roomTemperatures[enSogukOda]!; // ve aynı

  for (var sicakliklar in roomTemperatures.entries) { // roomTemperatures mapini 'sicakliklar' değişkenini variable olarak eşliyorum
    if (sicakliklar.value > enYuksek) {  // eğer sicakliklar value yani değeri En yuksekten buyuk olarak
      enYuksek = sicakliklar.value;  // ise bu
      enSicakOda = sicakliklar.key; // ve En sıcaktır ve keyi dir
    }
    if (sicakliklar.value < enDusuk) { // en düşükten dedüşükse
      enDusuk = sicakliklar.value; // ise bu
      enSogukOda = sicakliklar.key; // ve en soğuktur ve keyi dir
    }
  }

  print('En sıcak oda: $enSicakOda, Sıcaklık: $enYuksek°C'); // yazdır
  print('En soğuk oda: $enSogukOda, Sıcaklık: $enDusuk°C'); // yazdır

  // c- Ortalama ev sicakligini bulan bir fonksiyon

  int toplamSicaklik = 0; // null yazmak istemediğim için 0 yazdım işlem yaparak değişken içi zaten değişecek
  int odaSayisi = roomTemperatures.length; // mapin eleman endex uzunluğuna eşitlendi

  for (var ort in roomTemperatures.entries) {  // ort yaparak içerisinde döndürüyoruz
    toplamSicaklik += ort.value; // toplam sıcaklığa değerlerin eklenmesi için
  }

  double ortalamaEvSicakligi = toplamSicaklik / odaSayisi; // toplam sıcaklığı sayısına bölüp tam sayı gelemeyebileceğinden double değişkenine atıyoruz
print('Ortalama ev sıcaklığı: $ortalamaEvSicakligi°C'); // yazdırıyoruz

}

