class phone {
  String id;
  String image;
  String name;
  double price;
  double rate;
  String description;

phone({
    required this.id,
    required this.image,
    required this.name,
    required this.price,
    required this.rate,
    required this.description,
  });
}

List<phone> phoneItems = [
 phone(
    id: '1',
    image:
    'https://images.tokopedia.net/img/cache/500-square/VqbcmM/2023/7/12/747f12e2-95ad-4364-b2ea-f09d4112071b.jpg',
    name: 'iPhone 13 Pro Max',
    price: 1099.9,
    rate: 4.7,
    description:
    "iPhone 13 Pro Max memiliki layar 6,7 inci Super Retina XDR dengan ProMotion untuk tampilan lebih responsif. Ditenagai oleh chip A15 Bionic, perangkat ini dilengkapi dengan sistem tiga kamera 12MP (Telephoto, Wide, dan Ultra Wide) dan LiDAR Scanner. Fitur lainnya termasuk dukungan 5G, baterai yang tahan lama, dan desain tahan air dan debu dengan rating IP68",
  ),
  phone(
      id: '2',
      image:
      'https://images.tokopedia.net/img/cache/500-square/VqbcmM/2022/12/26/11b98dd7-92c3-490c-b9f9-9db62264f455.jpg',
      name: 'iPhone 14 Pro Max',
      price: 1199.9,
      rate: 4.8,
      description:
      "iPhone 14 Pro Max dilengkapi dengan layar Super Retina XDR OLED 6.7 inci, chip A16 Bionic yang sangat cepat, dan sistem kamera pro yang ditingkatkan. Kamera utamanya memiliki sensor 48MP, sedangkan kamera depan TrueDepth baru dengan bukaan ƒ/1.9 memungkinkan kinerja cahaya rendah yang lebih baik. Ponsel ini juga mendukung perekaman video 4K dan dilengkapi fitur keselamatan seperti Crash Detection dan Emergency SOS via satelit."),
 phone(
    id: '3',
    image:
    'https://images.tokopedia.net/img/cache/700/OJWluG/2023/11/28/fe65bbe2-bb91-41e9-a66d-e58251b81e6e.jpg',
    name: 'iPhone 15 Pro Max',
    price: 1599.9,
    rate: 4.8,
    description:
    "iPhone 15 Pro Max adalah smartphone terbaru dari Apple yang diluncurkan pada tahun 2023. Smartphone ini menawarkan berbagai fitur canggih dan performa yang luar biasa, menjadikannya pilihan terbaik bagi pengguna yang menginginkan smartphone premium.",
  ),
  phone(
    id: '4',
    image:
    'https://images.tokopedia.net/img/cache/700/OJWluG/2022/2/14/a28bbeb4-5c1a-4c33-a93e-f906b8ebbd87.jpg?ect=4g',
    name: 'iPhone 12 Pro Max',
    price: 899.9,
    rate: 4.5,
    description:
    "iPhone 12 Pro Max menawarkan layar Super Retina XDR OLED berukuran 6.7 inci dengan resolusi tinggi, memberikan pengalaman visual yang tajam dan jernih. Ponsel ini didukung oleh chip A14 Bionic yang sangat canggih, memastikan kinerja yang cepat dan efisien untuk berbagai aplikasi dan game.",
  ),
  phone(
    id: '5',
    image:
    'https://s.yimg.com/zp/MerchandiseImages/99D52D2AA3-SP-7561562.jpg',
    name: 'iPhone 11 Pro Max',
    price: 699.9,
    rate: 4.5,
    description:
    "iPhone 11 Pro Max adalah salah satu flagship smartphone terbaru dari Apple. Ini menawarkan desain yang elegan dengan bingkai stainless steel dan panel kaca di depan dan belakang. Layarnya adalah Super Retina XDR OLED berukuran 6.5 inci dengan resolusi tinggi dan mendukung HDR10, memberikan pengalaman visual yang memukau. Sistem kamera triple 12 MP di bagian belakang, yang terdiri dari kamera wide, ultra-wide, dan telephoto, memungkinkan pengguna untuk mengambil foto dan video yang detail dengan mode Night mode untuk kondisi pencahayaan rendah",
  ),
  phone(
    id: '6',
    image:
    'https://images.tokopedia.net/img/cache/700/OJWluG/2022/5/31/ccde0cc5-bdfd-4716-96ac-b4132b420d4c.jpg',
    name: 'iPhone X',
    price: 499.9,
    rate: 4.4,
    description:
    "iPhone X menampilkan desain yang revolusioner dengan layar Super Retina OLED berukuran 5.8 inci yang hampir tanpa bingkai, menghadirkan pengalaman visual yang imersif. Desainnya menghilangkan tombol home tradisional dan menggantinya dengan pengenalan wajah menggunakan Face ID untuk membuka kunci perangkat dan mengamankan data.",
  ),
];