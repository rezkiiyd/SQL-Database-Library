-- menampilkan data di tabel have
select * from have;

-- menampilkan store id dan alamat store
select s.store_ID, s.address
from store s;

-- menampilkan store id dan harga buku dalam K 
select s.store_ID, s.book_price / 1000 as 'Harga buku dalam K'
from store s;

-- menampilkan total harga yang dibeli oleh perpustakaan jika dikenakan pajak 10% untuk setiap transaksi
select p.total_price, (p.total_price * 1.1) + p.total_price as 'Total Harga setelah Pajak'
from purchasing p;

-- menampilkan tanggal meminjam buku antara bulan 1 sampai 3
SELECT d.date_borrowed AS 'Tanggal Peminjaman Buku Awal Tahun'
FROM dateborrowedt d
WHERE EXTRACT(MONTH FROM d.date_borrowed) BETWEEN 1 AND 3;

SELECT DATE(d.date_borrowed) AS 'Tanggal Peminjaman Buku Awal Tahun'
FROM dateborrowedt d
WHERE DAY(d.date_borrowed) BETWEEN 1 AND 21;

-- menampilkan rata rata penalty fee yang dimiliki oleh member di perpustakaan
select avg(p.penalty_fee) as 'rata-rata'
from penaltydatet p;

-- menampilkan total harga buku dari store
select sum(s.book_price) as totalHargaBuku
from store s;

-- menampilkan jumlah buku yang dimiliki oleh perpustakaan dengan id L0003
select count(b.book_ID) as jumlahBuku, p.library_ID
from book b join have h on b.book_ID = h.book_ID
join library p on h.library_ID = p.library_ID
group by p.library_ID having p.library_ID = 'L0003';

-- menampilkan nama publisher yang mempunyai nama berawalan Pe
select * from publisher p
where p.publisher_name like 'Pe%';

-- menampilkan nama member yang mempunyai nama berawalan J dan diakhiri oleh H
select m.member_name as namaMember
from member m
where m.member_name like 'J%H';

-- menampilkan tanggal suplai di bulan Mei
select s.date_supply as tanggal, s.store_ID
from supplied_by s
where s.date_supply like '%-05-%';

-- menampilkan total harga pruchasing yang kurang dari 2000000
select p.total_price as totalHarga, p.purchasing_ID
from purchasing p 
where p.total_price < 2000000;

-- menampilkan penalty fee dan penalty date yang harga penalty fee nya bukan 10000 dan 20000
select p.penalty_fee, p.penalty_Date
from penaltydatet p
where p.penalty_fee <> 10000 and p.penalty_fee <> 20000 ;

-- menampilkan data dari table buku yang genre nya kosong (null)
select * from book
where book.genre is null;

-- menampilkan data dari table written by yang author's role nya tidak kosong (not null)
select * from written_by w
where w.authors_role is not null;

-- menampilkan nama member dan tanggal meminjam dari yang mempunyai nama dengan awalan J dan S serta meminjam buku di bulan antara bulan Jan sampai Mei
select m.member_name, d.date_borrowed from member m join borrowing b on m.member_ID = b.member_ID
join dateborrowedt d on d.date_borrowed = b.date_borrowed
where (m.member_name like 'J%' or m.member_name like 'S%') and extract(month from d.date_borrowed) between 1 and 5;

select m.member_name, DATE(d.date_borrowed) as tanggal from member m join borrowing b on m.member_ID = b.member_ID
join dateborrowedt d on d.date_borrowed = b.date_borrowed
where (m.member_name like 'J%' or m.member_name like 'S%') and DAY(d.date_borrowed) between 1 and 15;

-- menampilkan payment method, total harga dari payment method 'Tunai' dan total harga lebih dari 100000
select p.payment_method, p.total_price
from purchasing p
where p.payment_method = 'Tunai' and p.total_price > 100000;

-- menampilkan semua data dari table have yang mempunyai number of copies buku di antara 2 samoai 4
select * from have h
where h.number_of_copies between 2 and 4;

-- menampilkan data dari harga buku dan store id yang mempunyai harga buku tidak di antara 150000 sampai 1000000
select store_id, book_price
from store
where book_price not between 150000 and 1000000;

-- menampilkan data tanggal meminjam dari table borrowing dengan tidak memiliki duplikat di data nya
select distinct date_borrowed
from borrowing;

-- menampilkan semua data author yang menjadi translator dan editor
select * from written_by
where authors_role in ('Translator', 'Editor');

-- menampilkan semua data payment method tunai dan kredit
select * from purchasing
where payment_method in ('Kredit', 'Tunai');

-- menampilkan semua data author yang menjadi translator dan editor serta diurutkan berdasarkan tahun publikasi terurut membesar
select * from written_by
where authors_role in ('Translator', 'Editor')
order by publication_year ;

-- menampilkan semua data payment method tunai dan kredit serta diurutkan berdasarkan total harga dan library id terurut mengecil
select * from purchasing
where payment_method in ('Kredit', 'Tunai')
order by total_price desc, library_ID desc;

-- menampilkan nama member, borrowing id dan alamat member dari member yang mempunyai huruf 'il' di dalam nama mereka
SELECT member.Member_Name, borrowing.Borrowing_ID, member.Address
FROM member
INNER JOIN borrowing ON member.Member_ID = borrowing.Member_ID
WHERE member.Member_Name LIKE '%il%';

-- menampilkan penalty id, payment date dan penalty fee dari penalty fee lebih dari 10000
SELECT P1.Penalty_ID,P1.Payment_Date_FK,P2.Penalty_Fee
FROM penalty P1
INNER JOIN penaltyDateT P2 ON P1.Penalty_Date = P2.Penalty_Date AND P2.Penalty_Fee > 10000;

-- menampilkan judul buku, nama author, nama publisher dan website publisher dari buku yang bergenre Fiction
SELECT b.Title, a.author_name, p.Publisher_name, p.website
FROM book b
JOIN author a ON b.Author_ID = a.Author_ID
JOIN publisher p ON b.Publisher_ID = p.Publisher_ID
WHERE b.Genre = 'Fiction';

-- menampilkan id buku, judul buku, nama author, nama publisher dan nama member dari member yang mempunyai huruf 'son' dalam nama mereka dan diurutkan berdasarkan alphabet nama author
SELECT b.Book_ID, b.Title, a.author_name, p.Publisher_name, m.Member_Name
FROM book b
JOIN author a ON b.Author_ID = a.Author_ID
JOIN publisher p ON b.Publisher_ID = p.Publisher_ID
JOIN member m ON b.Book_ID = m.Book_ID
where m.member_name like '%son%'
order by a.author_name;

-- menampilkan tanggal meminjam, member id dan alamat member dari member yang meminjam pada bulan januari
SELECT borrowing.date_borrowed, member.member_ID, member.address
FROM borrowing
NATURAL JOIN member
NATURAL JOIN dateBorrowedT
where borrowing.date_borrowed like '%-01-%';

-- menampilkan semua data perpustakaan dari data yang mempunyai total harga lebih dari 5000000
SELECT *
FROM library
NATURAL JOIN purchasing
WHERE purchasing.total_price > 5000000;

-- menampilkan purchasing id, tanggal purchasing, total harga purchasing, alamat toko dan nomor telpon toko yang telah di left outer join 
-- dengan tabel toko dengan total harga purchasing lebih dari 3000000
SELECT purchasing.purchasing_ID, purchasing.date_purchasing, purchasing.total_price, store.address, store.phone_number
FROM purchasing
LEFT JOIN store ON purchasing.Store_ID = store.Store_ID
where purchasing.total_price <= 3000000;

-- menampilkan semua data dari tabel borrowing yang di full outer join kan ke tabel have dengan number of copies kurang dari 4
SELECT *
FROM borrowing
LEFT JOIN have ON borrowing.Book_ID = have.Book_ID
where have.number_Of_Copies <= 4
UNION
SELECT *
FROM borrowing
RIGHT JOIN have ON borrowing.Book_ID = have.Book_ID
where have.number_Of_Copies <= 4;

-- menampilkan data total price dari purchasing yang di join kan dengan total price dari purchasing itu sendiri 
-- yang mempunyai data payment method transfer bank pada kedua tabel
SELECT P1.Total_Price as price_1, P2.Total_Price as price_2, P2.Payment_Method 
FROM purchasing P1
JOIN purchasing P2 ON P1.Payment_Method = 'Transfer Bank' and P2.Payment_Method = 'Transfer Bank'
WHERE P1.Total_Price <> P2.Total_Price;

-- menampilkan payment date yang digabungkan dengan data payment date table itu sendiri dengan syarat data kedua table tidak boleh sama
-- dimana data-data tersebut memiliki penalty status unpaid dan diurutkan berdasarkan tanggal payment date secara ascending
select p1.payment_date as status1, p2.payment_date as status2, p2.Penalty_status
from paymentdatet p1
join paymentdatet p2 on p1.Penalty_status = 'Unpaid' and p2.Penalty_status = 'Unpaid'
where p1.payment_date <> p2.payment_date
order by p1.payment_date;


-- menampilkan data authors role yang digabungkan dengan data authors role itu sendiri dengan syarat data dari kedua table tidak boleh sama
-- dimana data-data tersebut memiliki publication year 2022
select a1.authors_role as role1, a2.authors_role as role2, a2.publication_year
from written_by as a1 
join written_by as a2 on a1.publication_year = '2022' and a2.publication_year = '2022'
where a1.authors_role <> a2.authors_role;

-- menampilkan nama member yang meminjam buku lebih dari dua
SELECT member.Member_ID,book.Book_ID, member.Member_Name, COUNT(book.Book_ID) AS Total_Books
FROM member
JOIN book ON member.Book_ID = book.Book_ID
GROUP BY member.member_ID, book.Book_ID, member.Member_Name
HAVING Total_Books >= 2;

-- menampilkan nama member yang mempunyai besaran penalty lebih dari 10000
SELECT m1.Member_Name, b1.Penalty_Fee
FROM member m1
JOIN borrowing p1 ON m1.member_ID = p1.member_ID
join penalty a1 on a1.Penalty_ID = p1.Penalty_ID
join penaltydatet b1 on b1.Penalty_Date = a1.Penalty_Date
WHERE b1.Penalty_Fee > 10000;

-- menampilkan penalty id dan penalty fee yang kurang dari 1000
select p.Penalty_ID, p1.penalty_Fee
from penalty p join penaltydatet p1 on p.penalty_Date = p1.penalty_Date
where p1.penalty_fee < 10000;

-- menampilkan rata-rata, total, harga tertinggi dan harga terendah dari total harga table purchasing dimana payment method nya transfer bank
select avg(total_price) as rata, sum(total_price) as total, max(total_price) as tertinggi, min(total_price) as terendah
from purchasing
where payment_method = 'Transfer Bank';

-- menampilkan penalty fee terendah dan tertinggi dari member yang meminjam buku di bulan Jan
select max(p.penalty_fee), min(p.penalty_fee), d.date_borrowed
from penaltydatet p join penalty p1 on p.penalty_date = p1.penalty_date
join borrowing b on b.penalty_id = b.penalty_id
join dateborrowedt d on d.date_borrowed = b.date_borrowed
group by d.date_borrowed
having d.date_borrowed like '%-01-%';

-- menampilkan author yang menulis buku lebih dari 2
select a.author_name, count(b.book_id) as jumlahBuku
from author a join book b on b.author_id = a.author_id
group by a.author_name
having jumlahBuku > 2;

-- menampilkan author yang menulis buku lebih dari 2 dan diurutkan berdasarkan alphabet
select a.author_name, count(b.book_id) as jumlahBuku
from author a join book b on b.author_id = a.author_id
group by a.author_name
having jumlahBuku >= 1
order by a.author_name;

-- menampilkan semua data buku yang mempunyai number of copies terbanyak
select * from have
where number_of_copies = (select max(number_of_copies) from have );

-- menampilkan tanggal meminjam dan member id yang memiliki penalty fee terkecil dan diurutkan berdasarkan alphabet 
select distinct b.date_borrowed, b.member_id, p1.penalty_fee from borrowing b
join penalty p on b.penalty_ID = b.penalty_ID
join penaltydatet p1 on p.penalty_date_FK = p1.penalty_date
join paymentdatet p2 on p.payment_date_FK = p2.payment_date
where p1.penalty_fee = (select min(penalty_fee) from penaltydatet)
order by b.member_ID;

-- menampilkan harga buku tertinggi di toko dari payment method transfer bank
select max(Book_Price)
from 
(select s.book_price from store s join purchasing p on p.store_id = s.store_id where p.payment_method = 'Transfer Bank') as hasil;

select max(s.book_price)
from store s join purchasing p using(store_id)
where p.payment_method = 'Transfer bank';

-- menampilkan banyaknya member yang meminjam buku antara tanggal 3 sampai 8
select date(b.date_borrowed) as tanggal, count(m.member_name) as jumlah
from member m join borrowing b using (member_ID) 
where day(b.date_borrowed) between 3 and 8
group by b.date_borrowed;
