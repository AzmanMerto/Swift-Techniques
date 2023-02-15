import UIKit

//MARK: - Sabit Değerler (let)
/// Yazılımda değiştirilmeyecek değerler için kullanırız. Genellikle bir sunucudan veri çekeceğimiz adresten yada kullanıcının doğum tarihi gibi kalıplaşmış ve değişmeyeceğine inandığımız değerler için kullanılır. İlk başta bunları tamamlarız daha sonra kodumuza devam edebiliriz.

let doğumTarihi = 1999
let popülerSite = "https://github.com/NomoteteS"

  print(doğumTarihi)
  print(popülerSite)

//MARK: - //


//MARK: - Değişken Değerler (var)
/// Değişmeyen değerler olduğu gibi değişen değerlerde vardır. Bu değerleri kullanıcının yaşı gibi yada kullanıcı adı gibi istenilen veya zorunda kaldığı zaman değişecek değerlerdir.

var yaş = 24
var kullanıcıAdı = "NomoteteS"

   print(yaş)
   print(kullanıcıAdı)

yaş = 18
kullanıcıAdı = "sonSwiftBükücüsü"

   print(yaş)
   print(kullanıcıAdı)

//MARK: - //


//MARK: - Türler (Int, Double, Bool, String)
/// Değer atama yaparken değerlerin yapılarını ve kimliklerini belirlemek zorunda kaldığımız senaryolar oluyor. Bunun için de biz türleri kullanıyoruz.

var yaşım : Int = 24 /// Tam bir sayı kullanırken kullandığımız tür.

var boyum : Double = 1.70 /// Ondalıklı bir sayı kullanırken kullandığımız tür.

var kimimBen : String = "Benim adım Mert 23 yaşındayım ve 1.70 boyundayım" /// Yazı kullanırken kullandığımız tür.

var kendimiTanıttımMı : Bool = true /// doğru(true) ve yanlış(false) değerleri kullanırken kullandığımız tür.

/// Üst tarafta yeterince kendimi tanıttım olarak düşünürken. Size aklınızda oluşan veya oluşmasını beklediğim bir soruyu cevaplamak isterim. (yaşım) ve (boyum) farkını anlamış olmanızı düşünüyorum. Peki ya neden biz String içinde bu değerleri kullanmıyoruz diye soru gelirse cevabım şu şekilde olacaktır.

var şuAnkiTarihInt : Int = 2023 /// Elimizde iki tane tarih var ve bunlardan çıkarıp asıl yaşımı bulacağız.
var doğumTarihimInt : Int = 1999

print(şuAnkiTarihInt - doğumTarihimInt)

var şuAnkiTarihString = "2023" /// Şimdi ise bunları String türünde yapmaya çalışınca hata verecektir. İstersen alt tarafta dene.
var doğumTarihimString = "1999"

//print(şuAnkiTarihString - doğumTarihimString)  // Burası

/// Burada anlatmaya çalıştığım sayılar ile işlemlerimiz çok kolay oluyor. Fazla detaya girmeden hızlı bir bootcamp'e devam ederlim.

//MARK: - //


// MARK: - İpuç Notları

