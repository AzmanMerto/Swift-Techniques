import UIKit

//MARK: - Kontrol akışı(if, if else, ==, !=, >, >=, <, <=, !=, &&, ||)
/// Kontrol akışlarını kullanıcı seçimi ile yada bi eylemden sonra uygulanacak işlem için kullanırız. Öncellikle gördüğümüz operatörlerden örnek verelim.

var derece = 30 /// Burada derece olarak atadğımızı değişkeni 100 eşitledik.

// Şimdi odanın derecesine göre kontrol akışı yazalım. Kontrol akışı sağlamak için if veya if else şekilde veriyi işlememiz gerekiyor.

if derece > 30 { /// Odanın sıcaklığı 30 dereceden büyük ise sıcak az ise
    print("Oda çok sıcak\(derece)")
} else {
    print("Oda çok soğuk\(derece)")
}

// Bunun gibi değer kontrol ettiklerimiz var.

if derece == 30 {} /// Eşit ise
if derece != 30 {} /// Eşit değil ise
if derece > 30 {} /// Büyük ise
if derece >= 30 {} /// Büyük eşit ise
if derece < 30 {} /// Küçük ise
if derece <= 30 {} /// Küçük eşit ise
if derece != 30 {} /// Değil ise

// Fark ettiğiniz gibi aslında verdiğimiz değer doğru mu yanlış mı olarak da çevirebiliyoruz. Bundan dolayı da bize iki tane değeri kontrol etmemizi kolaylaştırıyor. Burada daha iyi anlamamız için bi tane daha değer ekliyoruz.

var benimDerecem = 60

if (derece > 20) && (benimDerecem > 50)  {
     print("Derecelerimzi yüksek")
} else if (derece < 40) && (benimDerecem > 50) { /// Burada asıl mantığını anlamak için biri yanlış biri doğru şekilde koyduk
    print("Birimizin derecesi düşük")
}

// Kısaca önemli bir tüyo vermem gerekir ise bu iki operötör iki farklı değerin doğru olup olmadığını kontrol ederek if(eğer) kontrölü sağlamamızı yarıyor.

if (derece > 20) && (benimDerecem > 50) {} // İkisi de doğru ise
if (derece > 20) || (benimDerecem > 50) {} // Sadece biri doğru ise


//MARK: - Belirli Kontrol Akışı (switch, case)

// Değerlerin neler doğru olduğunu belirlemizi sağlayan bir kontrol akışıdır.

var matematikSınavPuanım = 50

switch matematikSınavPuanım { /// Burada 50 değeri girdiğimizde alttaki kontrol değeri aktif oluyor.
case 20
    : print("Kaldım")
    
case 50
    : print("Geçtim")
    
case 80
    : print("Süperim")
    
case 100
    : print("Mükemmelim")
    
default:
    print("Not Girilmedi Galiba")
}
