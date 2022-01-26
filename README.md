# 3. Hafta Ödev
Veritabanı 
1. Patikadev yapısını düşünerek bir db oluşturun
  - eğitimler, öğrenciler,katılımcılar,eğitmenler,asistanlar, eğitimde öğrencilerin yoklamalarının ve başarı durumlarının tutulduğu tablolar olacaktır.
  - veritipleri ve ilişkiler belirtilmelidir.
2. trigger yazın
  - öğrenci yoklaması girildiğinde. yoklama durumuna göre başarı durumunu hafta bazlı olarak güncelleyin.(Örn: eğitim 7 hafta olsun. ilk iki hafta derslere katıldı ise başarı oranı 2/7 nin % olarak karşılı olmalı.)
3. stored procedure yazın
  - öğrencileri eğitimlere ekleyen bir procedure olacak. öğrenci belirtilen eğitim tarihinde herhangi başka bir eğitime kayıtlı olmamalıdır.
4. view yazın
  - eğitim bazlı öğrencileri listeleyin(gruplu olarak)

# Bonus
- Aynı yapıyı ef code first olarak sadece model bazında oluşturun


# 3. Hafta Ödev
1.Db oluşturdum.
  - Teachers tablosuna veri eklemek için spCreate_Teacher
  - Educations tablosuna veri eklemek için spCreate_EDU
  - her hangi bir eğitim için yoklama oluşturmak için spCreate_RollCall
  - eğitimler ile öğrencileri ilişkilendirmek için spAddStudentToEdu
  - bir öğrenci için yoklama almak için spTake_RollCall stored procedureleri kullanılabilir.
  
2.STUDENTS_ROLLCALLS tablosu altında tgSuccessStatusUpdate after triggeri var.Bu tabloya insert işleminden sonra EDU_STUDENTS tablosundaki SuccesStatus propunu yüzde biçiminde güncelliyor.

3.spAddStudentToEdu stored proceduresi verilen kısıtlamaya uygun çalışıyor.

4.vwStudentListByEDU viewi bulunuyor.

# Bonus
ek ders işlendikten sonra yapılacak.
